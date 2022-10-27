<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		$(".tab01").trigger('click');		
	}else if(hash == '#tab2'){
		$(".tab02").trigger('click');		
	}else if(hash == '#tab3'){
		$(".tab03").trigger('click');
	}else if(hash == '#tab4'){
		$(".tab04").trigger('click');
	}else if(hash == '#tab5'){
		$(".tab05").trigger('click');
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
 						<h2><img src="/images/truck/asso/history_tit.gif" alt="주요연혁" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">공제조합 소개</a>
						<span>주요연혁</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/history_con_tit.gif" alt="설립이래, 조합원의 사랑과 성원에 늘 노력해온 화물공제조합의 주요 기업 역사입니다." /></p>
					<div class="conSection">
						<!-- historyTab s -->
						<div class="hisTabs">
							<ul class="tabMenu">
								<li class="tab01"><a href="#tab1"><span class="hide">2020년대 ~ 현재까지</span></a></li>
								<li class="tab02"><a href="#tab2"><span class="hide">2010년대</span></a></li>
								<li class="tab03"><a href="#tab3"><span class="hide">2000년대</span></a></li>
								<li class="tab04"><a href="#tab4"><span class="hide">90년대</span></a></li>
								<li class="tab05"><a href="#tab5"><span class="hide">80년대</span></a></li>
							</ul><!--// tabMenu e -->
							<div class="tabContainer">
								<!-- 2020년대 ~ 현재까지 -->
								<div id="tab1" class="tabCont pA0">
									<h3 class="hide">2020년대 &#126; 현재까지</h3>
									<p class="pB20"><img src="/images/truck/asso/history_tab_20img.jpg" alt="2000년대 &#126; 현재까지 이미지" /></p>
									<h4 class="alC"><img src="/images/truck/asso/history_tit_now.gif" alt="2000년대 &#126; 현재까지" /></h4>
									<p class="alC"><img src="/images/truck/asso/history_subtit_20.gif" alt="조합원의 사랑과 성원에 늘 노력하는 화물공제조합의 현재" /></p>
									<div class="historyNow">
										<div class="right y2020">
											<h5 class="hide">2020</h5>
											<ul>
												<li><span class="month">03</span>제24대 연합회장 김옥상 취임</li>
												<li><span class="month">08</span>광주지부&#8226;경남지부 분리 운영</li>
											</ul>
										</div>										
									</div>
								</div>
								<!-- 2010년대 -->
								<div id="tab2" class="tabCont pA0">
									<h3 class="hide">2010년대</h3>
									<p class="pB20"><img src="/images/truck/asso/history_tab_2010.jpg" alt="2000년대 &#126; 현재까지 이미지" /></p>
									<h4 class="alC"><img src="/images/truck/asso/history_tit_2010.gif" alt="2000년대 &#126; 현재까지" /></h4>
									<p class="alC"><img src="/images/truck/asso/history_subtit_20.gif" alt="조합원의 사랑과 성원에 늘 노력하는 화물공제조합의 현재" /></p>
									<div class="history21">
										<div class="left y2019">
											<h5 class="hide">2019</h5>
											<ul>
												<li>제13대 서훈택 이사장 취임<span class="month">01</span></li>
											</ul>
										</div>
										<div class="right y2017">
											<h5 class="hide">2017</h5>
											<ul>
												<li><span class="month">03</span>제23대 연합회장 신한춘 취임</li>
											</ul>
										</div>
										<div class="left y2015">
											<h5 class="hide">2015</h5>
											<ul>
												<li>제12대 박응훈 이사장 취임&#40;연임&#41;<span class="month">01</span></li>
												<li>제22대 연합회장 신한춘 취임<span class="month">03</span></li>
											</ul>
										</div>
										<div class="right y2012">
											<h5 class="hide">2012</h5>
											<ul>
												<li><span class="month">11</span>운영위원회 위원장 전수산 취임</li>
												<li><span class="month">01</span>제11대 박응훈 이사장 취임&#40;연임&#41;</li>
											</ul>
										</div>
										<div class="left y2011">
											<h5 class="hide">2011</h5>
											<ul>
												<li>제21대 연합회 회장 김옥상 취임<span class="month">04</span></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- 2000년대 -->
								<div id="tab3" class="tabCont pA0">
									<h3 class="hide">2000년대</h3>
									<p class="pB20"><img src="/images/truck/asso/history_tab_2000.jpg" alt="2000년대 &#126; 현재까지 이미지" /></p>
									<h4 class="alC"><img src="/images/truck/asso/history_tit_2000.gif" alt="2000년대 &#126; 현재까지" /></h4>
									<p class="alC"><img src="/images/truck/asso/history_subtit_20.gif" alt="조합원의 사랑과 성원에 늘 노력하는 화물공제조합의 현재" /></p>
									<div class="history20">
										<div class="right y2009">
											<h5 class="hide">2009</h5>
											<ul>
												<li><span class="month">10</span>연합회 회장 김옥상 취임</li>
												<li><span class="month">10</span>제10대 박응훈 이사장 취임</li>
											</ul>
										</div>
										<div class="left y2008">
											<h5 class="hide">2008</h5>
											<ul>
												<li>제20대 연합회 회장 민경남 취임<span class="month">02</span></li>
											</ul>
										</div>
										<div class="right y2007">
											<h5 class="hide">2007</h5>
											<ul>
												<li><span class="month">09</span>광주지부&#8226;경남지부 통합&#40;경남지부 광주사업소운영&#41;</li>
												<li><span class="month">02</span>연합회 회장 김옥상 취임</li>
											</ul>
										</div>
										<div class="left y2006">
											<h5 class="hide">2006</h5>
											<ul>
												<li>연합회 회장직무대리 김동석 취임<span class="month">10</span></li>
												<li>제09대 안찬근 이사장 취임<span class="month">08</span></li>
												<li>연합회 회장 성종락 취임<span class="month">05</span></li>
											</ul>
										</div>
										<div class="right y2005">
											<h5 class="hide">2005</h5>
											<ul>
												<li><span class="month">03</span>제19대 연합회 회장 민경완 취임</li>
											</ul>
										</div>
										<div class="left y2004">
											<h5 class="hide">2004</h5>
											<ul>
												<li>적재물배상 책임공제 개시<span class="month">12</span></li>
											</ul>
										</div>
										<div class="right y2003">
											<h5 class="hide">2003</h5>
											<ul>
												<li><span class="month">01</span>제08대 김대중 이사장 취임</li>
											</ul>
										</div>
										<div class="left y2002">
											<h5 class="hide">2002</h5>
											<ul>
												<li>제18대 연합회 회장 윤영호 취임<span class="month">03</span></li>
											</ul>
										</div>
										<div class="right y2001">
											<h5 class="hide">2001</h5>
											<ul>
												<li><span class="month">03</span>연합회 회장 윤영호 취임</li>
											</ul>
										</div>
										<div class="left y2000">
											<h5 class="hide">2000</h5>
											<ul>
												<li>연합회 회장 민경완 취임<span class="month">07</span></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- 90년대 -->
								<div id="tab4" class="tabCont pA0">
									<h3 class="hide">90년대</h3>
									<p class="pB20"><img src="/images/truck/asso/history_tab_90img.jpg" alt="90년대 조합원 이미지" /></p>
									<h4 class="alC"><img src="/images/truck/asso/history_tit_90.gif" alt="90년대" /></h4>
									<p class="alC"><img src="/images/truck/asso/history_subtit_90.gif" alt="전국적 지부 확대 및 가입 조합원의 공제 서비스 강화" /></p>
									<div class="history90">
										<div class="right y1999">
											<h5 class="hide">1999</h5>
											<ul>
												<li><span class="month">09</span>제07대 조현용 이사장 취임</li>
												<li><span class="month">05</span>제17대 연합회 회장 민경완 취임</li>
											</ul>
										</div>
										<div class="left y1998">
											<h5 class="hide">1998</h5>
											<ul>
												<li>울산지부 공제사업 개시<span class="month">05</span></li>
												<li>종사자 재해공제사업 개시<span class="month">03</span></li>
											</ul>
										</div>
										<div class="right y1996">
											<h5 class="hide">1996</h5>
											<ul>
												<li><span class="month">04</span>제06대 이환건 이사장 취임</li>
												<li><span class="month">03</span>제16대 연합회 회장 민경완 취임</li>
											</ul>
										</div>
										<div class="left y1995">
											<h5 class="hide">1995</h5>
											<ul>
												<li>대전&#8226;충남지부 분리 운영<span class="month">09</span></li>
											</ul>
										</div>
										<div class="right y1993">
											<h5 class="hide">1993</h5>
											<ul>
												<li><span class="month">12</span>제05대 이종성 이사장 취임</li>
												<li><span class="month">03</span>제15대 연합회 회장 김진수 취임</li>
											</ul>
										</div>
										<div class="left y1992">
											<h5 class="hide">1992</h5>
											<ul>
												<li>광주&#8226;전남지부 분리 운영<span class="month">10</span></li>
											</ul>
										</div>
										<div class="right y1991">
											<h5 class="hide">1991</h5>
											<ul>
												<li><span class="month">04</span>제04대 류영호 이사장 취임</li>
											</ul>
										</div>
										<div class="left y1990">
											<h5 class="hide">1990</h5>
											<ul>
												<li>제14대 연합회 회장 김진수 취임<span class="month">03</span></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- 80년대 -->
								<div id="tab5" class="tabCont pA0">
									<h3 class="hide">80년대</h3>
									<p class="pB20"><img src="/images/truck/asso/history_tab_80img.jpg" alt="80년대 조합원 이미지" /></p>
									<h4 class="alC"><img src="/images/truck/asso/history_tit_80.gif" alt="80년대" /></h4>
									<p class="alC"><img src="/images/truck/asso/history_subtit_80.gif" alt="화물운송사업자의 보호와 사회복지구현이라는 이념아래 설립" /></p>
									<div class="history80">
										<div class="right y1989">
											<h5 class="hide">1989</h5>
											<ul>
												<li><span class="month">03</span>문갑석 이사장 취임 &#40;임시&#41;</li>
											</ul>
										</div>
										<div class="left y1988">
											<h5 class="hide">1988</h5>
											<ul>
												<li>전귀환 이사장 직무대행 취임<span class="month">11</span></li>
												<li>자부담제 시행<span class="month">07</span></li>
											</ul>
										</div>
										<div class="right y1987">
											<h5 class="hide">1987</h5>
											<ul>
												<li><span class="month">08</span>개별면허 운전자 중심요율제 시행</li>
												<li><span class="month">04</span>제03대 이용걸 이사장 취임</li>
											</ul>
										</div>
										<div class="left y1985">
											<h5 class="hide">1985</h5>
											<ul>
												<li>책임공제 사업개시<span class="month">08</span></li>
											</ul>
										</div>
										<div class="right y1984">
											<h5 class="hide">1984</h5>
											<ul>
												<li><span class="month">07</span>제02대 이용걸 이사장 취임</li>
											</ul>
										</div>
										<div class="left y1983">
											<h5 class="hide">1983</h5>
											<ul>
												<li>직할사무소 개설<span class="month">03</span></li>
											</ul>
										</div>
										<div class="right y1982">
											<h5 class="hide">1982</h5>
											<ul>
												<li><span class="month">07</span>경북지부 공제사업 개시</li>
											</ul>
										</div>
										<div class="left y1981">
											<h5 class="hide">1981</h5>
											<ul>
												<li>대구지부 공제사업 개시<span class="month">11</span></li>
												<li>차량공제 사업개시<span class="month">08</span></li>
												<li>초대 문갑석 이사장 취임 및 11개 지부 업무개시<span class="month">07</span></li>
												<li>사업계획 승인 &#40;교통부 장관 운수 1510 &#45; 10888호&#41;<span class="month">06</span></li>
												<li>연합회 총회 위임에 의거 연합회 이사회<span class="month">03</span></li>
												<li class="pR25">&#45; 이&nbsp;사&nbsp;장 &#58; 연합회 회장 겸임</li>
												<li class="pR25">&#45; 비상근이사 &#58; 연합회 부회장 겸임</li>
												<li class="pR25">&#45; 감&nbsp;사 &#58; 연합회 감사 겸임</li>
												<li>교통부 장관 공제사업 허가 &#40;운수 1510 &#45; 4930호&#41;<span class="month">03</span></li>
												<li>연합회 정기총회에서 공제조합 설립 결의<span class="month">02</span></li>
											</ul>
										</div>
									</div>
								</div>
							</div><!--// tabContainer e -->
						</div><!--// historyTab e -->
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>