<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
</script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=2aItskMeOScSSNcY7Bvl"></script>
<!-- <script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=<%=key%>"></script>  --> 
<script type="text/javascript">
function printpage(){
	window.print();
}
</script>
</head>
<body>
	<div id="mapPop">
		<div class="mapTit clfix">
			<h2>${result.JIBU_NAME}</h2>
			<div class="snsRight">
				<a title="인쇄하기" class="print" href="#;" onclick="printpage();"><span class="hide" onclick="">현재 화면을 프린트로 인쇄하기</span></a>
			</div>
		</div>
		<!-- 지도API관련부분  -->
<!-- 		<div id="mapCanvas" class="mapCanvas"></div> -->
		<div id="map" style="width:auto;height:350px"></div>

		<!-- ----------------카카오톡 지도--------------------- -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f56d4d0d58a46a1376571a28b0d43a79&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map');
			
			var X = ${result.X};
			var Y = ${result.Y};
			var mapOption = {center: new kakao.maps.LatLng(Y,X),
						   level: 3};
			
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch('"${ result.NEW_ADDR }"', function(result, status) {

			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${ result.JIBU_NAME}</div>'
			        });
			        infowindow.open(map, marker);

			        map.setCenter(coords);
			        map.setDraggable(false);
			    }
			});
			
		</script>
		<script>
// 		var mapOptions = {
// 		    center: new naver.maps.LatLng(${result.Y}, ${result.X}),
// 		    zoom: 11
// 		};
		
		
		
// 		var map = new naver.maps.Map('mapCanvas', mapOptions);
		
// 		var marker = new naver.maps.Marker({
// 		    position: new naver.maps.LatLng(${result.Y}, ${result.X}),
// 		    map: map
// 		});
		</script>
		
		<!-- <script type="text/javascript">
		var oPoint = new nhn.api.map.LatLng("${result.Y}", "${result.X}"); //각 x,y값 변경
		nhn.api.map.setDefaultPoint('LatLng');
		oMap = new nhn.api.map.Map('mapCanvas', {
		point : oPoint,
		zoom : 11, // - 초기줌레벨은11으로둔다.
		enableWheelZoom : true,
		enableDragPan : true,
		enableDblClickZoom : false,
		mapMode : 0,
		activateTrafficMap : false,
		activateBicycleMap : false,
		minMaxLevel : [ 1, 12 ],
		size : new nhn.api.map.Size(1024, 430)
		});
		
		var mapZoom = new nhn.api.map.ZoomControl(); // - 줌컨트롤선언
		mapZoom.setPosition({left:30, bottom:30}); // - 줌컨트롤위치지정
		oMap.addControl(mapZoom); // - 줌컨트롤추가.
		
		var oSize = new nhn.api.map.Size(28, 37);
		var oOffset = new nhn.api.map.Size(14, 37);
		var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
		
		var oMarker = new nhn.api.map.Marker(oIcon, { title : '${result.JIBU_NAME}' });  //마커를생성한다
		oMarker.setPoint(oPoint); //마커의좌표를oPoint 에저장된좌표로지정한다
		oMap.addOverlay(oMarker); //마커를네이버지도위에표시한다
		
		var oLabel = new nhn.api.map.MarkerLabel(); // 마커라벨를선언한다. 
		oMap.addOverlay(oLabel); // - 마커의라벨을지도에추가한다. 
		oLabel.setVisible(true, oMarker); //- 마커의라벨을보이게설정한다.
		</script> -->
		<!-- 상세위치 및 전화번호 안내  -->
		<div class="mapInfo">
			<p class="mapInfo01"><c:out value="${result.NEW_ADDR}"/><c:if test="${not empty result.ADDR}"><br>(${result.ADDR})</br></c:if></p>
			<p class="mapInfo02"><c:out value="${result.PHONE1 }"/></p>
			<p class="mapInfo03"><c:out value="${result.PHONE2 }"/></p>
		</div>
	</div>
</body>
</html>