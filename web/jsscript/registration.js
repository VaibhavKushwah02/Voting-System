var username,password,cpassword,city,address,adhar,email,mobile;
function addUser(){
    
    username=$("#username").val();
    password=$("#password").val();
    cpassword=$("#cpassword").val();
    city=$("#city").val();
    address=$("#address").val();
    adhar=$("#adhar").val();
    email=$("#email").val();
    mobile=$("#mobile").val();
    if(validateUser()){
        if(password!==cpassword){
            swal("Error","password do not match","error");
            return;
        }
        else{
            if(checkEmail()===false)
                return;
            if(checkMobile()===false)
            return;
            var data={ username:username,
                password:password,
                city:city,
                address:address,
                userid:adhar,
                email:email,
                mobile:mobile
        };
        var xhr=$.post("RegistrationControllerServlet",data,processResponse);
        xhr.fail(handleError);
    }
    
}
}
function processResponse(responseText,textStatus,xhr){
   var str=responseText.trim();
   if(str==="success"){
       swal("Success!","Registration done Successfully","success");
       setTimeout(redirectUser,3000);
   }
   else if(str==="uap")
          swal("Error!","User id is already present","error");
   else
      swal("Error!","Registration failed","error");


       
}
function handleError(xhr){
         swal("Error!","Problem in server communication:"+xhr.statusText,"error");
  
}
function validateUser(){
 if(username===""|| password===""|| cpassword===""|| city===""|| address===""|| adhar===""||email===""||mobile===""){
     swal("Error","All fields are mandatory","error");
     return false
 }  
 return true;
}
function checkEmail(){
    var attheratepos=email.indexOf("@");
    var dotpos=email.indexOf(".");
    if(attheratepos<1|| dotpos<attheratepos+2|| dotpos+2>=email.length){
      swal("Error","Please enter the valid email","error");
      return false;
    }
    return true;
}
function checkMobile()
{
    if(Number.isInteger(mobile)===true || mobile.toString().length!==10){
         swal("Error!","Please enter a valid Mobile Number!","error");
        return false;
    }
    return true;
}

function redirectUser(){
    window.location="login.html";
}


