<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
function goIndex() {
	document.location.href = "/main/index.do";
}
function detailList(acdnt_no) {
	document.boardForm.acdnt_no.value=acdnt_no;
	document.boardForm.action = "<c:url value='/netCounter/inquiryService/accListInquiry/accCarListInquiryDetail.do'/>";
   	document.boardForm.submit();
}

$(document).ready(function(){
	
	if('${checksf}'=='f'){
		alert("차량 관리자 정보가 존재하지 않습니다.<br/>계약지부 담당자를 통해 최초 1회 등록후 차량관리자로 등록이 가능합니다.");
	}
	
	if('${checksf}'=='s'){
		alert("차량관리자가 성공적으로 변경 되었습니다.");
	}
	
	var s = $("#carmgr_phoneNumber").text();
	var d = s.trim().length;
	var z = "";
	if(d==11){
		z += s.substr(0,3)+"-";
		z += s.substr(3,4)+"-";
		z += s.substr(7,4);
	}else if(d==10){
		z += s.substr(0,3)+"-";
		z += s.substr(3,3)+"-";
		z += s.substr(6,4);
	}
	if(s.trim()!=""){
		$("#carmgr_phoneNumber").text(z);
	}else{
		$("#carmgr_phoneNumber").text("");
	}
	
		

	
	
	$('#goList').on('click',function(event){
		event.preventDefault();
		history.back(-1);
	});
});

function goChange(){
	$("#goChange").submit();	
}
</script>
</head>
<body>
<form id="goChange" method="post" action="/netCounter/inquiryService/contractInquiry/totalContractInquiryCheckName.do">
 	<input type="hidden" name="agent_no" value="${resultList[0].agent_no }"/>
 	<input type="hidden" name="saupjang_seq" value="${resultList[0].saupjang_seq }"/>
 	<input type="hidden" name="gyeyak_no" value="${resultList[0].gyeyak_no }"/>
 	<input type="hidden" name="car_gaip_no" value="${resultList[0].car_gaip_no }"/>
 	<input type="hidden" name="saupja_no" value="${resultList[0].saupja_no }"/>
 	<input type="hidden" name="gyeyak_jibu_cd" value="${resultList[0].gyeyak_jibu_cd }"/>
</form>
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
 						<h2><img src="/images/truck/net/contrac_tit.gif" alt="계약관리" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<a href="/netCounter/inquiryService/contractInquiry/accCarListInquiry.do" >계약관리</a>
						<span>계약정보조회</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/contrac_con_tit02.gif" alt="고객님께서 가입하신 공제계약의 상세내용을 확인하실 수 있습니다" /></p>
					<!-- 20161214 삭제 
					<div class="tabGruop">
						<ul class="tab">
							<li class="on"><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><span>자동차공제조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/accInquiry.do"><span>재해공제조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/carryInquiry.do"><span>적재물공제조회</span></a></li>
						</ul>
					</div>
					//20161214 삭제 -->
					<div class="conSection clfix">
						<h3 class="hide">계약정보조회</h3>
						<!-- 20161208 삭제 
						<div class="netTitbox">
							<h4 class="netTit">${loginVO.agentNm} 고객님께서 가입하신 <span class="txtColor02">공제계약</span>의 <span class="txtColor03">상세내용</span>을 확인하실 수 있습니다&#46;</h4>
						</div>
						//20161208 삭제 -->
						<!-- 계약정보조회서브탭메뉴 s -->
						<div class="subtabGruop type2">
							<p class="tabTit"><span class="icoCar">차량번호</span> ${resultList[0].car_no} <span class="f13">의 상세내역입니다.</span></p>
							<!-- 20161208 삭제 
							<ul class="subTab"><!-- 탭 선택 시 class="on" 추가 
								<li class="last on"><a href="#;"><span>자동차공제계약</span></a></li>
								<%-- <c:if test="${not empty accTotCnt && accTotCnt > 0 }">
									<li><a href="/netCounter/inquiryService/contractInquiry/accDeductInquiry.do?car_gaip_no=${resultList[0].car_gaip_no}"><span>재해계약</span></a></li>
								</c:if>
								<c:if test="${not empty carryTotCnt && carryTotCnt > 0 }">
									<li><a href="/netCounter/inquiryService/contractInquiry/carryDeductInquiry.do?car_gaip_no=${resultList[0].car_gaip_no}"><span>적재물계약</span></a></li>
								</c:if> --%>
							</ul>
							//20161208 삭제 -->
						</div>
						<!-- 통합계약 s -->
						<h4 class="hide">통합계약</h4><%-- 자기차량손해가액 타이틀 추가하여 자동차정보 style 박음. --%>
						<h5 class="netsubTit" style="width: 50%;float: left;" ><span class="greenBul">자동차정보</span></h5>
						<h5 class="netsubTit" ><span class="greenBul">자기차량손해가액</span></h5>
						<div class="tbWork1">
							<table class="tbWork_st04" summary="자동차정보 상세정보 테이블 입니다.">
								<caption>자동차정보에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:30%;" />
									<col style="width:20%;" />
									<col style="width:30%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="borLeft">차량번호</th>
										<td>${resultList[0].car_no}</td>
										<th scope="row">자차공제가액</th>
										<td class="alR"><fmt:formatNumber value="${resultList[0].car_amt}" type="number" /> 원</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">차종</th>
										<td>${resultList[0].car_kind_nm}</td>
										<th scope="row">부속가액</th>
										<td class="alR"><fmt:formatNumber value="${resultList[0].sub_unit_tot}" type="number" /> 원</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">차명</th>
										<td>${resultList[0].car_nm}</td>
										<th scope="row">기계가액</th>
										<td class="alR"><fmt:formatNumber value="${resultList[0].machine_unit_amt}" type="number" /> 원</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">차대번호</th>
										<td>${resultList[0].car_body_no}</td>
										<th scope="row">탑탱크가액</th>
										<td class="alR"><fmt:formatNumber value="${resultList[0].top_tank_amt}" type="number" /> 원</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">년식</th>
										<td>${resultList[0].car_yy}년</td>
										<th scope="row">자차공제총가액</th>
										<td class="alR"><fmt:formatNumber value="${resultList[0].total_car_amt}" type="number" /> 원</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">적재정량</th>
										<td>${resultList[0].proper_wg} kg</td>
										<th scope="row" rowspan="2" class="brB1">특요항목</th>
										<td rowspan="2" class="brB1">${resultList[0].tukbyul_rate1_nm}, ${resultList[0].tukbyul_rate2_nm}, ${resultList[0].tukbyul_rate3_nm}</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">총 중 량</th>
										<td>${resultList[0].tot_wg} kg</td>
									</tr>
								</tbody>
							</table>
						</div><!--// 자동차정보 e -->

						<!-- 20161208 추가 -->
						<c:if test = "${loginVO.agentCd == '1'}">
							<div class="tblTop pT0">
								<h5 class="netsubTit"><span class="greenBul">차량관리자정보</span></h5>
								<span class="btn_pack btn_type18 right"><a href="javascript:goChange();">변경</a></span>
							</div>
							<div class="tbWork1">
								<table class="tbWork_st04 mB5" summary="차량관리자 상세정보 테이블 입니다.">
									<caption>차량관리자정보에 대해서 나타낸 표</caption>
									<colgroup>
										<col style="width:20%;" />
										<col style="width:30%;" />
										<col style="width:20%;" />
										<col style="width:30%;" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="borLeft">관리자명</th>
											<td>${resultList[0].carmgr_nm}</td>
											<th scope="row">연락처</th>
											<td class="alR" id="carmgr_phoneNumber" style="text-align:left !important;">${resultList[0].carmgr_phone}</td>
										</tr>
									</tbody>
								</table>
								<span class="desC">최초등록은 지부계약 담당자를 통해 요청하시기 바랍니다.</span>
							</div><!--// 차량관리자정보 e -->
						</c:if>
						<!-- //20161208 추가 -->

						<h5 class="netsubTit" ><span class="greenBul">계약기간&#40;계약상태&#41;</span></h5>
						<div class="tbWork1">
							<table class="tbWork_st01" summary="계약기간계약상태 상세정보 테이블 입니다.">
								<caption>계약기간 계약상태에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:20%;" />
									<col style="width:30%;" />
									<col style="width:20%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">담보</th>
										<th scope="col">계약상태</th>
										<th scope="col">계약기간</th>
										<th scope="col">납입구분</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>		  			    
											<td >${result.dambo_kind_nm}</td>
											<td >${result.gyeyak_state_nm}</td>
											<td >${result.dambo_gaip_ymd}</td>
											<td >${result.napip_gb}</td>
											<!-- <td >?? 개월 &#47; ?? 일</td> -->
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div><!--// 계약기간 e -->
						<h5 class="netsubTit" ><span class="greenBul">특별약관</span></h5>
						<div class="tbWork2">
							<p>
								<c:set var="tukyak" value=""/>
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<c:if test="${result.dambo_kind_cd == '2'}">
										<c:if test="${result.napip_gb_cd > 1}">
											<c:set var="tukyak" value="${tukyak }&#45;&nbsp;분담금 분할납입 특별약관"/>
											${tukyak}<br/>
										</c:if>
									</c:if>
									<c:if test="${result.dambo_kind_cd == '7'}">
										<c:if test="${tukyak!=''}">
											<c:set var="tukyak" value="${tukyak }<br/>"/>
										</c:if>
										<c:set var="tukyak" value="&#45;&nbsp;법률비용지원 특별약관"/>
										${tukyak}<br/>
									</c:if>
									<c:if test="${result.dambo_kind_cd == '9'}">
										<c:if test="${tukyak!=''}">
											<c:set var="tukyak" value="${tukyak }<br/>"/>
										</c:if>
										<c:set var="tukyak" value="${tukyak }&#45;&nbsp;긴급출동 서비스 특별약관"/>
										${tukyak}<br/>
									</c:if>
								</c:forEach>
								
							</p>
						</div><!--// 특별약관 e -->
						<h5 class="netsubTit" ><span class="greenBul">계약사항</span></h5>
						<div class="tbWork1">
							<table class="tbWork_st05" summary="계약사항 상세정보 테이블 입니다. 항목,내용,금액,합계">
								<caption>계약사항에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:33%;" />
									<col style="width:34%;" />
									<col style="width:33%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="alC">담보</th>
										<th scope="col" class="alC">보상한도</th>
										<th scope="col" class="alC">금액</th>
									</tr>
								</thead>
								<%--<tfoot>
									<tr>
										<td scope="col">합계</td>
										<td scope="col" colspan="2" class="alR">?? 원</td>
									</tr>
								</tfoot>--%>
								<tbody>
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>		  			    
											<td >${result.dambo_kind_nm}</td>
											<td >${result.dambo_hando}</td>
											<td class="alR"><fmt:formatNumber value="${result.bundam_amt }" type="number" /> 원</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div><!--// 청약사항 e -->
						<!--// 유재만 과장님 요청(기획부 정순규 과장님과 논의 후 적용) 2017.06.20 SONG -->
						<h5 class="netsubTit" ><span class="greenBul">계약에 적용된 요율</span></h5>
						<div class="tbWork1">
							<table class="tbWork_st01" summary="요율 상세정보 테이블 입니다. 항목,내용,금액,합계">
								<caption>계약사항에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:33%;" />
									<col style="width:34%;" />
									<col style="width:33%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="alC">표준요율(대인I)</th>
										<th scope="col" class="alC">표준요율(일반)</th>
										<th scope="col" class="alC">특별할증</th>
									</tr>
								</thead>
								<%--<tfoot>
									<tr>
										<td scope="col">합계</td>
										<td scope="col" colspan="2" class="alR">?? 원</td>
									</tr>
								</tfoot>--%>
								<tbody>
										<tr>		  			    
											<td >${resultList[0].dae1}</td>
											<td >${resultList[0].ilban}</td>
											<td >${resultList[0].tukbyul}</td>
										</tr>
								</tbody>
							</table>
						</div><!--// 청약사항 e -->
						<h5 class="netsubTit" >
							<span class="greenBul">분담금 납입정보</span> 
							- 분할납입특약 ( 대인I : ${resultList[0].napip_gb_dae1}회납, 일반 : ${resultList[0].napip_gb_ilban}회납 ) 
						</h5>
						<div class="tbWork1">
							<p class="etcTxt">&#40;기준일자 &#58;<fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월dd일" />&#41;</p>
							<table class="tbWork_st01" summary="분담금 납입정보 상세정보 테이블 입니다. 담보,계약상태,회차,분담금,영수일자,합계">
								<caption>분담금 납입정보에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:9%;" />
									<col style="width:7%;" />
									<col style="width:8%;" />
									<col style="width:6%;" />
									<col style="width:8%;" />
									<col style="width:6%;" />
									<col style="width:8%;" />
									<col style="width:6%;" />
									<col style="width:8%;" />
									<col style="width:6%;" />
									<col style="width:8%;" />
									<col style="width:6%;" />
									<col style="width:8%;" />
									<col style="width:6%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan="2">담보</th>
										<th scope="col" rowspan="2">계약상태</th>
										<th scope="col" colspan="2" class="brB1">1회</th>
										<th scope="col" colspan="2" class="brB1">2회</th>
										<th scope="col" colspan="2" class="brB1">3회</th>
										<th scope="col" colspan="2" class="brB1">4회</th>
										<th scope="col" colspan="2" class="brB1">5회</th>
										<th scope="col" colspan="2" class="brB1">6회</th>
									</tr>
									<tr>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="bunnap_sum_1" value="0"/>
									<c:set var="bunnap_sum_2" value="0"/>
									<c:set var="bunnap_sum_3" value="0"/>
									<c:set var="bunnap_sum_4" value="0"/>
									<c:set var="bunnap_sum_5" value="0"/>
									<c:set var="bunnap_sum_6" value="0"/>
									<c:forEach var="detail" items="${detailList}" varStatus="status">
										<c:if test="${not empty detail.bunnap_amt1}">
											<c:set var="bunnap_sum_1" value="${bunnap_sum_1+detail.bunnap_amt1 }"/>
										</c:if>
										<c:if test="${not empty detail.bunnap_amt2}">
											<c:set var="bunnap_sum_2" value="${bunnap_sum_2+detail.bunnap_amt2 }"/>
										</c:if>
										<c:if test="${not empty detail.bunnap_amt3}">
											<c:set var="bunnap_sum_3" value="${bunnap_sum_3+detail.bunnap_amt3 }"/>
										</c:if>
										<c:if test="${not empty detail.bunnap_amt4}">
											<c:set var="bunnap_sum_4" value="${bunnap_sum_4+detail.bunnap_amt4 }"/>
										</c:if>
										<c:if test="${not empty detail.bunnap_amt5}">
											<c:set var="bunnap_sum_5" value="${bunnap_sum_5+detail.bunnap_amt5 }"/>
										</c:if>
										<c:if test="${not empty detail.bunnap_amt6}">
											<c:set var="bunnap_sum_6" value="${bunnap_sum_6+detail.bunnap_amt6 }"/>
										</c:if>
										<%-- 날짜 --%>
										<c:if test="${not empty detail.youngsu_ymd1}">
											<fmt:parseDate value="${detail.youngsu_ymd1}" var="dateFmt1" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.youngsu_ymd2}">
											<fmt:parseDate value="${detail.youngsu_ymd2}" var="dateFmt2" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.youngsu_ymd3}">
											<fmt:parseDate value="${detail.youngsu_ymd3}" var="dateFmt3" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.youngsu_ymd4}">
											<fmt:parseDate value="${detail.youngsu_ymd4}" var="dateFmt4" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.youngsu_ymd5}">
											<fmt:parseDate value="${detail.youngsu_ymd5}" var="dateFmt5" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.youngsu_ymd6}">
											<fmt:parseDate value="${detail.youngsu_ymd6}" var="dateFmt6" pattern="yyyymmdd"/>
										</c:if>
										
										<tr>		 		
											<td>${detail.dambo_kind_nm}</td>		    	
											<td>${detail.gyeyak_state_nm}</td>
											<td class="alR"><fmt:formatNumber value="${detail.bunnap_amt1 }" type="number" /></td>
											<td><fmt:formatDate value="${dateFmt1}" pattern="yy.mm.dd"/></td>
											<td class="alR"><fmt:formatNumber value="${detail.bunnap_amt2 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt2}" pattern="yy.mm.dd"/></td>
											<td class="alR"><fmt:formatNumber value="${detail.bunnap_amt3 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt3}" pattern="yy.mm.dd"/></td>
											<td class="alR"><fmt:formatNumber value="${detail.bunnap_amt4 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt4}" pattern="yy.mm.dd"/></td>
											<td class="alR"><fmt:formatNumber value="${detail.bunnap_amt5 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt5}" pattern="yy.mm.dd"/></td>
											<td class="alR"><fmt:formatNumber value="${detail.bunnap_amt6 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt6}" pattern="yy.mm.dd"/></td>		    	
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td scope="col">합계</td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_1 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_2 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_3 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_4 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_5 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_6 }" type="number" /></td>
										<td scope="col"></td>
									</tr>
								</tfoot>
							</table>
						</div><!--// 분담금 납입정보 e -->
						<!-- 20161208 추가 -->
						<div class="btnboxR">
							<!-- <span class="btn_pack btn_type22"><a href="#">계약목록</a></span> -->
							<span class="btn_pack btn_type22"><a href="javascript:;" id="goList">목록</a></span>
						</div>
						<!-- //20161208 추가 -->
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