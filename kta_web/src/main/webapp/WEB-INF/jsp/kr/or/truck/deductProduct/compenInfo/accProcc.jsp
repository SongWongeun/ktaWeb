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
						<h2><img src="/images/truck/dedu/compeninfo_tit.gif" alt="보상안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/compenInfo/amountCharge.do" >보상안내</a>
						<span>사고처리절차</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/accprocc_con_tit.gif" alt="사고처리절차 안내입니다. 사고 발생시 신속히 보상 받을 수 있는 절차 등 상세한 내용을 제공해 드립니다." /></p>				
					<div class="conSection">
						<!-- tabs s -->
						<div class="jointabs">
							<ul class="tabMenu">
								<li><a href="#tab1" name="tab1">대인 &#183; 대물사고 처리절차</a></li>
								<li><a href="#tab2" name="tab2">적재물사고 처리절차</a></li>
							</ul><!--// tabMenu e -->
							<div class="tabContainer">
								<!-- 대인 대물사고 처리절차 -->
								<div id="tab1" class="tabCont">
									<h3 class="hide">대인&#183;대물사고 처리절차</h3>
									<div class="txtContent">
										<ul class="processList">
											<li class="pList clfix nC"><span class="pTit pN01 nN">사고발생</span></li>
											<li class="pList clfix"><span class="pTit pN02">사고접수</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>우리조합에 직접접수&#40;조합원사 또는 운전자&#41;</p>
															<p>24시간 사고접수&#183;현장출동&#183;지급보증 서비스 활용 &#40;1577-8278&#41;</p>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix"><span class="pTit pN03">사고조사</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>경찰신고 유무 확인</p>
															<ul>
																<li>경찰신고건은 관할 경찰서 방문 사고기록 열람</li>
															</ul>
															<p>현장조사</p>
															<ul>
																<li>&#8226;도로형태 및 사고 상황 조사</li>
																<li>&#8226;목격자 조사</li>
															</ul>
															<p>가&#8226;피해자 면담 및 사고진술서 징구</p>
															<p>과실비율 책정</p>
															<ul>
																<li>별도로 정한 자동차사고 과실비율의 인정기준에 따라 적용하며 사고유형이 동 기준에 없거나<br/>동 기준에 의한 과실비율의 적용이 곤란할 때에는 판결사례를 참작하여 적용함&#46;<br/>&#40;소송이 제기되었을 경우에는 확정 판결에 의한 과실비율을 적용&#41;</li>
															</ul>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix"><span class="pTit pN04">피해자&#40;물&#41;조사</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>피해자 조사</p>
															<ul>
																<li>&#8226;인적사항 파악</li>
																<li>&#8226;부상정도 및 치료병원 확인</li>
																<li>&#8226;소득관련 내용 파악</li>
															</ul>
															<p>피해물&#40;차량&#41; 조사</p>
															<ul>
																<li>&#8226;피해물&#40;차량&#41; 소유자 및 운전자 인적사항 파악</li>
																<li>&#8226;피해물&#40;차량&#41; 파손 정도 및 수리공장 확인</li>
																<li>&#8226;과실파악</li>
															</ul>
															<p>차량이외 피해물 조사</p>
															<ul>
																<li>&#8226;소유자 및 관리주체 인적사항 파악</li>
																<li>&#8226;피해물 파손 정도 확인</li>
																<li>&#8226;과실파악</li>
															</ul>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix"><span class="pTit pN05">피해자&#40;물&#41;관리</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>피해자</p>
															<ul>
																<li>치료병원에 치료비 지불보증 및 피해자에 대한 관리</li>
															</ul>
															<p>피해물&#40;차량&#41;</p>
															<ul>
																<li>&#8226;수리공장에 수리비 지불 보증 및 수리완료 여부 관리</li>
																<li>&#8226;렌트 사용시 대차료 지불 보증</li>
															</ul>
															<p>차량 이외 피해물</p>
															<ul>
																<li>원상복구 업체에 공제금 지불보증 및 복구완료 여부 관리</li>
															</ul>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix"><span class="pTit pN06">진료비 심사 및<br/>청구비용 손해사정</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>진료비</p>
															<ul>
																<li>청구진료비에 대한 심사</li>
																<li>&#8226;건강보험심사평가원 위탁 심사</li>
																<li>&#8226;피해자 직불진료비는 심사업무 처리에 따라 건강보험심사평가원에 심사요청 또는 공제조합 직접지금</li>
																<li>&#8226;심사결과에 대한 권리구제 심사결과 불복 → 이의신청(재심사 조정 청구)</li>
																<li>&#8226;이의신청 결과 불복 → 자동차보험진료수가 분쟁심의에 재상정</li>
															</ul>
															<p>차량 및 차량이외 피해물</p>
															<ul>
																<li>청구비용에 대한 손해사정 &#40;손해사정사 위탁 처리 및 대물보상 직원&#41;</li>
															</ul>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix"><span class="pTit pN07">공제금 산출</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>자동차공제약관 지급기준 및 보상실무지침에 의거 공제금 산출 &#40;보상담당자 산출&#41;</p>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix plL"><span class="pTit pN08 nL">공제금 지급</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>피해자&#183;공장 등 협의시 공제금 지급</p>
															<p>구상발생건 조치</p>
															<p>피해자&#183;공장 등 소 제기시 심사과 서류이관</p>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div><!--// 대인 대물사고 처리절차 e -->
								<!-- 적재물사고 처리절차 -->
								<div id="tab2" class="tabCont">
									<h3 class="hide">적재물사고 처리절차</h3>
									<div class="txtContent">
										<ul class="processList">
											<li class="pList clfix nC"><span class="pTit pN01 nN">사고발생</span></li>
											<li class="pList clfix"><span class="pTit pN02">사고접수</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>우리조합에 직접접수&#40;조합원사 또는 운전자&#41;</p>
															<p>24시간 사고접수 &#183; 현장출동 &#183; 지급보증 서비스 활용 &#40;1577-8278&#41;</p>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix"><span class="pTit pN03">사고조사</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>경찰신고 유무 확인</p>
															<ul>
																<li>경찰신고건은 관할 경찰서 방문 사고기록 열람</li>
															</ul>
															<p>현장조사</p>
															<p>가&#8226;피해자 면담 및 사고진술서 징구</p>
															<p>면부책 검토</p>
															<p>과실비율 책정</p>
															<ul>
																<li>별도로 정한 자동차사고 과실비율의 인정기준에 따라 적용하며 사고유형이 동 기준에 없거나 동 기준에 의한 과실비율의 적용이 곤란할 때에는 판결 사례를 참작하여 적용함<br/>&#40;소송이 제기되었을 경우에는 확정 판결에 의한 과실비율을 적용&#41;</li>
															</ul>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix"><span class="pTit pN04">피해물&#40;적재물&#41;조사</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>피해물&#40;적재물&#41;조사</p>
															<ul>
																<li>&#8226;피해물&#40;적재물&#41; 소유자 및 관리주체 인적사항 파악</li>
																<li>&#8226;피해물&#40;적재물&#41; 파손 정도 확인</li>
															</ul>
															<p>구상권등 종합적 검토</p>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix"><span class="pTit pN05">피해자&#40;적재물&#41;관리</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>보상절차 및 구비서류 안내</p>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix"><span class="pTit pN06">손해사정</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>구비서류 완비</p>
															<p>손해액 산정</p>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
											<li class="pList clfix plL"><span class="pTit pN07 nL">공제금 지급</span>
												<div class="pBox">
													<div class="roundBox02">
														<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
														<!-- 내용 -->
														<div class="processArea">
															<p>조합원 및 화주에게 안내</p>
															<p>공제금 지급 통보</p>
															<p>재보험 처리 및 구상발생건 등 조치</p>
														</div>
														<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div><!--// 적재물사고 처리절차 e -->
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