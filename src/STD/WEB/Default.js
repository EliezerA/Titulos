$(document).ready(function () {
    configurarUI();
});

function configurarUI() {
    $('#btnLogin').click(mostrarModal);
    $('#btnCerrar').click(cerrarModal);
    $('#btnIniciarSesion').click(iniciarSesion);
    $('#modalLogin').on('shown.bs.modal', function (e) {
        $('#txtUsuario').focus();
    })
    $('#modalLogin').on('hidden.bs.modal', function (e) {
        valReset();
        $('.alert').alert('close')
        $('#txtUsuario').val(null);
        $('#txtPass').val(null);
    });
    $("#txtPass").keypress(function (e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code == 13) {
            $("#btnIniciarSesion").click();
        }
    });
}

function mostrarModal() {
    $('#modalLogin').modal({
        show: true,
        keyboard: false,
        backdrop: 'static'
    });
}

function cerrarModal() {
    valReset();
    $('#modalLogin').modal('hide');
    $('.alert').alert('close')
    $('#txtUsuario').val(null);
    $('#txtPass').val(null);
}


function iniciarSesion() {
    if (validar()) {
        WEB.ws.WS_ET_Usuario.login($('#txtUsuario').val().trim(), $('#txtPass').val().trim(), onLoginSuccess, onLoginError);
    }
}

function onLoginSuccess(result) {
    valReset();
    if (eval(result) == true) {
        location.replace("FrmHome.aspx");
    } else if (eval(result) == false) {
        $('.alert').alert('close');
        $('#alertas').html('<div class="alert alert-warning" role="alert">El usuario ingresado se encuentra inactivo.<br />Contacte con un <b>administrador</b> para resolver su situación.</div>');
        desvanecerAlertas(8000);
    } else if (eval(result) == undefined) {
        $('.alert').alert('close');
        $('#alertas').html('<div class="alert alert-danger" role="alert">Usuarios y/o contraseña incorrecta(s). Vuelve a intentarlo.</div>');
        desvanecerAlertas(6000);
    }
}

function onLoginError() {
    valReset();
    $('.alert').alert('close');
    $('#alertas').html('<div class="alert alert-danger" role="alert">No se ha podido realizar la operación. Vuelve a intentarlo.</div>');
    desvanecerAlertas(6000);
}

function desvanecerAlertas(milisegundos) {
    setTimeout(function () {
        $(".alert").fadeOut(1000);
    }, milisegundos);
}

function validar() {
    valReset();

    var novalidos = 0;
    try {
        novalidos += valLong("#txtUsuario", 1, 50);
        novalidos += valLong('#txtPass', 1, 50);

        if (novalidos > 0) {
            $($(".form-control.is-invalid")[0]).focus();
            return false;
        }
    } catch (e) {
        return false;
    }

    return true;
}
