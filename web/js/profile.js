

function checkPass()
{
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('CurrentPassword');
    var pass2 = document.getElementById('NewPassword');
    //Compare the values in the password field
    //and the confirmation field
    if(pass1.value == pass2.value && pass1.value != ""){
        //The passwords match.
        //Set the color to the good color and inform
        //the user that they have entered the correct password
        document.getElementById('PwdCheck').classList.remove('fa-key');
        document.getElementById('PwdCheck').classList.remove('fa-times');
        document.getElementById('PwdCheck').classList.add('fa-check');
        document.getElementById("submitPwd").onclick = function () { $('#changePwdform').submit(); };
    }else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        document.getElementById('PwdCheck').classList.remove('fa-key');
        document.getElementById('PwdCheck').classList.remove('fa-check');
        document.getElementById('PwdCheck').classList.add('fa-times');
        document.getElementById("submitPwd").onclick = false;
    }
}