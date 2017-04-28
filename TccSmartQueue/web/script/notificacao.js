/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    
    var OneSignal = window.OneSignal || [];
    OneSignal.push(["init", {
      appId: "d65a5424-a984-45c5-ae6a-1b29fd9795a0",
      autoRegister: false, /* Set to true to automatically prompt visitors */
      subdomainName: 'https://smartqueue.onesignal.com',
      /*
      subdomainName: Use the value you entered in step 1.4: http://imgur.com/a/f6hqN
      */
      httpPermissionRequest: {
        enable: true
      },
      notifyButton: {
          enable: true /* Set to false to hide */
      }
    }]);


  OneSignal.push(function() {
  /* These examples are all valid */
  OneSignal.getUserId(function(userId) {
    console.log("OneSignal User ID:", userId);
    
    // (Output) OneSignal User ID: 270a35cd-4dda-4b3f-b04e-41d7463a2316    
  });
               
  OneSignal.getUserId().then(function(userId) {
    console.log("OneSignal User ID:", userId);
    document.gerasenha.notifica.value= userId; 
    // (Output) OneSignal User ID: 270a35cd-4dda-4b3f-b04e-41d7463a2316    
  });
});