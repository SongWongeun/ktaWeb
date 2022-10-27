<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<meta property="og:title" content="화물공제조합 - 본부안내"/>
<meta property="og:url" content="<%=thisUrl%>"/>
<meta property="og:image" content="<%=shareImage%>"/>
<meta property="og:site_name" content="화물공제조합"/>
<meta property="og:description"
      content="화물공제조합 본부안내 페이지입니다."/>
      
      
<script type="text/javaScript" language="javascript" defer="defer">
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

function printpage(){
	document.boardForm.action = "<c:url value='/assocIntroduce/office/printOfficeHq.do'/>";
	document.boardForm.target="printOfficeHq";
	window.open("",'printOfficeHq','toolbar=no,location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=971,height=760 top=10 left=10');
   	document.boardForm.submit();;
	document.boardForm.target="";
}

</script>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=<%=key%>"></script> 
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/asso/Location_tit.gif" alt="본부위치" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<span>본부안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
				<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post" action="">
				<fieldset>
				<legend>화물공제조합 본부위치 안내</legend>
				</fieldset>
				</form:form>
					<p class="confirTit"><img src="/images/truck/asso/Location_con_tit.gif" alt="화물공제조합 본부 위치 안내 입니다" /></p>
					<div class="conSection">
						<div class="contact cfix">
							<p class="consecTit pB0"><img src="/images/truck/asso/Location_sec_tit.gif" alt="고객에게 사랑과 정성을 다하는 화물공제조합 입니다." /></p>
							<div class="snsRight02">
								<a title="새창열림" class="print" href="#;" onclick="printpage()"><span class="hide">현재 화면을 프린트로 인쇄하기</span></a>
								<a title="트위터 공유하기" class="twitter" href="#;"><span class="hide">트위터</span></a>
								<a title="페이스북 공유하기" class="facebook" href="#;"><span class="hide">페이스북</span></a>
							</div>
						</div>
						<div id="map" style="width:100%;height:350px;position:relative;overflow:hidden;"></div> 
						<!-- ----------------카카오톡 지도--------------------- -->
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f56d4d0d58a46a1376571a28b0d43a79&libraries=services"></script>
						<script>
							var mapContainer = document.getElementById('map');

							var mapOption = {center: new kakao.maps.LatLng(0,0),
										   level: 3};
							
							var map = new kakao.maps.Map(mapContainer, mapOption);
							var geocoder = new kakao.maps.services.Geocoder();
							geocoder.addressSearch('서울시 서초구 동작대로 230', function(result, status) {
	
							     if (status === kakao.maps.services.Status.OK) {
	
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									var marker = new kakao.maps.Marker({
							            map: map,
							            position: coords
							        });
	
							        var infowindow = new kakao.maps.InfoWindow({
							            content: '<div style="width:150px;text-align:center;padding:6px 0;"><img src="/images/truck/com/sub_logo.gif" style="width:100px;" alt="KTA | 전국화물자동차공제조합"></div>'
							        });
							        infowindow.open(map, marker);
	
							        map.setCenter(coords);
							    }
							});
						</script>
						<!-- 상세위치 및 전화번호 안내  -->
						<div class="mapInfo clfix">
							<div class="mapLeft">
								<h3><img src="/images/truck/asso/Location_sub_tit01.gif"  alt="위치안내" /></h3>
								<p class="mapInfo01">서울시 서초구 동작대로 230<br/>&#40;서울시 서초구 방배본동 753&#45;5 화련회관&#41;</p>
								<p class="mapInfo02">&#40;02&#41;3483&#45;3700</p>
								<p class="mapInfo03">&#40;02&#41;3483&#45;3729</p>
							</div>
							<div class="mapRight">
								<h3><img src="/images/truck/asso/Location_sub_tit02.gif"  alt="교통편안내" /></h3>
								<ul class="mapInfo04">
									<li><span class="mapInfoli01">총신대입구</span><span class="mapInfoli02">이수역 &#40;도보 15분&#41;</span></li>
									<li class="mapInfoli05">구반포역 &#40;도보 15분&#41;</li>
								</ul>
								<ul class="mapInfo05">
									<li class="mapInfoli03">4212&#44; 4425&#44; 5524&#44; 4318&#44; 5524</li>
									<li class="mapInfoli04">360&#44; 752&#44; 502&#44; 540&#44; 643&#44; 8541</li>
								</ul>
							</div>
						</div>
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>