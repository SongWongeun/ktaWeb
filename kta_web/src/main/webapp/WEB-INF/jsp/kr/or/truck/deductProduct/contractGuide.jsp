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
						<h2><img src="/images/truck/dedu/joinguide_tit.gif" alt="가입안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>
						<span>계약 시 유의사항</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/joinguide_con_tit.gif" alt="공제계약 가입안내 입니다. 공제계약 절차 및 필수 참고 사항을 확인하세요." /></p>				
					<div class="conSection">
						<!-- tabs s -->
						<div class="jointabs">
							<ul class="tabMenu">
								<li><a href="#tab1" name="tab1">자동차 공제</a></li>
								<li><a href="#tab2" name="tab2">적재물 공제</a></li>
							</ul><!--// tabMenu e -->
							<div class="tabContainer">
								<!-- 공제계약 체결절차 -->
								<div id="tab1" class="tabCont">
									<h3 class="hide">자동차 공제</h3>
									<div class="txtContent">
										<h4 class="decuh4Tit">가&#46;의무가입 대상</h4>
										<p class="txtPoint">영업용 화물자동차의 경우 대인배상Ⅰ, 대인배상Ⅱ, 대물배상(2천만원 한도) 의무 가입</p>
										<ul class="txtListst01">
											<li>사업용 차량의 의무보험 과태료</li>
										</ul>
										<table class="tbDetail_st01" summary="사업용 차량의 의무보험 과태료 테이블 입니다.">
											<caption>공사업용 차량의 의무보험 과태료에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:34%;" />
												<col style="width:22%;" />
												<col style="width:22%;" />
												<col style="width:22%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" rowspan="2" class="bB1">구분</th>
													<th scope="col" colspan="3">지연 기간별 과태료</th>
												</tr>
												<tr>
													<th scope="col">10일 미가입</th>
													<th scope="col">10일 초과 매 1일당</th>
													<th scope="col">최고액</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>대인배상 &#8544; </td>
													<td class="alC">3만원</td>
													<td class="alC">8천원</td>
													<td class="alC">100만원</td>
												</tr>
												<tr>
													<td>대인배상 &#8545; </td>
													<td class="alC">3만원</td>
													<td class="alC">8천원</td>
													<td class="alC">100만원</td>
												</tr>
												<tr>
													<td>대물배상</td>
													<td class="alC">5천원</td>
													<td class="alC">2천원</td>
													<td class="alC">30만원</td>
												</tr>
											</tbody>
										</table><!--// 공제종목별 보상내용 e -->
									</div>
									<div class="txtContent pB0">
										<p>&nbsp;</p>
										<h4 class="decuh4Tit">나&#46; 차종구분은 자동차의 구조 및 장치의 변경과 관계없이 최초 신규등록시의 적재정량에 따릅니다.</h4>
									</div>
									<div class="txtContent pB0">
										<p>&nbsp;</p>
										<h4 class="decuh4Tit">다&#46; 주요 특별요율 대상 차량 및 할증율</h4>
										<p class="txtPoint">1&#41; 자동차의 구조나 운행실태가 동종차종과 상이한 차량의 경우 계약자의 고지에 따라 할증 적용여부가 결정되며, 고지하지 않아 미적용 되었을 경우 사고 시 면책될 수 있으므로 해당 차량은 반드시 고지하여 주시기 바랍니다.</p>
										<p class="txtPoint">2&#41; 계약자동차가 구조 변경된 경우(예시 : 기중기장치 및 차량 연결 장치 부착 등) 및 위험물 등의 적재로 위험도가 달라진 차량의 경우도 반드시 고지하여 주시기 바랍니다.</p>
										<table class="tbDetail_st01" summary="주요 특별요율 대상차량 및 특별요율 테이블 입니다.">
											<caption>주요 특별요율 대상차량 및 특별요율에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:15%;" />
												<col style="width:65%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">구분</th>
													<th scope="col">요윺적용</th>
													<th scope="col">적용대상</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>견인피견인</td>
													<td class="alC">117%</td>
													<td class="alL">수반차 견인을 위한 특수연결장치 장착차량 (트렉터, 풀카고 등)</td>
												</tr>
												<tr>
													<td>위험물 적재</td>
													<td class="alC">125%</td>
													<td class="alL">화약류, 고압가스, 기타 폭발·인화성 등 위험물 적재차량 등</td>
												</tr>
												<tr>
													<td>기중기 장착</td>
													<td class="alC">117%</td>
													<td class="alL">기중기 또는 붐 장치가 되어있는 구난형자동차, 사다리차 등</td>
												</tr>
												<tr>
													<td>다인승 차량</td>
													<td class="alC">150%</td>
													<td class="alL">6인승 밴형 화물자동차 및 승차정원이 3인을 초과하는 차량</td>
												</tr>
											</tbody>
										</table><!--// 공제종목별 보상내용 e -->
									</div>
									<div class="txtContent pB0">
										<p>&nbsp;</p>
										<h4 class="decuh4Tit">라&#46; 대물사고 발생 시 자부담금(30만원) 부과</h4>
										<p class="txtPoint">자부담금제는 사고로 발생된 손해액의 일부를 사고 야기자가 부담토록 함으로써, 운전자에게 사고 발생에 대한 경각심을 주어 사고예방을 도모하고자 시행하고 있으며 사고접수 시 납부함이 원칙입니다.</p>
										<p>&nbsp;</p>
										<h4 class="decuh4Tit">마&#46; 해지 사유 발생 시 분담금 환급</h4>
										<table class="tbDetail_st01" summary="해지사유 발생 시 분담금 환급 테이블 입니다.">
											<caption>해지사유 발생 시 분담금 환급에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:25%;" />
												<col style="width:45%;" />
												<col style="width:30%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">구분</th>
													<th scope="col">환급내역</th>
													<th scope="col">비고</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>조합원의 책임 없는 사유</td>
													<td class="alL">미경과 기간에 대해 일할 계산</td>
													<td class="alL">-</td>
												</tr>
												<tr>
													<td>조합원의 책임 있는 사유</td>
													<td class="alL">미경과 기간에 대해 단기요율로 계산</td>
													<td class="alL">-</td>
												</tr>
												<tr>
													<td>사고가 있는 경우</td>
													<td class="alL">공제금이 지급된 담보는 환급에서 제외</td>
													<td class="alL">예) 계약기간 중 대물사고 있는 경우, 대인Ⅰ,Ⅱ만 환급, 대물은 환급 ×</td>
												</tr>
											</tbody>
										</table><!--// 공제종목별 보상내용 e -->
										<ul class="txtListst01">
											<li>조합원이 납부하여야 할 분담금, 추가분담금, 자부담금 등이 미납된 경우에는 조합원에게 지급될 환급금에서 미납입분담금을 공제하고 지급합니다.</li>
										</ul>
									</div>
								</div>
								<!-- 공지사항 -->
								<div id="tab2" class="tabCont">
									<h3 class="hide">적재물공제</h3>
									<div class="txtContent ">
										<h4 class="decuh4Tit">가&#46; 적재물공제 의무가입 대상</h4>
										<p class="txtPoint">최대적재량 5톤 이상이거나 총 중량이 10톤 이상인 화물자동차</p>
									</div>
									<div class="txtContent pB0">
										<p>&nbsp;</p>
										<h4 class="decuh4Tit">나&#46; 가입제외 차량</h4>
										<p class="txtPoint">덤프형 화물자동차, 구난형·특수작업형 특수자동차, 동력장치가 없는 피견인차, 기타 국토부 장관이 고시한 가입제외 차량</p>
										<ul class="txtListst01">
											<li>&#40;시멘트 수송 전용차량, 사료 및 곡물수송 전용차량, 우유·식용유·공업유 등 원유 수송 전용차량, 석유류 수송 전용 차량, 고철 수송 전용 차량, 목재 수송 전용차량, 골재 수송 전용차량, 석탄 수송 전용차량, 아스콘·아스팔트유 수송 전용차량, 건축폐기물·산업폐기물·폐유 등 폐기물 운반용 트럭, 낙엽수집, 왕겨수송, 톱밥수거, 살수차, 급수차 및 기타 특수, 특정용도 차량</li>
										</ul>
										<p>&nbsp;</p>
										<h4 class="decuh4Tit">다&#46; 적재물공제의 분담금 적용은 자동차등록증상의 적재정량(→구조변경 후의 최대적재량)에 따릅니다. </h4>
										<p>&nbsp;</p>
										<h4 class="decuh4Tit">라&#46; 위험요소의 할증율</h4>
										<p class="txtPoint">1) 적재물 가입 시 대상물이 불특정하여 계약자의 고지에 따라 할증 적용여부가 결정되며, 고지하지 않아 미적용 되었을 경우 사고 시 면책될 수 있으므로 해당 차량은 반드시 고지하여 주시기 바랍니다.</p>
										<p class="txtPoint">2) 냉동컨테이너, 탱크트레일러, 플랙시탱크, 탱크컨테이너 등도 할증대상에 포함되므로 반드시 고지하시기 바랍니다.</p>
										<p class="txtPoint">3)대상물을 부정기적이나 단발성으로 운송하는 경우에도 반드시 고지하여야 합니다.</p>
										<table class="tbDetail_st01" summary="해지사유 발생 시 분담금 환급 테이블 입니다.">
											<caption>해지사유 발생 시 분담금 환급에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:75%;" />
												<col style="width:25%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">할증적용 대상</th>
													<th scope="col">할증율</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="alL">온도조절장치 부착차량, 유류가스 및 액체물체 운송 탱크로리</p>* 탱크로리와 유사한 플랙시 탱크, 탱크컨테이너 등도 할증대상 포함</td>
													<td class="alC">30%</td>
												</tr>
												<tr>
													<td class="alL"> 이륜자동차 차량탁송업에 사용되는 차량</td>
													<td class="alC">150%</td>
												</tr>
												<tr>
													<td class="alL">차량탁송업에 사용되는 차량</p>* 자동차관리법에서 정한 자동차로 한정(건설기계 탁송차량 할증 미적용) / 차량의 구조나 형태,  신차 내지 중고차, 운송수량 및 목적 여부를 불문하고 운송 대상이 자동차일 경우 할증적용</td>
													<td class="alC">500%</td>
												</tr>
											</tbody>
										</table><!--// 공제종목별 보상내용 e -->
										<p>&nbsp;</p>
										<h4 class="decuh4Tit">마&#46; 특별약관 종류 및 미가입 시 보상처리 여부</h4>
										<table class="tbDetail_st01" summary="해지사유 발생 시 분담금 환급 테이블 입니다.">
											<caption>해지사유 발생 시 분담금 환급에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:10%;" />
												<col style="width:40%;" />
												<col style="width:35%;" />
												<col style="width:15%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">특별약관</th>
													<th scope="col">보상내용</th>
													<th scope="col">해당 차종 및 특약분담금</th>
													<th scope="col">미가입 시</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="alC">화물운송부수</p>업무담보특약</td>
													<td class="alL">①화물을 수탁 받아 수하인에게 인도하기까지 화물운송에 관한 부수업무 수행 중 사고</p>②자차에 부착된 기계를 이용한 상하차 시 사고</td>
													<td class="alL">① 택배차량, 카 캐리어 등</p>② 크레인, 사다리차, 유압적하기, 고소작업차 등 / 기본분담금의 90% 금액</td>
													<td class="alC">①운송기간만 보상</p>②면책</td>
												</tr>
												<tr>
													<td class="alC">수탁화물확장</p>담보특약</td>
													<td class="alL">시계, 담배, 모피류, 유리제품, 계란류, 살아있는 동물 등</td>
													<td class="alL">해당제품 적재차량 / 적용분담금의 100% 금액</td>
													<td class="alC">면책</td>
												</tr>
												<tr>
													<td class="alC">온도조절장치</p>담보특약</td>
													<td class="alL">온도조절장치의 고장, 전기중단 등으로 인한 수탁화물 파손</td>
													<td class="alL">냉동, 냉장, 보온, 항온항습, 활어운송차(산소발생기계) 등 / 기본분담금의 30% 금액</td>
													<td class="alC">면책</td>
												</tr>
												<tr>
													<td class="alC">안심운송</p>특약*</td>
													<td class="alL">① 비례보상사고</p>&nbsp;&nbsp;- 출발지 관할 경찰서장 또는 관할관청의 허가 범위 내에서 초과 적재 중 사고시 초과적재범위(허가 없을 시 특약가입해도 면책)</p>② 포장불완전사고</p>&nbsp;&nbsp;- 수탁화물의 덮개로 인한 손해, 포장 또는 결박 불완전으로 생긴 손해</p>&nbsp;&nbsp;- 담보차량의 충돌이 수반되지 않은 상태에서 원인불문하고 수탁화물간의 충돌, 접촉으로 생긴 손해</p>③ 피해물 수습비용</p>&nbsp;&nbsp;- 300만원 한도 내 보상</td>
													<td class="alL">화물운송업을 하는 전 차량 / 기본분담금의 10% 금액</td>
													<td class="alC">①비례보상<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>② 면책<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>③ 15만원</td>
												</tr>
											</tbody>
										</table><!--// 공제종목별 보상내용 e -->
										<p class="txtPoint">* 아래 사고는 안심운송특약 가입해도 면책</p>
										<ul class="txtListst01">
											<li>&#40;비나 눈 또는 이와 비슷한 기상조건하에서 덮개를 씌우지 아니함으로써 생긴 손해</li>
											<li>&#40;사고발생의 개연성이 충분히 예상될 수 있을 정도로 수탁화물의 포장 또는 적재(결박)가 현저하게 잘못됨으로써 생긴 손해</li>
											<li>&#40;레일러 차량이 컨테이너를 고정시키는 잠금장치를 하나라도 채우지 아니함으로써 생긴 손해</li>
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