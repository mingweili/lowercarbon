var nameResult = false;
var mailResult = false;
var psdResult = false;
var submitEnable = false;

function validateNameInput() {
    if ($("#NameInput").val() == "") {
        $("#NameValidateResult").html("请输入用户名");
        nameResult = false;
    }
    else {
        $("#NameValidateResult").html("");
        LoginService.isRepeatUserName($("#NameInput").val(), responseIsRepeatUserName);
    }
}

function responseIsRepeatUserName(responseText) {
    if (responseText == true) {
        $("#NameValidateResult").html("用户名已重复");
        nameResult = false;
        submitEnable = false;
    }
    else {
        nameResult = true;
        submitEnable = nameResult && mailResult && psdResult;
        $("#submit").attr("Enabled", submitEnable);
    }
}

function resetNameInput() {
    $("#NameValidateResult").html("");
}

function validateMailInput() {
    if ($("#MailInput").val() == "") {
        $("#MailValidateResult").html("请输入邮箱");
        mailResult = false;
        submitEnable = false;
    }

    else {
        r = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
        if (!r.test($("#MailInput").val())) {
            $("#MailValidateResult").html("请输入正确的邮箱地址");
            mailResult = false;
            submitEnable = false;
        }
        else {
            $("#MailValidateResult").html("");
            mailResult = true;
            submitEnable = nameResult && mailResult && psdResult;
            $("#submit").attr("Enabled", submitEnable);
        }
    }
}


function resetMailInput() {
    $("#MailValidateResult").html("");
}

function onclickPsdInput() {
    $("#PsdAlert").html("提示：密码长度不小于6位");
    $("#PsdAlert2").html("");
    $("#password").val("");
    $("#password2").val("");
    psdResult = false;
    submitEnable = false;
}

function validatePsdInput() {
    if ($("#password").val().length >= 6)
        $("#PsdAlert").html("");
    else
        $("#PsdAlert").html("密码长度不小于6位");
}

function validatePsd() {
    if (($("#password").val() != $("#password2").val()) && $("#password2").val().length > 0)
        $("#PsdAlert2").html("前后密码不一致");
    else if ($("#password").val() == $("#password2").val()) {
        if ($("#password2").val().length >= 6) {
            $("#PsdAlert2").html("通过");
            psdResult = true;
            submitEnable = nameResult && mailResult && psdResult;
            $("#submit").attr("Enabled", submitEnable);
        }
        else {
            $("#PsdAlert2").html("密码长度不小于6位");
            psdResult = false;
            submitEnable = false;
        }
    }
}

function showResult() {
    if (nameResult && mailResult && psdResult)
        alert("成功~");
}
