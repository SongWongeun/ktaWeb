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
						<h2><img src="/images/truck/dedu/indirectinfo_tit.gif" alt="간접손해금 안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/compenInfo/amountCharge.do" >보상안내</a>
						<span>간접손해금 안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/indirectinfo_con_tit.gif" alt="간접손해금 안내 입니다." /></p>				
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">간접손해금 안내</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea manBg">
								<p class="lossTxt1">자동차공제 간접손해공제금이란?</p>
								<p class="lossTxt2">자동차사고로 인해 대물배상으로 처리 받으시는 차주(피해물 소유주)님이 청구하실 수 있는 대차료, 휴차료, <br/> 시세하락손해, 대체비용 등을 말합니다. 다만, 해당 항목 가운데 지급대상이 되는 경우에만 지급 가능합니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">대차료, 휴차료 지급기준</h4>
							<p class="txtPoint">비사업용 자동차(이륜차, 농기계, 건설기계 포함)가 파손 또는 오손되어 가동하지 못 하는 기간 동안에 다른 자동차를 대신 사용할 필요가 있는 경우 소요되는 필요 타당한 비용을 지급합니다.</p>
							<p class="txtPoint">1. 실제 대차를 한 경우</p>
							<p class="txtPoint">(1) 대여자동차는 「여객자동차운수사업법」에 따라 등록한 대여사업자에게서 차량만을 빌릴 때를 기준으로 동급의 대여자동차 중 최저요금의 대여자동차를 빌리는데 소요되는 통상의 요금을 지급합니다. 다만, 피해차량이 사고시점을 기준으로 「여객자동차운수사업법」에 따른 운행연한 초과로 동급의 대여자동차를 구할 수 없는 경우에는 피해차량과 동일한 규모의 대여자동차 중 최저요금의 대여자동차를 기준으로 지급합니다.</p>
							<p class="txtPoint">(2) 대여자동차가 없는 차종은 보험개발원이 산정한 사업용 해당 차종(사업용 해당차종의 구분이 곤란할 때는 사용방법이 유사한 차종) 휴차료 일람표 범위에서 실임차료를 지급합니다. 다만, 5톤 이하 또는 밴형 화물자동차 및 대형 이륜자동차(260cc 초과)의 경우 중형승용차급 중 최저요금 한도로 대차가 가능합니다.</p>
							</br>
							<p class="txtPoint">2. 대차를 하지 않은 경우</p>
							<p class="txtPoint">(1) 동급의 대여자동차가 있는 경우 : 해당 차량과 동급의 최저요금 대여자동차 대여 시 소요되는 통상의 요금의 30% 상당액</p>
							<p class="txtPoint">(2) ｢여객자동차운수사업법｣에 따른 운행 연한 초과로 동급의 대여자동차를 구할 수 없는 경우 :위 1-(1) 단서에 따라 대차를 하는 경우 소요되는 대차료의 30% 상당액</p>
							<p class="txtPoint">(3) 대여자동차가 없는 경우: 사업용 해당 차종 휴차료 일람표 금액의 30% 상당액</p>
							</br>
							<h4 class="decuh4Tit">대차료, 휴차료 인정기간</h4>
							<p class="txtPoint">수리를 위해 자동차정비업자에게 인도하여 수리가 완료될 때까지 소요된 기간으로 30일 한도로 지급합니다. 단, 부당한 수리지연이나 출고지연 등의 사유로 인해 통상의 수리기간을 초과하는 기간은 인정하지 않습니다. 수리가 불가능한 경우에는 10일 한도로 지급합니다.</p>
							</br>
							<h4 class="decuh4Tit">시세하락손해 </h4>
							<p class="txtPoint">출고 후 5년이하인 자동차로 수리비용이 사고직전 차량가액의 20%를 초과하는 경우 지급기준에 따라 시세하락손해를 지급합니다.</p>
							</br>
							<h4 class="decuh4Tit">대체비용</h4>
							<p class="txtPoint">전손사고로 차량 말소 후 차량을 대체하여 취등록세가 발생한 경우 지급기준에 따라 지급합니다. </p>
							</br>
							<h4 class="decuh4Tit">영업손실 지급기준</h4>
							<p class="txtPoint">1. 지급대상</br> - 소득세 법령에 정한 사업자의 사업장 또는 그 시설물을 파괴하여 휴업함으로써 상실된 이익</p>
							<p class="txtPoint">2. 인정기준액</br> - 증명자료가 있는 경우 : 소득을 인정할 수 있는 세법에 따른 관계증명서에 의하여 산정한 금액 </br>- 증명자료가 없는 경우 : 일용근로자 임금 </p>
							<p class="txtPoint">3. 인정기간</br>- 원상복구에 소요되는 기간으로 함. 그러나 합의지연 및 부당한 복구지연으로 연장되는 기간은 휴업기간에 넣지 아니함</br>- 영업손실의 인정기간은 30일을 한도로 함</p>
							</br>
							<h4 class="decuh4Tit">지급기준 확인방법</h4>
							<p class="txtPoint">간접손해공제금은 자동차공제약관의 공제금지급기준에 따라 청구하실 수 있으므로, 대물 차주님께서는 상기 기준에 해당하는지 화물공제조합 홈페이지 또는 보상처리 담당자에게 확인하시기 바랍니다.</p>
							</br>
							<h4 class="decuh4Tit">공제금 청구 소멸시효</h4>
							<p class="txtPoint">민법 제 766 조(손해배상청구권의 소멸시효) 제1항에 의해 손해 및 가해자를 안 날로부터 3년간 행사하지 않으면 손해배상청구권이 시효로 인해 소멸합니다.</p>
							</br>
							<h4 class="decuh4Tit">계좌정보 안내</h4>
							<p class="txtPoint">간접손해공제금 지급 대상인 경우 차주(피해물 소유주)님의 계좌정보(은행명, 계좌정보 등)를 보상처리 담당자에게 알려 주시기 바랍니다.</p>
							</br>
							<h4 class="decuh4Tit">기타 문의사항</h4>
							<p class="txtPoint"> 피해내용 등에 따라 해당되는 보상항목이 상이할 수 있습니다.기타 청구 및 관련사항 문의는 화물공제조합 또는 보상담당자 또는 콜센터(☎1577-8305)로 문의하시기 바랍니다.</p>
						</div><!--// 대인배상 I e -->						
						
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