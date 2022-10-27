<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en_US" xml:lang="en_US">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
  <title>OpenAPI Map Test</title>
  <style>v\:* { behavior: url(#default#VML); }</style>
  <!-- prevent IE6 flickering -->
  <script type="text/javascript">
   try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
  </script>

<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=b6cc0859933ceaa5db87af82e6fc38f1"></script>
 </head>
 <body>
 <div id = "testMap" style="border:1px solid #000; width:700px; height:400px; margin:20px; z-index:5; display:block;"></div>
 <script type="text/javascript">
			var oPoint = new nhn.api.map.LatLng(37.4970484, 126.9836436);
			nhn.api.map.setDefaultPoint('LatLng');
			oMap = new nhn.api.map.Map('testMap', {
						point : oPoint,
						zoom : 11, // - 초기 줌 레벨은 11으로 둔다.
						enableWheelZoom : true,
						enableDragPan : true,
						enableDblClickZoom : false,
						mapMode : 0,
						activateTrafficMap : false,
						activateBicycleMap : false,
						minMaxLevel : [ 1, 13 ],
						size : new nhn.api.map.Size(500, 400)
			});

			var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
			mapZoom.setPosition({left:30, bottom:30}); // - 줌 컨트롤 위치 지정
			oMap.addControl(mapZoom); // - 줌 컨트롤 추가.

			var oSize = new nhn.api.map.Size(28, 37);
			var oOffset = new nhn.api.map.Size(14, 37);
			var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
			   
			var oMarker = new nhn.api.map.Marker(oIcon, { title : '전국화물공제조합' });  //마커를 생성한다 
			oMarker.setPoint(oPoint); //마커의 좌표를 oPoint 에 저장된 좌표로 지정한다
			oMap.addOverlay(oMarker); //마커를 네이버 지도위에 표시한다
			 
			var oLabel = new nhn.api.map.MarkerLabel(); // 마커 라벨를 선언한다. 
			oMap.addOverlay(oLabel); // - 마커의 라벨을 지도에 추가한다. 
			oLabel.setVisible(true, oMarker); // 마커의 라벨을 보이게 설정한다.
  </script>
 </body>
</html>
				