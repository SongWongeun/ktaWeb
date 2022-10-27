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
	
	var param ='${param.code}'
		if(param == 'regist.success'){
		 param = '등록이';
		 alert('글'+param+' 완료되었습니다. 담당자 배정시 빠른 시간안에 연락드리겟습니다.');
	}
	

	if(hash == '#tab1'){
		$("a[name='tab1']").trigger('click');	
	}else if(hash == '#tab2'){
		$("a[name='tab2']").trigger('click');		
	}	
});

/* function windowOpen(){
	window.open("/deductProduct/hwamulGuide.do",'','toolbar=no,location=no,status=no,menubar=no, scrollbars=yes,resizable=no,width=700,height=500 top=20 left=20');
} */
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
						<h2><img src="/images/truck/dedu/personal_regist_tit.gif" alt="개인화물 가입안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>
						<span>개인화물 가입안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/personal_con_tit.gif" alt="개인화물자동차 공제가입을 위한 상담 신청 및 문의를 위한 공간입니다." /></p>
					<div class="conSection">
						<!-- tabs s -->
						<div class="jointabs">
							<!-- <ul class="tabMenu">
								<li><a href="#tab1" name="tab1">공제계약 체결절차</a></li>
								<li><a href="#tab2" name="tab2">안내사항</a></li>
							</ul>// tabMenu e
							<div class="tabContainer"> -->
								<!-- 공제계약 체결절차 -->
								<!-- <div id="tab1" class="tabCont">
									<h3 class="hide">공제계약 체결절차</h3> -->
									<div class="txtContent" style="margin-top:50px;">
										<h4 class="decuh4Tit">가&#46; 공제계약 대상</h4>
										<div style="position: absolute; left: 100px; top:-65px; font-size:15px;">
											<ul>
												<li class="hwamulBtn">
													<a href="/deductProduct/privateHwamul/hwamulAddView.do" class="hwamulBtn btn_praise">개인화물 가입상담 신청</a>
												</li>
											</ul>
										</div>
										<div style="position: absolute; left: 320px; top:-65px; font-size:15px;">
											<ul>
												<li class="hwamulBtn">
													<a href="/deductProduct/privateHwamul/hwamulList.do" class="hwamulBtn btn_praise" style="padding-left:25px;padding-right:38px;">상담신청 결과확인</a>
												</li>
											</ul>
										</div>
										<!-- <div style="position: absolute; left: 415px; top:-53px; font-size:15px;">
										( ◀  공제가입 상담문의로 연결됩니다. )
										</div> -->
										<p class="txtPoint">개인화물자동차 운송사업의 허가를 받은 자</p>
										<p class="txtPoint02 pB20 mB10">화물자동차운수사업법제3조(화물자동차 운송사업의 허가 등) 제1항 제2호에 따른 허가</p>
									</div>
									<div class="txtContent pB0">
										<h4 class="decuh4Tit">나&#46; 유의사항</h4>
										<p class="txtPoint">1&#41; 등록지별 관할지부 계약</p>
											<ul class="txtListst01 pB20">
												<li>차량등록지 관할지부(16개지부)에서 계약관리 (예시 : 서울00바0000 → 서울지부)</li>
												<p class="txtPoint02">유선 가입문의는 해당 관할지부로 문의</p>
											</ul>
										<p class="txtPoint pB20">2&#41; 만기 2개월 이내 분담금(보험료) 산출가능 </p>
										
										<p class="txtPoint">3&#41; 가입문의(분담금 산출) 시 필수서류 제출 </p>
											<ul class="txtListst01 pB10">
												<li>가입차량을 확인할 수 있는 서류</li>
												<p class="hwamulInfo02 mL10">1. 자동차등록증  2. 사업자등록증</p>
											</ul>
										
											<ul class="txtListst01 pB20">
												<li>분담금(보험료) 산출을 위한 서류</li>
												<p class="hwamulInfo02 mL10">1. 현 계약(손보사) 할인할증 등급확인서(사고내역 포함)</p>
												<p class="hwamulInfo02 mL10">2. 차기 갱신계약 청약서(사고내역 포함)</p>
												<p class="hwamulInfo02 mL20">⇨ 적용요율이 확인되지 않을 시 최고요율 230%적용되니 반드시 확인 후 문의</p>
												<p class="txtPoint02 mL10">운송사업 신규 허가일 경우는 제외</p>
												<p class="hwamulInfo02 pL25">(발급방법) 현재 가입중인 손보사에 요청 또는 해당 손보사 홈페이지에서 직접 발부</p>
											</ul>
										
										<p class="txtPoint">4&#41; 가입금 납부  ( 공제조합 최초가입시 가입금 납부(차종별) )</p>
											<ul class="txtListst01 pB20">
												<li>1종, 2종, 3종, 특수작업용, 특정용도 : 4만원</li>
												<li>4종 : 3만원</li>
												<p class="txtPoint02">운송사업의 폐지(전부 또는 일부)나 면허취소 등으로 말소 되거나 공제가입 자격이 상실한 경우에 한하여 환급가능</p>
											</ul>
										<p class="txtPoint">5&#41; 자부담금 납부</p>
											<ul class="txtListst01 pB20">
												<li>대물사고 발생 시 자부담금 납부(현재 30만원)</li>
												<p class="txtPoint02 pB10">사고발생 조합원에게 일정액의 자부담금을 부과(현재 30만원)하여 사고경각심 고취와 </p>
												<p class="pL10 pB10">무사고 차량과의 형평성을 도모하기 위해 운영 중인 제도로,</p> 
												<p class="pL10 pB20">사고접수 시 해당금액 납부(현금 또는 카드결제)를 원칙으로 하고 있습니다.</p>
											</ul>
									</div>
									<div class="txtContent">
										<h4 class="decuh4Tit">다&#46; 가입문의 및 계약체결 절차</h4>
										<p class="txtPoint pB10">1&#41; 홈페이지를 통한 가입문의</p>
										<!-- 개인화물 공제가입 안내 -->
										<div style="position: absolute; left: 215px; top:815px; font-size:15px;">
											<ul>
												<li class="hwamulBtn">
													<a href="/deductProduct/privateHwamul/hwamulAddView.do" class="hwamulBtn btn_praise">개인화물 가입상담 신청</a>
												</li>
											</ul>
										</div>
										<div style="position: absolute; left: 420px; top:815px; font-size:15px;">
											<ul>
												<li class="hwamulBtn">
													<a href="/deductProduct/privateHwamul/hwamulList.do" class="hwamulBtn btn_praise" style="padding-left:25px;padding-right:38px;">상담신청 결과확인</a>
												</li>
											</ul>
										</div>
										<!-- <div style="position: absolute; left: 415px; top:825px; font-size:15px;">
										( ◀  공제가입 상담문의로 연결됩니다. )
										</div> -->
										<ul class="txtListst01 pB20 mL10 mB10">
											<li>차량번호 등 공제가입(분담금 산출)을 위한 기초정보 등록</li>
										</ul>
										
										<div class="txtContent">
											<ul class="processList">
												<li class="pList clfix nC">
													<span class="pTit pN01">계약자</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>공제가입 상담신청 배너 클릭</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>
												</li>		
												<li class="pList clfix">
													<span class="pTit pN02">계약자</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>공제가입 설문페이지 작성 제출</p>
																<p style="background:none;"> → 업무담당자 배정</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>											
												</li>		
												<li class="pList clfix">
													<span class="pTit pN03">공제조합</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>설문 기재사항 확인 및 필요서류 요청</p>
																<p style="background:none;">→ 계약자에게 서류 징구</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>											
												</li>	
												<li class="pList clfix">
													<span class="pTit pN04">공제조합</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>서류확인 및 분담금 산출(청약서)안내</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>	
												</li>
												<li class="pList clfix">
													<span class="pTit pN05">계약자</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>청약사항 확인 및 분담금 수납</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>	
												</li>
												<li class="pList clfix plL">
													<span class="pTit pN06 nL">공제조합</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>수납확인 후 가입완료 안내</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>	
												</li>
											</ul>
										</div>
										
										<p class="txtPoint02 mT25 mL20 mB20">계약체결 시 공제약관 등은 전자적 방법으로 전달되며, 별도 요청 시 우편발송</p>
										<p class="txtPoint pB10">2&#41; 유선 가입문의    <span class="txtPoint">( 통화량 증가 시 상담이 제한될 수 있습니다. )</span></p>
											<ul class="txtListst01 pB20 mL20 mB10">
												<li>차량등록지 관할지부로 공제계약 문의 ( 예: 서울00바0000 ⇨ 서울지부 문의 )</li>
											</ul>
										<div class="txtContent">
											<ul class="processList">
												<li class="pList clfix nC">
													<span class="pTit pN01">계약자</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>관할지부 공제가입 상담신청</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>
												</li>		
												<li class="pList clfix">
													<span class="pTit pN02">공제조합</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>유선상담 후 필요서류 요청</p>
																<p style="background:none;"> → 계약자에게 서류 징구</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>											
												</li>		
												<li class="pList clfix">
													<span class="pTit pN03">공제조합</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>서류확인 및 분담금 산출(청약서) 안내</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>											
												</li>	
												<li class="pList clfix">
													<span class="pTit pN04">계약자</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>청약사항 확인 및 분담금 수납</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>	
												</li>
												<li class="pList clfix plL">
													<span class="pTit pN05 nL">공제조합</span>
													<div class="pBox">
														<div class="roundBox02">
															<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
															<!-- 내용 -->
															<div class="processArea">
																<p>수납확인 후 가입완료 안내</p>
															</div>
															<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
														</div>
													</div>	
												</li>
											</ul>
										</div>
										
										<p class="txtPoint02 mT25 mL20 mB20">계약체결 시 공제약관 등은 전자적 방법으로 전달되며, 별도 요청 시 우편발송</p>
									</div>
									<div class="txtContent pB0">
										<h4 class="decuh4Tit">라&#46; 공제상품</h4>
										<p class="txtPoint">대인배상Ⅰ, 대인배상Ⅱ, 대물배상, 자기신체사고, 종사자재해, 자기차량손해, 적재물배상책임공제, 법률비용지원 특약, 긴급출동 서비스 특약</p>
										<p class="txtPoint02 mB20 pB10">세부사항(보상하는 손해, 보장금액 등)은 상품안내 참고</p>
									</div>
									<div class="txtContent pB0">
										<h4 class="decuh4Tit">마&#46; 분담금(보험료) 납입 방법</h4>
										<p class="txtPoint">1&#41; 납입방식 : 현금(온라인, 가상계좌 등) 또는 신용카드(KB유가보조금카드)</p>
										<ul class="txtListst01" style="padding-bottom:5px;">
											<li>KB유가보조금 3 ~ 6개월 무이자할부 적용 가능</li>
											<li>KB유가보조금카드 분담금결재 특별한도 지원</li>
										</ul>
										<p class="hwamulInfo02 pB20">☞ 카드발급 및 신청방법 ☎ 1599-7900 [평일(월~금) 09:00~18:00]</p>
										
										<p class="txtPoint">2&#41; 납입회차 : 일시납 또는 6회 분납 가능</p>
										<p class="hwamulInfo02 mB20">☞ 분납할증율 : 2회- 101%적용, 4회- 101.5%적용, 6회- 102%적용</p>
									</div>
									<div class="txtContent pB0">
										<h4 class="decuh4Tit">바&#46; 의무가입 안내</h4>
										<p class="txtPoint">1&#41; 대인배상 Ⅰ ,대인배상 Ⅱ 및 대물배상(2천만원) 의무가입</p>
										<ul class="txtListst01" style="padding-bottom:5px;">
											<li>자동차손해배상보장법에 의거 사업용 화물자동차는 대인배상Ⅰ, 대인배상Ⅱ 및 대물배상에 의무적으로 가입해야 함</li>
										</ul>
										<p class="hwamulInfo02 mL10">1. 미가입시 : 300만원 이하의 과태료 처분(법 제48조 제3항 제1호)</p>
										<p class="hwamulInfo02 mL10 mB20">2. 미가입자동차 운행시 : 1년 이하의 징역 또는 1,000만원 이하의 벌금형(법 제46조 제2항)</p>
										
										<p class="txtPoint">2&#41; 적재물배상책임공제(보험) 의무가입</p>
										<ul class="txtListst01" style="padding-bottom:0px;">
											<li style="padding-bottom:5px;">화물자동차운송사업자 ( 최대적재량이 5톤 이상이거나 총 중량이 10톤 이상인 화물자동차 중 </li>
											<p class="hwamulInfo02 mL10">일반형 ⋅ 밴형 ⋅ 특수용도형 화물자동차와 견인형 특수자동차), 화물자동차운송주선사업자, 화물자동차운송가맹사업자는</p>
											<p class="hwamulInfo02 mL10">적재물배상책임공제(보험)에 의무적으로 가입하여야 함. </p>
										</ul>
										
										<p class="txtPoint02 mB20 pB10">제외차량 : (구)건설교통부 고시 제2005-53호(2005.3.10.)에 해당되는 화물자동차</p>
										
										
										<ul class="txtListst01" style="padding-bottom:5px;">
											<li style="padding-bottom:5px;">적재물배상책임공제(보험)에 가입하지 아니한 사업자 과태료 및 행정처분</li>
										</ul>
										<p class="hwamulInfo02 mL10">1. 화물자동차 운송사업자 : 미가입 일수에 따라 1대당 50만원 이하의 과태료</p>
										<p class="hwamulInfo02 mL10 mB20">2.  운송주선사업자 : 미가입 일수에 따라 사업자당 100만원 이하의 과태료</p>
										
										<ul class="txtListst01" style="padding-bottom:0px;">
											<li style="padding-bottom:5px;">적재물배상책임공제(보험)에 가입하지 아니한 상태로 화물자동차를 운행하거나 </li>
											<p class="hwamulInfo02 mL10">그 가입이 실효 상태로 화물자동차를 운행한 때</p>
										</ul>
										<p class="txtPoint02 mB20 pB10">1차 위반 운행정지 20일, 2차 위반 운행정지 30일</p>
										
									</div>
								<!-- </div>
								공지사항
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
							</div>--><!--// tabContainer e -->
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