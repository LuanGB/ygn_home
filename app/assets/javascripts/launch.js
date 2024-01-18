import { Controller } from "@hotwired/stimulus"

jQuery(document).ready(function($) {
  "use strict";

  // OPEN POPUP SEQUENCE
  $(".open-popup").click(function(){
    $(".popup").addClass("show");
    $(".popup").append('<div class="close-popup backface"></div>');
  });

  // CLOSE POPUP SEQUENCE
  $(document).on('click', '.close-popup', function(){ 
    $(".popup").removeClass("show");
    $(".popup .backface").remove();
  });

  // AJAX SUBSCRIBE FORM
  $('.subscribe-form').submit(function() {
    var postdata = $('.subscribe-form').serialize();

    $.ajax({
      type: 'POST',
      url: '/api/v1/newsletter_subscription/subscribe',
      data: postdata,
      dataType: 'json',
      success: function(json) {
        $('.subscribe-form').removeClass("form-error");
        $('.subscribe-form').removeClass("form-success");

        if(json.valid === 0) {
          $('.subscribe-form').addClass("form-error");
        } else {
          $('.subscribe-form').addClass("form-success");
          // $('.subscribe-form input,.subscribe-form button').val('').prop('disabled', true);
        }
      },
      error: function(json) {
        $('.subscribe-form').removeClass("form-error");
        $('.subscribe-form').removeClass("form-success");

        $('.subscribe-form').addClass("form-error");
      }
    });
    return false;
  });
});
