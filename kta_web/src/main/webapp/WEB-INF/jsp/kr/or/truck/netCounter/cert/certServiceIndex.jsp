<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	$(this).scrollTop(0);
	recent_dt_span = $("#recent_dt_span").text();
	dt_arr = recent_dt_span.split(".");
	$("#recent_dt_span").text("20"+dt_arr[0]+"년 "+dt_arr[1]+"월 "+dt_arr[2]+"일");
	
	recent_tm_span = $("#recent_tm_span").text();
	tm_arr = recent_tm_span.split(":");
	$("#recent_tm_span").text(tm_arr[0]+"시 "+tm_arr[1]+"분 "+tm_arr[2]+"초");
	
	if('${changeCode}'=='Y'){
		$("#ChangeCodePopupLayer").show();
	}
	
	//if('${logintf}'=='t'){
		//------팝업 레이어 삭제
// 		if('${loginVO.recent_dt}'!=''&&'${loginVO.recent_tm}'!=''&&'${loginVO.recent_ip}'!=''){
// 			$("#RecentPopupLayer").show();
// 		}
	//}
	
	$("#alertGyeyakPopupLayerClose").click(function(event){
		event.preventDefault();
		$("#alertGyeyakPopupLayer").hide();
	});
	
	$("#gyeyakOK").click(function(event){
		event.preventDefault();
		$("#alertGyeyakPopupLayer").hide();
	});
	
	$("#ChangeCodePopupLayerHide").on("click",function(event){
		event.preventDefault();
		$("#ChangeCodePopupLayer").hide();
	});
	
	//팝업 레이어 삭제 
	/* $("#RecentPopupLayerPopupLayerHide").on("click",function(event){
		event.preventDefault();
		var lengthB =  '<c:out value="${fn:length(nxtBunAlert)}"/>';
		var lengthG = '<c:out value="${fn:length(gyeyakAlert)}"/>';
		if(lengthB > 0 || lengthG >0) {
			$("#alertGyeyakPopupLayer").show();
		}
		$("#RecentPopupLayer").hide();
	}); */
		
});

function printCert(no){
		if(no == '2'){
			no = $('input[name="joinfact"]:checked').val();
			if (no == undefined){
				alert("증명서 발급 유형을 선택하세요!");
				return false;
			}
		}
		document.boardForm.sheetGb.value = no;
		document.boardForm.action = "<c:url value='/netCounter/certSerivce/printCert.do'/>";
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
 						<h2><img src="/images/truck/net/cer_tit.gif" alt="증명서발급" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<span>증명서발급</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<div class="conSection clfix">
						<p class="confirTit"><img src="/images/truck/net/cer_con_tit.gif" alt="공제 계약 증명서 발급 서비스 입니다 발급을 원하시는 증명서를 웹 사이트에서 즉시 발급 가능합니다" /></p>
						<!-- 증명서발급 s -->
						<div class="cerBox">
						<form:form commandName="searchVO" name="boardForm" method="post" action="">
						<fieldset>
						<legend>증명서발급</legend>
						<input type="hidden" name="sheetGb" id="sheetGb"/>
							<ul>
								<li class="cerType01">
									<p class="cerTxt">공제가입사실증명서</p>
									<div class="radioCh">
										<span><input name="joinfact"  id="joinfact1"  type="radio" value="2"  class="mR5" /><label for="joinfact1">통합공제</label></span>
										<span><input name="joinfact"  id="joinfact2"  type="radio" value="4"  class="mR5" /><label for="joinfact2">적재물&#40;운송&#41;</label></span>
										<span><input name="joinfact"  id="joinfact3"  type="radio" value="5"  class="mR5" /><label for="joinfact3">적재물&#40;주선&#41;</label></span>
										<span><input name="joinfact"  id="joinfact4"  type="radio" value="7"  class="mR5" /><label for="joinfact4">종사자 재해</label></span>
									</div>
									<a href="#;" onclick="printCert('2');" class="btn_cer"><span class="icoCheck"></span>발급하기</a>
								</li>
								<li class="cerType02">
									<p class="cerTxt">공제계약&#40;경력&#41;증명서</p>
									<div class="radioCh"></div>
									<a href="#;" onclick="printCert('3');" class="btn_cer"><span class="icoCheck"></span>발급하기</a>
								</li>
								<li class="cerType03">
									<p class="cerTxt">공제분담금납입증명서</p>
									<div class="radioCh">
									</div>
									<a href="#;" onclick="printCert('1');" class="btn_cer"><span class="icoCheck"></span>발급하기</a>
								</li>
							</ul>
						</fieldset>
						</form:form>
						</div><!--// 증명서발급 e -->
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
	<!-- ------------팝업 레이어 삭제-------------- --> 
	<!-- <div id="RecentPopupLayer" style="display:none;">
		<div class="layerBox">
			<div class="layerContents">
				<p class="topClose"></p>
				<p class="layerTxt">
				<p class="layerTit" style="text-align: center; color:red;">증명서 발급 시 빈화면 만 나오는경우 참고</p>
				<div style="color:#585858; line-height:25px; text-align:center">
						<span style="color:#585858;">즐겨찾기로 접속하지 마시고, 주소창에 www.truck.or.kr 직접입력 후<br/> </span>
						<span style="color:#585858;"> 접속 해주시기 바랍니다. 그 후 즐겨찾기 등록을 다시 해주시기 바랍니다.<br/> </span>
						<span style="color:#585858;">(홈페이지 개편으로 인터넷 주소가 변경되었음)</span>
				</div>		
					<div class="btnboxC clfix">
							<span class="btn_pack btn_type16"><a id="RecentPopupLayerPopupLayerHide" href="#;">확인</a></span>
					</div>
				</p>	
			</div>
		</div>
	</div> -->
</body>
</html>


<%--
<input type="button" value="증명서발급" onclick="window.open('/netCounter/certServiceView.do?rebFileName=sample','증명서발급','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=1050,height=1485 top=10 left=10')" >
<input type="button" value="markAny" onclick="window.open('/netCounter/certServiceView.do?rebFileName=markany','증명서발급','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=1050,height=1485 top=10 left=10')" >
<input type="button" value="test3" onclick="window.open('/netCounter/certServiceView.do?rebFileName=test3','증명서발급','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=1050,height=1485 top=10 left=10')" >
--%>