<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
function printpage(){
	window.print();
}
</script>
</head>
<body>
	<div id="mapPop">
		<div class="mapTit clfix">
			<h2>화물공제조합 본부 위치 안내</h2>
			<div class="snsRight">
				<a title="새창열림" class="print" href="#;" onclick="printpage();"><span class="hide" onclick="">현재 화면을 프린트로 인쇄하기</span></a>
			</div>
		</div>
		<!-- 지도 관련 부분 -->
		<!-- <div class="mapCanvas" ><img src="/images/truck/asso/kta_map.gif" alt="화물공제조합 본부 위치 안내" /></div> -->
		<div id="map" style="width:100%;height:350px;position:relative;overflow:hidden;"></div> 
		<!-- 상세위치 및 전화번호 안내 -->
		<div class="mapInfo clfix">
			<div class="mapLeft">
				<h3><img src="/images/truck/asso/Location_sub_tit01.gif"  alt="위치안내" /></h3>
				<p class="mapInfo01">서울시 서초구 동작대로 230<br/>&#40;서울시 서초구 방배본동 753&#45;5 화련회관&#41;</p>
				<p class="mapInfo02">02&#45;3483&#45;3700</p>
				<p class="mapInfo03">02&#45;3483&#45;3729</p>
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
		        	content: '<div style="width:150px;height:24px;text-align:center;padding:6px 0;font-weight:bold;"><img src="/images/truck/com/sub_logo.gif" style="width:100px;padding-top:3px;" alt="KTA | 전국화물자동차공제조합"></div>'
		        });
		        infowindow.open(map, marker);

		        map.setCenter(coords);
		        map.setDraggable(false);
		    }
		});
	</script>
</body>
</html>