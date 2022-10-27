<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
	$(document).ready(function(){
		<%session.invalidate();%>
		if('${out}'=='N'){
			$("#typePopupLayer").show();
		}
		if('${out}'=='Y'){
			$("#typePopupLayer2").show();
		}
		
		$("#goLoginPage").on("click",function(){
			location.href="/login.do";
		});
		
		$("#goMainPage").on("click",function(){
			location.href="/main/index.do";
		});
		
	});
</script>
<style>
#typePopupLayer,#typePopupLayer2{
		background: url("/images/truck/com/overlay.png") repeat 0% 0%;
		position: fixed;
		left: 0px;
		top: 0px;
		text-align: center;
		z-index: 90000;
		width: 100%;
		height: 100%;
		font-size:13px;
	}
</style>
</head>
<body>
		<div id="typePopupLayer" style="display:none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"></p>
					<p class="layerTxt">
						<p class="layerTit" style="text-align: center">알려드립니다!</p>
						<div style="color:#585858; line-height:25px;">
						회원가입시 등록한 대표자 정보, 사업자정보 조합원사 정보에 <br/>
						변동사항이 있습니다.  <span style="color: #23618c; font-weight:bold;">조합원관리</span> 메뉴에서 확인해주세요.<br/><br/>
						확인을 클릭하면 로그인화면으로 이동합니다.
						</div>
						<div class="btnboxC clfix">
								<span class="btn_pack btn_type16"><a id="goLoginPage" href="#;">확인</a></span>
						</div>
					</p>	
				</div>
			</div>
		</div>
		
		<div id="typePopupLayer2">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"></p>
					<p class="layerTxt">
						<p class="layerTit" style="text-align: center">알려드립니다!</p>
						<div style="color:#585858; line-height:25px;">
						회원가입시 등록한 대표자 정보, 사업자정보가  <br/>
						일치하지 않아 재가입이 필요합니다.<br/><br/>
						확인을 클릭하면 메인화면으로 이동합니다.
						</div>
						<div class="btnboxC clfix">
								<span class="btn_pack btn_type16"><a id="goMainPage" href="#;">확인</a></span>
						</div>
					</p>	
				</div>
			</div>
		</div>
</body>
</html>