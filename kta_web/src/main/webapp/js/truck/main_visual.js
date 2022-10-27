
// 메인 Visual 슬라이드용
$(function(){
	$('#mainSlides').slides({
		preloadImage: '/images/truck/com/icon_loading.gif',
		preload: true,
		container: 'main_slide_visual',
		generateNextPrev: false,
		generatePagination: true,
		pagination: true,
		paginationClass: 'main_slide_pagination',
		effect: 'fade',
		crossfade: true,
		autoHeight: true,
		fadeSpeed: 300,
		play: 5000,
		pause: 1000,
		hoverPause: false,
		showControl: true
	});
});










