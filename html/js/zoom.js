$(document).ready(function() {
	$('input').focusin(function(){
		$(this).css('border', '2px solid #ff7733');
	});
	
	$('input').focusout(function(){
		$(this).css('border', '2px solid white');
	});

	$('.btn').mousedown(function(){
		$(this).css('border', '2px solid #ff7733');
		$(this).css('background-color', '#ff7733');
	});

	$('.btn').mouseup(function(){
		$(this).css('border', '2px solid white');
		$(this).css('background-color', 'white');
	});

	$('.filter').css('background-color', 'rgba(0, 0, 0, 0.4)');

	$('#grid-container').css('background-');
});	