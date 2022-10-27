/* familySite 설정 */
$(document).ready(function () {
    $(".familySite .arrow_up").click(function () {
        var hidden = $(".arrow_up").next().is(":hidden");
        if (hidden) {
            $(".fsList").slideDown(300);
            $(".arrow_up").addClass("arrow_down");
        } else {
            $(".fsList").slideUp(300);
            $(".arrow_up").removeClass("arrow_down");
        }
    });
    $(".familySite").mouseleave(function () {
        $(".fsList").slideUp(500);
        $(".arrow_up").removeClass("arrow_down");
    });
  
    /*
     * 서브 페이지 상단 메뉴 이벤트
     */
    // 상단메뉴 고정 확인 
    if (getCookie('isTruckSubMenuNotFixed')) {
        $('#headerWrap div.gnb a.btn_pause.pause_on').removeClass('pause_on');
        $('#headerWrap')
            .css('height', '133px')
            .find('div.gnb a.btn_memuopen')
            .css('display', 'block');
    }
    // 닫기
    $("#headerWrap div.gnb a.btn_close").click(function () {
        $("#headerWrap").animate({
                'height': '133px'
            },
            500,
            function () {
                $('#headerWrap div.gnb a.btn_memuopen').show();
            }
        );
    });
    // 열기
    $('#headerWrap div.gnb a.btn_memuopen').click(function () {
        $('#headerWrap div.gnb a.btn_memuopen').hide();
        $("#headerWrap").animate({
                'height': '340px'
            },
            500,
            function () {}
        );
    });
    // 메뉴 고정 설정
    $('#headerWrap div.gnb a.btn_pause').click(function () {
        var t = $(this);
        if (t.hasClass('pause_on')) {
            t.removeClass('pause_on');
            setCookie('isTruckSubMenuNotFixed', 'true', 365);
        } else {
            t.addClass('pause_on');
            setCookie('isTruckSubMenuNotFixed', '', -1);
        }
    });
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

/* table 설정(마우스오버, 끝라인) */
$(function () {
    $(".tbList_st01 tr:not(:lt(1))").mouseover(function () {
        $(this).addClass("mouseover");
    }).mouseout(function () {
        $(this).removeClass("mouseover");
    });
    //테이블의 끝 라인 처리
    if ($(".tbList_st01").find("tfoot").html() == undefined) {
        $(".tbList_st01").find("tbody tr:last").addClass("last");
    }
    $(".tbIn_st01").find("tbody tr:last").addClass("last");
    $(".tbView_st02").find("tbody tr:last").addClass("last");
    $(".tbView_st03").find("tbody tr:last").addClass("last");
    $(".tbWork_st01").find("tbody tr:last").addClass("last");
    $(".tbWork_st03").find("tbody tr:last").addClass("last");
    $(".tbWork_st04").find("tbody tr:last").addClass("last");
    $(".tbWork_st05").find("tbody tr:last").addClass("last");
    $(".tbDetail_st01").find("tbody tr:last").addClass("last");
});

/* 서브 탭메뉴 이벤트 */
$(document).ready(function() {
	// 처음 세팅
	$(".tabCont").hide();
	$(".tabMenu li:first").addClass("active").show();
	$(".tabMenu li:last").css("margin-right","0");
	$(".tabCont:first").show();

	// 클릭 이벤트
	$(".tabMenu li").click(function() {
		$(".tabMenu li").removeClass("active");
		$(this).addClass("active");
		$(".tabCont").hide();
		var activeTab = $(this).find("a").attr("href");
		$(activeTab).show();
		return false;
	});
});

/* Font Control */
var Field = {
	/**
	 * Zoom 환경설정
	 */
	Zoom: {
		ZoomRate: 10,
		MaxZoom: 200,
		MinZoom: 100,
		NowZoom: 100,
		ElementName: ".conSection"
	},
	/**
	 * 화면을 확대한다.
	 * @param _elementName	(줌인 객체명)
	 */
	zoomIn: function (_elementName) {
		/*var ue = navigator.userAgent.toLowerCase();
		if(ue.indexOf('firefox')!=-1){ alert("익스플로러에서만 동작합니다."+"\n파이어폭스 브라우저는 메뉴 [보기]-[크기조정]을 이용하세요."); }
		else if(ue.indexOf('chrome')!=-1){alert("익스플로러에서만 동작합니다."+"\n크롬 브라우저는 메뉴 [보기]-[크기조정]을 이용하세요."); }
		else if(ue.indexOf('safari')!=-1){  }
		else if(ue.indexOf('msie')!=-1){  }
		else { alert("익스플로러에서만 동작합니다.\n"+ue+"\n브라우저 메뉴의 확대축소 기능을 이용하세요."); }*/

		var element = _elementName || this.Zoom.ElementName;
		if (this.Zoom.NowZoom < this.Zoom.MaxZoom) {
			this.Zoom.NowZoom += this.Zoom.ZoomRate;
			$(element).css({"font-size": this.Zoom.NowZoom+"%"});
		//	$(element).style.zoom = this.Zoom.NowZoom + "%";
		}
	},
	/**
	 * 화면을 축소한다.
	 * @param _elementName	(줌아웃 객체명)
	 */
	zoomOut: function (_elementName) {
		/*	var ue = navigator.userAgent.toLowerCase();
		if(ue.indexOf('firefox')!=-1){ alert("익스플로러에서만 동작합니다."+"\n파이어폭스 브라우저는 메뉴 [보기]-[크기조정]을 이용하세요."); }
		else if(ue.indexOf('chrome')!=-1){alert("익스플로러에서만 동작합니다."+"\n크롬 브라우저는 메뉴 [보기]-[크기조정]을 이용하세요."); }
		else if(ue.indexOf('safari')!=-1){  }
		else if(ue.indexOf('msie')!=-1){  }
		else { alert("익스플로러에서만 동작합니다.\n"+ue+"\n브라우저 메뉴의 확대축소 기능을 이용하세요."); }*/
		
		var element = _elementName || this.Zoom.ElementName;
		if (this.Zoom.NowZoom > this.Zoom.MinZoom) {
			this.Zoom.NowZoom -= this.Zoom.ZoomRate;
			$(element).css({"font-size": this.Zoom.NowZoom+"%"});
		//	$(element).style.zoom = this.Zoom.NowZoom + "%";
		}
	},

	zoom100: function (val, _elementName){
		var element = _elementName || this.Zoom.ElementName;
		if (val > this.Zoom.MinZoom || val < this.Zoom.MaxZoom) {
			this.Zoom.NowZoom = val;
			$(element).css({"font-size": this.Zoom.NowZoom+"%"});
			//$(element).style.zoom = this.Zoom.NowZoom + "%";
		}
	}
};

/*
 * GNB 메뉴 클릭시 처리
 * 
 * - 클릭시 div#headerWrap ul.gnbList 이벤트 처리
 * 		gnb1Dep01 
 * */
$(document).ready(function() {
	$('div#headerWrap ul.gnbList li[class*="gnb1Dep"]').each(function(index){
		//console.log(index);
		var parentThis = $(this);
		
		parentThis.find('a[class*="menu"]').click(function(e){
			//e.preventDefault();
			//초기화
			$('div#headerWrap ul.gnbList li[class*="gnb1Dep"]').each(function(index){
				$(this).removeClass('on');
			});
			parentThis.addClass('on');
			parentThis.parent().find('ul.subList').hide();//초기화 전체 hidden.
			parentThis
				.find('ul.subList').show()
				.find('div.depth03').show();//해당 element만 보임.
		});
	});
});
/*
 * 페이지 로딩시 GNB 메뉴 처리
 * 
 * 관련 class : gnb1Dep0X subDep0X
 * 처리 : class에 on 추가
 * */
$(document).ready(function() {
	var currentPath = document.location.pathname; // url path 부분
	var firstDirectory = currentPath.split('/')[1]; // url 첫번째 디렉토리
	
	var gnb1DepLink = $('div#headerWrap ul.gnbList li[class*="gnb1Dep"] a[href*="'+firstDirectory+'"]'); // 
	var subDepLink = $('div#headerWrap ul.gnbList ul.subList li[class*="subDep"] a[href="'+currentPath+'"]'); // 
	var depth03Link = $('div#headerWrap ul.gnbList ul.subList div.depth03 a[href="'+currentPath+'"]');
		
	if( depth03Link.size() > 0) {// 3depth에 현재 url 링크가 있을 경우
		depth03Link
			.addClass('on')
			.parent().parent().addClass('on')// -> .subDep0X
			.parent().parent().find('a').click();//-> .gnb1Dep0X > a
	}else if( subDepLink.size() > 0) {// 2depth에 현재 url 링크가 있을 경우
		subDepLink
			.parent().addClass('on')// -> .subDep0X
			.parent().parent().find('a').click();//-> .gnb1Dep0X > a
	}else{// 해당 링크가 없을 경우 
		if( currentPath == '/customer/cleanCenter/viewRegistBoard.do' || 
				currentPath == '/customer/cleanCenter/cleanCenterIndex.do' || 
				currentPath == '/customer/cleanCenter/authenticate.do'){
			///customer/cleanCenter/charter.do
			$('div#headerWrap ul.gnbList ul.subList div.depth03 a[href="/customer/cleanCenter/charter.do"]')
				.addClass('on')
				.parent().parent().addClass('on')
				.parent().parent().find('a').click();  
		}else if(currentPath == '/customboard/list.do' ||
				currentPath == '/customboard/view.do' ||
				currentPath == '/customboard/addView.do'||
				currentPath =='/customboard/modifyView.do'){//커스텀게시판일 경우
			var depth3 = document.boardForm.boardNo.value; //boardMastrNo
				$('div#headerWrap ul.gnbList li[class*="gnb1Dep"] a[href*="'+depth3+'"]')
				.addClass('on')
				.parent().parent().addClass('on')// -> .subDep0X
				.parent().parent().find('a').click();//-> .gnb1Dep0X > a
		}else if(currentPath == '/mail/checkUser.do'){ // 만기안내 비밀번호 변경 페이지 -- 2017.01.03[H]
			$('div#headerWrap ul.gnbList ul.subList div.depth03 a[href="/mail/check.do"]')
				.addClass('on')
				.parent().parent().addClass('on')
				.parent().parent().find('a').click();  
		}else{
			gnb1DepLink.click();
		}
	}
	
});

/* faq 형식 */
$(document).ready(function(){
	$(".list div").hide();
	$(".list h4").click(function() {
		$(this).next("div").slideToggle("fast")
			.siblings("div:visible").slideUp("fast");
		$(this).toggleClass("active")
			.siblings("h4").removeClass("active");
		});
	$(".list h4:eq(0)").click();
});

$(document).ready(function(){
	$(".list01 div").hide();
	$(".list01 h4").click(function() {
		$(this).next("div").slideToggle("fast")
			.siblings("div:visible").slideUp("fast");
		$(this).toggleClass("active")
			.siblings("h4").removeClass("active");
		});
});

/* loading 표시 */
/*window.onbeforeunload = function (e) {
	var agt = navigator.userAgent.toLowerCase();
	if( location.href.indexOf('/netCounter/') > -1 
			|| location.href.indexOf('/login.do') > -1){
		console.log("로딩페이지01");
		 IE 10이하 에서 팝업 열릴시에도 실행되어 처리함.
		 * - 조합원 - 보상정보조회 상세 ( /netCounter/inquiryService/accountInquiry/compenDetail.do )
		 * - 거래처 - 지급내역조회 ( /netCounter/inquiryService/accountInquiry/paymentListInquiry.do )
		 * 
		var agt = navigator.userAgent.toLowerCase();
		if(agt.indexOf("msie") != -1 && navigator.userAgent.match(/Trident\/(\d)/i)[1] < 7 && (location.href.indexOf('/compenDetail.do') > -1||location.href.indexOf('/paymentListInquiry.do') > -1) ){
			return ;
		}
		$('div#loading_page').show();
		console.log("로딩페이지02");
	}
};*/

$(document).ready(function(){
	$(".mLine li a p").css('display', 'none');
	
	$(".mLine li a").mouseover(function(){
		$(this).find("p").show();
	}).mouseout(function(){
	    $(this).find("p").hide();
	 });

});

