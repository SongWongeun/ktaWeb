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
						<h2><img src="/images/truck/dedu/compeninfo_tit.gif" alt="보상안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/compenInfo/amountCharge.do" >보상안내</a>
						<span>공제금 청구안내 &#40;손해배상 청구권자&#41;</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/amount_con_tit.gif" alt="공제금 청구 안내입니다. 사고 발생시 신속히 보상 받을 수 있는 절차 등 상세한 내용을 제공해 드립니다." /></p>				
					<div class="conSection">
						<!-- 공제금 청구안내 -->
						<h3 class="deduh3Tit amouBg">공제금 청구안내 &#40;손해배상 청구권자&#41;</h3>
						<!-- 1. 교통사고 처리시 제출해야 할 서류 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">1&#46; 교통사고 처리시 제출해야 할 서류</h4>
							<div class="accdocBox clfix">
								<!-- 대인(Ⅰ·Ⅱ)사고 제출서류 -->
								<div class="accdocArea01">
									<p class="txtPoint">대인&#40;&#8544;&#183;&#8545;&#41;사고 제출서류</p>
									<div class="roundBox02">
										<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
										<!-- 내용 -->
										<ul class="docArea docBg01">
											<li>교통사고 발생 사실을 확인할 수 있는 서류</li>
											<li>공제금 지급 청구서</li>
											<li>손해액을 증명하는 서류&#40;진단서&#44; 소득입증자료 등&#41;</li>
											<li>기타 조합이 꼭 필요하여 요청하는 서류 또는 증거</li>
										</ul>
										<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
									</div>
								</div>
								<!-- 대물사고 제출서류 -->
								<div class="accdocArea02">
									<p class="txtPoint">대물사고 제출서류</p>
									<div class="roundBox02">
										<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
										<!-- 내용 -->
										<ul class="docArea docBg02">
											<li>교통사고 발생 사실을 확인할 수 있는 서류</li>
											<li>공제금 지급 청구서</li>
											<li>손해액을 입증하는 서류&#40;견적서, 수리비 영수증 등&#41;</li>
											<li>기타 조합이 꼭 필요하여 요청하는 서류 또는 증거</li>
										</ul>
										<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
									</div>
								</div>
							</div>	
							<p class="txtPoint02">사고처리 담당자에게 직접 전달하시거나 팩스로 송부하시면 됩니다&#46;</p>
						</div>
						<!-- 2. 공제처리 하지 않는 사고의 처리절차 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">2&#46; 교통사고 합의서 작성 요령</h4>
							<p class="txtPoint"><span class="txtsub1">가&#46;</span><span class="txtsub2">합의서 양식을 별도로 필요하지 않으나 가능한 경찰서 교통계&#40;사고처리반&#41;에 비치되어 있는 양식을 사용하며 사고 당사자 간에 합의 문구를 작성하실 필요 없이 편리하게 사용할 수 있습니다&#46;</span></p>
							<p class="txtPoint"><span class="txtsub1">나&#46;</span><span class="txtsub2">별도의 양식이 없이 일반 용지 등에 합의서를 작성하실 경우에는 사고일시 및 사고차량번호&#44; 사고운전자 성명을 기재한 후 가해자 및 피해자를 구분하고 합의내역을 작성하시면 됩니다&#46;</span></p>
							<p class="txtPoint"><span class="txtsub1">다&#46;</span><span class="txtsub2">필요시 조합측에 연락주시면 합의서 양식을 송부(팩스/메일)해드립니다&#46;</span></p>
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