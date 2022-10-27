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
				<div class="deduSub clfix">
					<h2 class="hide">화물공제조합 공제상품 입니다</h2>
					<div class="deduL">
						<ul>
							<!-- 가입안내 -->
							<li>
								<dl>
									<dt class="topSty01"><a href="/deductProduct/joinInfo/joinInfo.do">가입안내</a></dt>
									<dd>공제계약 절차를 확인하세요&#46;</dd>
								</dl>
							</li>
							<!-- 공제약관 -->
							<li class="liSty01">
								<dl>
									<dt class="topSty01"><a href="/deductProduct/carDeductInfo.do">공제약관</a></dt>
									<dd>보험약관을 살펴 보실 수 있습니다&#46;</dd>
								</dl>
							</li>
							<!-- 보상안내 -->
							<li class="liSty02">
								<dl>
									<dt class="topSty01"><a href="/deductProduct/compenInfo/amountCharge.do">보상안내</a></dt>
									<dd>사고발생시 공제금청구&#44; 절차를 확인해보세요&#46;</dd>
								</dl>
							</li>
							<!-- 분담금계산 -->
							<li class="liSty02">
								<dl>
									<dt class="topSty02"><a href="/deductProduct/divideCalcu.do">분담금계산</a></dt>
									<dd>공제계약별 적용분담금 궁금하시죠&#63;</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="deduR">
						<div class="deduCont01">
							<h3>공제계약 상품안내</h3>
							<ul>
								<li><a href="/deductProduct/productInfo/manInfo.do">대인배상</a></li>
								<li><a href="/deductProduct/productInfo/objectInfo.do">대물배상</a></li>
								<li><a href="/deductProduct/productInfo/bodyAccInfo.do">자기신체사고</a></li>
								<li><a href="/deductProduct/productInfo/carryInfo.do">적재물</a></li>
								<li><a href="/deductProduct/productInfo/practicianInfo.do">종사자재해</a></li>
								<li><a href="/deductProduct/productInfo/myCarDamege.do">자기차량손해</a></li>
							</ul>
						</div>
						<div class="deduCont02">
							<h3>콜센터안내</h3>
							<p class="liSty01">사고접수(현장출동) · 긴급출동</p>
							<p><img src="/images/truck/subindex/callno.png" alt="1577-8278" /></p>
							<p class="liSty02">&#40;24시간 이용가능&#41;</p>
						</div>
					</div>
				</div>
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