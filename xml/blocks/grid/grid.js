
$(function(){
if ($(window).width() < 768 ) {
   		$('.l-grid_main').addClass('l-grid_mobile');

   		$('.b-action .b-button').addClass('b-button_max-width');
   		$('.b-action .b-button').removeClass('b-button_pin_clear-round');

   		$('.b-action .b-input').removeAttr('width').css({ width: "" });
   		$('.b-action .b-input__input').removeAttr('width').css({ width: "" });
   		$('.b-action .b-input').addClass('b-input_max-width');
   		

   		

   		
	}
})

$(function(){
		$(document).on('keydown', function (event) {
	    if (event.ctrlKey) {
	        $('.b-see-grid').addClass('b-see-grid_state_visible');
	    }
	});
})

$(function(){
		$(document).on('keydown', function (event) {
	    if (event.altKey) {
	        $('.b-see-grid').removeClass('b-see-grid_state_visible');
	    }
	});
})