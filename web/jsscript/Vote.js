function addvote(){
    
    var id=$('input[type=radio][name=flat]:checked').attr('id');
    data={candidateid:id};
    console.log(data);
    $.post("AddVoteControllerServlet",data,processresponse);
}
function processresponse(responseText){
    responseText=responseText.trim();
    if(responseText==="success"){
        swal("success","Voting done","success").then((value)=>{
            window.location="votingresponse.jsp";
        });
    }
    else
       swal("failure","Voting done","error").then((value)=>{
            window.location="votingresponse.jsp";
        });
}


