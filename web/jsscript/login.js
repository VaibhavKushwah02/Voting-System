let userid, password;

function connectUser() {
    userid = $("#username").val();
    password = $("#password").val();
    if (validateUser() === false) {
        swal("Access Denied", "Please enter userid/password", "error");
        return;
    }
    let data = {
        userid: userid,
        password: password
    };
    let xhr = $.post("LoginControllerServlet", data, processResponse);
    xhr.fail(handleError);
}
function processResponse(responseText) {
    if (responseText.trim() === "error") {
        swal("Access denied", "Invalid userid/password", "error");
    } else if (responseText.trim().indexOf("jsessionid") !== -1) {
        let pr = swal("Success", "Login successful", "success");  //promises made for talk to server then they take 2 argument first one for correct or second one for false
        pr.then((value) => {
            window.location = responseText.trim();
        });
    } else {
        swal("Access denied", "Some problem is occurred:" + responseText, "error");

    }


}
function handleError(xhr) {
    swal("Error!", "Problem in server communication:" + xhr.statusText, "error");

}
function validateUser() {
    if (userid === "" || password === "") {
        swal("Error", "All fields are mandatory", "error");
        return false;
    }
    return true;
}






