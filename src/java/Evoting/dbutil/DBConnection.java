/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Evoting.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author vaibh
 */
public class DBConnection {

    static Connection conn = null;

    static {
        try {
            Class.forName("oracle.jdbc.OracleDriver");  //driver load dynamic class loading k liye forName is use krte hai 
            conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "project", "project");
            System.out.println("Driver loaded and conn opened");
        } catch (ClassNotFoundException cnf) {
            cnf.printStackTrace();
        } catch (SQLException sqlx) {
            sqlx.printStackTrace();
        }
    }

    public static Connection getConnection() {
        return conn;
    }

    public static void closeConnection() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException sqlx) {
            sqlx.printStackTrace();
        }

    }
}
