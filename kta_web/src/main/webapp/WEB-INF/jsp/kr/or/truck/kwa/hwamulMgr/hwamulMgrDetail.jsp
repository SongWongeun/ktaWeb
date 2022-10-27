<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
<!-- Always force latest IE rendering engine or request Chrome Frame -->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800">
<!-- Use title if it's in the page YAML frontmatter -->
<title>KTA Admin page</title>

<link href="/bootStrap/stylesheets/application.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript" src="/namo/js/namo_scripteditor.js"></script>
<script type="text/javascript">
function backtoIndex(){
	document.boardForm.action = "<c:url value='/kwa/hwamulMgr/list.do'/>";
   	document.boardForm.submit();
}
function contentsModify(){
	var html = CrossEditor.GetBodyValue();
	var text = CrossEditor.GetTextValue();
	document.boardForm.replyContentHtml.value = html.replace(/\n/g,'').replace(/\r/g,'');
	document.boardForm.replyContentText.value = text;
	var sawonNo = document.boardForm.forwardId.value;
	
	  if(!CrossEditor.IsDirty()){ 
			alert("답변을 수정해 주세요");
			CrossEditor.SetFocusEditor(); 
			return;
		}
		if(text=="" || text==null){ 
			alert("답변을 입력해 주세요");
			CrossEditor.SetFocusEditor(); 
			return;
		}
		if(sawonNo==""){
			alert("담당자를 지정해 주세요");
			return;
		}
			
			
		if(confirm("답변을 완료하시겠습니까?")){
			document.boardForm.action = "<c:url value='/kwa/hwamulMgr/hwamulUpdate.do'/>";
   			document.boardForm.submit();
		}
}
/*
*관리자 검색
*/
function searchAdminList(){
	var keyword = $("#popSearchKeyword").val();
	var condition = $("#popSearchCondition").val();
	var params ={'keyword':keyword,'condition':condition};
	$.ajax({
		url:'/kwa/customerMgr/qna/searchStaffList.do', type:'POST',
		data : params, dataType:'html', timeout: 2000, async:false,
		error: function(html){
			alert("error!"+html);
		},
		success: function(html){
			$("#searchingList").html(html).css('dispaly','block');
		}
	});
}
/*
*관리자 페이징
*/
function searchAdminListPaging(pageNo){
	var keyword = $("#popSearchKeyword").val();
	var condition = $("#popSearchCondition").val();
	var paging = pageNo;
	var params ={'keyword':keyword,'condition':condition,'paging':paging};
	$.ajax({
		url:'/kwa/customerMgr/qna/searchStaffList.do', type:'POST',
		data : params, dataType:'html', timeout: 2000, async:false,
		error: function(html){
			alert("error!"+html);
		},
		success: function(html){
			$("#searchingList").html(html).css('dispaly','block');
		}
	});
}
/*
*담당자 추가 펑션
*/
function inputAdmin(sawonNo,name){
	var tbody = $("#forwardRep");
	var admNm = name;
	var admNo = sawonNo;
	var contents = "<td align='right'>이름:</td><td name='admNm'>"+admNm+"</td><td align='right'>사원번호:</td><td name='admNo' align='left'>"+admNo+"</td><td align='right'><i class=\"icon-remove\" onclick=\"removeAdm();\"></td>";
	tbody.html("");
    tbody.append(contents);    
    
    document.boardForm.forwardId.value = sawonNo;
    
    $("#searchingList").empty();
    $("#popSearchKeyword").val("");
    $("#popSearchCondition").val("1");
	$('#adminSearch').modal('hide');
	document.boardForm.forwardUpdt.value = "Y";
}
/*
*담당자 제거 펑션
*/
function removeAdm(){
	var tbody = $("#forwardRep");
	tbody.html("");
	tbody.append("<td>등록된 담당자가 없습니다.</td>");
	document.boardForm.forwardId.value = "";
	document.boardForm.forwardUpdt.value = "N";
}
/*
 * 담당자 변경하기
 */
function contentsRepModify(){
	if($("#forwardUpdt").val()=='N'){
		alert('담당자를 선택 해주세요.');
		return false;
	}
	if(confirm("담당자를 변경 하시겠습니까?")){
		document.boardForm.action = "<c:url value='/kwa/hwamulMgr/contentsRepUpdate.do'/>";
		document.boardForm.submit();
	}
}
function adminSearchEnterKey(){
	 if(event.keyCode==13){
		 searchAdminList();
	}
}
function contentsPrint(){
	var sURL = '/kwa/hwamulMgr/detail.do?isPrint=Y&articleNo=${resultDetail.articleNo}';
	window.open(sURL,'_blank','toolbar=no,location=no,status=no,menubar=no, scrollbars=yes,resizable=yes,width=1065,height=650 top=10'); 
}
</script>
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}'
	if(param == 'update.success'){ 
		alert('담당자 변경이 완료되었습니다.');
	}
});
</script>
</c:if>
<style type="text/css">
div.box-content div.col-md-3{ line-height:25px;}
</style>
</head>
<body>
<!-- header s -->
	<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
	<c:import url="/kwa/common/left.do"></c:import>
<!--// left e -->

	<div class="main-content">
		<form name="boardForm" id="boardForm" method="post">
			<input type="hidden" id="articleNo" name="articleNo" value="${resultDetail.articleNo}"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
			<input type="hidden" id="searchCondition" name="searchCondition" value="${searchVO.searchCondition}"/>
			<input type="hidden" id="searchCondition2" name="searchCondition2" value="${searchVO.searchCondition2}"/>
			<input type="hidden" id="searchCondition2" name="searchCondition3" value="${searchVO.searchCondition3}"/>
			<input type="hidden" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}"/>
			<input type="hidden" id="email" name="email" value="${resultDetail.email}"/>
			<input type="hidden" id="phone" name="phone" value="${resultDetail.phone}"/>
			<input type="hidden" id="emailSj" name="emailSj" value="KTA 홈페이지 문의하신 글에 답변이 완료되었습니다."/>
			<input type="hidden" id="emailCn" name="emailCn" value="<html><head></head><body><h2>KTA 홈페이지 문의하신 글에 답변이 완료되었습니다.</h2><p>등록일 : ${resultDetail.createTime}</p><p>글제목 : ${resultDetail.title}</p><br/><p>1:1문의내역[ <a href='http://www.truck.or.kr/customer/inquiry/oaoInquiryIndex.do' target='_blank'>http://www.truck.or.kr/customer/inquiry/oaoInquiryIndex.do</a> ]에 접속하여 확인바랍니다.</p></body></html>"/>
			<input type="hidden" id="repEmailSj" name="repEmailSj" value="KTA 홈페이지 1:1문의의 답변글을 입력해 주시기 바랍니다." />
			<input type="hidden" id="repEmailCn" name="repEmailCn" value="<html><head></head><body><h2>KTA 홈페이지 1:1문의의 답변글을 입력해 주시기 바랍니다.</h2><p>등록일 : ${resultDetail.createTime}</p><p>글제목 : ${resultDetail.title}</p><br/><p>1:1문의[ <a href='http://www.truck.or.kr/kwa/main.do' target='_blank'>http://www.truck.or.kr/kwa/main.do</a> ]에 접속하여 확인바랍니다.</p></body></html>"/>
			<input type="hidden" id="replyAt" name="replyAt" value="${resultDetail.replyAt}"/>
			<input type="hidden" id="replyContentHtml" name="replyContentHtml"/>
			<input type="hidden" id="replyContentText" name="replyContentText"/>
			<input type="hidden" id="forwardUpdt" name="forwardUpdt" value="<c:if test='${empty resultDetail.forwardId}'>N</c:if><c:if test='${!empty resultDetail.forwardId}'>Y</c:if>"/>
			<input type="hidden" id="email_yn" name="email_yn" value="${resultDetail.email_yn }"/>
			<input type="hidden" id="phone_yn" name="phone_yn" value="${resultDetail.phone_yn }"/>
			<input type="hidden" id="writerId" name="writerId" value="${resultDetail.writerId }"/>
			<div class="container">
				<div class="row">
					<div class="area-top clearfix">
						<div class="pull-left header">
							<h3 class="title">고객문의 관리</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
				

					<div class="col-md-12 padded" style="margin-bottom:20px;">
						<div class="box">
							<div class="box-header">
								<span class="title">고객문의 진행현황</span>
							</div>
							<div class="box-content padded">
								<div style="margin:0 auto;width:70%;text-align:center;">
									<c:if test="${empty resultDetail.forwardId}">
									
									 	<c:if test="${resultDetail.replyAt eq 'N' }">
											<button class="btn btn-red" style="width:150px;height:70px;font-size:25px;font-weight:bolder;line-height:25px;padding-top: 10px;">
												문의등록
												<br/>
												<span style="font-size:12px;font-weight:normal;">미답변</span> 
											</button>		
											<i class="icon-arrow-right" style="margin:0 30px;"></i> 
											<button class="btn btn-gray" style="width:150px;height:70px;font-size:20px;">처리중</button>
											<i class="icon-arrow-right" style="margin:0 30px;"></i> 
											<button class="btn btn-gray" style="width:150px;height:70px;font-size:20px;">답변완료</button>
									 	</c:if>
									 	<c:if test="${resultDetail.replyAt eq 'Y' }">
											<button class="btn btn-gray" style="width:150px;height:70px;font-size:20px;">문의등록</button>		
											<i class="icon-arrow-right" style="margin:0 30px;"></i> 
											<button class="btn btn-gray" style="width:150px;height:70px;font-size:20px;">처리중</button>
											<i class="icon-arrow-right" style="margin:0 30px;"></i> 
											<button class="btn btn-green" style="width:150px;height:70px;font-size:25px;font-weight:bolder;">답변완료</button>
									 	</c:if>
									</c:if>
									<c:if test="${not empty resultDetail.forwardId}">
									 	<c:if test="${resultDetail.replyAt eq 'Y' }">
											<button class="btn btn-gray" style="width:150px;height:70px;font-size:20px;">문의등록</button>		
											<i class="icon-arrow-right" style="margin:0 30px;"></i> 
											<button class="btn btn-gray" style="width:150px;height:70px;font-size:20px;">처리중<br/><span style="font-size:12px;">담당자 : ${forwardVO.HANGEUL_NM}</span></button>
											<i class="icon-arrow-right" style="margin:0 30px;"></i> 
											<button class="btn btn-green" style="width:150px;height:70px;font-size:25px;font-weight:bolder;">답변완료</button>
									 	</c:if>
										<c:if test="${resultDetail.replyAt eq 'N' }">
											<button class="btn btn-gray" style="width:150px;height:70px;font-size:20px;">문의등록</button>		
											<i class="icon-arrow-right" style="margin:0 30px;"></i> 
											<button class="btn btn-blue" style="width:150px;height:70px;font-size:25px;font-weight:bolder;line-height:25px;padding-top: 10px;">
												<span>처리중</span>
												<br/>
												<span style="font-size:12px;font-weight:normal;">담당자 : ${forwardVO.HANGEUL_NM}</span>
											</button>
											<i class="icon-arrow-right" style="margin:0 30px;"></i> 
											<button class="btn btn-gray" style="width:150px;height:70px;font-size:20px;">답변완료</button>
									 	</c:if>
									</c:if>
									<!-- <button class="btn btn-default" style="width:150px;height:70px;font-size:20px;">문의등록</button>		
									<i class="icon-angle-right" style="margin:0 30px;"></i>  
									<i class="icon-circle-arrow-right" style="margin:0 30px;"></i> 
									<i class="icon-arrow-right" style="margin:0 30px;"></i> 
									<i class="icon-play" style="margin:0 30px;"></i> 
									<button class="btn btn-red" style="width:150px;height:70px;font-size:20px;">진행중<br/><span style="font-size:12px;">담당자 : 송원근</span></button>
									<i class="icon-arrow-right" style="margin:0 30px;"></i> 
									<button class="btn btn-default" style="width:150px;height:70px;font-size:20px;">답변완료</button> -->
								</div>
							</div>
						</div>
					</div>
				
					<div class="col-md-12 padded" >
							<div class="box">
									<div class="box-header">
										<span class="title">고객문의 내용</span>
									</div>
									<div class="box-content">
										<table class="table ">
											<colgroup>
												<col style="width:15%;"/>
												<col style="width:35%;"/>
												<col style="width:15%;"/>
												<col style="width:35%;"/>
											</colgroup>
											<tbody>
												<tr>
													<td style="background: #F3F4F8;">작성자</td>
													<td  style="text-align:left;">
														<c:choose>
															<c:when test="${!empty resultDetail.writerName}">
																${resultDetail.writerName}
															</c:when>
															<c:when test="${empty resultDetail.writerName}">
																${resultDetail.writerId}
															</c:when>
														</c:choose>
													</td>
													<td style="background: #F3F4F8;">전화번호</td>
													<td  style="text-align:left;">
														${resultDetail.phone}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">이메일</td>
													<td  style="text-align:left;">
														${resultDetail.email}
													</td>
																											
													<td style="background: #F3F4F8;">작성일자</td>
													<td  style="text-align:left;">
														${resultDetail.createTime}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">[차량정보]</td>
													<td colspan="3" style="text-align:left; background: #F3F4F8;"></td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">차량번호</td>
													<td colspan="3" style="text-align:left;">
														${resultDetail.car_no}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">적재정량</td>
													<td colspan="3" style="text-align:left;">
														<c:if test="${not empty resultDetail.carry_capacity}">
														${resultDetail.carry_capacity}kg
														</c:if>
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">협회가입유무</td>
													<td colspan="3" style="text-align:left;">
														<c:if test="${resultDetail.assocication_join eq '0'}">
															미가입
														</c:if>
														<c:if test="${resultDetail.assocication_join eq '1'}">
															개별화물협회
														</c:if>
														<c:if test="${resultDetail.assocication_join eq '2'}">
															용달화물협회
														</c:if>
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">계약만기일</td>
													<td colspan="3" style="text-align:left;">
														${resultDetail.expire_date}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">현 할인할증등급</td>
													<td colspan="3" style="text-align:left;">
														${resultDetail.extra_charge}
														
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">필수고지사항</td>
													<td colspan="3" style="text-align:left;">
													<c:if test="${resultDetail.essential_notice1 eq 'Y'}">
														- 수반차를 견인하는데 사용하는 특수연결장치(트랙터, 풀카고 등)를 한 차량<br>
													</c:if>
													<c:if test="${resultDetail.essential_notice2 eq 'Y'}">
														- 위험물(석유,고압가스,폭발인화성위험물질 등)을 적재하는 차량<br>
													</c:if>
													<c:if test="${resultDetail.essential_notice3 eq 'Y'}">
														- 기중기, 붐, 집게등이 장착(사다리차, 크레인, 렉카 등)된 차량<br>
													</c:if>
													<c:if test="${resultDetail.essential_notice4 eq 'Y'}">
														- 방송, 녹음, 레트켄, 토오키 등 정밀기계가 장착된 차량<br>
													</c:if>
													<c:if test="${resultDetail.essential_notice5 eq 'Y'}">
														- 6인승 밴형화물자동차 또는 승차정원이 3인을 초과하는 차량<br>
													</c:if>
													<c:if test="${resultDetail.essential_notice6 eq 'Y'}">
														- 구조변경 이력이 있는 차량<br>
													</c:if>
													<c:if test="${resultDetail.essential_notice7 eq 'Y'}">
														- 해당없음<br>
													</c:if>
													</td>
												</tr>												
												<tr>
													<td style="background: #F3F4F8;">[가입상품]</td>
													<td colspan="3" style="text-align:left; background: #F3F4F8;"></td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">대인1</td>
													<td colspan="3" style="text-align:left;">												
													<c:if test="${resultDetail.person1_coverage eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.person1_coverage eq 'N'}">
														미가입
													</c:if>														
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">대인2</td>
													<td colspan="3" style="text-align:left;">
													<c:if test="${resultDetail.person2_coverage eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.person2_coverage eq 'N'}">
														미가입
													</c:if>	
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">대물</td>
													<td colspan="3" style="text-align:left;">
													<c:if test="${resultDetail.object_coverage eq '1500'}">
														${resultDetail.object_coverage}만원
													</c:if>
													<c:if test="${resultDetail.object_coverage eq '3000'}">
														${resultDetail.object_coverage}만원
													</c:if>
													<c:if test="${resultDetail.object_coverage eq '5000'}">
														${resultDetail.object_coverage}만원
													</c:if>
													<c:if test="${resultDetail.object_coverage eq '7000'}">
														${resultDetail.object_coverage}만원
													</c:if>
													<c:if test="${resultDetail.object_coverage eq '10000'}">
														1억원
													</c:if>
													<c:if test="${resultDetail.object_coverage eq '20000'}">
														2억원
													</c:if>
													<c:if test="${resultDetail.object_coverage eq '30000'}">
														3억원
													</c:if>
													<c:if test="${resultDetail.object_coverage eq '40000'}">
														4억원
													</c:if>
													<c:if test="${resultDetail.object_coverage eq '50000'}">
														5억원
													</c:if>
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">자기신체사고</td>
													<td colspan="3" style="text-align:left;">
													<c:if test="${resultDetail.selfbody_coverage eq '1500'}">
														${resultDetail.selfbody_coverage}만원
													</c:if>
													<c:if test="${resultDetail.selfbody_coverage eq '3000'}">
														${resultDetail.selfbody_coverage}만원
													</c:if>
													<c:if test="${resultDetail.selfbody_coverage eq '5000'}">
														${resultDetail.selfbody_coverage}만원
													</c:if>
													<c:if test="${resultDetail.selfbody_coverage eq '10000'}">
														1억원
													</c:if>
													<c:if test="${resultDetail.selfbody_coverage eq '0'}">
														미가입
													</c:if>
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">자기차량손해</td>
													<td colspan="3" style="text-align:left;">
													<c:if test="${resultDetail.selfcar_coverage eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.selfcar_coverage eq 'N'}">
														미가입
													</c:if>	
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">긴급출동</td>
													<td colspan="3" style="text-align:left;">	
													<c:if test="${resultDetail.emergency_call eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.emergency_call eq 'N'}">
														미가입
													</c:if>	
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">법률비용지원</td>
													<td colspan="3" style="text-align:left;">	
													<c:if test="${resultDetail.law_expense eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.law_expense eq 'N'}">
														미가입
													</c:if>		
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">적재물</td>
													<td colspan="3" style="text-align:left;">
													<c:if test="${resultDetail.luggage_coverage eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.luggage_coverage eq 'N'}">
														미가입
													</c:if>		
													</td>
												</tr>
											</tbody>
										</table>
									</div>
							</div>
					</div>
				
					<div class="col-md-12 padded" >
							<div class="box">
									<div class="box-header">
										<span class="title">고객문의 답변</span>
									</div>
									<div class="box-content">
										<table class="table ">
											<colgroup>
												<col style="width:15%;"/>
												<col style="width:35%;"/>
												<col style="width:15%;"/>
												<col style="width:35%;"/>
											</colgroup>
											<tbody>
												<tr>
													<td style="background: #F3F4F8;">고객답변</td>
													<td colspan="3" style="text-align:left;">
														<code id="replyContentHtmlView" style="display:none;">${resultDetail.replyContentHtml}</code>
														<script type="text/javascript">
															var CrossEditor = new NamoSE("test");
															CrossEditor.params.Width = "100%";
															CrossEditor.EditorStart();
															CrossEditor.SetBodyValue($("#replyContentHtmlView").html());
														</script>
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">답변일자</td>
													<td  style="text-align:left;">
														<c:choose>
															<c:when test="${resultDetail.replyAt!='Y'}">
																<div id="changViBtn" name="changViBtn" class="btn btn-red"  style="width: 59px;">미답변</div>
															</c:when>
															<c:otherwise>
																${resultDetail.replyTime}
															</c:otherwise>
														</c:choose>
													</td>
													<td style="background: #F3F4F8;">담당자 배정일자</td>
													<td  style="text-align:left;">
														${resultDetail.forwardTime}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">처리시간</td>
													<td  style="text-align:left;">
														<c:if test="${not empty resultDetail.procTime }">
															${resultDetail.procTime} (담당자배정일자 - 답변완료일자)
														</c:if>
													</td>
													<td style="background: #F3F4F8;">총 처리시간</td>
													<td  style="text-align:left;">
														<c:if test="${not empty resultDetail.totalProcTime }">
															${resultDetail.totalProcTime} (문의등록일자 - 답변완료일자)
														</c:if>
														
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">담당자 설정</td>
													<td colspan="3" style="text-align:left;">
														<div class="box">
															<div class="box-header"><span class="title">담당자</span></div>
															<div class="box-content">			
																<input type ="hidden" id="forwardId" name="forwardId" value="${resultDetail.forwardId}"/>
																<table cellpadding="0" cellspacing="0" border="0" class="table" id="admTbl">
																	<tbody id="admBody">
																		<tr id="forwardRep">
																		<c:if test="${not empty resultDetail.forwardId}">
																				<td >이름:${forwardVO.HANGEUL_NM}</td>
																				<td align="right">사원번호:</td>
																				<td name="admNo">${forwardVO.SAWON_NO}</td>
																				<td align='right'>
																					<c:if test="${resultDetail.replyAt!='Y'}">
																						<i class="icon-remove" onclick="removeAdm();">
																					</c:if>
																				</td>
																		</c:if>
																		<c:if test="${empty resultDetail.forwardId}">
																			<td>등록된 담당자가 없습니다.</td>
																		</c:if>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
														<c:if test="${resultDetail.replyAt!='Y'}">
															<span>
																<a id="searchAdmin" class="btn btn-blue" data-toggle="modal" href="#adminSearch">직원 검색</a>
															</span>
															<span>
																<a id="basicmodify" class="btn btn-blue" href="#;" onclick="contentsRepModify();">담당자변경</a>
															</span>
														</c:if>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
							</div>
						</div>
						
						
						
						
					</div>
				</div>
			</form>
			<div class="col-md-12" >
			<ul class="padded separate-sections">
				<li align="right">
				  <a class="btn btn-blue" href="#;" onclick="contentsPrint();">인쇄 및 Pdf 출력</a>
				  <a id="basicmodify" class="btn btn-blue" href="#;" onclick="contentsModify();">답변하기</a>
				  <a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>	
				</li>
			</ul>
			</div>
			<div id="adminSearch" class="modal fade" data-replace="true" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
			    <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					  <h4 class="modal-title">직원 검색</h4>
					</div>
					<div class="modal-body">
					<div class="box-content">
						<input type="text" name="popSearchKeyword"  id="popSearchKeyword" class="search" placeholder="Search" onkeypress="adminSearchEnterKey();" />
						<select name="popSearchCondition"  id="popSearchCondition" class="btn btn-default btn-sm">
						<li class=""><span class="title"><option value="2" label="이름" selected="selected"/></span></li>
						<li class=""><span class="title"><option value="1" label="사원번호"/></span></li>
						</select>
						<a id="searchBtn" class="btn btn-blue"  href="#;" onclick="searchAdminList();"> 검색</a>
					</div>
					<div id="searchingList">
					</div>
					</div>
			      	<div class="modal-footer">
			        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			     	</div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div>
		</div>
	</body>
</html>