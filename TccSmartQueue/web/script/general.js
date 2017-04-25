/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var height = $(window).height();


$(document).ready(function(){
    setTimeout(function(){
        $('.mensagem').addClass('ocultar');
        //$('.mensagem').hide();
    }, 2000);

    $('.main').css('min-height', height-50);
    //$('#cpf').mask('000.000.000-00', {reverse: true});
});

$(window).resize(function(){
    height = $(window).height();
    $('.main').css('min-height', height-50);    
});

function confirma() {
   confirm("Confirma?");
};
