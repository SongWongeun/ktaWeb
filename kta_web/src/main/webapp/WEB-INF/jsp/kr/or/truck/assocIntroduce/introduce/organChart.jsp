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
 						<h2><img src="/images/truck/asso/organ_tit.gif" alt="조직도" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">공제조합 소개</a>
						<span>조직도</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/organ_con_tit.gif" alt="화물운송사업자 및 종사자 여러분이 마음 놓고 화물운송사업에 전념 할 수 있도록 꾸준히 노력하고 있습니다" /></p>
					<div class="conSection">
						<div class="organogramArea">
							<a href="/assocIntroduce/office/officeInfo.do?code1=01&code2=00" class="btn01" id="btn01"><span class="hide">서울지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=02&code2=00" class="btn02" id="btn02"><span class="hide">부산지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=03&code2=00" class="btn03" id="btn03"><span class="hide">대구지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=04&code2=00" class="btn04" id="btn04"><span class="hide">인천지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=05&code2=00" class="btn05" id="btn05"><span class="hide">광주지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=06&code2=00" class="btn06" id="btn06"><span class="hide">대전지부</span></a>
							
							<a href="/assocIntroduce/office/officeInfo.do?code1=07&code2=00" class="btn07" id="btn07"><span class="hide">울산지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=07&code2=01" class="btn07_1" id="btn07_1"><span class="hide">울산지부 온산출장소</span></a>
							
							<a href="/assocIntroduce/office/officeInfo.do?code1=08&code2=00" class="btn08" id="btn08"><span class="hide">경기지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=08&code2=01" class="btn08_1" id="btn08_1"><span class="hide">경기지부 의정부사업소</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=08&code2=02" class="btn08_2" id="btn08_2"><span class="hide">경기지부 평택사업소</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=08&code2=03" class="btn08_3" id="btn08_3"><span class="hide">경기지부 용인사업소</span></a>
							
							<a href="/assocIntroduce/office/officeInfo.do?code1=09&code2=00" class="btn09" id="btn09"><span class="hide">강원지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=09&code2=01" class="btn09_1" id="btn09_1"><span class="hide">강원지부 원주출장소</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=09&code2=02" class="btn09_2" id="btn09_2"><span class="hide">강원지부 강릉출장소</span></a>
							
							<a href="/assocIntroduce/office/officeInfo.do?code1=10&code2=00" class="btn10" id="btn10"><span class="hide">충북지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=10&code2=01" class="btn10_1" id="btn10_1"><span class="hide">충북지부 충주사업소</span></a>
							
							<a href="/assocIntroduce/office/officeInfo.do?code1=11&code2=00" class="btn11" id="btn11"><span class="hide">충남지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=11&code2=01" class="btn11_1" id="btn11_1"><span class="hide">충남지부 천안사업소</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=11&code2=02" class="btn11_2" id="btn11_2"><span class="hide">충남지부 세종출장소</span></a>
							
							<a href="/assocIntroduce/office/officeInfo.do?code1=12&code2=00" class="btn12" id="btn12"><span class="hide">전북지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=12&code2=01" class="btn12_1" id="btn12_1"><span class="hide">전북지부 군산사업소</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=12&code2=02" class="btn12_2" id="btn12_2"><span class="hide">전북지부 정읍출장소</span></a>
							
							<a href="/assocIntroduce/office/officeInfo.do?code1=13&code2=00" class="btn13" id="btn13"><span class="hide">전남지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=13&code2=02" class="btn13_1" id="btn13_1"><span class="hide">전남지부 순천사업소</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=13&code2=01" class="btn13_2" id="btn13_2"><span class="hide">전남지부 목포사업소</span></a>
							
							<a href="/assocIntroduce/office/officeInfo.do?code1=14&code2=00" class="btn14" id="btn14"><span class="hide">경북지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=14&code2=02" class="btn14_1" id="btn14_1"><span class="hide">경북지부 포항사업소</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=14&code2=01" class="btn14_2" id="btn14_2"><span class="hide">경북지부 안동구미사업소</span></a>
							
							<a href="/assocIntroduce/office/officeInfo.do?code1=15&code2=00" class="btn15" id="btn15"><span class="hide">경남지부</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=15&code2=01" class="btn15_1" id="btn15_1"><span class="hide">경남지부 부산사업소</span></a>
							<a href="/assocIntroduce/office/officeInfo.do?code1=15&code2=02" class="btn15_2" id="btn15_2"><span class="hide">경남지부 진주사업소</span></a>
							
							<a href="/assocIntroduce/office/officeInfo.do?code1=16&code2=00" class="btn16" id="btn16"><span class="hide">제주지부</span></a>
							<dl class="hide">
								<dt>화물공제조합 2013년 10월 기준 조직도</dt>
								<dd>
									<ul>
										<li>회장
											<ul>
												<li>운영위원회</li>
												<li>이사장</li>
												<li>심사위원회</li>
												<li>총무상무이사
													<ul>
														<li>총무부
															<ul>
																<li>총무과</li>
																<li>인사과</li>
																<li>채무과</li>
															</ul>
														</li>
														<li>기획부
															<ul>
																<li>경영기획과</li>
																<li>업무기획과</li>
																<li>사업개발과</li>
															</ul>
															<ul><li>신사업운영전담팀</li></ul>
														</li>
													</ul>
												</li>
												<li>보상상무이사
													<ul>
														<li>보상지도부
															<ul>
																<li>보상지도과</li>
																<li>송무지도과</li>
																<li>구상지도과</li>
																<li>심사과</li>
															</ul>
														</li>
														<li>전산정보실
															<ul>
																<li>전산개발과</li>
																<li>시스템관리과</li>
																<li>전산사업과</li>
															</ul>
														</li>
														<li>물류공제연구소</li>
													</ul>
												</li>
												<li>직할사업소
													<ul>
														<li>15지부 16사업소 4출장소
															<ul>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=01&code2=00">서울지부</a>
																	<ul>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=01&code2=01">서부사업소</a></li>
																	</ul>
																</li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=02&code2=00">부산지부</a>
																	<ul>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=02&code2=01">강서사업소</a></li>
																	</ul>
																</li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=03&code2=00">대구지부</a></li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=04&code2=00">인천지부</a></li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=05&code2=00">대전지부</a></li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=06&code2=00">울산지부</a></li>
																<li>경기본부장
																	<ul>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=07&code2=00">경기지부</a>
																			<ul>
																				<li><a href="/assocIntroduce/office/officeInfo.do?code1=07&code2=02">의정부사업소</a></li>
																				<li><a href="/assocIntroduce/office/officeInfo.do?code1=07&code2=03">평택사업소</a></li>
																				<li><a href="/assocIntroduce/office/officeInfo.do?code1=07&code2=01">용인사업소</a></li>
																			</ul>
																		</li>
																	</ul>
																</li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=08&code2=00">강원지부</a>
																	<ul>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=08&code2=02">원주출장소</a></li>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=08&code2=01">강릉출장소</a></li>
																	</ul>
																</li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=09&code2=00">충북지부</a>
																	<ul>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=09&code2=01">충주사업소</a></li>
																	</ul>
																</li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=10&code2=00">충남지부</a>
																	<ul>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=10&code2=01">천안사업소</a></li>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=10&code2=02">홍성사업소</a></li>
																	</ul>
																</li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=11&code2=00">전북지부</a>
																	<ul>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=11&code2=01">군산사업소</a></li>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=11&code2=02">정읍출장소</a></li>
																	</ul>
																</li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=12&code2=00">전남지부</a>
																	<ul>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=12&code2=02">순천사업소</a></li>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=12&code2=01">목포사업소</a></li>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=12&code2=03">강진출장소</a></li>
																	</ul>
																</li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=13&code2=00">경북지부</a>
																	<ul>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=13&code2=02">포항사업소</a></li>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=13&code2=01">안동구미사업소</a></li>
																	</ul>
																</li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=14&code2=00">경남지부</a>
																	<ul>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=14&code2=03">광주사업소</a></li>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=14&code2=01">부산사업소</a></li>
																		<li><a href="/assocIntroduce/office/officeInfo.do?code1=14&code2=02">진주사업소</a></li>
																	</ul>
																</li>
																<li><a href="/assocIntroduce/office/officeInfo.do?code1=14&code2=15">제주지부</a></li>
															</ul>
														</li>
													</ul>
												</li>
												<li>상임감사
													<ul>
														<li>감사실
															<ul>
																<li>감사과</li>
															</ul>
														</li>
													</ul>
												</li>
											</ul>
										</li>
									</ul>
								</dd>
							</dl>
						</div>
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