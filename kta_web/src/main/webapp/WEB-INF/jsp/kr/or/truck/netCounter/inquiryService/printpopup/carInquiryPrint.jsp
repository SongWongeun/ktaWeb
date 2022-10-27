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
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" />  -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	$("#tbody_need").children("tr").each(function(value,index){
			
		    var v1 = $(this).children("td").eq(7).text();
		    $(this).children("td").eq(7).text(commas(v1));
		    
		    var v2 = $(this).children("td").eq(6).text();
		    $(this).children("td").eq(6).text(commas(v2));
		    
		    var v3 = $(this).children("td").eq(10).text();
		    $(this).children("td").eq(10).text(commas(v3));

	});
});

function commas(x) {
	if(x=="") return "";
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function printPdf() {
	var k = $("#printPdfDivision").html();
	var f = document.popForm;
	f.htmlData.value = k;
	f.submit();
}
</script>
<style>
.tbWork_st01 td {height: auto !important;}
.tbWork_st01 tr.last td {border-bottom:1px solid #e4ebee !important;}
.right-align{
	text-align:right !important;
}
</style>
</head>
<body>
	<form name="popForm" method="post"
		action="/netCounter/inquiryService/contractInquiry/compenInfoPdf.do">
		<input type="hidden" name="htmlData" />
	</form>
<div id="printPdfDivision" style="margin: 0 auto; padding: 10px;">
<!-- 차량조회검색결과 s --><!-- !검색 시 아래 style로 노출!-->
	<div class="netTitbox">
		<h4 class="netTit">${loginVO.agentNm} 고객님께서 가입하신 <span class="txtColor02">자동차공제</span> <span class="txtColor03">계약현황</span> 입니다&#46;</h4>
	</div>
	<div class="alR mB5" style="margin-top:15px; margin-right: 10px;">
	<div class="btn_absol">
		<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="#;" onclick="window.print();return false;" title="새창열림">인쇄하기</a></span>
		<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="#;" onclick="printPdf();return false;" title="새창열림">PDF</a></span>
	</div>
	</div>
	<h5 class="netsubTit" ><span class="greenBul">자동차공제 계약현황</span></h5>
	<!-- 가입중인차량현황 s -->
		<p class="etcTxt">&#40;기준일자 &#58; <fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> &#41;</p>
		<table class="tbWork_st01" summary="가입중인 차량현황 상세정보 테이블 입니다." style="margin-top: 20px;">
										<thead>
											<tr>
											<th scope="col" style='width: 10%;'>조합원명</th>
											<th scope="col" style='width: 9%;'>차량번호</th>
											<th scope="col" style='width: 11%;'>계약번호</th>
											<th scope="col" style='width: 6%;'>계약상태</th>
											<th scope="col" style='width: 13%;'>가입담보</th>
											<th scope="col" style='width: 8%;'>계약기간</th>
											<th scope="col" style='width: 7%;'>분담금총액</th>
											<th scope="col" style='width: 6%;'>분납회차</th>
											<th scope="col" style='width: 7%;'>수납금액</th>											
											<th scope="col" style='width: 6%; letter-spacing:-2px;' >차회납입일</th>
											<th scope="col" style='width: 7%;'>차회분담금</th>
											<th scope="col" style='width: 6%;'>최고기간</th>
											<th scope="col" style='width: 4%; letter-spacing:-3px;'>보상건수</th>
										</tr>
										</thead>
										<tbody id="tbody_need">
										<c:if test="${carInquiryList!=null}">
											<c:forEach var="carInquiry" items="${carInquiryList}" varStatus="s">
												<tr>
													<td>${carInquiry.AGENT_NM }</td>
													<td>${carInquiry.CAR_NO }</td>
													<td>${carInquiry.GYEYAK_NO }</td>
													<td>
													<c:if test="${carInquiry.GYEYAK_STATE_CD=='유지' }">
													유지
													</c:if>
													<c:if test="${carInquiry.GYEYAK_STATE_CD=='미도래' }">
													<span style="font-weight: bolder; color:#00FFFF;">미도래</span>
													</c:if>
													<c:if test="${carInquiry.GYEYAK_STATE_CD=='최고기간' }">
													<span style="font-weight: bolder; color:#FE2E2E;">최고기간</span>
													</c:if>
													</td>
													<td>
														<c:if test="${carInquiry.DAEIN1_YN=='Y' }">대인 I</c:if>
														<c:if test="${carInquiry.DAEIN2_YN=='Y' }">대인 II</c:if>
														<c:if test="${carInquiry.DAEMUL_YN=='Y' }">대물</c:if>
														<c:if test="${carInquiry.TEKYAK_YN=='Y' }">특약</c:if>
														<c:if test="${carInquiry.CHA_YN=='Y' }">차량</c:if>
													</td>
													<td>${carInquiry.GYEYAK_SYMD }<div>~${carInquiry.GYEYAK_EYMD }</div></td>
													<td style="text-align:right;">${carInquiry.BUNDAM_AMT }</td>
													<td>${carInquiry.BUNNAP_CNT }/${carInquiry.NAPIP_GB_CD }</td>
													<td style="text-align:right;">${carInquiry.TOT_NAPIP_AMT }</td>
													<td>${carInquiry.YUHYO_SYMD }</td>
													<td style="text-align:right;">${carInquiry.BUNNAP_AMT }</td>
													<td>${carInquiry.CHOIGO_EYMD }</td>
													<td>${carInquiry.BOSANG_CNT }건</td>
												</tr>
											</c:forEach>
											</c:if>
									</tbody>
					</table>

</div>
</body>
</html>
