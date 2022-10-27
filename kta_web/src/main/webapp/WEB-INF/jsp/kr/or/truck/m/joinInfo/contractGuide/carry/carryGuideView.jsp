<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->

</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path03">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/joinInfo/index.do">가입안내</a></li>
			<li><a href="/m/joinInfo/contractGuide/car/view.do">계약시 유의사항</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i03"><img alt="공제약관" src="/images/m_truck/subtop/03top_2.png" /></li>
				<li class="txt01">화물공제조합 공제가입시 유의사항입니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		
		<article class="tabWrap">
			<!-- tab -->
			<div class="tabBox03">
				<ul >
					<li><a href="/m/joinInfo/contractGuide/car/view.do">자동차 공제</a></li>
					<li class="on"><a href="/m/joinInfo/contractGuide/carry/view.do">적재물 공제</a></li>
				</ul>
			</div>
			<div class="basicCont02">
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>의무가입 대상</h3>
					<ul class="pt14">
						<li><span class="bulSt01">최대적재량 5톤 이상이거나 총 중량이 10톤 이상인 화물자동차</span></li>
					</ul>
				</div><!--// 라운드 박스 컨텐츠 -->
				
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>가입제외 차량</h3>
					<ul class="pt14">
						<li><span class="bulSt01">덤프형 화물자동차, 구난형·특수작업형 특수자동차, 동력장치가 없는 피견인차, 기타 국토부 장관이 고시한 가입제외 차량</span></li>
						<li class="line"><span class="bulSt01">가입제외 차량 상세(시멘트 수송 전용차량, 사료 및 곡물수송 전용차량, 우유·식용유·공업유 등 원유 수송 전용차량, 석유류 수송 전용 차량, 고철 수송 전용 차량, 목재 수송 전용차량, 골재 수송 전용차량, 석탄 수송 전용차량, 아스콘·아스팔트유 수송 전용차량, 건축폐기물·산업폐기물·폐유 등 폐기물 운반용 트럭, 낙엽수집, 왕겨수송, 톱밥수거, 살수차, 급수차 및 기타 특수, 특정용도 차량)</span></li>
						<li><span class="bulSt01">적재물공제의 분담금 적용은 자동차등록증상의 적재정량(→구조변경 후의 최대적재량)에 따릅니다. </span></li>
					</ul>
				</div><!--// 라운드 박스 컨텐츠 -->
				
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>위험요소의 할증율</h3>
					<ul class="pt14">
						<li><span class="bulSt01">적재물 가입 시 대상물이 불특정하여 계약자의 고지에 따라 할증 적용여부가 결정되며, 고지하지 않아 미적용 되었을 경우 사고 시 면책될 수 있으므로 해당 차량은 반드시 고지하여 주시기 바랍니다.</span></li>
						<li><span class="bulSt01">냉동컨테이너, 탱크트레일러, 플랙시탱크, 탱크컨테이너 등도 할증대상에 포함되므로 반드시 고지하시기 바랍니다.</span></li>
						<li><span class="bulSt01">대상물을 부정기적이나 단발성으로 운송하는 경우에도 반드시 고지하여야 합니다.</span></li>
						<li>
							<div class="tableBox pa0">
								<table class="tbSt01 mb5" summary="사업용 차량의 의무보험 과태료표">
									<caption>사업용 차량의 의무보험 과태료</caption>
									<colgroup>
										<col style="width:80%;" />
										<col style="width:20%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">할증적용 대상</th>
											<th scope="col">할증율</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="lineNo"> 온도조절장치 부착차량, 유류가스 및 액체물체 운송 탱크로리</p> * 탱크로리와 유사한 플랙시 탱크, 탱크컨테이너 등도 할증대상 포함</td>
											<td class="alC">30%</td>
										</tr>
										<tr>
											<td class="lineNo"> 이륜자동차 차량탁송업에 사용되는 차량</td>
											<td class="alC">150%</td>
										</tr>
										<tr>
											<td class="lineNo"> 차량탁송업에 사용되는 차량</p> * 자동차관리법에서 정한 자동차로 한정(건설기계 탁송차량 할증 미적용) / 차량의 구조나 형태,  신차 내지 중고차, 운송수량 및 목적 여부를 불문하고 운송 대상이 자동차일 경우 할증적용</td>
											<td class="alC">500%</td>
										</tr>
									</tbody>
								</table>
							</div>
						</li>
					</ul>
				</div><!--// 라운드 박스 컨텐츠 -->
				
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>특별약관 종류 및 미가입 시 보상처리 여부</h3>
					<ul class="pt14">						
						<li>
							<div class="tableBox pa0">
								<table class="tbSt01 mb5" summary="사업용 차량의 의무보험 과태료표">
									<caption>사업용 차량의 의무보험 과태료</caption>
									<colgroup>
										<col style="width:15%;" />
										<col style="width:40%;" />
										<col style="width:30%;" />
										<col style="width:15%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">특별약관</th>
											<th scope="col">보상내용</th>
											<th scope="col">해당차종 및 특약분담금</th>
											<th scope="col">미가입 시</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="lineNo">화물운송부수업무담보특약</td>
											<td class="alC">①화물을 수탁 받아 수하인에게 인도하기까지 화물운송에 관한 부수업무 수행 중 사고</p>②자차에 부착된 기계를 이용한 상하차 시 사고</td>
											<td class="alC">① 택배차량, 카 캐리어 등</p>② 크레인, 사다리차, 유압적하기, 고소작업차 등 / 기본분담금의 90% 금액</td>
											<td class="alC">①운송기간만 보상</p>②면책</td>
										</tr>
										<tr>
											<td class="lineNo">수탁화물확장 담보특약</td>
											<td class="alC">시계, 담배, 모피류, 유리제품, 계란류, 살아있는 동물 등</td>
											<td class="alC">해당제품 적재차량 / 적용분담금의 100% 금액</td>
											<td class="alC">면책</td>
										</tr>
										<tr>
											<td class="lineNo">온도조절장치 담보특약</td>
											<td class="alC">온도조절장치의 고장, 전기중단 등으로 인한 수탁화물 파손</td>
											<td class="alC">냉동, 냉장, 보온, 항온항습, 활어운송차(산소발생기계) 등 / 기본분담금의 30% 금액</td>
											<td class="alC">면책</td>
										</tr>
										<tr>
											<td class="lineNo">안심운송 특약</td>
											<td>① 비례보상사고</p> - 출발지 관할 경찰서장 또는 관할관청의 허가 범위 내에서 초과 적재 중 사고시 초과적재범위(허가 없을 시 특약가입해도 면책)</p>② 포장불완전사고</p> - 수탁화물의 덮개로 인한 손해, 포장 또는 결박 불완전으로 생긴 손해</p> - 담보차량의 충돌이 수반되지 않은 상태에서 원인불문하고 수탁화물간의 충돌, 접촉으로 생긴 손해</p>③ 피해물 수습비용</p> - 300만원 한도 내 보상</td>
											<td class="alC">화물운송업을 하는 전 차량 / 기본분담금의 10% 금액</td>
											<td class="alC">①비례보상</p>② 면책</p>③ 15만원</td>
										</tr>
									</tbody>
								</table>
							</div>
						</li>
						<div class="liBox">
							<h4 class="txtTit04">아래 사고는 안심운송특약 가입해도 면책</h4>
							<p class="txt01">비나 눈 또는 이와 비슷한 기상조건하에서 덮개를 씌우지 아니함으로써 생긴 손해</p>
							<p class="txt01">사고발생의 개연성이 충분히 예상될 수 있을 정도로 수탁화물의 포장 또는 적재(결박)가 현저하게 잘못됨으로써 생긴 손해</p>
							<p class="txt01 pb0">트레일러 차량이 컨테이너를 고정시키는 잠금장치를 하나라도 채우지 아니함으로써 생긴 손해</p>
						</div>					
					</ul>
				</div><!--// 라운드 박스 컨텐츠 -->
			</div>
				
		</article><!--// tabWrap -->
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>