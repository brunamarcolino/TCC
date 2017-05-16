/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function getLocation()
  {
      
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition,showError);
    }
  else{document.value="Seu browser nao suporta Geolocalizacao.";}
  }
  
  function showPosition(position)
  {
  document.tipo.localiza.value = position.coords.latitude +
  "," + position.coords.longitude; 
  }
  
function showError(error)
  {
  switch(error.code)
    {
    case error.PERMISSION_DENIED:
      document.tipo.localiza.value="Voce rejeitou a solicitacao de Geolocalizacao.";
      break;
    case error.POSITION_UNAVAILABLE:
      document.tipo.localiza.value="Localizacao indisponivel.";
      break;
    case error.TIMEOUT:
      document.tipo.localiza.value="A requisicao expirou.";
      break;
    case error.UNKNOWN_ERROR:
      document.tipo.localiza.value="Algum erro desconhecido aconteceu.";
      break;
    }
  }