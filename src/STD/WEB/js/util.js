function getMensajeEspera(texto) {
    if (!texto) texto = "Procesando... Un momento por favor";

    return '<div class="card card-inverse card-success mb-3 text-center"><div class="card-block"><blockquote class="card-blockquote">'+
            '<p><i class="fa fa-refresh fa-2x fa-spin" aria-hidden="true"></i>' + texto + '</p>' +
            '</blockquote></div></div>';
}

function bloquearPantalla(mensaje) {   
    if (!mensaje) mensaje = "Procesando... Un momento por favor";
    $('body').append('<div class="modal fade" id="blockScreen" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">'
        + '<div class="modal-dialog modal-sm modal-dialog-centered">'
        + '<div class="modal-content"><div class="modal-body bg-success text-white"><div class="container-fluid"><div class="row justify-content-around align-items-center">'
        + '<div class="col-3"><i class="fa fa-refresh fa-spin fa-2x fa-fw" aria-hidden="true"></i></div>'
        + '<div class="col-9">' + mensaje + '</div></div></div></div></div></div></div>');
    $('#blockScreen').modal({ backdrop: 'static', keyboard: false });
}

function desbloquearPantalla() {    
    $("#blockScreen").removeClass("in");
    $(".modal-backdrop").remove();
    $('body').removeClass('modal-open').css('padding-right', '');
    $("#blockScreen").hide();
}

function cerrarSesion() {
    bloquearPantalla();
    VISTA.ws.WS_ET_Usuario.logout();
    desbloquearPantalla();
    location.replace("Default.aspx");
}

//Identificación de las clases de bootstrap que se asignaran como
//respuesta visual en la validacipon
var ok = "is-valid", err = "is-invalid";
function marca(i, c) {
    $(i).addClass(c);
}

/*Quita los espacios iniciales y finales de una cadena, además de espacios dobles intermedios en una cadena (para que en la validación solo se consideren)
los textos sin espacios al inicio y al final*/
function limpiar(cad) {
    return cad.trim().replace(/[ ]+/g, " ");
}

/*Verifica la longitud de una cadena con el fin de que coincida con una longitud mínima y máxima*/
function valLong(id, min, max) {
    var valor = limpiar($(id).val());
    if (valor.length >= min && valor.length <= max) {
        marca(id, ok);
        return 0;
    }
    marca(id, err);
    return 1;
}


function valRango(id, min, max) {
    try{
        var valor = parseFloat($(id).val());
        if (valor >= min && valor <= max) {
            marca(id, ok);
            return 0;
        }
        marca(id, err);
        return 1;
    }catch(e){
        marca(id, err);
        return 1;
    }
}

/*Permite reestablecer la vista de los controles a antes de validar (quita
cualquier mensaje de validación correcta o incorrecta)*/
function valReset() {
    $(".form-control").removeClass(ok).removeClass(err);
}

