$(document).ready(function(){

  // enable delivery icons tooltips
  $(".delivery-tooltip").tooltip();


  //
  $("#user-button-settings").hover(function(){
    // hover enter
    $(this).html('<i class="fas fa-wrench"></i><span class="">&nbsp;edit profile</span>')

  }, function (){
    // hover end
    $(this).html('<i class="fas fa-wrench"></i>')
  });


});
