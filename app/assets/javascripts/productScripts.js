$(document).ready(function(){

  // HOVER HANDLER
  $(".card").hover(function(){
    $(".card-title", this).css("opacity", 1)
  }, function(){
    $(".card-title", this).css("opacity", 0)
  });
  // END OF HOVER HANDLER
});
