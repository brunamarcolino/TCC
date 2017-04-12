/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var x=document.getElementById("field1");
function getLocation()
  {
      
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition,showError);
    }
  else{x.value="Seu browser não suporta Geolocalização.";}
  }
  
  function showPosition(position)
  {
  x.value=position.coords.latitude +
  "," + position.coords.longitude; 
  }
  
function showError(error)
  {
  switch(error.code)
    {
    case error.PERMISSION_DENIED:
      x.value="Usuário rejeitou a solicitação de Geolocalização.";
      break;
    case error.POSITION_UNAVAILABLE:
      x.value="Localização indisponível.";
      break;
    case error.TIMEOUT:
      x.value="A requisição expirou.";
      break;
    case error.UNKNOWN_ERROR:
      x.value="Algum erro desconhecido aconteceu.";
      break;
    }
  }