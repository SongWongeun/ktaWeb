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
<script type="text/javascript">
$(document).ready(function(){
	<%-- 목록으로 이동 버튼 --%>
	$('span#goList').on('click',function(event){
		event.preventDefault();
		history.back(-1);
	});
	
	var acdnt_no ="${acdnt_no}";
	
	// 보상내역의 row를 한개로 보여주면 조합원사에서 한개 금액으로 착각 할 수 있는 여지있어 row-span 삭제
	//$("#detail1").rowspanizer({vertical_align: 'middle'});
	//$("#detail2").rowspanizer({vertical_align: 'middle'});
	//$("#detail3").rowspanizer({vertical_align: 'middle'});
	//$("#detail4").rowspanizer({vertical_align: 'middle'});
	//$("#detail5").rowspanizer({vertical_align: 'middle'});
	//$("#detail6").rowspanizer({vertical_align: 'middle'});
});
function printDocument(){
	//document.boardForm.action = "<c:url value='/netCounter/certSerivce/certServiceView.do'/>";
	document.boardForm.action = "<c:url value='/netCounter/inquiryService/accountInquiry/compenDetailJasper.do?acdnt_no=${acdnt_no}'/>";
	document.boardForm.target="certView";
	window.open("",'certView','toolbar=no,location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=1100,height=800 top=10 left=10');
   	document.boardForm.submit();
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
			<form:form commandName="searchVO" name="boardForm" method="post" action="">
			<fieldset>
			<legend>보상세부내용</legend>
			<input type="hidden" name="rebFileName" value="compenDetail3"/>
			<input type="hidden" name="resultXML" value="${report}"/>
			<input type="hidden" name="resultXML1" value="${report1}"/>
			<input type="hidden" name="resultXML2" value="${report2}"/>
			<input type="hidden" name="resultXML3" value="${report3}"/>
			<input type="hidden" name="resultXML4" value="${report4}"/>
			<input type="hidden" name="resultXML5" value="${report5}"/>
			<input type="hidden" name="resultXML6" value="${report6}"/>
			<%-- <input type="hidden" name="resultXML2" value="${report2}"/>
			<input type="hidden" name="resultXML3" value="${report3}"/> --%>
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/repair_tit.gif" alt="보상정보조회" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<span>보상정보조회</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/repair_con_tit.gif" alt="보상정보 및 내역 조회 서비스 입니다 최근 3여 년간의 사고내역만 조회가 가능하며, 좀더 상세한 내용은 계약지부의 담당자에게 문의하시기 바랍니다" /></p>
					<div class="conSection clfix">
						<!-- <div class="netTitbox">
							<div class="iconType01">
								<h3 class="netTit"><span class="txtColor03">보상정보 및 내역 조회</span> <span class="txtColor02">서비스 입니다&#46;</span></h3>
								<p class="netTitsub">최근 3여 년간의 사고내역만 조회가 가능하며&#44; 좀더 상세한 내용은 계약지부의 담당자에게 문의하시기 바랍니다&#46;</p>
							</div>
						</div> -->
						<!-- 선택한사고목록 s -->
						<!-- 인쇄하기버튼 -->
						<div class="flR">
							<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="#;" onclick="printDocument()"title="새창열림" >인쇄하기</a></span>
						</div>
						<h4 class="netsubTit" ><span class="greenBul">선택하신 사고의 상세정보입니다&#46;</span></h4>
						<div class="tbWork1">
							<table class="tbWork_st01" summary="선택하신 사고 목록 테이블 입니다.">
								<caption>사고목록에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:15%;" />
									<col style="width:15%;" />
									<col style="width:13%;" />
									<col style="width:17%;" />
									<col style="width:40%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">사고번호</th>
										<th scope="col">차량번호</th>
										<th scope="col">운전자</th>
										<th scope="col">사고일시</th>
										<th scope="col">사고장소</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="result" items="${resultList }" varStatus="varStatus" >
										<tr>
											<td>
												${fn:substring(result.acdnt_no,0,4) }-${fn:substring(result.acdnt_no,4,9) }
											</td>
											<td>${result.car_no }</td>
											<td>${result.drvr_nm }</td>
											<td>${result.acdnt_date }</td>
											<td style="padding-left: 9px;" class="alL">${result.acdnt_place }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div><!--// 선택한사고목록 e -->
						<!-- 상세보상내역 s -->
						
						
						<div class="tbWork1">
							<c:if test="${detailList1 != null}">
								<div class="netsubBoth">
									<h4 class="netsubTit flL" ><span class="greenBul">대인사고 상세정보</span></h4>
								</div>
								<table class="tbWork_st01" id="detail1" summary="선택하신 사고 목록 상세보상내역 테이블 입니다.">
									<caption>사고목록 상세보상내역에 대해서 나타낸 표</caption>
									<colgroup>
										<col style="width:7%;" />
										<col style="width:4%;" />
										<col style="width:4%;" />
										<col style="width:11%;" />
										<col style="width:10%;" />
										<col style="width:10%;" />
										<col style="width:10%;" />
										<col style="width:10%;" />
										<col style="width:8%;" />
										<col style="width:8%;" />
										<col style="width:8%;" />
										<col style="width:10%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">구분</th>
											<th scope="col" rowspan="2">담보</th>
											<th scope="col" rowspan="2">순번</th>
											<th scope="col" rowspan="2">피해자&#47;물</th>
											<th scope="col" rowspan="2">보상금액</th>
											<th scope="col" rowspan="2">사망<br />공제금</th>
											<th scope="col" rowspan="2">부상<br />공제금</th>
											<th scope="col" rowspan="2">후유장애<br />공제금</th>
											<th scope="col" rowspan="2">처리지부</th>
											<th scope="col" rowspan="2">담당<br />부서</th>
											<th scope="col" colspan="2" class="brB1">담당자</th>
										</tr>
										<tr>
											<th scope="col">이름</th>
											<th scope="col">연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="detailList1" items="${detailList1 }" varStatus="varStatus" >
											<tr>
												<td>${detailList1.gb}</td>
												<td>${detailList1.dmbo_gb_nm }</td>
												<td>${detailList1.psn_num }</td>
												<td>${detailList1.dmgd_psn_nm }</td>
												<td class="alR"><b><fmt:formatNumber value="${detailList1.jigub_amt }"  type="number" /></b></td>
												<td class="alR"><b><fmt:formatNumber value="${detailList1.jigub_amt1 }"  type="number" /></b></td>
												<td class="alR"><fmt:formatNumber value="${detailList1.jigub_amt2 }"  type="number" /></td>
												<td class="alR"><fmt:formatNumber value="${detailList1.jigub_amt3 }"  type="number" /></td>
												<td>${detailList1.jibu }</td>
												<td>${detailList1.pat }</td>
												<td>${detailList1.id }</td>
												<td>${detailList1.jibu_tel }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							</br>
							<c:if test="${detailList2 != null}">
								<div class="netsubBoth">
									<h4 class="netsubTit flL" ><span class="greenBul">대물사고 상세정보</span></h4>
								</div>
								<table class="tbWork_st01" id="detail2" summary="선택하신 사고 목록 상세보상내역 테이블 입니다.">
									<caption>사고목록 상세보상내역에 대해서 나타낸 표</caption>
									<colgroup>
										<col style="width:7%;" />
										<col style="width:4%;" />
										<col style="width:4%;" />
										<col style="width:11%;" />
										<col style="width:10%;" />
										<col style="width:12%;" />
										<col style="width:11%;" />
										<col style="width:11%;" />
										<col style="width:10%;" />
										<col style="width:10%;" />
										<col style="width:10%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">구분</th>
											<th scope="col" rowspan="2">담보</th>
											<th scope="col" rowspan="2">순번</th>
											<th scope="col" rowspan="2">피해자&#47;물</th>
											<th scope="col" rowspan="2">보상금액</th>
											<th scope="col" colspan="2" class="brB1">대물배상</th>
											<th scope="col" rowspan="2">처리지부</th>
											<th scope="col" rowspan="2">담당<br />부서</th>
											<th scope="col" colspan="2" class="brB1">담당자</th>
										</tr>
										<tr>
											<th scope="col">지급처명</th>
											<th scope="col">지급금액</th>
											<th scope="col">이름</th>
											<th scope="col">연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="detailList2" items="${detailList2 }" varStatus="varStatus" >
											<tr>
												<td>${detailList2.gb}</td>
												<td>${detailList2.dmbo_gb_nm }</td>
												<td>${detailList2.psn_num }</td>
												<td>${detailList2.dmgd_psn_nm }</td>
												<td class="alR"><b><fmt:formatNumber value="${detailList2.jigub_amt }"  type="number" /></b></td>
												<td>${detailList2.prvd_nm }</td>
												<td class="alR"><b><fmt:formatNumber value="${detailList2.jigub_amt1 }"  type="number" /></b></td>
												<td>${detailList2.jibu }</td>
												<td>${detailList2.pat }</td>
												<td>${detailList2.id }</td>
												<td>${detailList2.jibu_tel }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							</br>
							<c:if test="${detailList3 != null}">
								<div class="netsubBoth">
									<h4 class="netsubTit flL" ><span class="greenBul">자기차량사고 상세정보</span></h4>
								</div>
								<table class="tbWork_st01" id="detail3" summary="선택하신 사고 목록 상세보상내역 테이블 입니다.">
									<caption>사고목록 상세보상내역에 대해서 나타낸 표</caption>
									<colgroup>
										<col style="width:7%;" />
										<col style="width:4%;" />
										<col style="width:4%;" />
										<col style="width:11%;" />
										<col style="width:10%;" />
										<col style="width:15%;" />
										<col style="width:10%;" />
										<col style="width:10%;" />
										<col style="width:9%;" />
										<col style="width:9%;" />
										<col style="width:11%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">구분</th>
											<th scope="col" rowspan="2">담보</th>
											<th scope="col" rowspan="2">순번</th>
											<th scope="col" rowspan="2">피해자&#47;물</th>
											<th scope="col" rowspan="2">보상금액</th>
											<th scope="col" colspan="2" class="brB1">대물배상</th>
											<th scope="col" rowspan="2">처리지부</th>
											<th scope="col" rowspan="2">담당<br />부서</th>
											<th scope="col" colspan="2" class="brB1">담당자</th>
										</tr>
										<tr>
											<th scope="col">지급처명</th>
											<th scope="col">지급금액</th>
											<th scope="col">이름</th>
											<th scope="col">연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="detailList3" items="${detailList3 }" varStatus="varStatus" >
											<tr>
												<td>${detailList3.gb}</td>
												<td>${detailList3.dmbo_gb_nm }</td>
												<td>${detailList3.psn_num }</td>
												<td>${detailList3.dmgd_psn_nm }</td>
												<td><b><fmt:formatNumber value="${detailList3.jigub_amt }"  type="number" /></b></td>
												<td>${detailList3.prvd_nm }</td>
												<td class="alR"><b><fmt:formatNumber value="${detailList3.jigub_amt1 }"  type="number" /></b></td>
												<td>${detailList3.jibu }</td>
												<td>${detailList3.pat }</td>
												<td>${detailList3.id }</td>
												<td>${detailList3.jibu_tel }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							
							</br>
							<c:if test="${detailList4 != null}">
								<div class="netsubBoth">
									<h4 class="netsubTit flL" ><span class="greenBul">적재물배상 사고 상세정보</span></h4>
								</div>
								<table class="tbWork_st01" id="detail4" summary="선택하신 사고 목록 상세보상내역 테이블 입니다.">
									<caption>사고목록 상세보상내역에 대해서 나타낸 표</caption>
									<colgroup>
										<col style="width:7%;" />
										<col style="width:4%;" />
										<col style="width:4%;" />
										<col style="width:11%;" />
										<col style="width:10%;" />
										<col style="width:15%;" />
										<col style="width:10%;" />
										<col style="width:10%;" />
										<col style="width:9%;" />
										<col style="width:9%;" />
										<col style="width:11%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">구분</th>
											<th scope="col" rowspan="2">담보</th>
											<th scope="col" rowspan="2">순번</th>
											<th scope="col" rowspan="2">피해자&#47;물</th>
											<th scope="col" rowspan="2">보상금액</th>
											<th scope="col" colspan="2" class="brB1">대물배상</th>
											<th scope="col" rowspan="2">처리지부</th>
											<th scope="col" rowspan="2">담당<br />부서</th>
											<th scope="col" colspan="2" class="brB1">담당자</th>
										</tr>
										<tr>
											<th scope="col">지급처명</th>
											<th scope="col">지급금액</th>
											<th scope="col">이름</th>
											<th scope="col">연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="detailList4" items="${detailList4 }" varStatus="varStatus" >
											<tr>
												<td>${detailList4.gb}</td>
												<td>${detailList4.dmbo_gb_nm }</td>
												<td>${detailList4.psn_num }</td>
												<td>${detailList4.dmgd_psn_nm }</td>
												<td><b><fmt:formatNumber value="${detailList4.jigub_amt }"  type="number" /></b></td>
												<td>${detailList4.prvd_nm }</td>
												<td class="alR"><b><fmt:formatNumber value="${detailList4.jigub_amt1 }"  type="number" /></b></td>
												<td>${detailList4.jibu }</td>
												<td>${detailList4.pat }</td>
												<td>${detailList4.id }</td>
												<td>${detailList4.jibu_tel }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							
							</br>
							<c:if test="${detailList5 != null}">
								<div class="netsubBoth">
									<h4 class="netsubTit flL" ><span class="greenBul">법률지원특약 상세정보</span></h4>
								</div>
								<table class="tbWork_st01" id="detail5" summary="선택하신 사고 목록 상세보상내역 테이블 입니다.">
									<caption>사고목록 상세보상내역에 대해서 나타낸 표</caption>
									<colgroup>
										<col style="width:7%;" />
										<col style="width:4%;" />
										<col style="width:4%;" />
										<col style="width:13%;" />
										<col style="width:16%;" />
										<col style="width:16%;" />
										<col style="width:11%;" />
										<col style="width:9%;" />
										<col style="width:9%;" />
										<col style="width:11%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">구분</th>
											<th scope="col" rowspan="2">담보</th>
											<th scope="col" rowspan="2">순번</th>
											<th scope="col" rowspan="2">피해자&#47;물</th>
											<th scope="col" rowspan="2">방어비용+벌금지원금</th>
											<th scope="col" colspan="2">형사합의지원금</th>
											<th scope="col" rowspan="2">처리지부</th>
											<th scope="col" rowspan="2">담당<br />부서</th>
											<th scope="col" colspan="2" class="brB1">담당자</th>
										</tr>
										<tr>
											<th scope="col">이름</th>
											<th scope="col">연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="detailList5" items="${detailList5 }" varStatus="varStatus" >
											<tr>
												<td>${detailList5.gb}</td>
												<td>${detailList5.dmbo_gb_nm }</td>
												<td>${detailList5.psn_num }</td>
												<td>${detailList5.dmgd_psn_nm }</td>
												<td><b><fmt:formatNumber value="${detailList5.jigub_amt }"  type="number" /></b></td>
												<td class="alR"><b><fmt:formatNumber value="${detailList5.jigub_amt1 }"  type="number" /></b></td>
												<td>${detailList5.jibu }</td>
												<td>${detailList5.pat }</td>
												<td>${detailList5.id }</td>
												<td>${detailList5.jibu_tel }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							
							</br>
							<c:if test="${detailList6 != null}">
								<div class="netsubBoth">
									<h4 class="netsubTit flL" ><span class="greenBul">자기신체사고 상세정보</span></h4>
								</div>
								<table class="tbWork_st01" id="detail6" summary="선택하신 사고 목록 상세보상내역 테이블 입니다.">
									<caption>사고목록 상세보상내역에 대해서 나타낸 표</caption>
									<colgroup>
										<col style="width:7%;" />
										<col style="width:4%;" />
										<col style="width:4%;" />
										<col style="width:16%;" />
										<col style="width:16%;" />
										<col style="width:14%;" />
										<col style="width:13%;" />
										<col style="width:13%;" />
										<col style="width:13%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">구분</th>
											<th scope="col" rowspan="2">담보</th>
											<th scope="col" rowspan="2">순번</th>
											<th scope="col" rowspan="2">피해자&#47;물</th>
											<th scope="col" rowspan="2">보상금액</th>
											<th scope="col" rowspan="2">처리지부</th>
											<th scope="col" rowspan="2">담당<br />부서</th>
											<th scope="col" colspan="2" class="brB1">담당자</th>
										</tr>
										<tr>
											<th scope="col">이름</th>
											<th scope="col">연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="detailList6" items="${detailList6 }" varStatus="varStatus" >
											<tr>
												<td>${detailList6.gb}</td>
												<td>${detailList6.dmbo_gb_nm }</td>
												<td>${detailList6.psn_num }</td>
												<td>${detailList6.dmgd_psn_nm }</td>
												<td><b><fmt:formatNumber value="${detailList6.jigub_amt }"  type="number" /></b></td>
												<td>${detailList6.jibu }</td>
												<td>${detailList6.pat }</td>
												<td>${detailList6.id }</td>
												<td>${detailList6.jibu_tel }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							
							<!-- 사고점수 -->
							<div class="accPoint">
								<dl>
									<dt class="bold">사고점수</dt>
									<dd class="accTxt01">사고점수사항은 전일까지의 점수이며&#44; 갱신계약시나 조회시점에 따라 할인&#44; 할증 및 특별할증 여부 등이 변동 될 수 있습니다&#46;</dd>
									<dd class="accTxt02">
										<table class="tbWork_st02" summary="사고점수사항 테이블 입니다">
											<caption>사고점수사항 내역에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:33%;" />
												<col style="width:34%;" />
												<col style="width:33%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">원인점수</th>
													<th scope="col">위장사고여부</th>
													<th scope="col" class="last">내용점수</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="point" items="${point }" varStatus="varStatus" >
													<tr>
														<td>${point.acdnt_cause_points }</td>
														<td>${point.trick }</td>
														<td class="last">${point.acdnt_comment_points }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</dd>
								</dl>
							</div>
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span id="goList" class="btn_pack btn_type14 icon"><span class="check"></span><a href="#;">목록</a></span>
							</div>
						</div><!--// 상세보상내역 e -->
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</fieldset>
		</form:form>
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>