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
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javascript">
try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
</script>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=<%=key%>"></script> 
<script type="text/javascript" >
function searchCompany() {	
	document.boardForm.action = "<c:url value='/m/infoLounge/recommandCompany/list.do'/>";
   	document.boardForm.submit();
}
</script> 
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path04">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/infoLounge/index.do">정보마당</a></li>
			<li><a href="/m/infoLounge/recommandCompany/list.do">우수협력정비업체</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="mapView">
			<!-- naver map api  -->
			<div class="rcMap" style="width:95%; height:350px; margin:10px; display:block;">
					<div id="mapCanvas" class="mapCanvas" ></div>								
					<script type="text/javascript">
					var oPoint = new nhn.api.map.LatLng("${result[0].point.y}", "${result[0].point.x}"); //각 x,y값 변경
					nhn.api.map.setDefaultPoint('LatLng');
					oMap = new nhn.api.map.Map('mapCanvas', {
					point : oPoint,
					zoom : 12, // - 초기줌레벨은11으로둔다.
					enableWheelZoom : true,
					enableDragPan : false,
					enableDblClickZoom : false,
					mapMode : 0,
					activateTrafficMap : false,
					activateBicycleMap : false,
					minMaxLevel : [ 1, 12 ],
					size : new nhn.api.map.Size($('div.rcMap').width(), 350)
					});
					
					var oSize = new nhn.api.map.Size(28, 37);
					var oOffset = new nhn.api.map.Size(14, 37);
					var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
					
					var oMarker = new nhn.api.map.Marker(oIcon, { title : '${name}' });  //마커를생성한다
					oMarker.setPoint(oPoint); //마커의좌표를oPoint 에저장된좌표로지정한다
					oMap.addOverlay(oMarker); //마커를네이버지도위에표시한다
	
					var oLabel = new nhn.api.map.MarkerLabel(); // 마커라벨를선언한다. 
					oMap.addOverlay(oLabel); // - 마커의라벨을지도에추가한다. 
					oLabel.setVisible(true, oMarker); //- 마커의라벨을보이게설정한다.
					 </script>
			</div>
			<!-- 우수협력업체정보 -->
			<div class="detailView">
				<h2><c:out value="${name}"/></h2>
				<ul>
					<li><c:out value="${address}"/></li>
					<li><c:out value="${tel}"/></li>
				</ul>
			</div>
		</article>
		<!--// mapView -->
		<article class="btn_r_area">
		<form:form commandName="searchVO" name="boardForm" method="post">
			<a href="#;" onclick="searchCompany(); return false;"class="btn btn-black">목록</a>
			<form:hidden path="searchDirect"/>
			<form:hidden path="searchKeyword"/>
			<form:hidden path="pageIndex"/>
		</form:form>
		</article>
		<!-- // btn_areas -->
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>