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
						<span>대인배상</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/maninfo_con_tit.gif" alt="공제계약 대인배상 상품안내 입니다." /></p>				
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">대인배상 &#8544;</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea manBg">
								<p class="lossTxt1">보상하는 손해</p>
								<p class="lossTxt2">대인배상&#8544; 에서 조합은 조합원이 공제계약자동차의 운행으로 인하여 다른 사람을 죽거나 다치게 하여<br/>자동차손해배상보장법 제3조에 의한 손해배상책임을 짐으로써 입은 손해를 보상합니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">보장 금액</h4>
							<p class="txtPoint">사망</p>
							<ul class="txtListst01">
								<li>사망한 경우에는 1억원의 범위에서 피해자에게 발생한 손해액&#46; 다만&#44; 그 손해액이 2천만원 미만인 경우에는 2천만원 으로 하여 보상해 드립니다&#46;</li>
							</ul>
							<p class="txtPoint">상해구분 및 급별 한도금액표&#40; 대인배상&#8544;부상 관련&#41;</p>
							<table class="tbDetail_st01 mB5" summary="상해구분 및 급별 한도금액표(「대인배상Ⅰ」부상 관련) 상세정보 테이블 입니다.">
								<caption>상해구분 및 급별 한도금액표&#40;대인배상 부상 관련&#41;에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:10%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:10%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan = "2">상해등급</th>
										<th scope="col"  colspan="2">보험가입금액</th>
										<th scope="col" rowspan = "2">상해등급</th>
										<th scope="col"  colspan="2">보험가입금액</th>
									</tr>
									<tr>
										<th scope="col" >2016.3.31 이전사고</th>
										<th scope="col" >2016.4.1 이후사고</th>
										<th scope="col" >2016.3.31 이전사고</th>
										<th scope="col" >2016.4.1 이후사고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1급</td>
										<td class="alR">2&#44;000만원</td>
										<td class="alR">3&#44;000만원</td>
										<td>8급</td>
										<td class="alR">240만원</td>
										<td class="alR">300만원</td>
									</tr>
									<tr>
										<td>2급</td>
										<td class="alR">1&#44;000만원</td>
										<td class="alR">1&#44;500만원</td>
										<td>9급</td>
										<td class="alR">240만원</td>
										<td class="alR">240만원</td>
									</tr>
									<tr>
										<td>3급</td>
										<td class="alR">1&#44;000만원</td>
										<td class="alR">1&#44;200만원</td>
										<td>10급</td>
										<td class="alR">160만원</td>
										<td class="alR">200만원</td>
									</tr>
									<tr>
										<td>4급</td>
										<td class="alR">900만원</td>
										<td class="alR">1&#44;000만원</td>
										<td>11급</td>
										<td class="alR">160만원</td>
										<td class="alR">160만원</td>
									</tr>
									<tr>
										<td>5급</td>
										<td class="alR">900만원</td>
										<td class="alR">900만원</td>
										<td>12급</td>
										<td class="alR">80만원</td>
										<td class="alR">120만원</td>
									</tr>
									<tr>
										<td>6급</td>
										<td class="alR">500만원</td>
										<td class="alR">700만원</td>
										<td>13급</td>
										<td class="alR">80만원</td>
										<td class="alR">80만원</td>
									</tr>
									<tr>
										<td>7급</td>
										<td class="alR">500만원</td>
										<td class="alR">500만원</td>
										<td>14급</td>
										<td class="alR">80만원</td>
										<td class="alR">50만원</td>
									</tr>
								</tbody>
							</table><!--// 상해구분 및 급별 한도금액표 e -->
							<p class="txtPoint03 alR">
								<span class="orgBar">주) 상해등급은 자동차손해배상보장법 시행령 별표1에서 정한 상해구분에 따름</span>
							</p>
							<p class="txtPoint">후유장애 구분 및 급별 한도금액표&#40; 대인배상&#8544; 후유장애 관련&#41;</p>
							<table class="tbDetail_st01 mB5" summary="후유장애 구분 및 급별 한도금액표(대인배상Ⅰ후유장애 관련) 상세정보 테이블 입니다.">
								<caption>후유장애 구분 및 급별 한도금액표&#40; 대인배상 후유장애 관련&#41;에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:10%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:10%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan = "2">상해등급</th>
										<th scope="col"  colspan="2">보험가입금액</th>
										<th scope="col" rowspan = "2">상해등급</th>
										<th scope="col"  colspan="2">보험가입금액</th>
									</tr>
									<tr>
										<th scope="col" >2016.3.31 이전사고</th>
										<th scope="col" >2016.4.1 이후사고</th>
										<th scope="col" >2016.3.31 이전사고</th>
										<th scope="col" >2016.4.1 이후사고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1급</td>
										<td class="alR">1억원</td>
										<td class="alR">1억 5&#44;000만원</td>
										<td>8급</td>
										<td class="alR">3&#44;000만원</td>
										<td class="alR">4&#44;500만원</td>
									</tr>
									<tr>
										<td>2급</td>
										<td class="alR">9&#44;000만원</td>
										<td class="alR">1억 3&#44;500만원</td>
										<td>9급</td>
										<td class="alR">2&#44;250만원</td>
										<td class="alR">3&#44;800만원</td>
									</tr>
									<tr>
										<td>3급</td>
										<td class="alR">8&#44;000만원</td>
										<td class="alR">1억 2&#44;000만원</td>
										<td>10급</td>
										<td class="alR">1&#44;880만원</td>
										<td class="alR">2&#44;700만원</td>
									</tr>
									<tr>
										<td>4급</td>
										<td class="alR">7&#44;000만원</td>
										<td class="alR">1억 500만원</td>
										<td>11급</td>
										<td class="alR">1&#44;500만원</td>
										<td class="alR">2&#44;300만원</td>
									</tr>
									<tr>
										<td>5급</td>
										<td class="alR">6&#44;000만원</td>
										<td class="alR">9&#44;000만원</td>
										<td>12급</td>
										<td class="alR">1&#44;250만원</td>
										<td class="alR">1&#44;900만원</td>
									</tr>
									<tr>
										<td>6급</td>
										<td class="alR">5&#44;000만원</td>
										<td class="alR">7&#44;500만원</td>
										<td>13급</td>
										<td class="alR">1&#44;000만원</td>
										<td class="alR">1&#44;500만원</td>
									</tr>
									<tr>
										<td>7급</td>
										<td class="alR">4&#44;000만원</td>
										<td class="alR">6&#44;000만원</td>
										<td>14급</td>
										<td class="alR">630만원</td>
										<td class="alR">1&#44;000만원</td>
									</tr>
								</tbody>
							</table><!--// 후유장애 구분 및 급별 한도금액표(대인배상Ⅰ 후유장애 관련) e -->
							<p class="txtPoint03 alR">
								<span class="orgBar">주) 장애등급은 자동차손해배상보장법 시행령 별표2에서 정한 후유장애 구분에 따름</span>
							</p>
						</div><!--// 대인배상 I e -->						
						<!-- 대인배상 Ⅱ -->
						<h3 class="deduh3Tit prodBg">대인배상 &#8545;</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea manBg2">
								<p class="lossTxt1">보상하는 손해</p>
								<p class="lossTxt2">대인배상&#8545;에서 조합은 조합원이 공제계약자동차를 소유 &#183; 사용 &#183; 관리하는 동안에 생긴 공제계약자동차의 사고로 인하여<br/>다른 사람을 죽게 하거나 다치게 하여 법률상 손해배상책임을 짐으로써 입은<br/>손해&#40;대인배상&#8544; 후유장애 관련에서 보상하는 손해를 초과하는 손해에 한함&#41;를 보상합니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">보장 금액</h4>
							<p class="txtPoint">피해자의 직업과 연령에 따라 고액의 공제금이 지급되어 질수도 있으므로 무한배상 으로 보상해 드립니다&#46;</p>
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