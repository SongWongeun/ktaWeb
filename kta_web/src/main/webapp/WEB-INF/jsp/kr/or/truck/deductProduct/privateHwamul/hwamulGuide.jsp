<%@page import="NiceID.Check.CPClient"%>
<%@page import="Kisinfo.Check.IPINClient"%>
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
window.name ="Parent_window";

$(document).ready(function(){
	
});

</script>
<style>
	.hwamulButton{
		
	}
</style>
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
 						<h2><img src="/images/truck/cust/authen_tit.gif" alt="회원인증" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/deductProduct/hwamulInfo.do">개인화물 가입안내</a>
						<span>회원인증</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<div class="conSection">
						<div class="supportCont">
							<div class="roundBox">
								<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
								<!-- 내용 -->
								<div class="supportArea">
									<div class="hwamulButton"><a href="/deductProduct/privateHwamul/hwamulAddView.do"/> 상담등록 </a></div>
									<div class="hwamulButton"><a href="/deductProduct/privateHwamul/hwamulList.do"/> 상담결과 </div>
								</div>
								<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
							</div>
						</div>
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	
</body>
</html>