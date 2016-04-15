$('.btn').click(function(){
	$.ajax({
		type: 'POST',
		url: 'http://localhost/subs.txt',
		data: '',
		 success: function(msg){
     		alert(msg);
 		},
 		error: function(XMLHttpRequest, textStatus, errorThrown) {
    		alert("Some error occured");
 		}
	});
});