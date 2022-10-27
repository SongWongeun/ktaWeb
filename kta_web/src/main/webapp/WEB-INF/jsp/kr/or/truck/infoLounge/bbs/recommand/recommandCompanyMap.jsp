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
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript 
<script type="text/javascript">
try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
</script>
-->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=2aItskMeOScSSNcY7Bvl"></script>
<c:import url="/common/include/subGlobal.do"></c:import>
</head>
<body>
	<div id="popUp">
		<div class="rcMap">
			<p class="rcName"><c:out value="${name}"/></p>
			<p class="mapGuide">해당 사업장 위치 지도 서비스는 네이버 api로 별도의 접근성을 제공하지 않습니다&#46;<a href="#;" onclick="">지도api 정보 건너뛰기</a></p>
				<div id="mapCanvas" class="mapCanvas" style="border:1px solid #000 width:700px height:400px margin:20px display:block"></div>	 
				<span class="hide">네이버 지도API서비스</span> 
				<script>
				var person = $.parseJSON('${jsondata}');
				var x;
				var y;
				
				if( person.result == null )
				{	
					//도로명 주소일 경우에는 java소스상에서 정보를 제대로 못가져온다. 임의값을 셋팅해주고
					x = 126.9025759;
					y = 37.5650014;
				} else {
					x = person.result.items[0].point.x;
					y = person.result.items[0].point.y;
				}
				
				//126.9025759,                    "y": 37.5650014
				//(37.338337, 127.110111),
				var mapOptions = {
				    center: new naver.maps.LatLng(y, x),
				    zoom: 11
				};
				
				var map = new naver.maps.Map('mapCanvas', mapOptions);
				
				var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(y, x),
				    map: map
				});
				
				if( person.result == null ) {
					//도로명 주소를 다시 검색해준다.
					searchAddressToCoordinate('${name}');
				}
				
				// result by latlng coordinate
				function searchAddressToCoordinate(address) {
					naver.maps.Service.geocode({
						address: address
					}, function(status, response) {
						if (status === naver.maps.Service.Status.ERROR) {
							return alert('Something Wrong!');
						}

						var item = response.result.items[0],
							addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
							point = new naver.maps.Point(item.point.x, item.point.y);

						map.setCenter(point);
					});
				}
				</script>							
			<p class="rcmInfo">
				<span class="add"><c:out value="${address}"/></span>
			</p>
		</div>
	</div>
</body>
</html>