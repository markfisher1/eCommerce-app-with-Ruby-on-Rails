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
    // NOTE:  I was using const instead of var, however Asset compilation was
    //        failing when deploying to Heroku.
    //        The error message on terminal pointed to this line and to the
    //        keyword `const` flagging some kind of error while performing the
    //        uglifier process.
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
