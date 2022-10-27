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

<link href="/bootStrap/stylesheets/application_print.css" media="all" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<style type="text/css">
div.box-content div.col-md-3{ line-height:25px;}
div.main-content {margin:0;}
</style>
<script type="text/javascript">
function printPdf() {
	var z = $("#asdf");
	var s ="";
	
	z.children("p").each(function(){
			s += "<div>"+$(this).text()+"</div><div> </div>";
	});
	z.html(s);

    var k = $(".row").html();

	var f = document.popForm;
	f.htmlData.value = k;
	f.submit();
}
</script>
</head>
<body>
	<form name="popForm" method="post"
		action="/kwa/customerMgr/qna/detailPdf.do">
		<input type="hidden" name="htmlData" />
	</form>

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
			<input type="hidden" id="emailCn" name="emailCn" value="<html><head></head><body><h2>KTA 홈페이지 문의하신 글에 답변이 완료되었습니다.</h2><p>등록일 : ${resultDetail.createTime}</p><p>글제목 : ${resultDetail.title}</p><p>1:1문의내역[ <a href='http://www.truck.or.kr/customer/inquiry/oaoInquiryIndex.do' target='_blank'>http://www.truck.or.kr/customer/inquiry/oaoInquiryIndex.do</a> ]에 접속하여 확인바랍니다.</p></body></html>"/>
			<input type="hidden" id="repEmailSj" name="repEmailSj" value="KTA 홈페이지 1:1문의의 답변글을 입력해 주시기 바랍니다." />
			<input type="hidden" id="repEmailCn" name="repEmailCn" value="<html><head></head><body><h2>KTA 홈페이지 1:1문의의 답변글을 입력해 주시기 바랍니다.</h2><p>등록일 : ${resultDetail.createTime}</p><p>글제목 : ${resultDetail.title}</p><p>1:1문의[ <a href='http://www.truck.or.kr/kwa/main.do' target='_blank'>http://www.truck.or.kr/kwa/main.do</a> ]에 접속하여 확인바랍니다.</p></body></html>"/>
			<input type="hidden" id="replyAt" name="replyAt" value="${resultDetail.replyAt}"/>
			<input type="hidden" id="replyContentHtml" name="replyContentHtml"/>
			<input type="hidden" id="replyContentText" name="replyContentText"/>
			<input type="hidden" id="forwardUpdt" name="forwardUpdt" value="<c:if test='${empty resultDetail.forwardId}'>N</c:if><c:if test='${!empty resultDetail.forwardId}'>Y</c:if>"/>
			<div class="container">
				<div class="row">
					<div class="col-md-12 padded" >
							<div class="box">
									<div class="box-header">
										<span class="title">고객문의 내용</span>
									</div>
									<div class="box-content">
										<table class="table ">
											<tr>
											<th scope="col" style='width: 15%;'></th>
											<th scope="col" style='width: 35%;'></th>
											<th scope="col" style='width: 15%;'></th>
											<th scope="col" style='width: 35%;'></th>
										  	</tr>
											<tbody>
												<tr>
													<td style="background: #F3F4F8;">제목</td>
													<td colspan="3" style="text-align:left;">
														${resultDetail.title}
													</td>
												</tr>
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
													<td style="background: #F3F4F8;">email</td>
													<td  style="text-align:left;">
														${resultDetail.email}
													</td>
													<td style="background: #F3F4F8;">작성일자</td>
													<td  style="text-align:left;">
														${resultDetail.createTime}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">주소</td>
													<td colspan="3" style="text-align:left;">
														${resultDetail.addr}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">신주소</td>
													<td colspan="3" style="text-align:left;">
														${resultDetail.newAddr}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">첨부파일</td>
													<td colspan="3" style="text-align:left;">
														<c:if test="${not empty resultDetail.atchFileId}">
															<c:import url="/com/atch/selectFileInfs.do" charEncoding="utf-8">
																<c:param name="param_atchFileId" value="${resultDetail.atchFileId}" />
															</c:import>
											 			</c:if> 
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">문의내용</td>
													<td colspan="3" style="text-align:left;height:300px;vertical-align: top;">
														${resultDetail.contentHtml}
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
												<tr>
											<th scope="col" style='width: 15%;'></th>
											<th scope="col" style='width: 35%;'></th>
											<th scope="col" style='width: 15%;'></th>
											<th scope="col" style='width: 35%;'></th>
										  	</tr>
											<tbody>
												<tr>
													<td style="background: #F3F4F8;">고객답변</td>
													<td colspan="3" style="text-align:left;height:300px;vertical-align: top;" id="asdf">
														${resultDetail.replyContentHtml}
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
														<c:if test="${not empty resultDetail.forwardId}">
																${forwardVO.HANGEUL_NM} ( ${forwardVO.SAWON_NO} )
														</c:if>
														<c:if test="${empty resultDetail.forwardId}">
															등록된 담당자가 없습니다.
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
		</div>
		<div style="height:40px; margin:20px;" >
			<input type="button" onclick="window.print();" value="인쇄하기"/> <input type="button" onclick="printPdf();" value="pdf출력"/>
		</div>
		
	</body>
</html>