$(document).ready(function(){

  // HOVER HANDLER
  $(".card").hover(function(){
    $(".card-title", this).css("opacity", 1)
  }, function(){
    $(".card-title", this).css("opacity", 0)
  });
  // END OF HOVER HANDLER

  // DEAL WITH PRODUCT ARRAY AND POPULATE PRODUCT IMAGES ASYNC.
  var productArray = $("#hidden_information_products_array").data("products-array");

  for (i = 0; i < productArray.length; i++){
    var imageObj = $("img[data-product-id='"+productArray[i].id+"']");
    var downloadingImage = new Image();
    downloadingImage.src = "/assets/" + productArray[i].image_url;

    // console.log(image);
    downloadingImage.onload = function(){
      imageObj.removeClass("load_image");
      imageObj.addClass("card-img-top");
      imageObj[0].src = downloadingImage.src;
    };
  };
  // END OF > DEAL WITH PRODUCT ARRAY AND POPULATE PRODUCT IMAGES ASYNC.

});
