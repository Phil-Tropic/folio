$(document).ready(function () {
    $(".msgInfo").attr('disabled', true);
});

function clearMsg() {
    var message = document.getElementById('inputRep');
    message.value = "";
}

function validate() {
    var nom = document.getElementById('inputName');
    var email = document.getElementById('inputEmail');
    var tel = document.getElementById('inputTel');
    var message = document.getElementById('inputMessage');


    var u = new user(nom.value, email.value, tel.value, message.value);

    if (!u.validateNom()) {
        nom.style.borderColor = "red";

    }
    else {
        nom.style.borderColor = "black";
    }

    if (!u.validateTel()) {
        tel.style.borderColor = "red";

    }
    else {
        tel.style.borderColor = "black";
    }

    if (!u.validateEmail()) {
        email.style.borderColor = "red";

    }
    else {
        email.style.borderColor = "black";
    }

    if (!u.validateMessage()) {
        message.style.borderColor = "red";

    }
    else {
        message.style.borderColor = "black";
    }

    if (u.validateNom() && u.validateTel() && u.validateEmail() && u.validateMessage()) {

        infoget = "?nom=" + u.getNom();
        infoget += "?tel=" + u.getTel();
        infoget += "?email=" + u.getMail();
        infoget += "?message=" + u.getMessage();

        $.get("traitements/insertMessagerie.aspx" + infoget, (data) => {

            alert(data);
        });
    }

}

function user(nom, email, tel, message) {
    this.nom = nom;
    this.email = email;
    this.tel = tel;
    this.message = message;

}

user.prototype.getNom = function () {
    return this.nom;
}

user.prototype.setNom = function (nom) {
    this.nom = nom;
}


user.prototype.getMail = function () {
    return this.email;
}

user.prototype.setMail = function (email) {
    this.email = email;

}


user.prototype.setTel = function (tel) {
    this.tel = tel;

}

user.prototype.getTel = function () {
    return this.tel;
}
user.prototype.setTel = function (message) {
    this.message = message;

}

user.prototype.getMessage = function () {
    return this.message;
}

user.prototype.validateNom = function () {
    var status;

    for (var i = 0; i < this.nom.length; i++) {
        if (((this.nom.charCodeAt(i) >= "A".charCodeAt(0)) && (this.nom.charCodeAt(i) <= "Z".charCodeAt(0))) ||
            ((this.nom.charCodeAt(i) >= "a".charCodeAt(0)) && (this.nom.charCodeAt(i) <= "z".charCodeAt(0)))) {
            status = true;

        }
        else {
            status = false;
        }
    }

    return status;

}

user.prototype.validateTel = function () {

    var telRegEx = /^(\(\d{3}\)) ?\d{3}-\d{4}/;
    if (telRegEx.test(this.tel)) {
        return true;
    }
    else {
        return false;
    }

}
user.prototype.validateEmail = function () {

    var emailRegEx = /[a-zA-Z0-9]+(\.|_|-)?[a-zA-Z0-9]+@/;
    if (emailRegEx.test(this.email)) {
        return true;
    }
    else {
        return false;
    }

}
user.prototype.validateMessage = function () {

    var status;

    for (var i = 0; i < this.message.length; i++) {
        if (((this.nom.charCodeAt(i) >= "A".charCodeAt(0)) && (this.nom.charCodeAt(i) <= "Z".charCodeAt(0))) ||
            ((this.nom.charCodeAt(i) >= "a".charCodeAt(0)) && (this.nom.charCodeAt(i) <= "z".charCodeAt(0)))) {
            status = true;

        }
        else {
            status = false;
        }
    }
    return true;

}

function clearMsg() {
    var nom = document.getElementById('inputName');
    var email = document.getElementById('inputEmail');
    var tel = document.getElementById('inputTel');
    var message = document.getElementById('inputMessage');

    nom.value = "";
    email.value = "";
    tel.value = "";
    message.value = "";
}