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
<meta property="og:title" content="화물공제조합 - 지부안내"/>
<meta property="og:url" content="<%=thisUrl%>?code1=${result.CODE1}&code2=${result.CODE2}"/>
<meta property="og:image" content="<%=shareImage%>"/>
<meta property="og:site_name" content="화물공제조합"/>
<meta property="og:description"
      content="화물공제조합 지부안내 페이지입니다."/>
      
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
		var msg = '화물공제조합 지부안내 페이지입니다.';
		window.open("https://twitter.com/intent/tweet?text=" + encodeURIComponent(msg)+"  "+encodeURIComponent( returnUrl ));//트위터추가
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
 						<h2><img src="/images/truck/asso/office_tit.gif" alt="지부안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<span>지부안내</span>
					</div>
				</div><!--// conTitle e -->
				<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post" action="">
				<fieldset>
				<legend>본지부안내</legend>
				<form:input path="code1" type="hidden" id="code1" />
				<form:input path="code2" type="hidden" id="code2"/>
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/office_con_tit.gif" alt="화물공제조합의 지부 위치와 주소 안내입니다" /></p>
					<div class="conSection">
						<!-- office tabs s -->
						<div class="tabs" >
							<ul class="officetabMenu" id="officeTab">
								<li class="<c:if test="${result.CODE1 == '01'}">office01 on</c:if> office01" onclick="<c:if test="${result.CODE1 != '01'}">changeCode1('01')</c:if>">
									<a href="#;"><span class="hide">서울</span></a>
									<ul <c:if test="${result.CODE1 == '01'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">서울지부</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '02'}">office02 on</c:if> office02" onclick="<c:if test="${result.CODE1 != '02'}">changeCode1('02')</c:if>">
									<a href="#;"><span class="hide">부산</span></a>
									<ul <c:if test="${result.CODE1 == '02'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">부산지부</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '03'}">office03 on</c:if> office03" onclick="<c:if test="${result.CODE1 != '03'}">changeCode1('03')</c:if>">
									<a href="#;"><span class="hide">대구</span></a>
									<ul <c:if test="${result.CODE1 == '03'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">대구지부</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '04'}">office04 on</c:if> office04" onclick="<c:if test="${result.CODE1 != '04'}">changeCode1('04')</c:if>">
									<a href="#;"><span class="hide">인천</span></a>
									<ul <c:if test="${result.CODE1 == '04'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">인천지부</a></li>
									</ul>
								</li>	
								<li class="<c:if test="${result.CODE1 == '05'}">office05 on</c:if> office05" onclick="<c:if test="${result.CODE1 != '05'}">changeCode1('05')</c:if>">
									<a href="#;"><span class="hide">광주</span></a>
									<ul <c:if test="${result.CODE1 == '05'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">광주지부</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '06'}">office06 on</c:if> office06" onclick="<c:if test="${result.CODE1 != '06'}">changeCode1('06')</c:if>">
									<a href="#;"><span class="hide">대전</span></a>
									<ul <c:if test="${result.CODE1 == '06'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">대전지부</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '07'}">office07 on</c:if> office07" onclick="<c:if test="${result.CODE1 != '07'}">changeCode1('07')</c:if>">
									<a href="#;"><span class="hide">울산</span></a>
									<ul <c:if test="${result.CODE1 == '07'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">울산지부</a></li>								
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">울산 온산출장소</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '08'}">office08 on</c:if> office08" onclick="<c:if test="${result.CODE1 != '08'}">changeCode1('08')</c:if>">
									<a href="#;"><span class="hide">경기</span></a>
									<ul <c:if test="${result.CODE1 == '08'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if> none" onclick="changeCode2('00');return false;"><a href="#;" >경기지부</a></li>										
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">경기지부 의정부사업소</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">경기지부 평택사업소</a></li>
										<li class="<c:if test="${result.CODE2 == '03'}">on02</c:if>" onclick="changeCode2('03');return false;"><a href="#;">경기지부 용인사업소</a></li>										
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '09'}">office09 on</c:if> office09" onclick="<c:if test="${result.CODE1 != '09'}">changeCode1('09')</c:if>">
									<a href="#;"><span class="hide">강원</span></a>
									<ul <c:if test="${result.CODE1 == '09'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">강원지부</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">강원지부 원주출장소</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">강원지부 강릉출장소</a></li>										
									</ul>
								</li>														
								<li class="<c:if test="${result.CODE1 == '10'}">office10 on</c:if> office10" onclick="<c:if test="${result.CODE1 != '10'}">changeCode1('10')</c:if>">
									<a href="#;"><span class="hide">충북</span></a>
									<ul <c:if test="${result.CODE1 == '10'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">충북지부</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">충북지부 충주사업소</a></li>
									</ul>
								</li>						
								<li class="<c:if test="${result.CODE1 == '11'}">office11 on</c:if> office11" onclick="<c:if test="${result.CODE1 != '11'}">changeCode1('11')</c:if>">
									<a href="#;"><span class="hide">충남</span></a>
									<ul <c:if test="${result.CODE1 == '11'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">충남지부</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">충남지부 천안사업소</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">충남지부 세종출장소</a></li>
									</ul>
								</li>	
								<li class="<c:if test="${result.CODE1 == '12'}">office12 on</c:if> office12" onclick="<c:if test="${result.CODE1 != '12'}">changeCode1('12')</c:if>">
									<a href="#;"><span class="hide">전북</span></a>
									<ul <c:if test="${result.CODE1 == '12'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">전북지부</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">전북지부 군산사업소</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">전북지부 정읍출장소</a></li>
									</ul>
								</li>		
								<li class="<c:if test="${result.CODE1 == '13'}">office13 on</c:if> office13" onclick="<c:if test="${result.CODE1 != '13'}">changeCode1('13')</c:if>">
									<a href="#;"><span class="hide">전남</span></a>
									<ul <c:if test="${result.CODE1 == '13'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">전남지부</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">전남지부 순천사업소</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">전남지부 목포사업소</a></li>										
									</ul>
								</li>																				
								<li class="<c:if test="${result.CODE1 == '14'}">office14 on</c:if> office14" onclick="<c:if test="${result.CODE1 != '14'}">changeCode1('14')</c:if>">
									<a href="#;"><span class="hide">경북</span></a>
									<ul <c:if test="${result.CODE1 == '14'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">경북지부</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">경북지부 안동 구미사업소</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">경북지부 포항사업소</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '15'}">office15 on</c:if> office15" onclick="<c:if test="${result.CODE1 != '15'}">changeCode1('15')</c:if>">
									<a href="#;"><span class="hide">경남</span></a>
									<ul <c:if test="${result.CODE1 == '15'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">경남지부</a></li>
										<li class="<c:if test="${result.CODE2 == '01'}">on02</c:if>" onclick="changeCode2('01');return false;"><a href="#;">경남지부 부산사업소</a></li>
										<li class="<c:if test="${result.CODE2 == '02'}">on02</c:if>" onclick="changeCode2('02');return false;"><a href="#;">경남지부 진주사업소</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '16'}">office16 on</c:if> office16" onclick="changeCode1('16');return false;">
									<a href="#;"><span class="hide">제주</span></a>
									<ul <c:if test="${result.CODE1 == '16'}">style="display:block"</c:if>>
										<li class="on02"><a href="#;">제주지부</a></li>
									</ul>
								</li>
								<li class="<c:if test="${result.CODE1 == '00'}">office00 on</c:if> office00" onclick="<c:if test="${result.CODE1 != '00'}">changeCode1('00')</c:if>">
									<a href="#;"><span class="hide">직할</span></a>
									<ul <c:if test="${result.CODE1 == '00'}">style="display:block"</c:if>>
										<li class="<c:if test="${result.CODE2 == '00'}">on02</c:if>" onclick="changeCode2('00');return false;"><a href="#;">직할사업소</a></li>
									</ul>
								</li>
							</ul><!-- officetabMenu e -->
							<div class="map_wrap">
							    <div id="map" style="width:100%;height:350px;position:relative;overflow:hidden;"></div> 
<!-- 							    <div class="custom_typecontrol radius_border"> -->
<%-- 							        <span id="btnRoadmap" class="btn" onclick="goingback()">${ result.JIBU_NAME}로</span> --%>
<!-- 							    </div> -->
							</div>
							<div class="tabContainer">
								<h3 class="hide">지역별 본&#183;지부 위치와 주소 안내</h3>
								<div class="officeArea clfix">
									<h4><img src="/images/truck/asso/Location_sub_tit01.gif" alt="위치안내" /></h4>
									<div class="snsRight">
										<a title="새창열림" class="print" href="#;" onclick="printpage();"><span class="hide" onclick="">현재 화면을 프린트로 인쇄하기</span></a>
										<a title="트위터 공유하기" class="twitter" href="#;"><span class="hide">트위터</span></a>
										<a title="페이스북 공유하기" class="facebook" href="#;"><span class="hide">페이스북</span></a>
									</div>
								</div>
								
								<!-- 상세위치 및 전화번호 안내  -->
								<div class="mapInfo">
<%-- 									<a href="https://map.naver.com/v5/?c=${result.X},${result.Y},14,0,0,0,dh" target="_blank" title="네이버지도 새창열기" class="btn_navermap"> --%>
<!-- 									<img src="/images/truck/btn/btn_navermap.png" alt="naver큰지도보기" /></a> -->
									<p class="mapInfo01"><c:out value="${result.NEW_ADDR}"/><c:if test="${not empty result.ADDR}"><br>(${result.ADDR})</br></c:if></p>
									<c:if test="${not empty result.PHONE1}"><p class="mapInfo02">&#40;<c:out value="${result.PHONE1 }"/></p></c:if>
									<c:if test="${not empty result.PHONE2}"><p class="mapInfo03">&#40;<c:out value="${result.PHONE2 }"/></p></c:if>
								</div>
								<!-- ----------------카카오톡 지도--------------------- -->
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
								
								<!-- ----------------카카오톡 지도--------------------- -->
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