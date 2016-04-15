$(function() {

	var pgurl = window.location.href;

	var pgurl2 = pgurl.replace(/^(?:(ftp|http|https):\/\/)?(?:[\w-]+\.)+[a-z]{3,6}$/);

	var pgurl3 = pgurl2.replace('www.', '');

	console.log(pgurl3);

    $(".b-link").each(function(){
    	if(($(this).attr("href") == pgurl)||($(this).attr("href") == pgurl3))
			$(this).replaceWith("<span class='b-link b-link_state_active'>" + $(this).text() + "</span>");
     })
});