/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    setTimeout(function(){
        $('.mensagem').addClass('ocultar');
        //$('.mensagem').hide();
    }, 2000);
    
    //$('#cpf').mask('000.000.000-00', {reverse: true});
});

function confirma() {
   confirm("Confirma?");
};
