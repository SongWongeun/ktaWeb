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
						<h2><img src="/images/truck/dedu/claiminfo_tit.gif" alt="직접청구권안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/compenInfo/amountCharge.do" >보상안내</a>
						<span>직접청구권안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/claiminfo_con_tit.gif" alt="사고접수 안내(직접청구권)안내 입니다." /></p>				
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">사고 접수 안내</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea manBg">
								<p class="lossTxt1">배상책임(대인배상 Ⅰ,Ⅱ/ 대물배상)</p>
								<p class="lossTxt2">화물공제조합 가입차량으로 인하여 다른 사람을 죽게 하거나 다치게 한 경우 또는 다른 사람의 재물을 없애거나 <br/>훼손한 경우 손해를 보상합니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">공제금 청구권자 및 직접청구권</h4>
							<!-- <p class="txtPoint">사망</p> -->
							<p class="txtPoint">1) 공제조합에 보상을 청구 할수 있는 자로서는 <strong>「자동차공제약관」제1조(용어의 정의) 15.조합원에 의거 기명조합원/친족조합원/승낙조합원/사용조합원/운전조합원이 사고접수 및 공제금을 청구 할 수 있습니다.</strong></p>
							<p class="txtPoint">2) 다만 화물공제 가입차량의 사고로서 조합원(기명/친족/승낙/사용/운전)이 사고 접수를 거부할 시 피해자는 <strong>자동차 손해 배상보장법 제10조, 상법724조 ②항에 의거 하여 조합측에 공제금 및 사고접수를 직접 청구 할 수 있습니다.</strong></br></br></p>
							
							<h4 class="decuh4Tit">공제금 직접 청구시 청구방법</h4>
							<div class="lossSide2">
								<div class="lossBox">
									<p>화물공제조합 <span class="txtBlue2">사고접수번호 (1577-8278)</span>로 안내를 받은 후 해당 지부를 방문하여 직접청구에 관련된 서류작성</p>
									<p><span class="txtRed">☞(피해자 직접청구시 필요서류징구: 교통사고사실확인원 및 진단서/견적서/사진 등)</span><br/></p>
								</div>
							</div>		
							
						</div><!--// 대인배상 I e -->						
						<!-- 대인배상 Ⅱ -->
						<h3 class="deduh3Tit prodBg">관련 법규 조항</h3>
						
						<div class="lossSide2">
							<div class="lossBox">
								<p><span class="txtBlue4">자동차손해배상보장법 제10조 (보험금등의 청구)</span><br/>① 보험가입자등에게 <span class="txtBlue">제3조</span>에 따른 손해배상책임이 발생하면 그 피해자는 대통령령으로 정하는 바에 따라 보험회사등에게 <span class="txtBlue">「상법」 제724조제2항</span>에 따라 보험금등을 자기에게 직접 지급할 것을 청구할 수 있다. 이 경우 <strong>피해자는 자동차보험진료수가에 해당하는 금액은 진료한 의료기관에 직접 지급하여 줄 것을 청구할 수 있다.</strong><br/><br/>② 보험가입자등은 보험회사등이 보험금등을 지급하기 전에 피해자에게 손해에 대한 배상금을 지급한 경우에는 보험회사등에게 보험금등의 보상한도에서 그가 피해자에게 지급한 금액의 지급을 청구할 수 있다.<br/><br/></p>
								<p><span class="txtBlue4">상법제724조 (보험자와 제3자와의 관계)</span><br/>① 보험자는 피보험자가 책임을 질 사고로 인하여 생긴 손해에 대하여 제3자가 그 배상을 받기 전에는 보험금액의 전부 또는 일부를 피보험자에게 지급하지 못한다.<br/><br/>② <span class="txtBlue">제3자는 피보험자가 책임을 질 사고로 입은 손해에 대하여 보험금액의 한도내에서 보험자에게 직접 보상을 청구할 수 있다.</span> 그러나, 보험자는 피보험자가 그 사고에 관하여 가지는 항변으로써 제3자에게 대항할 수 있다. [개정 91·12·31]<br/><br/>③ 보험자가 제2항의 규정에 의한 청구를 받은 때에는 지체없이 피보험자에게 이를 통지하여야 한다. [신설 91·12·31]<br/><br/>④ 제2항의 경우에 피보험자는 보험자의 요구가 있을 때에는 필요한 서류·증거의 제출, 증언 또는 증인의 출석에 협조하여야 한다. [신설 91·12·31]</p>
							</div>
						</div>		
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