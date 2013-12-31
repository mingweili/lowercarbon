/*
 *	许强
 */
// reg_user_name emial onfocue
function reg_mail_onfocus() {
    // 焦点效果
    document.getElementById("reg_username_div").className = "jh_yanzhenghover"; 
}

//////////////////////////////////////////////////////////////////
// check email
function CheckEmail(email) {
    var pattern = /^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    flag = pattern.test(email);
    if (!flag) {
        return false;
    }
    return (true); 
}

// reg_user_name onblur
function reg_mail_onblur() {

    document.getElementById("reg_mail_div").className = "jh_yanzheng";

    var email = document.getElementById('reg_mail').value;
    var isValidateEmail = CheckEmail(email);

    if (isValidateEmail == false) {
        document.getElementById('red_reg_mail').innerHTML = 
            '<div style="" class="errormt"><strong><span>请输入正确邮箱格式。</span></strong></div>';
    }
    else {
        document.getElementById('red_reg_mail').innerHTML =
                        '<div class="success"><img class="tipicon tip3" src="./Images/transparent.gif" alt="" title=""></div>';
    }
   
}

// reg_password_onfocus 
function reg_password_onfocus() {
    document.getElementById("reg_password_div").className = "jh_yanzhenghover"; 
}

// check password length

// reg_password_onblur
function reg_password_onblur() {
    document.getElementById("reg_password_div").className = "jh_yanzheng";

    var password = document.getElementById('reg_password').value;

    if (password.length < 7) {
        document.getElementById('red_reg_password').innerHTML =
                        '<div style="" class="errormt"><strong><span>密码太短了，最少6位。</span></strong></div>';
    }
    else {
        document.getElementById('red_reg_password').innerHTML =
                        '<div class="success"><img class="tipicon tip3" src="./Images/transparent.gif" alt="" title=""></div>';
    }
}

// reg_password2_onblur
function reg_password2_onblur() {
    document.getElementById("reg_password2_div").className = "jh_yanzheng";

    var password1 = document.getElementById('reg_password').value;
    var password2 = document.getElementById('reg_password2').value;

    if ((password1 != null) || (password2 != null)) {
        document.getElementById('red_reg_password2').innerHTML =
            '<div style="" class="errormt"><strong><span>密码不能为空。</span></strong></div>';
    }

    if ((password1 != password2) && (password1 != null) && (password2 != null)) {
        
        document.getElementById('red_reg_password2').innerHTML =
            '<div style="" class="errormt"><strong><span>两次输入的密码不同。</span></strong></div>';
    }
    else if ((password1 != null) && (password2 != null)) {
        document.getElementById('red_reg_password2').innerHTML =
            '<div class="success"><img class="tipicon tip3" src="./Images/transparent.gif" alt="" title=""></div>';
    }
}

// reg_password2_onfocus
function reg_password2_onfocus() {
    // 焦点效果
    document.getElementById("reg_password2_div").className = "jh_yanzhenghover";
}


// submit user input
function register() {
    //使用js向服务器端提交代码，暂时忽略
}

/********************************************************/
function reg_username_onfocus() {
    document.getElementById("reg_username_div").className = "jh_yanzhenghover";

}

function reg_username_onblur() {
    document.getElementById("reg_username_div").className = "jh_yanzheng";

    var username = document.getElementById('reg_username').value;


    if (username != '') {
        $.ajax({
            type: "GET",
            url: "./LoginValidateHandler.ashx",
            data: "username=" + username,
            success: function (msg) {
                if (msg == 'y') {
                    // 可以使用emial注册
                    document.getElementById('red_reg_username').innerHTML =
                        '<div class="success"><img class="tipicon tip3" src="./Images/transparent.gif" alt="" title=""></div>';
                }
                else if (msg == 'n') {
                    document.getElementById('red_reg_username').innerHTML =
                        '<div style="" class="errormt"><strong><span>已经存在该用户名，<a href="./Default.aspx">登录</a>？</span></strong></div>';

                }
            }
        });
    }
    else if (username == '') {
        document.getElementById('red_reg_username').innerHTML =
                        '<div style="" class="errormt"><strong><span>请输入用户名！</span></strong></div>';
    }
   
}