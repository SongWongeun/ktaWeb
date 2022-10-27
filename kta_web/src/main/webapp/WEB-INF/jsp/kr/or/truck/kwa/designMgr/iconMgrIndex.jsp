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
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" /> -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">
$(document).ready(function(){

});

function iconModify(no, name){
	//document.f.action = "<c:out value='/kwa/design/themaModify.do'/>"
	//document.f.submit();	
	
	if(confirm(name+'에 대한 설정을 변경하시겠습니까?')){
		var startMDt = $('#startMDt'+no).val();
		var startDDt = $('#startDDt'+no).val();
		var endMDt = $('#endMDt'+no).val();
		var endDDt = $('#endDDt'+no).val();
		var url = $('#url'+no).val();
		
		var chkStDt = ""+startMDt+startDDt;
		var chkEndDt = ""+endMDt+endDDt;
		if(chkStDt>chkEndDt){
			alert("시작일과 종료일을 확인해주세요.");
			return false;
		}
		$.ajax({
			async : true
	      , type: 'POST'
	      , url: "<c:url value='/kwa/design/iconModify.do'/>"
	      , dataType : 'json'
	      , data : {
	    	    "START_M_DT" : startMDt,
	    	    "START_D_DT" : startDDt,
	    	    "END_M_DT" : endMDt,
	    	    "END_D_DT" : endDDt,
	    	    "URL" : url,
	    	    "NO" : no
	          }
	      , success : function (data) {
	    	  console.log(data);
	    	  if(data._result=="LOGIN"){
	    		  FnAjaxLoginMovie("<c:url value='/kwa/main.do' />");
	    		  
	    	  }else if(data._result=="S"){
	    		  alert("변경이 성공적으로 완료 되었습니다.");
	    		  FnList();
	    	  }else{
	    		  alert(data._message);
	    	  }
	    	  
		  }, error: function(response, error) {
			  FnAjaxError( response );
		  }
		});
	}
}

</script>
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
	if(param == 'update.success'){
		alert('모바일 테마 변경이 완료되었습니다.');
	}	
});
</script>
</c:if>
</head>
<body>
<!-- header s -->
	<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
	<c:import url="/kwa/common/left.do"></c:import>
<!--// left e -->
<div class="main-content">
<form:form name="f" id="f" commandName="designVO"  method="post"  enctype="multipart/form-data">
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						테마 관리
					</h3>
				</div>
			</div>
		</div>
	</div>
		<div class="container">
		<div class="col-md-12" >
			<div class="panel panel-primary">
 				<div class="panel-heading">홈페이지 공지사항 관리</div>
				<div class="panel-body">			
					<div class="row">
						<div class="col-lg-12">
							<table class="table table-condensed table-bordered table-centered table-form">
								<colgroup>
									<col width="10%">
									<col width="25%">
									<col width="10%">
									<col width="45%">
									<col width="10%">
								</colgroup>
								<tbody>
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<th>${result.NAME}</th>
											<td>
												<select name="startMDt${result.NO}" id="startMDt${result.NO}">
													<c:forEach begin="1" end="12" step="1" varStatus="status">
														<c:choose>
															<c:when test="${status.index<10}">
																<c:set var="matchingNum" value="0${status.index}"/>
																<option value="0${status.index}" <c:if test="${result.START_M_DT==matchingNum}">selected="selected"</c:if> >${status.index}</option>
															</c:when>
															<c:otherwise>
																<option value="${status.index}" <c:if test="${result.START_M_DT==status.index}">selected="selected"</c:if>>${status.index}</option>	
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
												월
												<select name="startDDt${result.NO}" id="startDDt${result.NO}">
													<c:forEach begin="1" end="31" step="1" varStatus="status">
														<c:choose>
															<c:when test="${status.index<10}">
																<c:set var="matchingNum" value="0${status.index}"/>
																<option value="0${status.index}" <c:if test="${result.START_D_DT==matchingNum}">selected="selected"</c:if>>${status.index}</option>
															</c:when>
															<c:otherwise>
																<option value="${status.index}" <c:if test="${result.START_D_DT==status.index}">selected="selected"</c:if>>${status.index}</option>	
															</c:otherwise>
														</c:choose>	
													</c:forEach>
												</select>
												일
												 ~ 
												<select name="endMDt${result.NO}" id="endMDt${result.NO}">
													<c:forEach begin="1" end="12" step="1" varStatus="status">
														<c:choose>
															<c:when test="${status.index<10}">
																<c:set var="matchingNum" value="0${status.index}"/>
																<option value="0${status.index}" <c:if test="${result.END_M_DT==matchingNum}">selected="selected"</c:if>>${status.index}</option>
															</c:when>
															<c:otherwise>
																<option value="${status.index}" <c:if test="${result.END_M_DT==status.index}">selected="selected"</c:if>>${status.index}</option>	
															</c:otherwise>
														</c:choose>		
													</c:forEach>
												</select>
												월
												<select name="endDDt${result.NO}" id="endDDt${result.NO}">
													<c:forEach begin="1" end="31" step="1" varStatus="status">
														<c:choose>
															<c:when test="${status.index<10}">
																<c:set var="matchingNum" value="0${status.index}"/>
																<option value="0${status.index}" <c:if test="${result.END_D_DT==matchingNum}">selected="selected"</c:if>>${status.index}</option>
															</c:when>
															<c:otherwise>
																<option value="${status.index}" <c:if test="${result.END_D_DT==status.index}">selected="selected"</c:if>>${status.index}</option>	
															</c:otherwise>
														</c:choose>		
													</c:forEach>
												</select>
												일
											</td>
											<th>URL</th>
											<td>
												<input type="text" style="width: 100%;" name="url${result.NO}" id="url${result.NO}" value="${result.URL}"/>
											</td>
											<td>
												<a id="modify" class="btn btn-blue" href="#;" onclick="iconModify('${result.NO}','${result.NAME}')">적용하기</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					 </div>
				</div>					
			</div>
		</div>
		</div>
</form:form>
</div>
</body>
</html>