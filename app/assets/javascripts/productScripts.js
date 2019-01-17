
$(document).on("turbolinks:load", function(){

  // HOVER HANDLER
  $(".card").hover(function(){
    $(".card-title", this).css("opacity", 1);
  }, function(){
    $(".card-title", this).css("opacity", 0);
  });
  // END OF HOVER HANDLER

  // DEAL WITH PRODUCT ARRAY AND POPULATE PRODUCT IMAGES ASYNC.
  var canvasArray = $(".product_image");

  for (i = 0; i < canvasArray.length; i++){
    $(canvasArray[i]).removeClass("load_image");
    $(canvasArray[i]).addClass("card-img-top");
    var imageSrc = $(canvasArray[i]).data("product-image");

    // lets check for picture or distribute default avatar for product
    if (imageSrc.length < 1){
      imageSrc = $(canvasArray[i]).data("product-default-image");
    }
    canvasArray[i].src = imageSrc
    var ele = $(canvasArray[i]);

    // console.log(ele);
    ele.on("load", function (){
      // $(this).addClass("card-img-top");
      $(".loading_gif").fadeTo(700, 0, function(){});
      $(this).fadeTo(750, 1, function(){

      });
    })

  }
  // END OF DEAL WITH PRODUCT ARRAY AND POPULATE PRODUCT IMAGES ASYNC.

  // ADD 2 CART BUTTON
  $("[data-operation='add2cart']").on("click", function(){
    var productID = $(this).data("product_id");
    alert(`Added product ID${productID} to cart.\n\nMy idea is to store product id as "varchar" array on Orders table and proceed from there to a cart system.`);
  });
  // END OF ADD 2 CART BUTTON

});
