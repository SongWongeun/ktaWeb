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
						<h2><img src="/images/truck/dedu/delayinfo_tit.gif" alt="공제금지급지연안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/compenInfo/amountCharge.do" >보상안내</a>
						<span>공제금 지급지연 안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/delayinfo_con_tit.gif" alt="공제금 지급지연 안내 입니다." /></p>				
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">공제금 지급지연 안내</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea manBg">
								<p class="lossTxt1">공제금의 지급</p>
								<p class="lossTxt2">공제조합은 공제금 청구에 관한 서류를 받았을 때는 지체 없이 지급할 공제금액을 정하고 그 정하여진 날부터 7일 이내에 지급합니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">공제금 지급지연에 대한 안내</h4>
							<!-- <p class="txtPoint">사망</p> -->
							<p class="txtPoint">조합이 정당한 사유없이 공제금을 정하는 것을 지연하였거나 정한 지급기일 내에 공제금을 지급하지 않았을 때, 지급할 공제금이 있는 경우에는 그 다음날로부터 지급일까지의 기간에 대하여 보험개발원이 공시한 <부표> ‘보험금을 지급할 때의 적립이율’에 따라 연 단위 복리로 계산한 금액을 공제금에 더하여 드립니다.다만, 조합원 및 손해배상청구권자의 책임 있는 사유로 지급이 지연될 때에는 그 해당 기간에 대한 이자는 더하여 드리지 않습니다.</p>
							
						</div><!--// 대인배상 I e -->						
						<!-- 대인배상 Ⅱ -->
						<h3 class="deduh3Tit prodBg">공제금 지급지연 안내사항</h3>
						
						<div class="lossSide2">
							<div class="lossBox">
								<p><span class="txtBlue4">기본 계약사항</span><br/>① 인적사항, 공제금 청구내용<br/>② 접수일자, 접수기관, 지급예정일자, 업무처리담당자 정보<br/><br/></p>
								<p><span class="txtBlue4">필수안내사항</span><br/>① 지급이 지연되는 구체적 사유<br/>② 공제금 지급예정일<br/>③ 공제금 가지급금 제도<br/><br/></p>
								<p><span class="txtBlue4"><부표>공제금 지급시 적립이율</span></p>
								
								<table class="tbDetail_st01" summary="후유장해인정임금">
									<caption>공제금 지급시 적립이율에 대해서 나타낸 표</caption>
									<colgroup>
										<col span="2" style="width:50%;">
									</colgroup>
									<tbody>
										<tr>
											<td>기간</td>
											<td>지급이자</td>
										</tr>
										<tr>
											<td>지급기일의 다음 날부터 30일 이내 기간</td>
											<td>보험계약 대출이율</td>
										</tr>
										<tr>
											<td>지급기일의 31일 이후부터 60일 이내 기간</td>
											<td>보험계약 대출이율+가산이율(4.0%)</td>
										</tr>
										<tr>
											<td>지급기일의 61일 이후부터 90일 이내 기간</td>
											<td>보험계약 대출이율+가산이율(6.0%)</td>
										</tr>
										<tr>
											<td>지급기일의 91일 이후 기간</td>
											<td>보험계약 대출이율+가산이율(8.0%)</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>	
						
						<h3 class="deduh3Tit prodBg">면책에 대한 공제금 부지급 시 안내</h3>
						<div class="lossSide2">
							<div class="lossBox">
								<p>공제금 부지급 처리 사유(약관, 판례 등) <br/></p>
								<p>문의를 위한 업무처리 담당자 및 연락처 <br/></p>
								<p>이의제기 절차(공제조합 민원팀, 자동차손해배상진흥원 민원센터 등) <br/></p>
								
							</div>
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