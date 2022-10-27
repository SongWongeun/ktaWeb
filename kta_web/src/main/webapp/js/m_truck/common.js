//메인_v1 상단 검색창
$(document).ready(function(){
	$("#header_v01 div").hide();
	$("#header_v01 h2").click(function() {
		$(this).next("div").slideToggle("fast")
			.siblings("div:visible").slideUp("fast");
		$(this).toggleClass("active")
			.siblings("h2").removeClass("active");
		});
});

//메인_v2 상단 검색창
$(document).ready(function(){
	$("#header_v02 div").hide();
	$("#header_v02 h2").click(function() {
		$(this).next("div").slideToggle("fast")
			.siblings("div:visible").slideUp("fast");
		$(this).toggleClass("active")
			.siblings("h2").removeClass("active");
		});
});

//메인_v3 상단 검색창
$(document).ready(function(){
	$("#header_v03 div").hide();
	$("#header_v03 h2").click(function() {
		$(this).next("div").slideToggle("fast")
			.siblings("div:visible").slideUp("fast");
		$(this).toggleClass("active")
			.siblings("h2").removeClass("active");
		});
});

//서브 상단 검색창
$(document).ready(function(){
	$("#subheader div").hide();
	$("#subheader h2").click(function() {
		$(this).next("div").slideToggle("fast")
			.siblings("div:visible").slideUp("fast");
		$(this).toggleClass("active")
			.siblings("h2").removeClass("active");
		});
});

// 탭메뉴
$(document).ready(function(){	
	$(".con1").css("display","block");
	$(".con2, .con3").css("display","none");
	$(".tab1").click(function(){
		$(".con1").css("display","block");
		$(".con2, .con3").css("display","none");
		$(".tab1").addClass("on");
		$(".tab2, .tab3").removeClass("on");
	});
	$(".tab2").click(function(){
		$(".con2").css("display","block");
		$(".con1, .con3").css("display","none");
		$(".tab2").addClass("on");
		$(".tab1, .tab3").removeClass("on");
	});
	$(".tab3").click(function(){
		$(".con3").css("display","block");
		$(".con1, .con2").css("display","none");
		$(".tab3").addClass("on");
		$(".tab1, .tab2").removeClass("on");
	});
});	
	
//사이트맵
var rightMenuOpenFlag = false;
var subMenuOpenFlag = false;
var subMenuLoadFlag = false;

function rightMenuOpen()
{
	/*if ( rightMenuOpenFlag == false)
	{
		//var $screen = ($("<div/>")).addClass("ui-mobile-ajaxloader-screen");
		//$screen.insertAfter($("footer"));
	
		$("#wrap").stop().animate ( { left:-300 }  );
		$("#rightMenu").stop().css ( { display:"block" , right:-300 }).animate ( { right:0 } , { complete:rightMenuMotionEnd});
		
		
		function rightMenuMotionEnd ( e )
		{
			$(".menuAll > a ").focus();
		}
		
		var maxScreenHeight = Math.max($(".menuAll").outerHeight(), $("#wrap").outerHeight());
		$screen.css("height", maxScreenHeight);
		
		rightMenuOpenFlag = !rightMenuOpenFlag;
		
		$(window).bind("orientationchange", function () {
			if (rightMenuOpenFlag === true) {
				setTimeout(function() {
					//alert("rmenu : " + $(".menuAll").outerHeight() + ", wrap : " + $("#wrap").outerHeight());
					var maxScreenHeight = Math.max($(".menuAll").outerHeight(), $("#wrap").outerHeight());
					$screen.css("height", maxScreenHeight);
				}, 500);
			}
		});
	}
	else
	{
		$("#wrap").stop().animate ( { left:0 } , { complete:menuOpenEnd } );
		$("#rightMenu").stop().animate ( { right:-300  } );
//		$("#rightMenu").stop().animate ( { width:0 } , { complete:menuOpenEnd } );
		
		rightMenuOpenFlag = !rightMenuOpenFlag;
	}

	function menuOpenEnd()
	{
		$("#rightMenu").css ( { display:"none" } );
	}*/
	$("#rightMenu").show();		
}
function rightMenuClose(){
	$("#rightMenu").hide();		
}
$(document).ready(function(){
	$('#rightMenu').height( $('body').height() );
});

/* loading 표시*/
window.onbeforeunload = function (e) {
	if( location.href.indexOf('/netCounter/') > -1 
			|| location.href.indexOf('/login.do') > -1){
		
		$('div#loading_page').show();
	}
};

//qna형식
$(document).ready(function(){
	$(".list01 div").hide();
	$(".list01 h3").click(function() {
		$(this).next("div").slideToggle("fast")
			.siblings("div:visible").slideUp("fast");
		$(this).toggleClass("active")
			.siblings("h3").removeClass("active");
	});
});

/* 글내용에 table에 width가 px로 박혀있을 경우 변경*/
$(document).ready(function(){
	$('.defaultView div.article table').css('width','90%');
});

/* 
 * 쿠키 설정
 */
// 쿠키 생성
function setCookie(cName, cValue, cDay) {
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ ';
    if (typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}
// 쿠키 가져오기
function getCookie(cName) {
    cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if (start != -1) {
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if (end == -1) end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
}