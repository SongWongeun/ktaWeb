<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
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
						<h2><img src="/images/truck/dedu/tempinfo_tit.gif" alt="가불금 청구권 안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/compenInfo/amountCharge.do" >보상안내</a>
						<span>가불금 청구권 안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/tempinfo_con_tit.gif" alt="가불금 청구권 안내 입니다." /></p>				
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">가불금 청구권 안내</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea manBg">
								<p class="lossTxt1">가불금 제도</p>
								<p class="lossTxt2">손해배상 책임 미확정 등의 이유로 적기에 피해보상을 받지 못하는 피해자를 보호하기 위해 도입된 제도입니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">지급범위</h4>
							<!-- <p class="txtPoint">사망</p> -->
							<p class="txtPoint">공제조합원등이 자동차 운행으로 다른 사람을 사망하게 하거나 부상하게 한 경우에는 피해자는 대통령령으로 정하는 바에 따라 공제조합등에게 자동차보험진료수가에 대하여는 그 전액을 그 외의 공제금등에 대하여는 책임공제금의 범위 내에서 피해자에게 발생한 손해액의 50%까지 지급이 가능합니다.</p>
							<p class="txtPoint">단, 공제조합은 관련 법령상 조합원의 손해배상책임이 발생하지 않거나 자동차공제 약관상 공제조합의 공제금 지급의무가 발생하지 아니하는 것이 객관적으로 명백한 경우에는 가불금을 지급하지 않을 수도 있습니다.</p>
							
							<h4 class="decuh4Tit">가불금 청구방법</h4>
							<p class="txtPoint">청구서류 및 절차는 공제조합 보상 담당자에게 문의하시기 바랍니다.</p>
							
							
						</div><!--// 대인배상 I e -->						
						<!-- 대인배상 Ⅱ -->
						<h3 class="deduh3Tit prodBg">관련 법규 조항</h3>
						
						<div class="lossSide2">
							<div class="lossBox">
								<p><span class="txtBlue4">자동차손해배상보장법 제11조(피해자에 대한 가불금)</span><br/>① 보험가입자등이 자동차의 운행으로 다른 사람을 사망하게 하거나 부상하게 한 경우에는 피해자는 대통령령으로 정하는 바에 따라 보험회사등에게 자동차보험진료수가에 대하여는 그 전액을, 그 외의 보험금등에 대하여는 대통령령으로 정한 금액을 제10조에 따른 보험금등을 지급하기 위한 가불금으로 지급할 것을 청구할 수 있다.<br/><br/>② 보험회사등은 제1항에 따른 청구를 받으면 국토교통부령으로 정하는 기간에 그 청구 받은 가불금을 지급하여야 한다.<br/><br/></p>
							</div>
						</div>		
						<p class="txtPoint">기타 청구 및 관련사항 문의는 화물공제조합 또는 보상담당자 또는 콜센터(☎1577-8305)로 문의하시기 바랍니다.</p>
						<p class="txtPoint"><span class="txtBlue">※관련양식은 자료실에서 다운로드 가능합니다</span></p>
					</div><!--// conSection e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<!--// container e -->
		<hr />
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->

</body>
</html>