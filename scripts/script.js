$(function(){
	$('.link .button').hover(function(){
		var title=$(this).attr('data-title');
		$('.tip em').text(title);
		var pos=$(this).offset().left;
		var dis=($('.tip').outerWidth()-$(this).outerWidth())/2;
		var l=pos-dis;
		$('.tip').css({'left':l+'px'}).animate({'top':280,'opacity':1},400);
	},function(){
		$('.tip').animate({'top':260,'opacity':0},400);
	})
})