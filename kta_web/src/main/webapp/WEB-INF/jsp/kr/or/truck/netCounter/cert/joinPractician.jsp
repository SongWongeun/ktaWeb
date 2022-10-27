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
	
	var param ='${param.code}'
	if(param == 'regist.success'){
		 alert('증명서가 메일로 발송되었습니다.');
	}
	
	<%-- 체크박스 전체선택 --%>
	$('form#f input[name="allCheck"]').on('click',function(event){
		
		$('form#f input[name="check"]').click();
		
	});
	
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
	

	$("form#f [name='searchRecentDate']").on('change',function(event){
		var cal = ($(this).val());

		if(sMonth.toString().length == '2'){
			$("#end_datepicker").val( sYear+''+sMonth+''+a.getDate()	);
		}else{
			$("#end_datepicker").val( sYear+'0'+sMonth+''+a.getDate() );
		}
		
		if(cal == 'one'){
			var b = new Date(sYear,sMonth-1,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+''+searchMonth+a.getDate());
			}else{
				$("#start_datepicker").val( searchYear+'0'+searchMonth+a.getDate());
			}
		}else if(cal == 'three'){
			var b = new Date(sYear,sMonth-3,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+''+searchMonth+a.getDate());
			}else{
				$("#start_datepicker").val( searchYear+'0'+searchMonth+a.getDate());
			}
			
		}else if(cal == 'six'){
			var b = new Date(sYear,sMonth-6,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+''+searchMonth+a.getDate() );
			}else{
				$("#start_datepicker").val( searchYear+'0'+searchMonth+a.getDate() );
			}
			
		}
	});
	
	$("input:radio[name=sendMail_yn]").click(function(){
		if($("input:radio[name=sendMail_yn]:checked").val()=='y'){
			$("#mailChk").show();
		}else{
			$("#mailChk").hide();
		}
	});
	
});
	
	
//검색일자 선택 
$(function() {
  $("#start_datepicker").datepicker({
		  showOn : 'both',
          defaultDate : "+1w",
          changeYear : true,
          changeMonth : true,
          monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
                '7월', '8월', '9월', '10월', '11월', '12월' ],
          dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
          showMonthAfterYear : true,
          selectOtherMonths: true,
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
          selectOtherMonths: true,
	      dateFormat : 'yymmdd',
	      buttonImageOnly : true,
	      buttonImage : '/images/truck/board/calendar.gif'
		});
});
function goPage(pageNo){
	var check = "${searchVO.searchKeyword}";
	if(check == ""){
		document.f.searchKeyword.value="";
	}
	document.f.target="";
	document.f.pageIndex.value = pageNo;
	document.f.submit();
}

function printDocument(){
	document.f.car_gaip_no.value = "";
	document.f.gyeyak_no.value = "";
	document.f.car_no.value = "";
	document.f.action = "<c:url value='/netCounter/certService/printJoinPractician.do'/>";
	var use = document.f.publish_use.value;
	if(use == null || use == ""){
		alert("발급용도를 입력해 주세요");
		return false;
	}

	var i = 0;
	
	$('form#f input[name="check"]:checked').each(function(){
		var temp =  $(this).val().split('|');
		document.f.car_gaip_no.value += temp[0]+",";
		document.f.gyeyak_no.value += temp[1]+",";
		document.f.car_no.value += temp[2]+",";
		/* document.f.car_gaip_no.value += $(this).val().split('|')+",";
		document.f.gyeyak_no.value += $(this).val()+","; */
	});
	if(document.f.car_gaip_no.value ==""){
		alert("계약번호를 선택하세요.");
		return false;
	}
	
	//if(document.f.sendMail_yn.value == "y"){
	if($("input:radio[name=sendMail_yn]:checked").val()=='y'){
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var email = f.mailAddr.value;
		if (email == '' || !re.test(email)) {
			alert("올바른 이메일 주소를 입력하세요")
			return false;
		}	
	}else{
		document.f.target="certView";
		window.open("",'certView','toolbar=no,location=no,status=no,menubar=no, scrollbars=no,resizable=yes,width=900px,height=1548px, top=10, left=10');
	}
	
	document.f.submit(); ;
	document.f.target="";
}

function searchJoinPractician(){
	document.f.pageIndex.value = "0";
	document.f.action = "<c:url value='/netCounter/certService/searchJoinPractician.do'/>";
   	document.f.submit();
}

function removeRecent(){
	$("input:radio").attr("checked", false).checkboxradio("refresh"); 
}
<%--function goIndex() {
	document.location.href = "/main/index.do";
}
function detailList(acdnt_no) {
	document.f.acdnt_no.value=acdnt_no;
	document.f.action = "<c:url value='/netCounter/inquiryService/accListInquiry/accCarListInquiryDetail.do'/>";
   	document.f.submit();
}--%>
</script>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<form:form commandName="searchVO" id="f" name="f" method="post" action="" >
		<fieldset>
		<legend>공제가입사실증명서</legend>
		<input type="hidden" id="car_gaip_no" name="car_gaip_no"/>
		<input type="hidden" id="gyeyak_no" name="gyeyak_no"/>
		<input type="hidden" id="car_no" name="car_no"/>
		<input type="hidden" id="comment" name="comment" value=""/>
		<input type="hidden" name="basic_date" id="basic_date" value="<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" />"/>
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
						<span>공제가입사실증명서 종사자재해</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<div class="conSection clfix">
						<p class="confirTit"><img src="/images/truck/net/service_tit07.gif" alt="종사자재해 가입사실증명서 발급 서비스 입니다 용도 및 기타 내용을 작성하고 차량을 선택하여 발급하기 버튼을 클릭해 주시기 바랍니다" /></p>
						<div class="searchBox05 clfix">
							<!-- 업무구분&공고명 -->
							<div class="searchUp">
								<div class="option">
									<dl>
										<!-- <dd>
										<form:select path="searchCondition" id="" name="" title="검색조건" style="width:140px;">
										<form:option value="car_no">차량번호</form:option>
										<form:option value="gyeyak_no">계약번호</form:option>
										</form:select>
										</dd> -->
										<dt>차량번호</dt>
										<dd>
											<label for="search" class="hide">검색키워드</label><form:input path="searchKeyword" id="searchKeyword" name="searchKeyword" title="차량번호를 입력해주세요" class="txt" style="width:150px" type="text" onkeydown="if(event.keyCode==13)searchBidBoard()" />
										</dd>
										
										<dt>계약기간</dt>
										<div class="date">
											<dd>
												<ul>
													<li onclick="removeRecent()"><label for="start_datepicker" class="hide">시작날짜</label><form:input type="text" path="searchStartDetailDate" id="start_datepicker" name="startdate" readonly="true" title="시작날짜" class="alC" /></li>
													<li>~</li>
													<li class="pR45" onclick="removeRecent()"><label for="end_datepicker" class="hide">종료날짜</label><form:input type="text" path="searchEndDetailDate" id="end_datepicker" name="enddate" readonly="true" title="종료날짜" class="alC" /></li>
													<!-- <li><form:radiobutton path="searchRecentDate" value="one" id="month1" type="radio" /><label for="month1">최근1개월</label></li>
													<li><form:radiobutton path="searchRecentDate" value="three" id="month3" type="radio"/><label for="month3">최근3개월</label></li>
													<li><form:radiobutton path="searchRecentDate" value="six" id="month6" type="radio" /><label for="month6">최근6개월</label></li> -->
												</ul>
											</dd>
										</div>
										<dd>
											<div class="btn_srch">
												<span class="btn_pack btn_type04" style="vertical-align:middle !important;"><a href="#;" onclick="searchJoinPractician(); return false;" class="bold">검색하기</a></span>
											</div>
										</dd>
									</dl>
								</div>
							</div>
								<!-- <div class="keywords">
									<dl>
										
										
									</dl>
									<dl>
										
									</dl>
								</div>
								<div class="date">
									
								</div>
							</div> -->
							<!-- 날짜&기간검색
							<div class="searchDown">
								
							</div> -->
						</div><!--// 증명서검색 e -->

						<div class="bbsList1">
							<table class="tbWork_st01" summary="공제가입사실증명서 종사자재해">
								<caption>통합공제 게시판</caption>
								<colgroup>
									<col style="width:8%;" />
									<col style="width:10%;" />
									<col style="width:15%;" />
									<col style="width:20%;" />
									<col style="width:47%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><label for="allCheck" class="hide">선택</label><input type="checkbox" name="allCheck" id="allCheck" value="0"/></th>
										<th scope="col">상태</th>
										<th scope="col">차량번호</th>
										<th scope="col">계약번호</th>
										<th scope="col" class="last">계약기간</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
										<c:when test="${ not empty resultList }">
											<c:forEach var="result" items="${resultList}" varStatus="status">
											 	<tr>		  
											 		<td	class="listCenter" nowrap>
											 		<label for="" class="hide">선택</label><input type="checkbox" name="check" value="${result.CAR_GAIP_NO}|${result.GYEYAK_NO}|${result.CAR_NO}"/>
											 		</td>		
											 		<c:choose>  
												 		<c:when test="${result.GYEYAK_STATE_NM == '유지'}">  
													    	<td class="listCenter" nowrap style="color:blue;">
													    	${result.GYEYAK_STATE_NM}											    	
													    	</td>
												    	</c:when>
												 		<c:when test="${result.GYEYAK_STATE_NM == '해지'}">  
													    	<td class="listCenter" nowrap style="color:red;">
													    	${result.GYEYAK_STATE_NM}											    	
												    		</td>
												    	</c:when>
												 		<c:otherwise>  
													    	<td class="listCenter" nowrap >
													    	${result.GYEYAK_STATE_NM}											    	
													    	</td>
												    	</c:otherwise>
											    	</c:choose>
											    	<td class="listCenter" nowrap>${result.CAR_NO}</td>
											    	<td class="listCenter" nowrap>${result.GYEYAK_NO}</td>
											    	<td class="listCenter" nowrap>${result.DAMBO_GAIP_YMD}</td>
											  	</tr>
											 </c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="9">유효한 계약사항이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<!-- paging s -->
						<div class="paging">
							<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="goPage" />
							<form:hidden path="pageIndex" />
						</div>
						<!--// paging e -->
					</div>
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
								
									<%-- 
										<dl>
											<dt>용도</dt>
											<!--<dd>
												<label class="hide" for="publish_use">용도</label>
												<form:input path="publish_use" title="publish_use" class="" id="publish_use" style="width:500px;" type="text" />
											</dd>-->
											<dd>
											<form:select path="publish_use" title="publish_use" id="publish_use" name="" style="width:300px;">
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
									 --%>
									
								</div>
								<div class="btn_srch" style="margin-top:20px;">
									<span class="btn_pack btn_type04" style="vertical-align:middle !important;"><a href="#;" onclick="printDocument();" class="bold">발급하기</a></span>
								</div>
							</div>
							<!-- 기타 
							<div class="searchDown02">
								<div class="searchL">
									<dl>
										<dt>기타</dt>
										<dd><label class="hide" for="comment">기타</label>
											<form:input path="comment" title="comment" class="" id="comment" style="width:360px;" type="text" />
										</dd>
									</dl>
								</div>
							</div>
							<p class="btn_sev"><a href="#;" onclick="printDocument();" title="새창열림" ><img src="/images/truck/btn/btn_send.gif" alt="발급하기" /></a></p>-->							
						</div>
						<ul class="txtListst01">
							<li>증명서 발급은 현재 계약이 유지중이거나 미도래된 차량만 가능하며, 과거 계약건이 필요한경우 각 지부 계약 담당자를 통해 발급이 가능합니다&#46;</li>
						</ul>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		</fieldset>
		</form:form>
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>