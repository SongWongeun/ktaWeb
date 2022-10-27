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
					<li class="on"><a href="/m/joinInfo/contractGuide/car/view.do">자동차 공제</a></li>
					<li><a href="/m/joinInfo/contractGuide/carry/view.do">적재물 공제</a></li>
				</ul>
			</div>
			<div class="basicCont02">
				<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>의무가입 대상</h3>
				<ul class="pt14">
					<li class="line"><span class="bulSt01">영업용 화물자동차의 경우 대인배상Ⅰ, 대인배상Ⅱ, 대물배상(2천만원 한도) 의무 가입</span></li>
					<li class="line">
						<div class="tableBox pa0">
							<table class="tbSt01 mb5" summary="사업용 차량의 의무보험 과태료표">
								<caption>사업용 차량의 의무보험 과태료</caption>
								<colgroup>
									<col style="width:25%;" />
									<col style="width:25%;" />
									<col style="width:25%;" />
									<col style="width:25%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan = "2" class="lineNo">구분</th>
										<th scope="col" colspan = "3">지연 기간별 과태료</th>
									</tr>
									<tr>
										<th scope="col">10일 미가입</th>
										<th scope="col">10일 초과 매 1일당</th>
										<th scope="col">최고액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="lineNo">대인배상 &#8544; </td>
										<td class="alC">3만원</td>
										<td class="alC">8천원</td>
										<td class="alC">100만원</td>
									</tr>
									<tr>
										<td class="lineNo">대인배상 &#8545; </td>
										<td class="alC">3만원</td>
										<td class="alC">8천원</td>
										<td class="alC">100만원</td>
									</tr>
									<tr>
										<td class="lineNo">대물배상</td>
										<td class="alC">5천원</td>
										<td class="alC">2천원</td>
										<td class="alC">30만원</td>
									</tr>
								</tbody>
							</table>
							<p class="bulSt05 pb0">사업용 차량의 의무보험 과태료</p>
						</div>
					</li>
					<li><span class="bulSt01">차종구분은 자동차의 구조 및 장치의 변경과 관계없이 최초 신규등록시의 적재정량에 따릅니다.</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>주요 특별요율 대상 차량 및 할증율</h3>
				<ul class="pt14">
					<li><span class="bulSt01">자동차의 구조나 운행실태가 동종차종과 상이한 차량의 경우 계약자의 고지에 따라 할증 적용여부가 결정되며, 고지하지 않아 미적용 되었을 경우 사고 시 면책될 수 있으므로 해당 차량은 반드시 고지하여 주시기 바랍니다.</span></li>
					<li><span class="bulSt01">계약자동차가 구조 변경된 경우(예시 : 기중기장치 및 차량 연결 장치 부착 등) 및 위험물 등의 적재로 위험도가 달라진 차량의 경우도 반드시 고지하여 주시기 바랍니다.</span></li>
					<li>
						<div class="tableBox pa0">
							<table class="tbSt01 mb5" summary="사업용 차량의 의무보험 과태료표">
								<caption>사업용 차량의 의무보험 과태료</caption>
								<colgroup>
									<col style="width:25%;" />
									<col style="width:15%;" />
									<col style="width:60%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">구분</th>
										<th scope="col">요율적용</th>
										<th scope="col">적용대상</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="lineNo">견인피견인</td>
										<td class="alC">117%</td>
										<td class="alL">수반차 견인을 위한 특수연결장치 장착차량 (트렉터, 풀카고 등)</td>
									</tr>
									<tr>
										<td class="lineNo">위험물 적재</td>
										<td class="alC">125%</td>
										<td class="alL">화약류, 고압가스, 기타 폭발·인화성 등 위험물 적재차량 등</td>
									</tr>
									<tr>
										<td class="lineNo">기중기 장착</td>
										<td class="alC">117%</td>
										<td class="alL">기중기 또는 붐 장치가 되어있는 구난형자동차, 사다리차 등</td>
									</tr>
									<tr>
										<td class="lineNo">다인승 차량</td>
										<td class="alC">150%</td>
										<td class="alL">6인승 밴형 화물자동차 및 승차정원이 3인을 초과하는 차량</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>대물사고 발생 시 자부담금(30만원) 부과</h3>
				<ul class="pt14">
					<li><span class="bulSt01">자부담금제는 사고로 발생된 손해액의 일부를 사고 야기자가 부담토록 함으로써, 운전자에게 사고 발생에 대한 경각심을 주어 사고예방을 도모하고자 시행하고 있으며 사고접수 시 납부함이 원칙입니다.</span></li>					
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>해지 사유 발생 시 분담금 환급</h3>
				<ul class="pt14">					
					<li>
						<div class="tableBox pa0">
							<table class="tbSt01 mb5" summary="사업용 차량의 의무보험 과태료표">
								<caption>사업용 차량의 의무보험 과태료</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:40%;" />
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
										<td class="lineNo">조합원의 책임 없는 사유</td>
										<td class="alL">미경과 기간에 대해 일할 계산</td>
										<td class="alL">-</td>
									</tr>
									<tr>
										<td class="lineNo">조합원의 책임 있는 사유</td>
										<td class="alL">미경과 기간에 대해 단기요율로 계산</td>
										<td class="alL">-</td>
									</tr>
									<tr>
										<td class="lineNo">사고가 있는 경우</td>
										<td class="alL">공제금이 지급된 담보는 환급에서 제외</td>
										<td class="alL">예) 계약기간 중 대물사고 있는 경우, 대인Ⅰ,Ⅱ만 환급, 대물은 환급 ×</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>					
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