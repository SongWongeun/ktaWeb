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
/*
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
} */

//www.truck.or.kr Client ID
//2aItskMeOScSSNcY7Bvl
//m.truck.or.kr Client ID
//lty3WNE_9J8Uzrn3AfSJ
%>
<%
	String u1 = "http://" +request.getServerName();
	String u2 = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String thisUrl = u1+u2;
	String shareImage = u1+"/images/truck/jpg/thumb_fb_logo.jpg";
	//String shareImage = "http://www.truck.or.kr/img2009/kta_banner.gif";
%>
<html lang="ko">
<style>
/* 	.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;} */
/* 	.radius_border{border:1px solid #919191;border-radius:5px;}    */
/* 	.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;} */
/* 	.custom_typecontrol span {display:block;width:130px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;background-color:white;} */
/* 	.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);} */
/* 	.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);} */
</style>
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javascript">
try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
</script>
<meta property="og:title" content="화물공제조합 - 지부안내"/>
<meta property="og:url" content="<%=thisUrl%>?code1=${result.CODE1}&code2=${result.CODE2}"/>
<meta property="og:image" content="<%=shareImage%>"/>
<meta property="og:site_name" content="화물공제조합"/>
<meta property="og:description"
      content="화물공제조합 지부안내 페이지입니다."/>
      
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lty3WNE_9J8Uzrn3AfSJ"></script>      
<script type="text/javascript">
$(document).ready(function(){
	
	<%-- 지부선택 조회 선택시 event --%>
	$('form#f select[name="code1"]').on('change',function(event){
		var l = $('form#f select[name="code1"] option:selected').val();
		document.f.code1.value = l;
		document.f.code2.value = '';
		document.f.action = "<c:url value='/m/associationIntroduce/office/view.do#container'/>";
	   	document.f.submit();
	});
	$('form#f select[name="code2"]').on('change',function(event){
		var l = $('form#f select[name="code1"] option:selected').val();
		var o = $('form#f select[name="code2"] option:selected').val();
		document.f.code1.value = l;
		document.f.code2.value = o;
		document.f.action = "<c:url value='/m/associationIntroduce/office/view.do#container'/>";
	   	document.f.submit();
	});
	var returnUrl = '<%=thisUrl%>';
	var code ='?code1=${result.CODE1}&code2=${result.CODE2}';
	returnUrl = returnUrl+code;
	
	$('a.twitter').on('click',function(){		
		var msg = '화물공제조합 지부안내 페이지입니다.';
		window.open("https://twitter.com/intent/tweet?text=" + encodeURIComponent(msg)+"  "+encodeURIComponent( returnUrl ));//트위터추가
	});
	
	$('a.facebook').on('click',function(){		
		var url = 'https://www.facebook.com/sharer/sharer.php?u='+ encodeURIComponent( returnUrl );
	 	window.open( url );
	});
});
function printpage(){
	window.print();
}

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
            location.href = "navermaps://?menu=location&lat=${result.Y}&lng=${result.X}&title=${result.JIBU_NAME}";
       	
        }else if(/android/.test(str)){   
        	
	        var clickedAt = +new Date;            
	        naverAppCheckTimer = setTimeout(function() { 
	        if (+new Date - clickedAt < 2000){ 
	                 if (window.confirm("네이버앱 최신 버전이 설치되어 있지 않습니다.   \n설치페이지로 이동하시겠습니까?")){ 
	                	 goapp.close();
	                 	location.href = strGotoAnd; } 
	                 }
	        }, 1500);
	        goapp = open("navermaps://?menu=location&lat=${result.Y}&lng=${result.X}&title=${result.JIBU_NAME}");
        }
	}
	
}
</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path07">
		<ul>
			<li class="depth02"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li><a href="/m/associationIntroduce/office/view.do">지부안내</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
	<form:form commandName="searchVO" name="f" id="f" method="post">
		<%-- <article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i07"><img alt="지부안내아이콘" src="/images/m_truck/subtop/07top_1.png" /></li>
				<li class="txt01">지부 위치와 주소 안내입니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 --> --%>
		<article class="basicCont02 pt0">
			<%-- <div class="textTitle"><h2 class="txtTit03">지부명 찾기</h2></div> --%>
			<!-- 지부검색 -->
			<div class="searchOffice">
				<div class="txt">
					<p class="cellFirst">
						<span class="cellw12">지부</span>
						<span class="cellw11">
							<form:select class="select" id="code1" path="code1">
							<%-- <form:option value="">지역선택</form:option> --%>
							<%-- <form:option value="00">전체</form:option> --%>
							<form:option value="00">직할사업소</form:option>
							<form:option value="01">서울지부</form:option>
							<form:option value="02">부산지부</form:option>
							<form:option value="03">대구지부</form:option>
							<form:option value="04">인천지부</form:option>
							<form:option value="05">광주지부</form:option>
							<form:option value="06">대전지부</form:option>
							<form:option value="07">울산지부</form:option>
							<form:option value="08">경기지부</form:option>
							<form:option value="09">강원지부</form:option>
							<form:option value="10">충북지부</form:option>
							<form:option value="11">충남지부</form:option>
							<form:option value="12">전북지부</form:option>
							<form:option value="13">전남지부</form:option>
							<form:option value="14">경북지부</form:option>
							<form:option value="15">경남지부</form:option>
							<form:option value="16">제주지부</form:option>
							</form:select>
						</span>
					</p>
				</div>
				<div class="txt">
					<p class="cellFirst">
						<span class="cellw12">사업(출장)소</span>
						<span class="cellw11">
							<form:select class="select" id="code2" path="code2">
							<%-- <form:option value="">지부선택</form:option> --%>
							<c:forEach var="list" items="${list}">
							<form:option value="${list.CODE2}">${list.JIBU_NAME}</form:option>
							</c:forEach>
							</form:select>
						</span>
					</p>
				</div>
				<a class="btn" href="#;"><i class="icon-search"></i></a>
			</div>
			<div class="map_wrap">
			    <div id="map" style="width:100%;height:350px;position:relative;overflow:hidden;"></div> 
<!-- 			    <div class="custom_typecontrol radius_border"> -->
<%-- 			        <span id="btnRoadmap" class="btn" onclick="goingback()">${ result.JIBU_NAME}로</span> --%>
<!-- 			    </div> -->
			</div>
			<!-- ----------------카카오톡 지도--------------------- -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f56d4d0d58a46a1376571a28b0d43a79&libraries=services"></script>
			<script>
				var mapContainer = document.getElementById('map');
// 				var fX = 0;
// 				var fY = 0;
				var X = ${result.X};
				var Y = ${result.Y};
				var mapOption = {center: new kakao.maps.LatLng(Y,X),
							   level: 3};
				
				var map = new kakao.maps.Map(mapContainer, mapOption);
				var geocoder = new kakao.maps.services.Geocoder();
				geocoder.addressSearch('"${ result.NEW_ADDR }"', function(result, status) {
	
				     if (status === kakao.maps.services.Status.OK) {
	
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
// 				        fX = result[0].x;
// 						fY = result[0].y;
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
	
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${ result.JIBU_NAME}</div>'
				        });
				        infowindow.open(map, marker);
	
				        map.setCenter(coords);
				    }
				     
				});
				
// 				function goingback(){
// 					var firstpoint = new kakao.maps.LatLng(fY, fX);
// 					map.setCenter(firstpoint);
// 				}
			</script>
			<!-- sns -->
			<div class="sns">
				<a title="트위터 공유하기" class="twitter" href="#;" ></a>
				<a title="페이스북 공유하기" class="facebook" href="#;" ></a>
<!-- 				<a title="네이버 앱으로보기" class="naver" href="#;" onclick="linkApp();"></a> -->
			</div>
			<!-- 본지부정보 -->
			<div class="mapDetail">
				<ul>
					<li><c:out value="${result.NEW_ADDR}"/><c:if test="${not empty result.ADDR}"><br>(${result.ADDR})</br></c:if></li>
					<li><c:out value="${result.PHONE1 }"/></li>
					<c:if test="${not empty result.PHONE2}"><li><c:out value="${result.PHONE2 }"/></li></c:if>
				</ul>
			</div>
		</article>
		</form:form>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>









