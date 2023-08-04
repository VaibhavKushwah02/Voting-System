/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Evoting.dao;

import Evoting.dbutil.DBConnection;
import Evoting.dto.CandidateDTO;
import Evoting.dto.CandidateDetails;
import Evoting.dto.CandidateInfo;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;

/**
 *
 * @author vaibh
 */
public class CandidateDao {

    private static PreparedStatement ps, ps1, ps2, ps3, ps4, ps5;
    private static Statement st;
    static {
        try {
            st=DBConnection.getConnection().createStatement();
            ps = DBConnection.getConnection().prepareStatement("select count(*) from candidate");
            ps1 = DBConnection.getConnection().prepareStatement("select username from user_details where adhar_no=?");
            ps2 = DBConnection.getConnection().prepareStatement("select distinct city from user_details");
            ps3 = DBConnection.getConnection().prepareStatement("insert into candidate values(?,?,?,?,?)");
            ps4 = DBConnection.getConnection().prepareStatement("select * from candidate where candidate_id=?");
            ps5 = DBConnection.getConnection().prepareStatement("select candidate_id,username,party,symbol from candidate,user_details where candidate.user_id=user_details.adhar_no and candidate.city=(select city from user_details where adhar_no=?)");

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static String getNewId() throws SQLException {
        ResultSet rs = ps.executeQuery();
        rs.next();
        return "C" + (100 + rs.getInt(1) + 1);
    }

    public static String getUserNameById(String uid) throws SQLException {
        ps1.setString(1, uid);
        ResultSet rs = ps1.executeQuery();
        if (rs.next()) {
            return rs.getString(1);
        } else {
            return null;
        }
    }

    public static ArrayList<String> getCity() throws SQLException {
        ArrayList<String> cityList = new ArrayList<>();
        ResultSet rs = ps2.executeQuery();
        while (rs.next()) {
            cityList.add(rs.getString(1));
        }
        return cityList;
    }

    public static boolean addCandidate(CandidateDTO obj) throws SQLException {
        ps3.setString(1, obj.getCandidateId());
        ps3.setString(2, obj.getParty());
        ps3.setString(3, obj.getUserid());
        ps3.setBinaryStream(4, obj.getSymbol());
        ps3.setString(5, obj.getCity());
        return ps3.executeUpdate() != 0;
    }

    public static ArrayList<String> getCandidateId() throws SQLException {
        ArrayList<String> candidate = new ArrayList<>();
        ResultSet rs = st.executeQuery("select candidate_id from candidate");
        while (rs.next()) {
            candidate.add(rs.getString(1));
        }
        return candidate;
    }

    public static CandidateDetails getDetailsById(String cid) throws Exception {
        ps4.setString(1, cid);
        ResultSet rs = ps4.executeQuery();
        CandidateDetails cd = new CandidateDetails();
        //first blob convert into inputstream then this convert into byte array then after this it will convert into base64 
        //bolb->inputstream->bytearray->base64;
        Blob blob;
        InputStream inputstream;
        byte[] buffer;
        byte[] imageBytes;
        int byteRead;
        String base64Image;
        ByteArrayOutputStream outputStream;
        if (rs.next()) {
            //image came from in the form of blob;
            blob = rs.getBlob(4);
            //image came in the form of inputstream;
            inputstream = blob.getBinaryStream();
            //below line will convert into binaryStream;
            outputStream = new ByteArrayOutputStream();
            buffer = new byte[4096];
            byteRead = -1;
            //below loop byteread read the array of image maximum it will read 4096 byte;
            while ((byteRead = inputstream.read(buffer)) != -1) {
                //here bytebuffer convert into outputstream;
                outputStream.write(buffer, 0, byteRead);
            }
            //here we convert outputstream into arraybyte image;
            imageBytes = outputStream.toByteArray();
            //below line will convert imagebytes array into base64 string formate;
            Base64.Encoder en = Base64.getEncoder();
            base64Image = en.encodeToString(imageBytes);
            cd.setSymbol(base64Image);
            cd.setCandidateId(cid);
            cd.setCandidateName(getUserNameById(rs.getString(3)));
            cd.setParty(rs.getString(2));
            cd.setCity(rs.getString(5));
            cd.setUserId(rs.getString(3));

        }

        return cd;

    }

    public static ArrayList<CandidateInfo> viewCandidate(String adhar_id) throws Exception {

        ArrayList<CandidateInfo> candidateList = new ArrayList<CandidateInfo>();
        ps5.setString(1, adhar_id);
        ResultSet rs = ps5.executeQuery();
        Blob blob;
        InputStream inputStream;
        ByteArrayOutputStream outputStream;
        byte[] buffer;
        int bytesRead;
        byte[] imageBytes;
        String base64Image;
        while (rs.next()) {

            blob = rs.getBlob(4);
            inputStream = blob.getBinaryStream();
            outputStream = new ByteArrayOutputStream();
            buffer = new byte[4096];
            bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            imageBytes = outputStream.toByteArray();
            Base64.Encoder en = Base64.getEncoder();
            base64Image = en.encodeToString(imageBytes);

            CandidateInfo candidate = new CandidateInfo();
            candidate.setCandidateId(rs.getString(1));
            candidate.setCandidateName(rs.getString(2));
            candidate.setParty(rs.getString(3));
            candidate.setSymbol(base64Image);

            candidateList.add(candidate);

        }
        return candidateList;

    }
}
