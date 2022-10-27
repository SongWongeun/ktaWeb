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
						<h2><img src="/images/truck/dedu/callinfo_tit.gif" alt="콜센터안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>		
						<span>콜센터안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/callinfo_con_tit.gif" alt="화물공제조합의 콜센터는 24시간 이용이 가능한 서비스 입니다." /></p>				
					<div class="conSection">
						<h3><img src="/images/truck/dedu/callinfo.gif" alt="사고 접보.현장출동 서비스 1577- 8278 주요업무 : 사고 접보 및 24시간 현장출동업무 ※차량 정비 및 고장으로 인한 긴급출동 서비스 제외 업무시간 : 24시간 이용가능" /></h3>
						<!-- -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="callSide">
								<h4 class="decuh4Tit03">사고 접수(현장출동) ⋅ 긴급출동 서비스</h4>
								<h4 class="decuh4Tit04">1577-8278</h4>
								<div class="callBox2">
									<ul>
										<li>주요업무 : 사고접수(현장출동), 지급보증, 긴급출동업무</li>
										<li>업무시간 : 24시간 이용가능(단, 긴급출동서비스는 특약가입 차량에 한함)</li>										
									</ul>
								</div>
							</div>							
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드-->
						</div> 
						<p>&nbsp;</p>
						<h3 class="deduh3Tit masterBg">마스타 사고접수 및 현장출동서비스 처리절차</h3>
						<div class="txtContent">
							<ul class="processList">
								<li class="pList clfix nC">
									<span class="pTit pN01">사고발생 / 접수</span>
									<div class="pBox">
										<div class="roundBox02">
											<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
											<!-- 내용 -->
											<div class="processArea">
												<p>24시간 사고 접수 및 접수번호 발생</p>
												<p>24시간 접수번호 문자발송</p>
											</div>
											<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
										</div>
									</div>
								</li>		
								<li class="pList clfix">
									<span class="pTit pN02">현장출동</span>
									<div class="pBox">
										<div class="roundBox02">
											<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
											<!-- 내용 -->
											<div class="processArea">
												<p>24시간 사고현장 출동 및 초동조사</p>
											</div>
											<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
										</div>
									</div>											
								</li>		
								<li class="pList clfix">
									<span class="pTit pN03">지급보증</span>
									<div class="pBox">
										<div class="roundBox02">
											<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
											<!-- 내용 -->
											<div class="processArea">
												<p>24시간 병원/공장 지급보증</p>
											</div>
											<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
										</div>
									</div>											
								</li>	
								<li class="pList clfix plL">
									<span class="pTit pN04 nL">보상업무 진행</span>
									<div class="pBox">
										<div class="roundBox02">
											<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
											<!-- 내용 -->
											<div class="processArea">
												<p>보상담당자 배정 · 문자발송</p>
												<p>대인, 대물, 적재물 사고처리 절차에 따라 업무 진행</p>
											</div>
											<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
										</div>
									</div>	
								</li>
							</ul>
						</div>
						
						</br></br></br></br></br>
						<h3 class="deduh3Tit masterBg">마스타 긴급출동서비스 처리절차</h3>
						<div class="txtContent">
							<ul class="processList">
								<li class="pList clfix nC">
									<span class="pTit pN01">서비스 접수</span>
									<div class="pBox">
										<div class="roundBox02">
											<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
											<!-- 내용 -->
											<div class="processArea">
												<p>24시간 서비스 접수</p>
												<p>전문가의 접수상담</p>
											</div>
											<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
										</div>
									</div>
								</li>		
								<li class="pList clfix">
									<span class="pTit pN02">가입확인/기사배정</span>
									<div class="pBox">
										<div class="roundBox02">
											<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
											<!-- 내용 -->
											<div class="processArea">
												<p>스마트앱 · SMS · 알림톡을 통한 출동정보 실시간 전송</p>
											</div>
											<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
										</div>
									</div>											
								</li>		
								<li class="pList clfix">
									<span class="pTit pN03">서비스 제공</span>
									<div class="pBox">
										<div class="roundBox02">
											<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
											<!-- 내용 -->
											<div class="processArea">
												<p>지정 전문기사의 서비스 제공</p>
												<p>콜센타에 완료보고</p>
											</div>
											<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
										</div>
									</div>											
								</li>	
								<li class="pList clfix plL">
									<span class="pTit pN04 nL">해피콜 서비스</span>
									<div class="pBox">
										<div class="roundBox02">
											<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
											<!-- 내용 -->
											<div class="processArea">
												<p>서비스 제공여부 및 만족도 조사</p>
												<p>발생민원 조치</p>
											</div>
											<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
										</div>
									</div>	
								</li>
							</ul>
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