<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<%
String ip =request.getServerName();

String key = "";
String local = "127.0.0.1";
String server ="192.1.60.6";
String server2 = "210.92.214.206";
String server3 = "www.truck.or.kr";
String server4 = "m.truck.or.kr";

if( ip.equals(local) ){
	key =  "66cee6c69e698d9fcb64b021c6d92b7c";
}else if(ip.equals(server)){
	key = "df0e3954115f01e84de59a3d2503cd38";
}else if(ip.equals(server2)){
	key = "d19403ca3aba2ec480163c7d2308aa9c";
}else if(ip.equals(server3)){
	key = "5ffbc8913075f0639912396fde047d50";
}else if(ip.equals(server4)){
	key = "ad52b7d1aa914491c59704f846a3335c";
}
%>
<%
	String u1 = "http://" +request.getServerName();
	String u2 = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String thisUrl = u1+u2;
	String shareImage = u1+"/images/truck/jpg/thumb_fb_logo.jpg";
	//String shareImage = "http://www.truck.or.kr/img2009/kta_banner.gif";
%>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<meta property="og:title" content="화물공제조합 - 본부안내"/>
<meta property="og:url" content="<%=thisUrl%>"/>
<meta property="og:image" content="<%=shareImage%>"/>
<meta property="og:site_name" content="화물공제조합"/>
<meta property="og:description"
      content="화물공제조합 본부안내 페이지입니다."/>
<script type="text/javascript">
try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
$(document).ready(function(){

	var returnUrl = '<%=thisUrl%>';
	
	$('a.twitter').on('click',function(){		
		var msg = '화물공제조합 본부안내 페이지입니다.';
		window.open("https://twitter.com/intent/tweet?text=" + encodeURIComponent(msg)+"  "+encodeURIComponent( returnUrl ));//트위터추가
	});
	
	$('a.facebook').on('click',function(){		
		var url = 'https://www.facebook.com/sharer/sharer.php?u='+ encodeURIComponent( returnUrl );
	 	window.open( url );
	});
});

function linkApp(){
	
	if(document.location.search != "?mobile")
	{
        var strGotoIphone = "http://m.nstore.naver.com/appstore/web/detail.nhn?productNo=24501";
        var strGotoAnd = "http://m.androidapp.naver.com/naverapp";
        var str = window.navigator.userAgent.toLowerCase();
        
        if(/iphone/.test(str)||/ipad/.test(str)){

            var clickedAt = +new Date;            
            naverAppCheckTimer = setTimeout(function() { 
             if (+new Date - clickedAt < 2000){ 
                     if (window.confirm("네이버앱 최신 버전이 설치되어 있지 않습니다.   \n설치페이지로 이동하시겠습니까?")){
                    	 location.href = strGotoIphone;
                    	 } 
                     }
             }, 1500);
            location.href = "navermaps://?menu=location&lat=37.4970484&lng=126.9836436&title=화물공제조합본부";
       	
        }else if(/android/.test(str)){   
        	
	        var clickedAt = +new Date;            
	        naverAppCheckTimer = setTimeout(function() { 
	        if (+new Date - clickedAt < 2000){ 
	                 if (window.confirm("네이버앱 최신 버전이 설치되어 있지 않습니다.   \n설치페이지로 이동하시겠습니까?")){ 
	                	 goapp.close();
	                 	location.href = strGotoAnd; } 
	                 }
	        }, 1500);
	        goapp = open("navermaps://?menu=location&lat=37.4970484&lng=126.9836436&title=화물공제조합본부");
        }
	}
	
}


</script>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=<%=key%>"></script> 
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path06">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/associationIntroduce/index.do">조합소개</a></li>
			<li><a href="/m/location/view.do">본부안내</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i06"><img alt="본부위치" src="/images/m_truck/subtop/06top_1.png" /></li>
				<li class="txt01">화물공제조합 본부 위치와 주소 안내입니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont02 pt0">
			<!-- naver map api  높이 350px-->
			<div id="mapCanvas" class="mapCanvas" style="width:95%; height:350px; margin:10px; display:block;"></div>
			<script type="text/javascript">
				var oPoint = new nhn.api.map.LatLng(37.4970484, 126.9836436); //각 x,y값 변경
				nhn.api.map.setDefaultPoint('LatLng');
				oMap = new nhn.api.map.Map('mapCanvas', {
				point : oPoint,
				zoom : 11, // - 초기줌레벨은11으로둔다.
				enableWheelZoom : true,
				enableDragPan : false,
				enableDblClickZoom : false,
				mapMode : 0,
				activateTrafficMap : false,
				activateBicycleMap : false,
				size : new nhn.api.map.Size($('#mapCanvas').width(), 350)
				});
				
				var mapZoom = new nhn.api.map.ZoomControl(); // - 줌컨트롤선언
				mapZoom.setPosition({left:30, bottom:30}); // - 줌컨트롤위치지정
				
				var oSize = new nhn.api.map.Size(28, 37);
				var oOffset = new nhn.api.map.Size(14, 37);
				var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
				
				var oMarker = new nhn.api.map.Marker(oIcon, { title : '전국화물공제조합' });  //마커를생성한다
				oMarker.setPoint(oPoint); //마커의좌표를oPoint 에저장된좌표로지정한다
				oMap.addOverlay(oMarker); //마커를네이버지도위에표시한다
				
				var oLabel = new nhn.api.map.MarkerLabel(); // 마커라벨를선언한다. 
				oMap.addOverlay(oLabel); // - 마커의라벨을지도에추가한다. 
				oLabel.setVisible(true, oMarker); // 마커의라벨을보이게설정한다.
			</script>
			<!-- sns -->
			<div class="sns">
				<a title="트위터 공유하기" class="twitter" href="#;" ></a>
				<a title="페이스북 공유하기" class="facebook" href="#;" ></a>
				<a title="네이버 앱으로보기" class="naver" href="#;" onclick="linkApp();"></a>
			</div>
			<!-- 본지부정보 -->
			<div class="mapDetail">
				<ul>
					<li>서울시 서초구 방배본동 753-5 화련회관</li>
					<li>02) 3483-3700<a href="tel:02-3483-3700" class="btn_call"><img src="/images/m_truck/com/btn_call.png" alt-="전화연결" /></a></li>
					<li>02) 3483-3729</li>
					<li>
						<p><span class="txt01">4호선</span> 총신대 입구(도보 15분)</p>
						<p><span class="txt02">7호선</span> 이수역(도보 15분)</p>
						<p><span class="txt05">9호선</span> 구반포역(도보 15분)</p>
					</li>
					<li>
						<p><span class="txt03">초록(지선)버스</span> : 4212, 4425, 5524, 4318, 5524</p>
						<p><span class="txt04">파랑(간선)버스</span> : 360, 752, 502, 540, 643, 8541 이수교 하차</p>
					</li>
				</ul>
			</div>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>









