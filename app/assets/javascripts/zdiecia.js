$(function(){
	$('img').live('mouseenter', function(){
		$(this).animate({width:300})
	})
	$('img').live('mouseleave', function(){
		$(this).animate({width:200})
	})

})
