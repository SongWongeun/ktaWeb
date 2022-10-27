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
						<h2><img src="/images/truck/dedu/prodinfo_tit.gif" alt="상품안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/deductProductIndex.do" >상품안내</a>
						<span>자기신체사고</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/bodyinfo_con_tit.gif" alt="공제계약 자기신체사고 상품안내 입니다." /></p>				
					<div class="conSection">
						<!-- 자기신체사고 -->
						<h3 class="deduh3Tit prodBg">자기신체사고</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea bodyBg" style="margin-bottom:0px;">
								<p class="lossTxt1">보상하는 손해</p>
								<p class="lossTxt2">자기신체사고에서 조합은 조합원이 공제계약자동차를 소유 &#183; 사용 &#183; 관리하는 동안에 생긴 다음 중 어느 하나의 사고로 인하여 상해를 입은 때에 그로 인한 손해를 보상하여 드립니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossSide">
								<div class="lossBox">
									<p><span class="txtBlue">1. 공제계약자동차의 운행으로 인한 사고</p>
									<p><span class="txtBlue">2. 공제계약자동차의 운행 중 발생한 다음의 사고&#46; 다만, 조합원이 공제계약자동차에 탑승 중에 한합니다&#46;</p>
									<p>&nbsp;&nbsp;&nbsp;&nbsp;가. 날아오거나 떨어지는 물체와 충돌</p>
									<p>&nbsp;&nbsp;&nbsp;&nbsp;나. 화재 또는 폭발</p>
									<p>&nbsp;&nbsp;&nbsp;&nbsp;다. 공제계약자동차의 낙하</p>
									
								</div>
							</div>							
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">보장 금액</h4>
							<p class="txtPoint">공제계약 금액</p>
							<table class="tbDetail_st01 mB5" summary="공제계약 금액 상세정보 테이블 입니다.">
								<caption>공제계약 금액에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">항목</th>
										<th scope="col" colspan="4">공제계약금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>사망</td>
										<td>1천5백만원</td>
										<td>3천만원</td>
										<td>5천만원</td>
										<td>1억원</td>
									</tr>
									<tr>
										<td>부상</td>
										<td>1천5백만원</td>
										<td>1천5백만원</td>
										<td>1천5백만원</td>
										<td>1천5백만원</td>
									</tr>
									<tr>
										<td>장해</td>
										<td>1천5백만원</td>
										<td>3천만원</td>
										<td>5천만원</td>
										<td>1억원</td>
									</tr>
								</tbody>
							</table><!--// 공제계약 금액표 e -->
							<p class="txtPoint03 alR">
								<span class="orgBar">위 공제계약금액은 조합원 1인당 한도액임</span>
							</p>
							<p class="txtPoint">상해구분 및 급별 공제계약 금액표</p>
							<table class="tbDetail_st01 mB5" summary="상해구분 및 급별 공제계약 금액표 상세정보 테이블 입니다.">
								<caption>상해구분 및 급별 공제계약 금액에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:30%;" />
									<col style="width:20%;" />
									<col style="width:30%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">상해등급</th>
										<th scope="col">공제계약금액</th>
										<th scope="col">상해등급</th>
										<th scope="col">공제계약금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1급</td>
										<td>1&#44;500만원</td>
										<td>8급</td>
										<td>180만원</td>
									</tr>
									<tr>
										<td>2급</td>
										<td>800만원</td>
										<td>9급</td>
										<td>140만원</td>
									</tr>
									<tr>
										<td>3급</td>
										<td>750만원</td>
										<td>10급</td>
										<td>120만원</td>
									</tr>
									<tr>
										<td>4급</td>
										<td>700만원</td>
										<td>11급</td>
										<td>100만원</td>
									</tr>
									<tr>
										<td>5급</td>
										<td>500만원</td>
										<td>12급</td>
										<td>60만원</td>
									</tr>
									<tr>
										<td>6급</td>
										<td>400만원</td>
										<td>13급</td>
										<td>40만원</td>
									</tr>
									<tr>
										<td>7급</td>
										<td>250만원</td>
										<td>14급</td>
										<td>20만원</td>
									</tr>
								</tbody>
							</table><!--// 상해구분 및 급별 한도금액표 e -->
							<p class="txtPoint03 alR">
								<span class="orgBar">상해등급은 자동차손해배상보장법 시행령 별표1에서 정한 상해 구분에 의함</span>
							</p>
							<p class="txtPoint">후유장애 구분 및 급별 공제계약금액표</p>
							<table class="tbDetail_st01 mB5" summary="후유장애 구분 및 급별 공제계약금액 상세정보 테이블 입니다.">
								<caption>후유장애 구분 및 급별 공제계약금액에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">장애등급</th>
										<th scope="col" colspan="4">공제계약금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1급</td>
										<td>1&#44;500만원</td>
										<td>3&#44;000만원</td>
										<td>5&#44;000만원</td>
										<td>1억원</td>
									</tr>
									<tr>
										<td>2급</td>
										<td>1&#44;350만원</td>
										<td>2&#44;700만원</td>
										<td>4&#44;500만원</td>
										<td>9&#44;000만원</td>
									</tr>
									<tr>
										<td>3급</td>
										<td>1&#44;200만원</td>
										<td>2&#44;400만원</td>
										<td>4&#44;000만원</td>
										<td>8&#44;000만원</td>
									</tr>
									<tr>
										<td>4급</td>
										<td>1&#44;050만원</td>
										<td>2&#44;100만원</td>
										<td>3&#44;500만원</td>
										<td>7&#44;000만원</td>
									</tr>
									<tr>
										<td>5급</td>
										<td>900만원</td>
										<td>1&#44;800만원</td>
										<td>3&#44;000만원</td>
										<td>6&#44;000만원</td>
									</tr>
									<tr>
										<td>6급</td>
										<td>750만원</td>
										<td>1&#44;500만원</td>
										<td>2&#44;500만원</td>
										<td>5&#44;000만원</td>
									</tr>
									<tr>
										<td>7급</td>
										<td>600만원</td>
										<td>1&#44;200만원</td>
										<td>2&#44;000만원</td>
										<td>4&#44;000만원</td>
									</tr>
									<tr>
										<td>8급</td>
										<td>450만원</td>
										<td>900만원</td>
										<td>1&#44;500만원</td>
										<td>3&#44;000만원</td>
									</tr>
									<tr>
										<td>9급</td>
										<td>360만원</td>
										<td>720만원</td>
										<td>1&#44;200만원</td>
										<td>2&#44;400만원</td>
									</tr>
									<tr>
										<td>10급</td>
										<td>270만원</td>
										<td>540만원</td>
										<td>900만원</td>
										<td>1&#44;800만원</td>
									</tr>
									<tr>
										<td>11급</td>
										<td>210만원</td>
										<td>420만원</td>
										<td>700만원</td>
										<td>1&#44;400만원</td>
									</tr>
									<tr>
										<td>12급</td>
										<td>150만원</td>
										<td>300만원</td>
										<td>500만원</td>
										<td>1&#44;000만원</td>
									</tr>
									<tr>
										<td>13급</td>
										<td>90만원</td>
										<td>180만원</td>
										<td>300만원</td>
										<td>600만원</td>
									</tr>
									<tr>
										<td>14급</td>
										<td>60만원</td>
										<td>120만원</td>
										<td>200만원</td>
										<td>400만원</td>
									</tr>
								</tbody>
							</table><!--// 후유장애 구분 및 급별 공제계약금액표 e -->
							<p class="txtPoint03 alR">
								<span class="orgBar">장애등급은 자동차손해배상보장법 시행령 별표2에서 정한 후유장애 구분에 의함</span>
							</p>
						</div><!--// 자기신체사고 e -->
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