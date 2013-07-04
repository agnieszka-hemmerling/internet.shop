$(function() {
	$('#header a').click(function () { 
		$('#left a.active').removeClass('active') 
	})	
	$('#header a').mouseenter(function(){ 
		$(this).animate({ 
		fontSize: '65px', 
		color: '#ba544a' },1200 ) 
	})
	$('#header a').mouseleave(function(){ 
		$(this).animate({ 
		fontSize: '55px', 
		color: '#e8695d' },1200 ) 
	})
})
