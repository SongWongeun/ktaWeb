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
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){

	var mailAddr ="${mailAddr}";
	console.log(mailAddr);
	
	var param ='${param.code}'
	if(param == 'regist.success'){
		 alert('증명서가 메일로 발송되었습니다.');
	}
	
	<%-- 체크박스 전체선택 --%>
	$('form#boardForm input[name="allCheck"]').on('click',function(event){
		
		$('form#boardForm input[name="check"]').click();
		
	});
	
	$("input:radio[name=sendMail_yn]").click(function(){
		if($("input:radio[name=sendMail_yn]:checked").val()=='y'){
			$("#mailChk").show();
		}else{
			$("#mailChk").hide();
		}
	});
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
	
	<%-- datepicker 설정--%>
	$("#start_acdnt_ymd").datepicker({
			showOn : 'both',
			changeYear : true,
			changeMonth : true,
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
			      '7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
			showMonthAfterYear : true,
			dateFormat : 'yymmdd',
			buttonImageOnly : true,
			buttonImage : '/images/truck/board/calendar.gif',
			yearRange : (sYear-3)+':'+sYear
	});
	$("#end_acdnt_ymd").datepicker({
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
			buttonImage : '/images/truck/board/calendar.gif',
			yearRange : (sYear-3)+':'+sYear
	});
	
	<%-- 검색박스 엔터키 설정--%>
	$('form#f input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			search();
			return false;
		}
	});

	<%-- 조회기간년도세팅 --%>
	$('form#f select[name="year"]')
		.append('<option value="'+sYear+'" >'+sYear+'</option>')
		.append('<option value="'+(sYear-1)+'">'+(sYear-1)+'</option>')
		.append('<option value="'+(sYear-2)+'">'+(sYear-2)+'</option>')
		.append('<option value="'+(sYear-3)+'">'+(sYear-3)+'</option>')
		;
	<%-- 조회기간월 셋팅--%>
	for(var z=1;z<=12;z++){
		if(z == sMonth){
				$('form#f select[name="month"]')
					.append('<option value="'+z+'" >'+z+'</option>');
		}else{
				$('form#f select[name="month"]')
					.append('<option value="'+z+'">'+z+'</option>');
		}
	}
	
	<%-- 조회된 기간 셋팅--%>
	$('form#f select[name="year"] option[value="${fn:substring(searchVO.start_acdnt_ymd,0,4) }"]').attr('selected','selected');
	$('form#f select[name="month"] option:eq(${fn:substring(searchVO.start_acdnt_ymd,4,6) })').attr('selected','selected');

	<%-- 월별 조회 선택시 event --%>
	$('form#f select[name="year"], form#f select[name="month"]').on('change',function(event){
		var y = $('form#f select[name="year"] option:selected').val();
		var m = $('form#f select[name="month"] option:selected').val();
		if( y != '0000' && m != '00' ){
			if(m.length == 2){
				$("#start_acdnt_ymd").val( y+m+'01' );
				$("#end_acdnt_ymd").val( y+m+new Date( y, m, '').getDate()	);
			}else{
				$("#start_acdnt_ymd").val( y+'0'+m+'01' );
				$("#end_acdnt_ymd").val( y+'0'+m+new Date( y, m, '').getDate()	);
			}
		}
	});
	<%-- 조회 --%>
	$('a#f_submit').on('click',function(event){
		//event.preventDefault();
		search();
	});
	
	$('form#f input[name="searchKeyword"]').focus();
	
});

function printData(){
	var data = "";
	$('form#boardForm input[name="check"]:checked').each(function(){
		data += $(this).val()+",";
	});
	
	if(data == ""){
		if(!confirm("차량을 선택해주세요.")){
			return false;
		//}else{
		//	printAllCert();
		};
	}else if($('form#boardForm input#start_acdnt_ymd').val() == '' || 
			$('form#boardForm input#end_acdnt_ymd').val() == '' ){
		alert('납입 기준일을 입력해주세요.');
		return false;
	}else{
		printCert();
	}
	
}	
	
	
function printCert(){
	var use = document.boardForm.publish_use.value;
	var sDate = $("#end_datepicker").val();
	var eDate = $("#start_datepicker").val();
	if(use == null || use == ""){
		alert("발급용도를 입력해 주세요");
		return false;
	}
	
	//if(sDate == ""||eDate == ""){
	//	alert("검색 기준일을 선택해주세요");
	//	return false;		
	//}
	document.boardForm.car_gaip_no.value = "";
	document.boardForm.car_no_arr.value = "";
	document.boardForm.agent_no.value = "";
	document.boardForm.saupjang_seq.value = "";
	document.boardForm.action = "<c:url value='/netCounter/certService/printDivideCert.do'/>";
	
	$('form#boardForm input[name="check"]:checked').each(function(){
		var temp =  $(this).val().split('|');
		//document.boardForm.car_gaip_no.value += $(this).val()+",";
		document.boardForm.car_gaip_no.value += temp[0]+",";
		document.boardForm.car_no_arr.value += temp[1]+",";
		document.boardForm.agent_no.value += temp[2]+",";
		document.boardForm.saupjang_seq.value += temp[3]+",";
	});
	
	//if(document.boardForm.sendMail.value == "y"){
	if($("input:radio[name=sendMail_yn]:checked").val()=='y'){
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var email = boardForm.mailAddr.value;
		if (email == '' || !re.test(email)) {
			alert("올바른 이메일 주소를 입력하세요")
			return false;
		}
	}else{
		document.boardForm.target="certView";
		window.open("",'certView','toolbar=no,location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=900,height=1248 top=10 left=10');
	}
   	document.boardForm.submit();
	document.boardForm.target="";
	}

function printAllCert(){
	var use = document.boardForm.publish_use.value;
	var sDate = $("#end_datepicker").val();
	var eDate = $("#start_datepicker").val();
	if(use == null || use == ""){
		alert("발급용도를 입력해 주세요");
		return false;
	}
	//if(sDate == ""||eDate == ""){
	//	alert("검색 기준일을 선택해주세요");
	//	return false;		
	//}
	document.boardForm.action = "<c:url value='/netCounter/certService/printDivideCertAll.do'/>";
	document.boardForm.target="certView";
	window.open("",'certView','toolbar=no,location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=900,height=1248 top=10 left=10');
   	document.boardForm.submit();
	document.boardForm.target="";
}

/* pagination 페이지 링크 function */
function paginService(pageNo){
	var check = "${searchVO.searchKeyword}";
	if(check == ""){
		document.boardForm.searchKeyword.value="";
	}else{
		document.boardForm.searchCondition.value="1";
	}
		
	document.boardForm.target="";
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/netCounter/certService/saerchDivideCert.do'/>";
   	document.boardForm.submit();
}
function searchDivideCert(){
	document.boardForm.pageIndex.value = "0";
	document.boardForm.action = "<c:url value='/netCounter/certService/saerchDivideCert.do'/>";
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
 						<h2><img src="/images/truck/net/cer_tit.gif" alt="증명서발급" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<a href="/netCounter/certSerivce/certServiceIndex.do" >증명서발급</a>
						<span>공제분담금 납입증명서</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
				<form:form commandName="searchVO" name="boardForm" id="boardForm"  action="">
				<fieldset>
				<legend>공제분담금 납입증명서</legend>
				
				<input type="hidden" name="saupjang_seq" id="saupjang_seq"/>
				<input type="hidden" name="car_gaip_no" id="car_gaip_no"/>
				<input type="hidden" id="car_no_arr" name="car_no_arr"/>
				<input type="hidden" id="agent_no" name="agent_no"/>
				<input type="hidden" id="comment" name="comment" value=""/>
				<input type="hidden" id="searchCondition" name="searchCondition" value=""/>
				<input type="hidden" name="basic_date" id="basic_date" value="<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" />"/>
				<div class="conSection clfix">
					<p class="confirTit"><img src="/images/truck/net/service_tit06.gif" alt="공제분담금납입증명서 가입사실증명서 발급 서비스 입니다 용도 및 기타 내용을 작성하고 차량을 선택하여 발급하기 버튼을 클릭해 주시기 바랍니다" /></p>
						 <div class="searchBox05 clfix">
								<!-- 검색 -->
								<div class="searchUp">
									<div class="searchC">
										<dl>
											<dt>납입 기준일</dt>
											<dd>
												<label for="start_acdnt_ymd" class="hide">시작날짜</label>
												<input type="text" value="${searchVO.start_acdnt_ymd }" id="start_acdnt_ymd" name="start_acdnt_ymd" readonly="true" title="시작날짜" style="width:95px;" class="alC" />
												&#126;
												<label for="end_acdnt_ymd" class="hide">종료날짜</label>
												<input type="text" value="${searchVO.end_acdnt_ymd }" id="end_acdnt_ymd" name="end_acdnt_ymd" readonly="true" title="종료날짜" style="width:95px;" class="alC" />
											</dd>
										</dl>
									</div>
										
									<div class="option5">
										<dl>
											<dt>차량번호</dt>
											<dd>
												<label for="search" class="hide">검색키워드</label><form:input path="searchKeyword" id="searchKeyword" name="searchKeyword" title="차량번호를 입력해주세요" class="txt" style="width:150px" type="text" onkeydown="if(event.keyCode==13)searchBidBoard()" />
											</dd>
											<dd>
												<div class="btn_srch">
													<span class="btn_pack btn_type04" style="vertical-align:middle !important;"><a href="#;" onclick="searchDivideCert(); return false;" class="bold">검색하기</a></span>
												</div>
											</dd>
										</dl>
									</div>
								</div>
							</div><!--// 증명서검색 e -->
						<table class="tbWork_st01" summary="가입중인 차량현황입니다..">
							<caption>적재물 공제 계약에 대해서 나타낸 표</caption>
							<colgroup>
								<col style="width:10%;" />
								<col style="width:30%;" />
								<col style="width:30%;" />
								<col style="width:30%;" />
								<%-- <col style="width:13%;" /> --%>
							</colgroup>
							<thead>
								<tr>
									<!-- <th scope="col">순번</th> -->
									<th scope="col" class="first"><label for="allCheck" class="hide">선택</label>
									<input type="checkbox" name="allCheck" id="allCheck" value="0"/>
									</th>
																		
									<th scope="col">가입번호</th>
									<th scope="col">차량번호</th>
									<th scope="col">차대번호</th>
									<!-- <th scope="col">증명서</th> -->
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ not empty carStatusList}">
										<c:forEach var="result" items="${carStatusList}" varStatus="status">
										 	<tr>		  			    
												<%-- <td class="listCenter" nowrap>
												<c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/>
												</td> --%>										 		
										 		<td	class="listCenter" nowrap>
										 		<label for="" class="hide">선택</label><input type="checkbox" name="check" value="${result.CAR_GAIP_NO}|${result.CAR_NO}|${result.AGENT_NO}|${result.SAUPJANG_SEQ}"/>
										 		</td>
										 		
										 		
										 		<td class="listCenter" nowrap>${result.CAR_GAIP_NO}</td>
										    	<td class="listCenter" nowrap>${result.CAR_NO}</td>
									      		<td class="listCenter" nowrap>${result.CAR_BODY_NO}</td>
										      	<%-- <td class="listCenter" nowrap>
										      	<span class="btn_pack btn_type09 icon"><span class="ser"></span>
										      		<a href="#;" onclick="printCert('${result.CAR_GAIP_NO}');" class="btn_cer">
										      		발급받기</a></span>
										      	</td>   --%> 			    
										  	</tr>
										 </c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="6">검색해주세요.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<!-- paging s -->
						<div class="paging">
							<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paginService" />
							<form:hidden path="pageIndex" />
						</div>
						<!--// paging e -->	
						<%-- <div class="searchBox04 clfix">
							<!-- 용도 -->
							<div class="searchUp03">
								<div class="searchL">
									<dl>
										<dt>용도</dt>
										<dd>
										<form:select path="publish_use" title="publish_use" id="publish_use" name="" style="width:300px;">
										<form:option value="세무서제출용">세무서제출용</form:option>
										<form:option value="가입확인용">가입확인용</form:option>
										<form:option value="대폐차등록용">대폐차등록용</form:option>
										<form:option value="보험제출용">보험제출용</form:option>
										<form:option value="거래처제출용">거래처제출용</form:option>
										<form:option value="계약확인용">계약확인용</form:option>
										<form:option value="경찰서제출용">경찰서제출용</form:option>
										<form:option value="확인용">확인용</form:option>
										</form:select>
										</dd> 
									</dl>
								</div>
								<div class="btn_srch">
									<span class="btn_pack btn_type04" style="vertical-align:middle !important;"><a href="#;" onclick="printData();" class="bold">발급하기</a></span>
								</div>
							</div>
						</div> --%>
						<div class="searchBox04 clfix">
							<!-- 용도 -->
							<div class="searchUp03" style="width:900px !important;padding-left:70px;">
								<div class="searchL">
									<table class="tbView_st02" summary="출력 옵션 선택 테이블 입니다." style="width:700px;border:1px solid #e4ebee !important">
											<caption>증명서 출력 옵션 선택용 표</caption>
											<colgroup>
												<col style="width:15%;" />
												<col style="width:35%;" />
												<col style="width:15%;" />
												<col style="width:35%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="bB1">용도</th>
													<th scope="col" style="background-color:white;">
														<form:select path="publish_use" title="publish_use" id="publish_use" name="" style="width:200px;height:30px;">
															<form:option value="세무서제출용">세무서제출용</form:option>
															<form:option value="보험가입 확인용">보험가입 확인용</form:option>
															<form:option value="대폐차등록용">대폐차등록용</form:option>
															<form:option value="보험제출용">보험제출용</form:option>
															<form:option value="거래처제출용">거래처제출용</form:option>
															<form:option value="계약확인용">계약확인용</form:option>
															<form:option value="경찰서제출용">경찰서제출용</form:option>
															<form:option value="확인용">확인용</form:option>
														</form:select>
													</th>
													<th scope="col" class="bB1">발급방법 선택</th>
													<th scope="col" style="background-color:white;">
														<form:radiobutton path="sendMail_yn" value="n" id="sendDirect" type="radio" checked="checked" /><label for="sendDirect" style="margin:10px;">직접 출력</label>
														<form:radiobutton path="sendMail_yn" value="y" id="sendMail" type="radio" style="margin-left:10px;"/><label for="sendMail" style="margin:10px;">이메일 발송</label>
													</th>
												</tr>
											</thead>
											<tbody>
												<tr id="mailChk" style="display:none;">
													<td style="color:#23618c;background-color:#f7f7f7f7;">이메일주소</td>
													<td colspan="3"><form:input path="mailAddr" type="text" value="${mailAddr}" placeholder="등록된 메일주소가 없습니다. sample@naver.com 형식으로 입력해주세요." style="width:95%;height:30px;"></form:input></td>
												</tr>
												<tr>
													<td colspan="4" >
													<img src="/images/truck/net/certificate_guide.jpg" alt="증명서 출력 안내" style="cursor:default;" />
													<p class="mA0">01 증명서 발급은 PDF 뷰어가 정상적으로 PC에 설치되어야 출력이 가능합니다.</p>
													<p class="mA0">02 PDF 뷰어 프로그램 설치는 아래 설치 링크를 통해 설치하시기 바랍니다. </p>
													<p class="mA0">03 미리보기 화면에서 PDF 파일로 저장 후 출력이 가능합니다. </p>
													<p class="mA0">04 다운로드 받은 PDF 파일은 암호화 되어있으며, <b>비밀번호는 사업자번호 10자리</b> 입니다.</p>
													</td>
												</tr>
												<tr>
													<td colspan="4" style="border-bottom:1px solid #e4ebee;">
														<a href="http://get.adobe.com/kr/reader/" target="_blank" title="새창열림">
															<img src="/images/truck/net/secure_mail_acrobat.jpg" alt="아크로뱃 리더 프로그램을 PC에 설치하시기 바랍니다" />
														</a>
													</td>
												</tr>
											</tbody>
										</table>
								</div>
								<div class="btn_srch" style="margin-top:20px;">
									<span class="btn_pack btn_type04" style="vertical-align:middle !important;"><a href="#;" onclick="printData();" class="bold">발급하기</a></span>
								</div>
							</div>
						</div>
						<ul class="txtListst01">
							<li>증명서 발급은 현재 계약이 유지중이거나 미도래된 차량만 가능하며, 과거 계약건이 필요한경우 각 지부 계약 담당자를 통해 발급이 가능합니다&#46;</li>
						</ul>
					</div><!--// 현재 가입중인 차량현황 e -->
					</fieldset>
					</form:form>
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


<%--
<input type="button" value="증명서발급" onclick="window.open('/netCounter/certServiceView.do?rebFileName=sample','증명서발급','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=1050,height=1485 top=10 left=10')" >
<input type="button" value="markAny" onclick="window.open('/netCounter/certServiceView.do?rebFileName=markany','증명서발급','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=1050,height=1485 top=10 left=10')" >
<input type="button" value="test3" onclick="window.open('/netCounter/certServiceView.do?rebFileName=test3','증명서발급','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=1050,height=1485 top=10 left=10')" >
--%>