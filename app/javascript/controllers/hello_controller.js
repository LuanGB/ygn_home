import { Controller } from "@hotwired/stimulus"

jQuery(window).on('load', function() {
  // SHOW/ANIMATE ANIMATION CONTAINER
  setTimeout(function(){
    $(".hero .animation-container").each(function(){
      var e = $(this);

      setTimeout(function(){
        e.addClass("run-animation");
      }, e.data("animation-delay") );
    });
  }, 900 );
});


jQuery(document).ready(function($) {
  "use strict";


  $(window).on('load', function() {

    // SHOW/ANIMATE ANIMATION CONTAINER
    setTimeout(function(){
      $(".hero .animation-container").each(function(){
        var e = $(this);
        setTimeout(function(){
          e.addClass("run-animation");
        }, e.data("animation-delay") );
      });
    }, 900 );
  });


  // INIT PARALLAX PLUGIN
  $(".hero .background-content.parallax-on").parallax({
    scalarX: 24,
    scalarY: 15,
    frictionX: 0.1,
    frictionY: 0.1,
  });


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

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
