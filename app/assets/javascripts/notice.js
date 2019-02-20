$(document).on("turbolinks:load", function(){


  // define delay and fadeOut for alerts & notices within .info-popout selector
  $(".info-popout").delay(2500).fadeOut(2500);

  // item added alerts
  $("#global-notice").hide();
});
