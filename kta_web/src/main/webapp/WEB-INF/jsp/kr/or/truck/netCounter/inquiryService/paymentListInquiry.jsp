<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" />  -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>

<link rel="stylesheet" href="/webPonent-Grid/css/webponent.grid.css" /> <!-- 그리드 -->
<link rel="stylesheet" href="/webPonent-Grid/css/webponent.grid.flat.css" /> <!-- 그리드 -->
<script src="/webPonent-Grid/external/jquery-1.11.1.min.js"></script> <!-- 그리드 -->
<script src="/webPonent-Grid/external/jquery-ui-1.10.3.custom.min.js"></script> <!-- 그리드 -->
<script src="/webPonent-Grid/external/jquery.mousewheel.min.js"></script> <!-- 그리드 -->
<script src="/webPonent-Grid/external/underscore-min.js"></script> <!-- 그리드 -->
<script src="/webPonent-Grid/webponent.grid.js"></script> <!-- 그리드 -->
<script src="/webPonent-Grid/webponent.report.js"></script> <!-- 엑셀&pdf -->
<script src="/webPonent-Grid/external/json2.min.js"></script> <!-- 엑셀&pdf -->
<script src="/webPonent-Grid/external/lz-string.js"></script> <!-- 엑셀&pdf -->

<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
	
	var nowday = a.getDate();
	if(nowday.toString().length == '1'){
		nowday = '0'+nowday;
	}
	
	if('${searchVO.searchRecentDate}' == 'six'){

		var b = new Date(sYear,sMonth-6,'');
		var searchYear = b.getFullYear();
		var searchMonth = b.getMonth()+1;
		if(searchMonth.toString().length == '2'){
			$("#start_datepicker").val( searchYear+''+searchMonth+nowday-1 );
		}else{
			$("#start_datepicker").val( searchYear+'0'+searchMonth+nowday-1 );
		}
		
		if(sMonth.toString().length == '2'){
		$("#end_datepicker").val( sYear+''+sMonth+''+nowday	);
		}else{
		$("#end_datepicker").val( sYear+'0'+sMonth+''+nowday );
		}
	}
	
	$("form#boardForm [name='searchRecentDate']").on('change',function(event){
		var cal = ($(this).val());

		if(sMonth.toString().length == '2'){
			$("#end_datepicker").val( sYear+''+sMonth+''+nowday	);
		}else{
			$("#end_datepicker").val( sYear+'0'+sMonth+''+nowday );
		}
		
		if(cal == 'one'){
			var b = new Date(sYear,sMonth-1,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+''+searchMonth+nowday-1);
			}else{
				$("#start_datepicker").val( searchYear+'0'+searchMonth+nowday-1);
			}
		}else if(cal == 'two'){
			var b = new Date(sYear,sMonth-2,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+''+searchMonth+nowday-1);
			}else{
				$("#start_datepicker").val( searchYear+'0'+searchMonth+nowday-1);
			}
			
		}else if(cal == 'three'){
			var b = new Date(sYear,sMonth-3,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+''+searchMonth+nowday-1);
			}else{
				$("#start_datepicker").val( searchYear+'0'+searchMonth+nowday-1);
			}
			
		}else if(cal == 'six'){
			var b = new Date(sYear,sMonth-6,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+''+searchMonth+nowday-1 );
			}else{
				$("#start_datepicker").val( searchYear+'0'+searchMonth+nowday-1 );
			}
			
		}else if(cal == 'year'){
			var b = new Date(sYear,sMonth-12,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+''+searchMonth+nowday-1);
			}else{
				$("#start_datepicker").val( searchYear+'0'+searchMonth+nowday-1);
			}
			
		}else if(cal =='${curYear}'){
			var curYear = '${curYear}';
			$("#start_datepicker").val(curYear+'0101');
			$("#end_datepicker").val( curYear+'1231');
		}else if(cal == '${lastYear}'){
			var lastYear = '${lastYear}';
			$("#start_datepicker").val(lastYear+'0101');
			$("#end_datepicker").val(lastYear+'1231');
		}
	});
	
	
	<%-- 월별 조회 선택시 event --%>
	$('form#boardForm input[name="junpyo_symd"], form#boardForm input[name="junpyo_eymd"]').on('change',function(event){
		$("form#boardForm input[name='searchRecentDate']").attr("checked",false);
	});
	
});

//검색일자 선택 
$(function() {
  $("#start_datepicker").datepicker({
		  showOn : 'both',
          changeYear : true,
          changeMonth : true,
          monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
                '7월', '8월', '9월', '10월', '11월', '12월' ],
          dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
          showMonthAfterYear : true,
          dateFormat : 'yymmdd',
          buttonImageOnly : true,
          buttonImage : '/images/truck/board/calendar.gif'
  		});
 });
$(function() {
 $("#end_datepicker").datepicker({
		  showOn : 'both',
	      defaultDate : "+1w",
	      changeYear : true,
	      changeMonth : true,
	      monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
	            '7월', '8월', '9월', '10월', '11월', '12월' ],
	      dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
	      showMonthAfterYear : true,
	      dateFormat : 'yymmdd',
	      buttonImageOnly : true,
	      buttonImage : '/images/truck/board/calendar.gif'
		});
});

function goIndex() {
	document.location.href = "/main/index.do";
}

function searchPaymentList(){
	
	
	if( $("#start_datepicker").val() >= $("#end_datepicker").val() ){
		alert('검색 시작일이 종료일 보다 작아야합니다.  ');
		return false;
	}
	
	var tSY = $("#start_datepicker").val().substr(0,4);
	var tSM = $("#start_datepicker").val().substr(4,2);
	var tEY = $("#end_datepicker").val().substr(0,4);
	var tEM = $("#end_datepicker").val().substr(4,2);
	
	var sDate = new Date(tSY,Number(tSM)-1);
	var eDate = new Date(tEY,Number(tEM)-1);
	var betweenMonth = ( eDate.getFullYear() - sDate.getFullYear()) * 12 + eDate.getMonth() - sDate.getMonth();
	
	if( (betweenMonth < 0) || (betweenMonth > 12)){
		alert("기간별 검색은 1년 이내만 가능합니다.");
		
		return false;
	}
	
	
	document.boardForm.action = "<c:url value='/netCounter/inquiryService/accountInquiry/paymentListInquiry.do'/>";
   	document.boardForm.submit();
}

function printDocument(){
	if(document.boardForm.searchRecentDate.value == ""){
		document.boardForm.searchRecentDate.value = "0";
	}
	document.boardForm.action = "<c:url value='/netCounter/certSerivce/certServiceView.do'/>";
	document.boardForm.target="certView";
	window.open("",'certView','toolbar=no,location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=1500,height=800 top=10 left=10');
   	document.boardForm.submit();
   	document.boardForm.target='';
}

function printJasper(){
	if(document.boardForm.searchRecentDate.value == ""){
		document.boardForm.searchRecentDate.value = "0";
	}
	document.boardForm.action = "<c:url value='/netCounter/inquiryService/accountInquiry/paymentListJasper.do'/>";
	document.boardForm.target="certView";
	window.open("",'certView','toolbar=no,location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=1150,height=800 top=10 left=10');
   	document.boardForm.submit();
   	document.boardForm.target='';
}

function goPage(pageNo){
	
	document.boardForm.pageIndex.value = pageNo;
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
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/pay_tit.gif" alt="지급내역조회" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<span>지급내역조회</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/pay_con_tit.gif" alt="본 조회 서비스는 거래처를 위한 업무지원서비스 입니다 조회내용과 실지급내역이 상이한 경우에는 해당지부 경리과로 문의하시기 바랍니다" /></p>
					<div class="conSection clfix">
					<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post" action="">
					<fieldset>
					<legend>게시글리스트</legend>
					<input type="hidden" name="resultXML" value="${report}"/>
					<input type="hidden" name="articleNo" />
					<input type="hidden" name="rebFileName" value="paymentList"/>
					<input type="hidden" name="symd" value="${symd}"/>
					<input type="hidden" name="eymd" value="${eymd}"/>
						<!-- 지급내역검색 s -->
						<div class="netsubBoth clfix">
							<h4 class="netsubTit flL" ><span class="blueBul">지급내역검색</span></h4>
							<div class="flR">
								<span class="txtPoint06">조회기간은 최대 1년까지 가능합니다&#46;</span>
							</div>
						</div>
						<div class="searchBox02 clfix mB30">
							<!-- 기간별조회 -->
							<div class="searchUp">
								<div class="searchL">
									<dl>
										<dt>기간별조회</dt>
										<dd>
											<label for="startdate" class="hide">시작날짜</label><form:input type="text" path="junpyo_symd" id="start_datepicker" readonly="true" title="시작날짜" style="width:95px;" class="alC" />
											&#126;
											<label for="enddate" class="hide">종료날짜</label><form:input type="text" path="junpyo_eymd" id="end_datepicker" readonly="true" title="종료날짜" style="width:95px;" class="alC" />
										</dd>
									</dl>
								</div>
								<div class="beforeDate">
									<ul>
										<li><form:radiobutton path="searchRecentDate" value="one" id="month1" name="month" type="radio" /><label for="month1">최근1개월</label></li>
										<li><form:radiobutton path="searchRecentDate" value="two" id="month2" name="month" type="radio" /><label for="month2">최근2개월</label></li>
										<li><form:radiobutton path="searchRecentDate" value="three" id="month3" name="month" type="radio" /><label for="month3">최근3개월</label></li>
										<li><form:radiobutton path="searchRecentDate" value="six" id="month6" name="month" type="radio" /><label for="month6">최근6개월</label></li>
										<li><form:radiobutton path="searchRecentDate" value="year" id="year1" name="year" type="radio" /><label for="year1">1년</label></li>
									</ul>
								</div>
							</div>
							<!-- 조회지부선택 -->
							<div class="searchDown">
								<div class="searchL">
									<dl>
										<dt><label for="">조회 지부를 선택하세요</label></dt>
										<dd>
											<form:select path="jibu_cd"  name="" id="" title="조회 지부를 선택" style="width:100px;" class="sel">
											<form:option selected="selected" value="">전체</form:option>
											<form:option value="0201">서울</form:option>
											<form:option value="0301">부산</form:option>
											<form:option value="0401">대구</form:option>
											<form:option value="0501">인천</form:option>
											<form:option value="0701">대전</form:option>
											<form:option value="0801">울산</form:option>
											<form:option value="0901">경기</form:option>
											<form:option value="1001">강원</form:option>
											<form:option value="1101">충북</form:option>
											<form:option value="1201">충남</form:option>
											<form:option value="1301">전북</form:option>
											<form:option value="1401">전남</form:option>
											<form:option value="1501">경북</form:option>
											<form:option value="1601">경남</form:option>
											<form:option value="1701">제주</form:option>
											</form:select>지부
										</dd>
									</dl>
								</div>
								<div class="beforeDate" style="margin-left: 22px;">
									<ul>
										<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<form:radiobutton path="searchRecentDate" value="${curYear}" id="curYear" type="radio" /><label for="curYear">${curYear}년</label></li>
										<li>
										<form:radiobutton path="searchRecentDate" value="${lastYear}" id="lastYear" type="radio" /><label for="lastYear">${lastYear}년</label></li>
									</ul>
								</div>
								<!-- 검색버튼 -->
								<div class="btn_absol">
									<span class="btn_pack btn_type04"><a href="#;" onclick="searchPaymentList(); return false;" class="bold">검색하기</a></span>
								</div>
							</div>
						</div>
						<div class="netsubBoth clfix" style="margin: -30px 0 30px 0;">
							<div class="flL">
								<span class="txtPoint06">1년 단위 조회시 다소 시간이 지체될 수 있습니다.( 1~2분 )&#46;</span>
							</div>
						</div>
						
						
						<!--// 지급내역검색 e -->
						<!-- 지급상세내역 s -->
						<div class="alR mT25 mB5">
							<h4 class="netsubTit flL" ><span class="greenBul">지급상세내역</span></h4>
							<!-- 인쇄하기버튼 -->
							<div class="btn_absol">
								<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="javascript:;" onclick="printJasper();return false;"title="새창열림" >인쇄하기</a></span>
								<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="javascript:;" id="exportGridEx" title="새창열림" >EXCEL</a></span>
								<!-- <span class="btn_pack btn_type13 icon"><span class="print"></span><a href="javascript:;" id="exportGridPdf" title="새창열림" >PDF</a></span> -->
							</div>
						</div>
						
						<div class="tbWork1">
							<div id="grid-paymentList">
								<table>
									<thead>
										<tr>
											<th>지급일자</th>
											<th>지부명</th>
											<th>사고번호</th>
											<th>사고일자</th>
											<th>조합원명</th>
											<th>차량번호</th>
											<th>피해자&#47;물</th>
											<th>금액</th>
											<th>갑근세</th>
											<th>주민세</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${resultList != null }">
										<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<fmt:parseDate value="${result.junpyo_ymd}" var="dateFmt" pattern="yyyymmdd"/>
											<td><fmt:formatDate value="${dateFmt}" pattern="yyyy.mm.dd"/></td>
											<td><c:out value="${result.jibu_nm}"/></td>
											<td><c:out value="${fn:substring(result.sago_no,0,4) }-${fn:substring(result.sago_no,4,9) }"/></td>
											<td><c:out value="${result.sago_ymd}"/></td>
											<td><c:out value="${result.johabwon}"/></td>
											<td><c:out value="${result.car_no}"/></td>
											<td><c:out value="${result.pihaeja}"/></td>
											<td style="text-align:right !important;">
											<c:if test="${not empty result.tot_amt}"><fmt:formatNumber value="${result.tot_amt}"  type="number" />원</c:if>
											<c:if test="${empty result.tot_amt}">0원</c:if>
											</td>
											<td style="text-align:right !important;">
											<c:if test="${not empty result.revenue}"><fmt:formatNumber value="${result.revenue}"  type="number" />원</c:if>
											<c:if test="${empty result.revenue}">0원</c:if>
											</td>
											<td style="text-align:right !important;">
											<c:if test="${not empty result.inhabit}"><fmt:formatNumber value="${result.inhabit}"  type="number" />원</c:if>
											<c:if test="${empty result.inhabit}">0원</c:if>
											</td>
										</tr>
										</c:forEach>
										</c:if>
										<c:if test="${empty resultList  }">
										<tr>
											<td colspan="10">조회할 기간을 선택후 검색하여 주세요.</td>
										</tr>
										</c:if>
									</tbody>
								</table>
								</div>
								<div id="grid-paymentListTemp" style="display:none;">
									<table width = "100%">
										<thead>
											<tr>
												<th name="junpyo_ymd" align="center" width="9%">지급일자</th>
												<th name="jibu_nm" align="center" width="9%">지부명</th>
												<th name="sago_no" align="center" width="9%">사고번호</th>
												<th name="sago_ymd" align="center" width="9%">사고일자</th>
												<th name="johabwon" align="center" width="12%">조합원명</th>
												<th name="car_no" align="center" width="13%">차량번호</th>
												<th name="pihaeja" align="center" width="12%">피해자&#47;물</th>
												<th name="tot_amt" align="center" width="9%">금액</th>
												<th name="revenue" align="center" width="9%">갑근세</th>
												<th name="inhabit" align="center" width="9%">주민세</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td name="junpyo_ymd" bind="junpyo_ymd"></td>
												<td name="jibu_nm" bind="jibu_nm"></td>
												<td name="sago_no" bind="sago_no"></td>
												<td name="sago_ymd" bind="sago_ymd"></td>
												<td name="johabwon" bind="johabwon"></td>
												<td name="car_no" bind="car_no"></td>
												<td name="pihaeja" bind="pihaeja"></td>
												<td name="tot_amt" bind="tot_amt"></td>
												<td name="revenue" bind="revenue"></td>
												<td name="inhabit" bind="inhabit"></td>
											</tr>
										</tbody>
									</table>
								</div>

								<script>
								    var table = $('#grid-paymentList');
								    var template = $('#grid-paymentListTemp');
							        var grid = webponent.grid.init(table, template, {
								        paging: {
								        	countPerPage : 10,
			                                paginationCount : 10,
			                                freezeScrollerY : 'hide'
								        }
							        });
							        grid.makePageList();
							        
							        var da = grid.getData();
								    console.log(da);
							        if(da.length == 0) {
							        	grid.markup.main.body.wrapper.style.display='none';
							        }
							        
							        $("#exportGridEx").click(function(){
							            var option = {
							                fileName: "지급내역",
							                sheetName: "전체"
							            };
							            webponent.report.excel(grid, $('#export-form'), option);
							        });
							        
							        $("#exportGridPdf").click(function () {
							            var option = {
							                drawArea: grid,
							                fileName: '지급내역',
							                stylesheet: [
							                    '/webPonent-Grid/css/webponent.grid.css',
							                    '/webPonent-Grid/css/webponent.grid.flat.css',
							                    '/webPonent-Grid/css/report.view.css']
							            };
							            webponent.report.pdf($('#export-form'), option);
							        });
							        
							   </script>
							
							<div class="netsubBoth clfix">
								<div class="flL">
									<span class="txtPoint06">지급내역은 2002년 이후부터 조회가 가능하며, 위의 지급일자와 실제 지급일자는 약간의 차이가 발생할 수 있습니다.</span>
									<span class="txtPoint06" style="margin-top: 0;" >본 조회 서비스는 거래처를 위한 업무지원 서비스입니다. 조회내용과 실지급 내역이 상이한 경우에는 해당지부 경리과로 문의하시기 바랍니다.</span>
									<!-- <span class="txtPoint06" style="margin-top: 0;" >세무서 신고용 원천징수영수증은 해당지부 경리과로 문의하시기 바랍니다.</span> -->
								</div>
							</div>
							<!-- paging s -->
							<%-- <div class="paging">
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="goPage" />
								<form:hidden path="pageIndex" />
							</div> --%><!--// paging e -->
						</div><!--// 지급상세내역 e -->
						</fieldset>
						</form:form>
						
						<form id="export-form" style="display: none;"></form>
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
	</div>
</body>
</html>
