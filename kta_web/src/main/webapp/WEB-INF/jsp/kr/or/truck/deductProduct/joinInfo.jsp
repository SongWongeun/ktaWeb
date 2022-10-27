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
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	var hash = location.hash;
	

	if(hash == '#tab1'){
		$("a[name='tab1']").trigger('click');	
	}else if(hash == '#tab2'){
		$("a[name='tab2']").trigger('click');		
	}	
});
</script>
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
						<h2><img src="/images/truck/dedu/joininfo_tit.gif" alt="가입안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>
						<span>가입안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/joininfo_con_tit.gif" alt="공제계약 가입안내 입니다. 공제계약 절차 및 필수 참고 사항을 확인하세요." /></p>				
					<div class="conSection">
						<!-- tabs s -->
						<div class="jointabs">
							<ul class="tabMenu">
								<li><a href="#tab1" name="tab1">공제계약 체결절차</a></li>
								<li><a href="#tab2" name="tab2">안내사항</a></li>
							</ul><!--// tabMenu e -->
							<div class="tabContainer">
								<!-- 공제계약 체결절차 -->
								<div id="tab1" class="tabCont">
									<h3 class="hide">공제계약 체결절차</h3>
									<div class="txtContent">
										<h4 class="decuh4Tit">가&#46;계약대상</h4>
										<p class="txtPoint">연합회를 설립한 협회의 회원자격을 가진 자로서 화물자동차운송사업을 영위하고 있거나&#44; 영위 하고자 하는 자가 소유하고 있는 사업용 화물자동차</p>
									</div>
									<div class="txtContent pB0">
										<h4 class="decuh4Tit">나&#46; 계약체결 기본요소</h4>
										<p class="txtPoint">1&#41; 기명조합원</p>
										<ul class="txtListst01">
											<li>자동차 등록원부상의 소유자&#40;운송사업자&#41;</li>
										</ul>
										<p class="txtPoint">2&#41; 공제종목 및 기간</p>
										<ul class="txtListst01">
											<li>대인배상 &#8544; &#40;책임공제&#41;&#44; 대인배상 &#8545; &#44; 대물공제&#44; 자기차량손해&#44; 종사자재해&#44; 적재물배상책임공제</li>
											<li>전 종목 공히 1년 기본 계약단위로 함&#46; &#40;공제 계약기간이 1년 미만일 경우 별도로 정한 단기요율로 계약&#41;</li>
										</ul>
										<p class="txtPoint">3&#41; 공제종목별 보상내용</p>
										<table class="tbDetail_st01" summary="공제종목별 보상내용 상세정보 테이블 입니다.">
											<caption>공제종목별 보상내용에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:17%;" />
												<col style="width:15%;" />
												<col style="width:68%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" colspan="2" class="bB1">공제종목</th>
													<th scope="col" rowspan="2">보상하는 내용</th>
												</tr>
												<tr>
													<th scope="col">종목</th>
													<th scope="col">담보</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td rowspan="6">자동차공제</td>
													<td>대인배상 &#8544; </td>
													<td class="alL">조합원이 공제계약 자동차의 운행으로 인하여 남을 죽게 하거나 다치게 하여 자동차손해배상보장법 등에 의한 손해배상책임을 짐으로써 입은 손해를 약관에 따라 보상</td>
												</tr>
												<tr>
													<td>대인배상 &#8545; </td>
													<td class="alL">조합원이 공제계약자동차의 사고로 남을 죽게 하거나 다치게 하여 법률상 손해배상책임을 짐으로써 입은 손해 중 대인배상 &#8544; 로 지급되는 금액 또는 대인배상&#8544; 로 지급될 수 있는 금액을 넘는 손해를 약관에 따라 보상</td>
												</tr>
												<tr>
													<td>대물배상</td>
													<td class="alL">조합원이 공제계약 자동차의 사고로 남의 재물을 없애거나 훼손하여 법률상 손해배상 책임을 짐으로써 입은 손해를 약관이 정한 바에 따라 보상</td>
												</tr>
												<tr>
													<td>자기신체사고</td>
													<td class="alL">조합원이 공제계약자동차를 소유 &#8901; 사용 &#8901; 관리하는 동안에 발생한 사고로 인해 상해를 입은 경우 약관이 정한바에 따라 그 손해를 보상</td>
												</tr>
												<tr>
													<td>종사자재해</td>
													<td class="alL">조합원이 종사자재해 공제계약 자동차를 소유 &#8901; 사용 &#8901; 관리하는 동안에 재해공제 계약자동창의 종사자가 재해로 인하여 보상사유가 발생한 때에 약관이 정하는 바에 따라 보상</td>
												</tr>
												<tr>
													<td>자기차량손해</td>
													<td class="alL">조합원의 공제계약자동차가 타 차 또는 타 물체와의 충돌&#44; 접촉&#44; 추락&#44; 전복&#44; 침수&#44; 도난&#44; 화재&#44; 폭발&#44; 낙뢰&#44; 기타 이와 유사한 사고로 인하여 자동차&#40;그 부속품과 부속기계장치 포함&#41;에 생긴 직접 손해를 약관에 따라 보상</td>
												</tr>
												<tr>
													<td colspan="2">적재물배상책임공제</td>
													<td class="alL">화주로부터 수탁 받은 화물을 운송 중 사고로 인해 망그러뜨려 법률상 손해배상 책임을 부담함으로써 입게 되는 손해를 약관이 정하는 바에 따라 보상</td>
												</tr>
											</tbody>
										</table><!--// 공제종목별 보상내용 e -->
									</div>
									<div class="txtContent pB0">
										<h4 class="decuh4Tit">다&#46; 계약체결 절차</h4>
										<p class="txtPoint pB0"">대당 가입금&#40;1종&#44; 2종&#44; 3종&#44; 특수&#44; 특정4만원&#44; 4종3만원&#41;납입&#44; 공제조합원 자격 취득</p>
										<p class="txtPoint02 pB20">자동차공제에 한함</p>
										<p class="txtPoint">가입대상 조합원의 청약 &#8594; 청약서 기재사항 확인 &#8594; 공제인수여부 및 분담금 결정 &#8594; 해당 분담금 납부확인 &#8594; 공제분담금 영수 &#8594; 공제분담금 영수증 발행교부</p>
									</div>
								</div>
								<!-- 공지사항 -->
								<div id="tab2" class="tabCont">
									<h3 class="hide">안내사항</h3>
									<div class="txtContent ">
										<h4 class="decuh4Tit">가&#46; 대인배상 &#8544; &#44;대인배상 &#8545; 및 대물배상&#40;2천만원&#41; 의무가입</h4>
										<p class="txtPoint">자동차손해배상보장법에 의거 사업용 화물자동차는 대인배상 &#8544; &#44;대인배상 &#8545; 및 대물배상에 의무적으로 가입해야 함</p>
										<ul class="txtListst01">
											<li>미가입시 &#58; 300만원 이하의 과태료 처분&#40;법 제48조 제3항 제1호&#41;</li>
											<li>미가입자동차 운행시 &#58; 1년 이하의 징역 또는 1,000만원 이하의 벌금형&#40;법 제46조 제2항&#41;</li>
										</ul>
									</div>
									<div class="txtContent pB0">
										<h4 class="decuh4Tit">나&#46; 적재물배상책임공제&#40;보험&#41; 의무가입</h4>
										<p class="txtPoint">화물자동차운송사업자&#40;최대적재량이 5톤 이상이거나 총 중량이 10톤 이상인 화물자동차 중 일반형 &#8901; 밴형 &#8901; 특수용도형 화물자동차와 견인형 특수자동차&#41;&#44; 화물자동차운송주선사업자&#44; 화물자동차운송가맹사업자는 적재물배상책임공제&#40;보험&#41;에 의무적으로 가입하여야 함&#46;</p>
										<ul class="txtListst01">
											<li>&#40;구&#41;건설교통부 고시 제2005-53호&#40;2005&#46;3&#46;10&#46;&#41;에 해당되는 화물자동차</li>
										</ul>
										<p class="txtPoint">적재물배상책임공제&#40;보험&#41;에 가입하지 아니한 사업자 과태료 및 행정처분</p>
										<ul class="txtListst01">
											<li>화물자동차 운송사업자 &#58; 미가입 일수에 따라 1대당 50만원 이하의 과태료</li>
											<li>운송주선사업자 &#58; 미가입 일수에 따라 사업자당 100만원 이하의 과태료</li>
										</ul>
										<p class="txtPoint">적재물배상책임공제&#40;보험&#41;에 가입하지 아니한 상태로 화물자동차를 운행하거나 그 가입이 실효 상태로 화물자동차를 운행한 때</p>
										<ul class="txtListst01">
											<li>1차 위반 운행정지 20일&#44; 2차 위반 운행정이 30일</li>
										</ul>
									</div>
								</div>
							</div><!--// tabContainer e -->
						</div><!--// tabs e -->
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