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

function windowOpen(){
	window.open("/deductProduct/cardGuide.do",'','toolbar=no,location=no,status=no,menubar=no, scrollbars=yes,resizable=no,width=700,height=500 top=20 left=20');
}
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
						<h2><img src="/images/truck/dedu/cardinfo_tit.gif" alt="카드수납안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>
						<span>카드수납안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/cardinfo_con_tit.gif" alt="신용카드를 이용한 분담급 납입 제도 안내입니다." /></p>				
					<div class="conSection">
					<h3><img src="/images/truck/dedu/card_img.jpg" alt="조합원 사업용 화물자동차 구입자금 대출 보증사업" /></h3>
						<!-- tabs s -->
						<div class="jointabs" style="margin-top:30px;">
							<div class="tabContainer">
								<!-- 공제계약 체결절차 -->
								<div id="tab1" class="tabCont">
									<div class="lossSide2" style="margin-bottom:0px;">
										<div class="lossBox">
											<ul>
												<li>2017년 3월 1일부터 조합원 및 조합원으로부터 동의된 위수탁 차주는 공제조합과 업무협약이 체결된 신용카드 회사(KB국민카드)의 신용카드를 이용하여 분담금을 납입할 수 있습니다. </li>
												※ 이 경우에 『신용카드 이용 분담금 납입 특별약관』을 적용합니다. 
											</ul>
										</div>
									</div>
									
									<table class="tbDetail_st01 mB0 tbTerm"  summary="신용카드 이용 분담금 납입 특별약관 테이블 입니다.">
										<caption>신용카드 이용 분담금 납입 특별약관에 대해서 나타낸 표</caption>
										<colgroup>
											<col style="width:40%;" />
											<col style="width:*;" />
											<col style="width:15%;" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" ><span>『신용카드 이용 분담금 납입 특별약관』 </span></th>
												<td class="bB2"></td>
												<td class="alC bB2"><span class="btn_pack btn_type07 icon"><span class="acrob"></span><a href="/cmm/fms/FileDown.do?atchFileId=FILE_000000000006897&fileSn=0">다운로드</a></span></td>
											</tr>
										</tbody>
									</table><!--// 신한 화물자동차 보증상품표 e -->
									
									<div class="txtContent">
										<h4 class="decuh4Tit" style="margin-top:30px;">가&#46; 결제 수단</h4>
										<p class="txtPoint">1&#41; 조합원</p>
										<ul class="txtListst01">
											<li>PC &#40;<a href="http://card.truck.or.kr" target="_blank"><font color="blue">http://card.truck.or.kr</font></a>&#41; </li> 
										</ul>
										<p class="txtPoint">2&#41; 동의된 위수탁 차주</p>
										<ul class="txtListst01">
											<li>PC &#40;<a href="http://card.truck.or.kr" target="_blank"><font color="blue">http://card.truck.or.kr</font></a>&#41;</font></li>
											<li>스마트폰(모바일) &#40;<a href="http://card.truck.or.kr" target="_blank"><font color="blue">http://card.truck.or.kr</font></a>&#41;</font></li>
											<li>ARS &#40;1544-8335&#41;</li>
										</ul>
										<ul class="txtListst01">
											<li><a href="#;" onclick="windowOpen(); return false;" title="새창열림" ><font color="blue">카드수납 시스템 접속이 안되는 경우 참고</font></a> </li> 
										</ul>
									</div>
									<div class="txtContent pB0" style="margin-top:20px;">
										<h4 class="decuh4Tit">나&#46; 분담금 결제 가능 카드(KB국민카드)</h4>
										<p class="txtPoint">1&#41; 조합원 : KB국민카드사에서 발급된 법인카드 및 대표자명의의 카드</p>
										<p class="txtPoint">2&#41; 동의된 위수탁 차주 : KB국민카드사에서 발급된 위수탁 차주 명의의 유류구매카드(유가보조금카드)</p>
										
										<ul class="txtListst01" style="margin-bottom:0px;">
											<li>결제 가능 신용카드 요약 정보</li>
										</ul>
										
										<table class="tbDetail_st01" summary="결제가능 신용카드 요약정보 테이블 입니다.">
											<caption>결제가능 신용카드 요약정보에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:17%;" />
												<col style="width:15%;" />
												<col style="width:15%;" />
												<col style="width:53%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="bB1">결제 주체</th>
													<th scope="col" class="bB1">결제 가능 카드</th>
													<th scope="col" class="bB1">구   분</th>
													<th scope="col" class="bB1">국민카드</th>
													<!-- <th scope="col" rowspan="2">보상하는 내용</th> -->
												</tr>
											</thead>
											<tbody>
												<tr>
													<td rowspan="5">조합원사</td>
													<td rowspan="2">법인카드</td>
													<td>카드신청</td>
													<td class="alL">KB국민카드 및 은행 영업점</td>
												</tr>
												<tr>
													<td>포인트적립</td>
													<td class="alL">납부금액의 0.3% 적립</td>
												</tr>
												<tr>
													<td rowspan="3">대표자명의 카드</td>
													<td>카드신청</td>
													<td class="alL">1899-0077</td>
												</tr>
												<tr>
													<td>무이자할부</td>
													<td class="alL">-</td>
												</tr>
												<tr>
													<td>혜택</td>
													<td class="alL">해당카드 고유 혜택</td>
												</tr>
												<tr>
													<td rowspan="3" style="border-bottom:2px solid #c7ced1;">동의된 위수탁 차주</td>
													<td rowspan="3" style="border-bottom:2px solid #c7ced1;">유류구매카드<br/>(유가보조금카드)</td>
													<td>카드신청</td>
													<td class="alL">1599-7900</td>
												</tr>
												<tr>
													<td>무이자할부</td>
													<td class="alL">3~6개월 무이자할부</td>
												</tr>
												<tr>
													<td>할인</td>
													<td class="alL">일시불 납부시 0.3% 청구할인</td>
												</tr>
											</tbody>
										</table><!--// 공제종목별 보상내용 e -->
										※ 카드사의 정책상 무이자 할부 및 기타혜택은 변동될 수 있습니다. 자세한 사항은 카드사 홈페이지를 확인해 주시기 바랍니다.
									</div>
									<p class="txtPoint01" style="margin-top:35px;"> <b>■ 중 요 사 항</b></p>
									<div class="roundBox02" style="margin-top:5px;">
										<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
										<!-- 내용 -->
										<div class="lossSide2">
											<ul class="lossListst01" style="padding:18px 22px 20px 22px;">
												<li>『신용카드 이용 분담금 납입 특별약관』 제2조에 따라 위수탁계약상의 위수탁 차주는 자기 명의의 카드로 분담금을 납입한 경우라도<br/> 공제계약에 따른 분담금의 해지, 환급 등의 제반 권리와 의무는 자동차등록증상의 소유자에게 있음을 알려드립니다&#46;</li>
											</ul>
											
											<div class="lossBox">
												<ul>
													<li>우리조합은 『공제규정』 제6조(공제가입 및 계약)에 의거 협회의 회원 자격을 가진 <b>화물자동차운송사업자를 공제계약의 당사자(기명조합원)로 공제계약을 체결</b>하고 있습니다.</li>
													<li>공제계약과 관련하여 법령에서 정한 공제계약당사자에 대한 <b>공제조합의 의무사항</b>(약관교부 및 설명의무, 증권교부의무 등)는 <b>공제계약의 당사자(기명조합원)에게 이행</b>하고 있으며 <b>특히 환급사유 발생시에도 당사자(기명조합원)에게 환급</b>됨을 알려드립니다.</li>
												</ul>
											</div>

										</div>							
										<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
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