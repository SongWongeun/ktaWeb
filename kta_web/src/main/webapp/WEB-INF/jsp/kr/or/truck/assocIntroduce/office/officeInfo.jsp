<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String ip =request.getServerName();

String key = "";			//"www.truck.or.kr";
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
	String u1 = "http://"+request.getServerName();
	String u2 = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String thisUrl = u1+u2;
	String shareImage = u1+"/images/truck/jpg/thumb_fb_logo.jpg";
	//String shareImage = "http://www.truck.or.kr/img2009/kta_banner.gif";
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
<!-- <script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=<%=key%>"></script> --> 
<meta property="og:title" content="?????????????????? - ????????????"/>
<meta property="og:url" content="<%=thisUrl%>?code1=${result.CODE1}&code2=${result.CODE2}"/>
<meta property="og:image" content="<%=shareImage%>"/>
<meta property="og:site_name" content="??????????????????"/>
<meta property="og:description"
      content="?????????????????? ???????????? ??????????????????."/>
      
<style>
	.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
	.radius_border{border:1px solid #919191;border-radius:5px;}   
	.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;}
	.custom_typecontrol span {display:block;width:130px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;background-color:white;}
	.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}
	.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
</style>

<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){

	var returnUrl = '<%=thisUrl%>';
	var code ='?code1=${result.CODE1}&code2=${result.CODE2}';
	returnUrl = returnUrl+code;
	
	$('a.twitter').on('click',function(){		
		var msg = '?????????????????? ???????????? ??????????????????.';
		window.open("https://twitter.com/intent/tweet?text=" + encodeURIComponent(msg)+"  "+encodeURIComponent( returnUrl ));//???????????????
	});
	
	$('a.facebook').on('click',function(){		
		var url = 'https://www.facebook.com/sharer/sharer.php?u='+ encodeURIComponent( returnUrl );
	 	window.open( url );
	});
});
function changeCode2(code){
	$("#code2").val(code);
	document.boardForm.action = "<c:url value='/assocIntroduce/office/officeInfo.do#container'/>";
   	document.boardForm.submit();
}
function changeCode1(code){
	$("#code1").val(code);
	$("#code2").val("00");
	document.boardForm.action = "<c:url value='/assocIntroduce/office/officeInfo.do#container'/>";
   	document.boardForm.submit();
}
function printpage(){
	document.boardForm.action = "<c:url value='/assocIntroduce/office/printOffice.do'/>";
	document.boardForm.target="printOffice";
	window.open("",'printOffice','toolbar=no,location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=1024,height=665 top=10 left=10');
   	document.boardForm.submit();
	document.boardForm.target="";
}

</script>
</head>
<body>
	<div class="skipMenu"  title="????????????" >
		<a href="#Gnb">????????? ????????????</a>
		<a href="#Contents">????????? ????????????</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/asso/office_tit.gif" alt="????????????" /></h2>
						<p>?????? ???????????? ???????????? ?????????????????? ?????????&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">????????????</a>
						<span>????????????</span>
					</div>
				</div><!--// conTitle e -->
				<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post" action="">
				<fieldset>
				<legend>???????????????</legend>
				<form:input path="code1" type="hidden" id="code1" />
				<form:input path="code2" type="hidden" id="code2"/>
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/office_con_tit.gif" alt="????????????????????? ?????? ????????? ?????? ???????????????" /></p>
					<div class="conSection">
						<!-- office tabs s -->
						<div class="tabs" >
							<ul class="officetabMenu" id="officeTab">
								<li class="<c:if test="${result.CODE1 == '01'}">office01 on</c:if> office01" onclick="<c:if test="${result.CODE1 != '01'}">changeCode1('01')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '01'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '02'}">office02 on</c:if> office02" onclick="<c:if test="${result.CODE1 != '02'}">changeCode1('02')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '02'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '03'}">office03 on</c:if> office03" onclick="<c:if test="${result.CODE1 != '03'}">changeCode1('03')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '03'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '04'}">office04 on</c:if> office04" onclick="<c:if test="${result.CODE1 != '04'}">changeCode1('04')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '04'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
									</ul>
								</li>	
								<li class="<c:if test="${result.CODE1 == '05'}">office05 on</c:if> office05" onclick="<c:if test="${result.CODE1 != '05'}">changeCode1('05')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '05'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '06'}">office06 on</c:if> office06" onclick="<c:if test="${result.CODE1 != '06'}">changeCode1('06')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '06'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '07'}">office07 on</c:if> office07" onclick="<c:if test="${result.CODE1 != '07'}">changeCode1('07')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '07'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>								
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">?????? ???????????????</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '08'}">office08 on</c:if> office08" onclick="<c:if test="${result.CODE1 != '08'}">changeCode1('08')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '08'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if> none" onclick="changeCode2('00');return false;"><a href="#;" >????????????</a></li>										
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">???????????? ??????????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">???????????? ???????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '03'}">on02</c:if>" onclick="changeCode2('03');return false;"><a href="#;">???????????? ???????????????</a></li>										
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '09'}">office09 on</c:if> office09" onclick="<c:if test="${result.CODE1 != '09'}">changeCode1('09')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '09'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">???????????? ???????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">???????????? ???????????????</a></li>										
									</ul>
								</li>														
								<li class="<c:if test="${result.CODE1 == '10'}">office10 on</c:if> office10" onclick="<c:if test="${result.CODE1 != '10'}">changeCode1('10')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '10'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">???????????? ???????????????</a></li>
									</ul>
								</li>						
								<li class="<c:if test="${result.CODE1 == '11'}">office11 on</c:if> office11" onclick="<c:if test="${result.CODE1 != '11'}">changeCode1('11')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '11'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">???????????? ???????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">???????????? ???????????????</a></li>
									</ul>
								</li>	
								<li class="<c:if test="${result.CODE1 == '12'}">office12 on</c:if> office12" onclick="<c:if test="${result.CODE1 != '12'}">changeCode1('12')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '12'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">???????????? ???????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">???????????? ???????????????</a></li>
									</ul>
								</li>		
								<li class="<c:if test="${result.CODE1 == '13'}">office13 on</c:if> office13" onclick="<c:if test="${result.CODE1 != '13'}">changeCode1('13')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '13'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">???????????? ???????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">???????????? ???????????????</a></li>										
									</ul>
								</li>																				
								<li class="<c:if test="${result.CODE1 == '14'}">office14 on</c:if> office14" onclick="<c:if test="${result.CODE1 != '14'}">changeCode1('14')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '14'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">???????????? ?????? ???????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">???????????? ???????????????</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '15'}">office15 on</c:if> office15" onclick="<c:if test="${result.CODE1 != '15'}">changeCode1('15')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '15'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">???????????? ???????????????</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">???????????? ???????????????</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '16'}">office16 on</c:if> office16" onclick="changeCode1('16');return false;">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '16'}">style="display:block"</c:if>>
										<li class="on02"><a href="#;">????????????</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '00'}">office00 on</c:if> office00" onclick="<c:if test="${result.CODE1 != '00'}">changeCode1('00')</c:if>">
									<a href="#;"><span class="hide">??????</span></a>
									<ul <c:if test="${result.CODE1 == '00'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">???????????????</a></li>
									</ul>
								</li>
							</ul><!-- officetabMenu e -->
							<div class="map_wrap">
							    <div id="map" style="width:100%;height:350px;position:relative;overflow:hidden;"></div> 
<!-- 							    <div class="custom_typecontrol radius_border"> -->
<%-- 							        <span id="btnRoadmap" class="btn" onclick="goingback()">${ result.JIBU_NAME}???</span> --%>
<!-- 							    </div> -->
							</div>
							<div class="tabContainer">
								<h3 class="hide">????????? ???&#183;?????? ????????? ?????? ??????</h3>
								<div class="officeArea clfix">
									<h4><img src="/images/truck/asso/Location_sub_tit01.gif" alt="????????????" /></h4>
									<div class="snsRight">
										<a title="????????????" class="print" href="#;" onclick="printpage();"><span class="hide" onclick="">?????? ????????? ???????????? ????????????</span></a>
										<a title="????????? ????????????" class="twitter" href="#;"><span class="hide">?????????</span></a>
										<a title="???????????? ????????????" class="facebook" href="#;"><span class="hide">????????????</span></a>
									</div>
								</div>
								
								<!-- ???????????? ??? ???????????? ??????  -->
								<div class="mapInfo">
<%-- 									<a href="https://map.naver.com/v5/?c=${result.X},${result.Y},14,0,0,0,dh" target="_blank" title="??????????????? ????????????" class="btn_navermap"> --%>
<!-- 									<img src="/images/truck/btn/btn_navermap.png" alt="naver???????????????" /></a> -->
									<p class="mapInfo01"><c:out value="${result.NEW_ADDR}"/><c:if test="${not empty result.ADDR}"><br>(${result.ADDR})</br></c:if></p>
									<c:if test="${not empty result.PHONE1}"><p class="mapInfo02">&#40;<c:out value="${result.PHONE1 }"/></p></c:if>
									<c:if test="${not empty result.PHONE2}"><p class="mapInfo03">&#40;<c:out value="${result.PHONE2 }"/></p></c:if>
								</div>
								<!-- ----------------???????????? ??????--------------------- -->
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f56d4d0d58a46a1376571a28b0d43a79&libraries=services"></script>
								<script>
									var mapContainer = document.getElementById('map');
									
// 									var fX = 0;
// 									var fY = 0;
									var X = ${result.X};
									var Y = ${result.Y};
									var mapOption = {center: new kakao.maps.LatLng(Y,X),
												   level: 3};
									
									var map = new kakao.maps.Map(mapContainer, mapOption);
									var geocoder = new kakao.maps.services.Geocoder();
									geocoder.addressSearch('"${ result.NEW_ADDR }"', function(result, status) {

									     if (status === kakao.maps.services.Status.OK) {

									        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
// 											fX = result[0].x;
// 											fY = result[0].y;
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
									
// 									function goingback(){
// 										var firstpoint = new kakao.maps.LatLng(fY, fX);
// 										map.setCenter(firstpoint);
// 									}
								</script>
								
								<!-- ----------------???????????? ??????--------------------- -->
							</div><!--// tabContainer e -->
						</div>
						<!--// office tabs e -->
					</div>
				</div><!--// conaArea e -->
				</fieldset>
				</form:form>
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