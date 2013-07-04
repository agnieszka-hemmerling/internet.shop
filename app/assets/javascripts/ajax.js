$(function() {
	$('a').live('click', function(e){
		strona = $(this).attr('href')
		History.pushState(null, null, strona)
		e.preventDefault()
		$('#content').fadeOut(function(){
			$('#content').load(strona + ' #content > *', function() {
				$('#content').fadeIn()
			}, 1000)
		})
	})
})
