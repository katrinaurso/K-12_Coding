$(document).ready(function(){
	$("#calendar").fullCalendar();
	$(".news_button").hide();
  	$(".news").click(function(){
  		$(".news").toggle();
  		$(".news_button").toggle();
  		$(this).show();
  	});   
});
  