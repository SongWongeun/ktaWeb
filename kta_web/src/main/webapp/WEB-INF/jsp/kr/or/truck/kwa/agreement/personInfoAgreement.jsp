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
<link href="/css/truck/admin.css" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>

<script type="text/javascript">
var attachCount = 1;
var nameNum = 1;

	$(document).ready(function(){
		$("#selectFileUp").click(function(){
			$("#agreeInfoFileUp").click();
		});
		
		$("#agreeInfoFileUp").on('change', function(){
			var fileNm = $(this)[0].files[0].name;
			$("#agreeInfoFileUpV").val(fileNm);
		});
		
		$("#selectFileUpAdd").click(function(){
			var input = "<input type='file' id='agreeInfoFileUpAdd"+attachCount+"'  name='agreeInfoFileUpAdd"+attachCount+"' style='display: none'>";
			$("#attachFileInput").append(input);
			
			$("#agreeInfoFileUpAdd"+attachCount).click();
			$("#agreeInfoFileUpAdd"+attachCount).on('change', function(){
				addDivSelectFile($(this)[0].files);
			});
			attachCount++;
		});
		
		$("#submitAgreeInfo").click(function(){
			document.listForm.action = "/kwa/agreement/fileAdd.do";
			document.listForm.submit();
		});
	});
	
	function addDivSelectFile(files){
		var file, fileInfo = "";
		var fileNm = files[0].name;
		
		file = $("#attachFileList").html();
		fileInfo += "<div class='attachFile' id='fileListdiv"+nameNum+"'>";
		fileInfo += "<input type='text' id='agreeInfoFileUpAddV' name='agreeInfoFileUpAddV"+nameNum+"' value='"+fileNm+"' style=' border:none;' readonly />";
		fileInfo += "<a href='#' onclick='deleteFile("+nameNum+")'><img src='/images/truck/board/btn_close.gif'></a></div>";
		
		file += fileInfo;
		$("#attachFileList").html(file);
		nameNum++;
	}
	
	function deleteFile(num) {
		$("#agreeInfoFileUpAdd"+num).remove();
		$("#fileListdiv"+num).remove();
		
	}
	
</script>

</head>
<body>
<!-- header s -->
	<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
	<c:import url="/kwa/common/left.do"></c:import>
<!--// left e -->

<div class="main-content">
	<!-- 20161208 신규 -->
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						개인정보보호정책 관리
					</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12" >
				<div class="panel panel-primary">
  					<div class="panel-heading">개인정보보호정책 변경</div>
					<div class="box-content vAlign">	<!-- 20161215 수정 -->	
						<form name="listForm" method="post" enctype="multipart/form-data" >
						<input type="hidden" id="ph_code" name="ph_code" value="p"/>
							<div class="row box-section">
								<div class="col-md-1">파일</div>
								<div class="col-md-11">
									<input type="file" id="agreeInfoFileUp" name="agreeInfoFileUp" style="display: none">
									<div class="attachFile">
										<input type="text" id="agreeInfoFileUpV" name="agreeInfoFileUpV" value="" style=" border:none; width: 430px;" readonly>
									</div>
									<a class="btn btn-blue" href="#" id="selectFileUp">파일선택</a>
								</div>
							</div>
							<div class="row box-section">
								<div class="col-md-1">버전</div>
								<div class="col-md-11">
									<input type="text" id="fileVersion" name="ph_ver"  placeholder="버전" style="width:560px;">
								</div>
							</div>
							<div class="row box-section">
								<div class="col-md-1">변경내용</div>
								<div class="col-md-11">
									<input type="text" id="changeContents" name="ph_chg_info"  placeholder="변경내용" style="width:560px;">
								</div>
							</div>
							<div class="row box-section">
								<div class="col-md-1">첨부파일</div>
								<div class="col-md-10">
									<a class="btn btn-blue" href="#" id="selectFileUpAdd">파일선택</a>
									<div id="attachFileInput"></div>
									<div id="attachFileList" style="display:inline-block;"></div>
								</div>
								<div class="col-md-1"><a class="btn btn-blue" href="#" id="submitAgreeInfo">적용</a></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top:26px;">
		<div class="row">
			<div class="col-md-12" >
				<div class="box">
  					<div class="box-header">
						<span class="title">개인정보보호정책 변경이력</span>
					</div>
					<div class="box-content">
						<table class="table table-hover condensed">
							<colgroup>
								<col style="width:16%;" />
								<col style="width:20%;" />
								<col style="*" />
								<col style="width:25%;" />
							</colgroup>
							<thead>
							<tr>
								<th><div>변경일자</div></th>
								<th><div>버전</div></th>
								<th><div>변경내용</div></th>
								<th><div>첨부파일</div></th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${resultList != null }">
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<c:if test="${result.ph_atch_file_id == null}">
										<tr>
											<td>${result.ph_regDate}</td>
											<td>
												${result.ph_ver}
											</td>
											<td>
												${result.ph_chg_info}
											</td>
											<td>
												${result.ph_reg_fileName}
											</td>
										</tr>
									</c:if>
									<c:if test="${result.ph_atch_file_id != nul}">
										<c:if test="${resultListAttach != nul}">
											<c:forEach var="attach" items="${resultListAttach}">
												<c:if test="${result.ph_atch_file_id == attach.key}">
													<tr>
														<td>${result.ph_regDate}</td>
														<td>
															${result.ph_ver}
														</td>
														<td>
															${result.ph_chg_info}
														</td>
														<td>
															<c:forEach var="attachFileNm" items="${attach.value}">
																${attachFileNm}<br>
															</c:forEach>
														</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:if>
									</c:if>
								</c:forEach>
							</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- //20161208 신규 -->
	</div>
</body>
</html>