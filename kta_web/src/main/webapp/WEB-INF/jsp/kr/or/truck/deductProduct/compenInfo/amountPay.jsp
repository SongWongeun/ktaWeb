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
						<h2><img src="/images/truck/dedu/amountpay_tit.gif" alt="공제급 지급절차 안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/compenInfo/amountCharge.do" >보상안내</a>
						<span>공제급 지급절차 안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/amountpay_con_tit.gif" alt="공제급 지급절차 안내 입니다." /></p>				
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">공제급 지급절차 안내</h3>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">1. 공제금의 청구와 지급</h4>
							<p class="txtPoint">자동차공제의 공제담보 종류별 구체적 공제금 지급항목은 다음과 같으며 공제조합은 공제금 청구권자의 공제금 지급항목별 청구에 따라 공제금을 지급합니다.</p>
							<table class="tbDetail_st01 mB5" summary="상해구분 및 급별 한도금액표(「대인배상Ⅰ」부상 관련) 상세정보 테이블 입니다.">
								<caption>공제금의 청구와 지급표</caption>
								<colgroup>
									<col style="width:25%;" />
									<col style="width:25%;" />
									<col style="width:50%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" colspan="2">담보종류</th>
										<th scope="col">지급항목</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="3">대인배상</td>
										<td>사망</td>
										<td>장례비, 위자료, 상실수익액</td>
									</tr>
									<tr>
										<td>후유장해</td>
										<td>위자료, 상실수익액, 가정간호비</td>
									</tr>
									<tr>
										<td>부상</td>
										<td>위자료, 휴업손해, 치료관계비 등</td>
									</tr>
									<tr>
										<td rowspan="2">대물배상</td>
										<td>전손</td>
										<td>교환가액, 차량대체 소요비용, 대차료 등</td>
									</tr>
									<tr>
										<td>분손</td>
										<td>교환가액, 대차료, 휴차료 등</td>
									</tr>
								</tbody>
							</table><!--// 공제금의 청구와 지급표 e -->
							<p class="txtPoint"> * 공제가입사항, 피해내용 등에 따라 해당되는 보상항목이 달라질 수 있으며 구체적인 내용은 공제조합 담당자의 안내 및 도움을 받으시기 바랍니다.</p>

							</br>
							<h4 class="decuh4Tit">2. 진료비 지불보증</h4>
							<p class="txtPoint">대인배상Ⅰ(책임보험),대인배상Ⅱ(종합보험)의 경우 공제조합은 손해배상청구권자의 청구가 있거나 기타 원인에 의하여 대인사고 피해자가 발생한 사실을 안 때에는 피해자를 진료하는 의료기관에 당해 진료에 따른 자동차보험 진료수가의 지급의사 유무 및 지급한도 등을 통지합니다.(자동차손해배상보장법 제12조)</p>
							</br>
							<h4 class="decuh4Tit">3. 피해자 가불금</h4>
							<p class="txtPoint">공제조합원등이 자동차 운행으로 다른 사람을 사망하게 하거나 부상하게 한 경우에는 피해자는 대통령령으로 정하는 바에 따라 공제조합등에게 자동차보험진료수가에 대하여는 그 전액을 그 외의 공제금등에 대하여는 책임공제금의 범위 내에서 피해자에게 발생한 손해액의 50%까지 지급이 가능합니다.</p>
							<p class="txtPoint">단, 공제조합은 관련 법령상 조합원의 손해배상책임이 발생하지 않거나 자동차공제 약관상 공제조합의 공제금 지급의무가 발생하지 아니하는 것이 객관적으로 명백한 경우에는 가불금을 지급하지 않을 수도 있습니다.</p>
							<p class="txtPoint">청구서류 및 절차는 공제조합 담당자에게 문의하시기 바랍니다.(자동차손해배상보장법 제11조)</p>
							</br>
							<h4 class="decuh4Tit">4. 교통사고환자 진료비</h4>
							<p class="txtPoint">교통사고로 인해 발생하는 진료비는 자동차공제로 처리됩니다. 이 경우 의료기관은 이에 해당하는 진료비를 교통사고환자에게 직접 청구할 수 없습니다.</p>
							<p class="txtPoint">기존질병 및 당해 교통사고와 관련 없는 상병에 대한 진료비는 원칙적으로 건강보험으로 처리되며, 이 경우 환자측의 본인부담금이 발생할 수 있습니다. 다만, 기존질병이라 하여도 당해 교통사고로 인하여 악화된 경우 그 추가된 진료비는 자동차공제로 처리됩니다.(자동차손해배상보장법 제12조, 국토교통부 고시「자동차보험 진료수가에 관한 기준」제5조 제1항 및 제2항)</p>
							</br>
							<h4 class="decuh4Tit">5. 간접손해 공제금</h4>
							<p class="txtPoint">대물사고의 피해자에게 피해차량을 사용하지 못함으로써 발생한 손해 등을 자동차공제 약관규정에 따라 지급합니다. 간접손해 공제금에 해당하는 항목으로는 대차료, 휴차료(사업용 자동차에 해당), 차량대체비용(전부손해사고로 인해 다른 차량으로 대체하는 경우의 취득세, 등록세), 자동차 시세하락손해 등이 있으며, 지급기준 및 필요서류에 대해서는 공제조합 차량 담당자에게 문의하여 주시기 바라며, 간접손해 공제금의 소멸시효는 민법 제766조(손해배상청구권의 소멸시효)에 의거 손해 및 가해자를 안 날로부터 3년입니다.</p>
							</br>
							<h4 class="decuh4Tit">6. 장애분쟁 해결</h4>
							<p class="txtPoint">부상 치료후 장애가 발생할 경우 맥브라이드식 후유장애 평가방법에 따라 옥내 또는 옥외 근로자를 기준으로 타당한 노동능력상실률을 적용하며, 동 판정과 관련하여 다툼이 있을 경우 공제금 청구권자와 공제조합이 협의하여 정한 제3의 전문의료기관의 전문의에게 판정을 의뢰할 수 있습니다. (자동차공제 약관 「공제금 지급기준」중 후유장애편)</p>
							</br>
							<h4 class="decuh4Tit">7. 지급 기한</h4>
							<p class="txtPoint">공제조합은 공제금 청구에 관한 서류를 받은 때에는 지체 없이 지급할 보험금액을 정하고 그 정하여진 날로부터 7일 이내에 지급합니다.</p>
							<p class="txtPoint">공제조합에서 위에서 정한 지급기일 내에 공제금을 지급하지 아니하였을 때에는, 그 다음날로부터 지급일까지의 기간에 대하여 공제금 지급시 적립이율에 의한 이자를 공제금에 더하여 드립니다. 단, 손해배상청구권자 등의 책임있는 사유로 지급이 지연된 때에는 그 해당기간에 대한 이자는 더하여 드리지 아니합니다.</p>
							</br>
							<h4 class="decuh4Tit">8. 공제금 청구 소멸시효</h4>
							<p class="txtPoint">민법 제 766 조(손해배상청구권의 소멸시효) 제1항에 의해 손해 및 가해자를 안 날로부터 3년간 행사하지 않으면 손해배상청구권이 시효로 인해 소멸합니다.</p>
							</br>
							<h4 class="decuh4Tit">9. 개인정보의 처리 등에 대한 동의 안내</h4>
							<p class="txtPoint">손해사정, 사고조사, 공제금 지급심사 등의 업무수행에 필요한 경우「신용정보의 이용 및 보호에 관한 법률」,「개인정보보호법」등에 따른 개인정보의 처리 등에 대한 동의가 필요합니다. 개인정보 처리목적, 개인정보의 처리 및 보유기간, 개인정보의 제3자 제공 등의 세부내용은 공제조합 홈페이지(http://www.truck.or.kr)의 개인정보처리방침에서 확인할 수 있습니다.</p>
							</br>
							<h4 class="decuh4Tit">10. 분쟁 조정절차 및 피해 구제사항 안내</h4>
							<p class="txtPoint">본 교통사고 처리와 관련하여 문의하실 내용이 있을 경우 담당자로 연락을 주시거나 저희 공제조합 고객콜센터(☎ 1577-8305)로 문의하실 수 있습니다.</p>
							
						</div><!--// 대인배상 I e -->						
							
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