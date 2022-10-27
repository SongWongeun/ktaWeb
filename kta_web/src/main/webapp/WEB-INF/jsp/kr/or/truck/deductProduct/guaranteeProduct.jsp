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
						<h2><img src="/images/truck/dedu/guarantee_tit.gif" alt="보증상품" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>
						<span>보증상품</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/guarantee_con_tit.gif" alt="조합원 사업용 화물자동차 구입자금 대출 보증사업 입니다." /></p>				
					<div class="conSection">
                    	<h3><img src="/images/truck/dedu/bj_img.jpg" alt="조합원 사업용 화물자동차 구입자금 대출 보증사업" /></h3>
			 <div class="jointabs">
							
							<div class="tabContainer">
								<!-- 공제계약 체결절차 -->
								<div id="tab1" class="tabCont">
									<h3 class="hide">보증사업</h3>
									<!-- <div class="lossSide3">
											<div class="lossBox">
												<p>본 사업은 2014&#46; 1&#46; 1부터 국토교통부 승인을 받아 시행하는 복지사업으로 전국화물자동차공제조합이 추천 또는 보증하는 조합원(위수탁 차주 포함)에게
												 </br>신한금융(신한은행, 신한카드)에서 화물자동차 구매자금을 지원하는 대출보증 사업입니다&#46;
											</div>
										</div>		 -->
									<div class="txtContent">
										<h3 class="deduh5Tit prodBg">신한 화물자동차 <font color='red'>신차</font> 대출</h3>
									</div>
									<div class="txtContent pB0">
										<p class="txtPoint">대상자 &#58; 화물공제조합 자동차 공제 가입 및 계약을 체결중인 차량의 명의인자인 조합원(단 개인사업력 1년이상 또는 미만시 보증인 설정)</p>
                                        <p class="txtPoint"> 대출한도</p>
                                          <ul class="txtListst06">
                                            <li>신한카드 &#58; 3억원 이내&#40;신한은행 대출 초과분 &#126;&#47; 차량 가격 한도내&#41; 신조차에 한함</li>
										</ul>
                                        <p class="txtPoint"> 대출금리</p>
                                          <ul class="txtListst06">
                                            <li>신한카드 &#58; 3&#46;9&#37; &#126; 최고 5&#46;6&#37;</li>
										  </ul>
										<p class="txtPoint"> 대출개월</p>
                                          <ul class="txtListst06">
											<li>신한카드 &#58; 3 &#126; 72개월</li>
										  </ul>
                                         <p class="txtPoint"> 금리우대</p>
                                          <ul class="txtListst06">
											<li>화물공제조합 대출 추천서(은행)</li>
										</ul>
                                        <p class="txtPoint">신청문의 &#58; 신한카드 &#40;1688&#45;7474&#41;</p>
									</div>
									
									<div class="txtContent">
										<h3 class="deduh5Tit prodBg">신한 화물자동차 <font color='red'>중고차</font> 대출</h3>
									</div>	
									<div class="txtContent pB0">
										<p class="txtPoint">대상자 &#58; 화물공제조합 자동차 공제 가입 및 계약을 체결중인 차량의 명의인자인 조합원(단, 개인 사업력 1년 이상 또는 미만 시 보증인 설정)</p>
                                        <p class="txtPoint"> 대출한도</p>
                                          <ul class="txtListst06">
                                            <li>신한카드 &#58; 2억원 이내</li>
										</ul>
                                        <p class="txtPoint"> 대출금리</p>
                                          <ul class="txtListst06">
                                            <li>신한카드 &#58; 6&#46;6 &#126; 최고 9&#46;6&#37;</li>
										  </ul>
										<p class="txtPoint"> 대출개월</p>
                                          <ul class="txtListst06">
                                            <li>신한카드 &#58; 6 ~ 60개월</li>
										  </ul>  
										<!-- <p class="txtPoint"> 대출개월</p>
                                          <ul class="txtListst06">
                                            <li>신한카드 &#58; 6 ~ 60개월</li>
										  </ul> -->  
                                        <p class="txtPoint">신청문의 &#58; 신한카드 &#40;1688&#45;7474&#41;</p>
									</div>
									
									
									<p>&nbsp;</p><p>&nbsp;</p>
									<p class="txtPoint01"> <b>※ 공통사항(대상차량) : 2.5t 이상 화물자동차 신조차량 &#183; 중고차(단, 구난차량 제외)</b></p>
									
									
									<div class="roundBox02">
										<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
										<!-- 내용 --><br/>
										<div class="lossSide2">
											<div class="lossBox">
												<ul>
													<li><span>연체이자율은 "회원별, 이용상품별 약정금리 + 최대3%, 법정 최고금리(24%) 이내"</li>
													<li><span>「화물공제조합 조합원 대출 보증사업 가입에 따른 추가약정서」 제4조(보증금 지급후의 채무변제) 제1항에 따른 화물공제조합의 연체이율은 신한카드 대출약정상의 연체이율, 법정최고한도 20% 이내로 함</li>
													<li><span>중도상환수수료 안내 : -신차 : 중도상환원금의 2%<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-중고차 : 대출금리 12%이하 중도상환원금의 2%, <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대출금리 18%이하 상환원금의 1.5% / 대출금리 18%초과 상환원금의 1.0%</li>
													<li><span>상기 사항은 여신기관인 신한카드에 문의 요망(TEL : 1688-7474)</li>
												</ul>
											</div>

											<ul class="lossListst01" style="padding:18px 22px 0px 22px;">
												<li><b>신용카드 남용은 가계경제에 위협이 됩니다&#46;</b></li>
												<li>계약 체결 전 상품설명서와 대출약정서의 약관을 참조하시기 바랍니다&#46;</li>
												<li>금융기관 신용관리대상자 등 여신부적격자에 대하여 대출 및 보증이 제한될 수 있음</li>
												<li>본 내용은 2018. 04. 30 기준으로, 추후 시장상황에 따라 변동될 수 있음</li>
											</ul>

										</div>							
										<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
									</div>
									
									
									<table class="tbDetail_st01 mB0 tbTerm" summary="신한 화물자동차 보증상품 테이블 입니다.">
										<caption>신한 화물자동차 보증상품에 대해서 나타낸 표</caption>
										<colgroup>
											<col style="width:40%;" />
											<col style="width:*;" />
											<col style="width:15%;" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" ><span>관련자료</span></th>
												<td class="bB2"></td>
												<td class="alC bB2"><span class="btn_pack btn_type07 icon"><span class="acrob"></span><a href="/cmm/fms/FileDown.do?atchFileId=FILE_000000000007400&fileSn=0">다운로드</a></span></td>
											</tr>
										</tbody>
									</table><!--// 신한 화물자동차 보증상품표 e -->
									<div class="txtContent pB0" style="margin-top:25px; text-align:right;">
										<p class="txtPoint" style="color:#e96f00;"><b>여신금융협회 심의필 제2018-C1h-05268호(2018.05.02 ~ 2019.05.01)</b></p>
									</div>
								</div>
								<!-- 공지사항 -->
								
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