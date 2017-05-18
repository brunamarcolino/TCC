/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    var height = $(document).height();
    
    setTimeout(function(){
        $('.mensagem').addClass('ocultar');
        //$('.mensagem').hide();
    }, 5000);
    
    $('.image').css('height', height);
    $('.main').css('min-height', height-150);
    //$('#cpf').mask('000.000.000-00', {reverse: true});
    
    $('select#tipo_atendimento').on('change',function(){
       var texto = $('select#tipo_atendimento option:selected').text();
       
       if(texto == 'Preferencial'){
           $('.preferencial').addClass('aberto');
       }else{
           $('.preferencial').removeClass('aberto');
       }
    });
    
    if($(".tooltip").length || $(".tooltip_title").length){
        $(".tooltip").qtip({
            content: {
                text: $('.tooltiptext')
            },
            position: {
                my: 'center left',
                at: 'center right',
                target: $('.tooltip')
            }
        });
        $(".tooltip_title").qtip({
            content: {
                text: $('.tooltiptext_title')
            },
            position: {
                my: 'center left',
                at: 'center right',
                target: $('.tooltip_title')
            }
        });
    }
    
    if($("#cpf").length){
        $("#cpf").mask('000.000.000-00', {reverse: true});
    }
    
    $('.menu-mobile-icone').click(function(){
        $('.menu-mobile nav').toggleClass('aberto');
        $('#nav-icon3').toggleClass('aberto');
    })
});

$(window).resize(function(){
    height = $(document).height();
    $('.image').css('height', height);
    $('.main').css('min-height', height-150);    
});

function confirma() {
   confirm("Confirma?");
};
