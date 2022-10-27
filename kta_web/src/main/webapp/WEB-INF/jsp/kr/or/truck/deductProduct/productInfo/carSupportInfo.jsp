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
						<span>긴급출동서비스 특약</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/carsupportinfo_con_tit.gif" alt="공제계약 긴급출동서비스 특약 상품안내 입니다." /></p>				
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">긴급출동서비스 특약</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea manBg">
								<p class="lossTxt1">보상하는 손해</p>
								<p class="lossTxt2">공제조합(이하 “조합”이라 함)은 조합원이 청약서에 기재된 공제계약자동차를 소유, 사용, 관리하는 동안에 조합에 긴급출동서비스(Ⅰ,Ⅱ)를 요청한 때에는 이 특별약관에 따라 해당하는 긴급출동서비스(Ⅰ,Ⅱ)를 조합이 지정하는 업체를 통하여 제공합니다.</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">가입대상</h4>
							<p class="txtPoint">(특약Ⅰ) <b>적재정량 1.6톤 이하</b>의 공제계약 자동차(특정, 특수차종 제외)</p>
							<p class="txtPoint">(특약Ⅱ) <b>적재정량 1.6톤 초과 ~ 5톤 이하</b>의 공제계약자동차(특정, 특수차종 제외)</p></br>
								
						
							<h4 class="decuh4Tit">서비스 내용</h4>
							<table class="tbDetail_st01 mB5" summary="긴급출동 서비스 특약 서비스내용 테이블 입니다.">
								<caption>긴급출동 서비스 특약 서비스내용</caption>
								<colgroup>
									<col style="width:40%;" />
									<col style="width:30%;" />
									<col style="width:30%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">제공서비스</th>
										<th scope="col">특약Ⅰ</th>
										<th scope="col">특약Ⅱ</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>배터리충전</td>
										<td>○</td>
										<td>○</td>
									</tr>
									<tr>
										<td>잠금장치 해제</td>
										<td>○</td>
										<td>○</td>
									</tr>
									<tr>
										<td>비상급유</td>
										<td>○</td>
										<td>○</td>
									</tr>
									<tr>
										<td>타이어 교체</td>
										<td>○</td>
										<td>-</td>
									</tr>
									<tr>
										<td>긴급견인</td>
										<td>○</td>
										<td>-</td>
									</tr>
									<tr>
										<td>비상구난</td>
										<td>○</td>
										<td>-</td>
									</tr>
								</tbody>
							</table><!--// 긴급출동 서비스 특약 서비스내용 표 e -->
							<p>&nbsp;</p><p>&nbsp;</p>
							
							<table class="tbDetail_st04 mB5" summary="긴급출동 서비스 특약 서비스내용 테이블 입니다.">
								<caption>긴급출동 서비스 특약 서비스내용</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">구분</th>
										<th scope="col">상세 내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>긴급견인 서비스</td>
										<td>사고 또는 고장으로 공제계약자동차가 자력으로 운행하지 못하여 수리를 위해 긴급견인을 필요로 할 경우에 1일당 1회에 한하여 10km를 한도로 견인하여 드립니다. 
 다만 10km를 초과하는 거리에 대해 발생된 비용은 조합원의 부담으로 합니다. 
 또한 차량의 적재물 또는 구조 변경 등으로 인하여 서비스의 제공에 제한이 생길 경우에는 서비스를 제공하지 않습니다.</td>
									</tr>
									<tr>
										<td>비상급유 서비스</td>
										<td>자동차의 연료가 소진되어 운행이 정지된 경우에 긴급운행용으로 3ℓ 이내(특약 Ⅱ의 경우 5ℓ)의 연료를  주유하여 드립니다. 
 다만 3ℓ(특약 Ⅱ의 경우 5ℓ)를 초과하는 경우 조합원 실비 부담, 년2회 , 1일 1회로 한정합니다.</td>
									</tr>
									<tr>
										<td>배터리충전 서비스</td>
										<td>배터리의 방전으로 운행할 수 없는 경우에 차량의 운행이 가능하도록 조치하여 드립니다. 다만, 배터리 교환시는 배터리 실비는 조합원이 지급하여야 합니다.</td>
									</tr>
									<tr>
										<td>타이어교체 서비스</td>
										<td>타이어의 펑크로 운행을 할 수 없는 경우 예비타이어가 있는 경우에 한하여 고장난 타이어를 예비타이어로 교체하여 드립니다. 
 다만, 차량의 적재물 또는 구조변경 등으로 인하여 서비스의 제공에 제한이 생길 경우에는 서비스를 제공하지 않습니다.</td>
									</tr>
									<tr>
										<td>잠금장치 해제서비스</td>
										<td>차량의 Key를 자동차 실내에 두거나 분실 등으로 차문을 열 수 없는 경우에 잠금장치를 해제하여 드립니다.(트렁크 잠금장치 해제는 제외) 다만, 잠금장치의 해제를 위하여 부득이 파손된 부분의 원상복구를 위해 소요되는 비용은 보상하지 않습니다.

 외산차나 최근 출시된 국산 자동차의 경우에는 특수 잠금장치(스마트 키, 이모빌라이저 등)가 장착되어 있거나 사이드 에어백의 장착 등으로 잠금장치해제가 불가능한 경우 서비스를 제공하지 않습니다.</td>
									</tr>
									<tr>
										<td>긴급구난 서비스</td>
										<td>조합은 조합원이 공제계약자동차를 소유, 사용, 관리하던 중 도로를 이탈, 장애물 등으로 공제계약자동차의 자력 운행이 불가능할 경우 공제계약자동차를 구난하여 드립니다.
 다만, 별도의 구난장비 없이 출동한 자동차로 구난 가능한 경우에 한하며, 특수한 구난을 한 경우에는 별도의 사용료를 지급하여야 합니다. 또한, 차량의 적재물로 인하여 서비스의 제공이 힘든 경우에는 서비스를 제공하지 아니합니다.</br> 

  ※ 이 특별약관에서 특수한 구난을 한 경우라 함은</br> 
  ① 2.5t을 초과하는 구난형 특수자동차로 구난한 경우</br> 
  ② 2대 이상의 구난형 특수자동차가 구난한 경우 </br>
  ③ 구난작업을 시작하여 견인 고리 연결직전까지 소요된 시간이 30분을 초과한 경우</br> 
  ④ 2,500cc이상의 국산차량 및 외제차량을 구난한 경우를 말합니다.</td>
									</tr>
								</tbody>
							</table><!--// 긴급출동 서비스 특약 서비스내용 표 e -->
							
							
							<p>&nbsp;</p><p>&nbsp;</p>
							<h4 class="decuh4Tit">유의사항</h4>
							<table class="tbDetail_st04 mB5" summary="긴급출동 서비스 특약 서비스내용 테이블 입니다.">
								<caption>긴급출동 서비스 특약 서비스내용</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:70%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">구분</th>
										<th scope="col">상세 내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>보상하지 않는 손해</td>
										<td>- 조합은 이 특별약관에서 정한 서비스의 요청지가 견인차가 접근하기 어려운 지역이나 도서지역(제주도 및 연륙교로 연결된 도서지역 제외), 산간지역 또는 통신교환이 원활하지 못하여 회사가 서비스 제공이 불가능하다고 판단되는 지역인 경우에는 긴급출동서비스Ⅰ,Ⅱ을 제공하지 아니합니다</br>
- 조합은 긴급출동서비스Ⅰ,Ⅱ의 지연 또는 미제공으로 인하여 발생한 간접손해에 대하여는 보상하지 아니합니다.</td>
									</tr>
									<tr>
										<td>특약의 자동 해지</td>
										<td>- 조합원이 이 특별약관에 가입 후 긴급출동서비스Ⅰ, Ⅱ를 5회 이상(공제기간이 1년 미만인 경우는 3회 이상)받았을 때에는 그 시점부터 자동으로 해지됩니다.</td>
									</tr>
								</tbody>
							</table><!--// 긴급출동 서비스 특약 서비스내용 표 e -->
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