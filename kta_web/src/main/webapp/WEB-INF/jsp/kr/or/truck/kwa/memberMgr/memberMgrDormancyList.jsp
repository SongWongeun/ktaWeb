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
<title>KTA Admin page 휴면</title>

<link href="/bootStrap/stylesheets/application.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">
/* pagination 페이지 링크 function */
function paging_Board(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/kwa/memberMgr/staff/list.do'/>";
   	document.boardForm.submit();
}
function staffMemberDetail(id){
	document.boardForm.id.value = id;
	document.boardForm.action = "<c:url value='/kwa/memberMgr/staff/detail.do'/>";
   	document.boardForm.submit();
}

function searchList(){
	document.boardForm.pageIndex.value = 1;
	document.boardForm.action = "<c:url value='/kwa/memberMgr/staff/list.do'/>";
   	document.boardForm.submit();
}
function searchList2(x){
	$("#selectAgentCd").val(x);
	$("#f_selectKindAgentCd").submit();
}

$(document).ready(function(){
	
	if('${out}'=='out'){
		$("#out").attr("class","btn btn-primary");
		$("#human").attr("class","btn btn-default");
		$("#goOutButton").show();
		$("#goHumanButton").hide();
		$("#outList").show();
		$("#humanList").hide();
	}
	
	$("#out").on("click",function(){
		$(this).attr("class","btn btn-primary");
		$("#human").attr("class","btn btn-default");
		$("#goOutButton").show();
		$("#goHumanButton").hide();
		$("#outList").show();
		$("#humanList").hide();
	});
	
	$("#human").on("click",function(){
		$(this).attr("class","btn btn-primary");
		$("#out").attr("class","btn btn-default");
		$("#goHumanButton").show();
		$("#goOutButton").hide();
		$("#humanList").show();
		$("#outList").hide();
	});
	//휴면처리
	$("#goHumanButton").on("click",function(){
		var z="";
		$("input:checkbox[name='checkHuman'][attr-unchecked='1']").each(function(){
			z += $(this).val()+"|";
		});
		$("#noDormancy").val(z);
		$("#f_human").submit();
		
	});
	
	$("input:checkbox[name='checkHuman']").on("click",function(){
		var s = $(this).attr("attr-unchecked");
		if(s=="0"){
			$(this).attr("attr-unchecked","1");
		}else{
			$(this).attr("attr-unchecked","0");
		}
	});
	//휴면처리
	
	//탈퇴처리
	$("#goOutButton").on("click",function(){
		var k = "";
		$("input:checkbox[name='checkOut'][attr-unchecked='1']").each(function(){
			k += $(this).val()+"|";
		});
		$("#noOut").val(k);
		
		if(confirm("탈퇴처리시 회원테이블에서 일괄 삭제 됩니다. 삭제하시겠습니까?")){
			$("#f_out").submit();
		}
	});
	
	$("input:checkbox[name='checkOut']").on("click",function(){
		var s = $(this).attr("attr-unchecked");
		if(s=="0"){
			$(this).attr("attr-unchecked","1");
		}else{
			$(this).attr("attr-unchecked","0");
		}
	});
	//탈퇴처리
	
	$("#allSelectHuman").on("click",function(){
		 //클릭되었으면
        if($("#allSelectHuman").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=checkHuman]").prop("checked",true);
            $("input[name=checkHuman]").attr("attr-unchecked","0");
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=checkHuman]").prop("checked",false);
            $("input[name=checkHuman]").attr("attr-unchecked","1");
        }

	});
	
	$("#allSelectOut").on("click",function(){
		 //클릭되었으면
       if($("#allSelectOut").prop("checked")){
           //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
           $("input[name=checkOut]").prop("checked",true);
           $("input[name=checkOut]").attr("attr-unchecked","0");
           //클릭이 안되있으면
       }else{
           //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
           $("input[name=checkOut]").prop("checked",false);
           $("input[name=checkOut]").attr("attr-unchecked","1");
       }

	});
});
</script>

</head>
<body>
<!-- header s -->
	<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
	<c:import url="/kwa/common/left.do"></c:import>
<!--// left e -->
<form id="f_human" method="post" action="/kwa/memberMgr/dormancy/goDormancy.do">
	<input type="hidden" name="id" value="" id="noDormancy">
	<input type="hidden" name="category" value="${searchVO.category }">
</form>

<form id="f_out" method="post" action="/kwa/memberMgr/dormancy/goOutMember.do">
	<input type="hidden" name="id" value="" id="noOut">
	<input type="hidden" name="category" value="${searchVO.category }"/>
</form>

<form method="post" action="/kwa/memberMgr/dormancy/list.do" id="f_selectKindAgentCd">
	<input type="hidden" name="category" value="" id="selectAgentCd"/>
</form>

<div class="main-content">
	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						휴면계정 및 탈퇴계정 관리
					</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
			<div class="row">
				<div class="col-md-12" >
					<div class="box">
						<div class="box-header">
							<span class="title"></span>
						</div>
						<div class="box-content padded">
							<select class="btn btn-default btn-sm" onchange="javascript:searchList2(this.value);">
								<li class=""><span class="title"><option value="0" <c:if test="${searchVO.category=='0' }">selected="selected"</c:if> >조합원</option></span></li>
								<li class=""><span class="title"><option value="1" <c:if test="${searchVO.category=='1' }">selected="selected"</c:if> >차량관리자</option></span></li>
								<li class=""><span class="title"><option value="2" <c:if test="${searchVO.category=='2' }">selected="selected"</c:if> >거래처</option></span></li>
							</select>
							<a id="human" class="btn btn-primary btn-sm"  href="#;">휴면대상목록</a>
							<a id="out" class="btn btn-default btn-sm"  href="#;">탈퇴대상목록</a>  
							
							<a id="goHumanButton" class="btn btn-primary btn-sm"  href="#;" style="margin-left:600px;">휴면처리</a> 
							<a id="goOutButton" class="btn btn-primary btn-sm"  href="#;" style="display:none; margin-left:600px;">탈퇴처리</a> 

						</div>
					</div>
				</div>
			</div>
	</div>
	<div class="container" id="humanList">
		<div class="row">
			<div class="col-md-12" >
				<div class="box">
					<div class="box-content">
						<table class="table table-hover condensed">
						<colgroup>
							<col style="width:15%;" />
							<col style="width:15%;" />
							<col style="width:30%;" />
							<col style="width:20%;" />
							<col style="width:20%;" />
						</colgroup>
						<thead>
						<tr>
						  <th><div><input type="checkbox" id="allSelectHuman" checked="checked"/></div></th>
						  <th><div>종류</div></th>
						  <th><div>회사명</div></th>
						  <th><div>아이디</div></th>
						  <th><div>최근접속날짜</div></th>
						</tr>
						</thead>
						<tbody>
						<c:if test="${not empty dormancyList }">
						<c:forEach var="dormancy" items="${dormancyList}" varStatus="status">
							<tr>
								<td><input type="checkbox" checked="checked" name="checkHuman" attr-unchecked="0" value="${dormancy.ID}"/></td>
								<td>${dormancy.AGENT_CD }</td>
								<td>${dormancy.AGENT_NM }</td>
								<td>${dormancy.ID }</td>
								<td>${dormancy.RECENT_DT }</td>
							</tr>
						</c:forEach>	
						</c:if>	
						<c:if test="${empty dormancyList }">
						<tr>
							<td colspan="5">검색결과가 없습니다.</td>
						</tr>
						</c:if>						
						</tbody>
						</table>			
					</div>		
				</div>					
				<%-- <!-- paging s -->
				<div class="text-center">
					<ul class="pagination pagination-sm">
						<ui:pagination paginationInfo = "${paginationInfo}" type="bootStrap" jsFunction="paging_Board" />
					</ul>
					<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo}" />
				</div><!--// paging e --> --%>
			</div>
		</div>
	</div>
	
	<div class="container" id="outList" style="display:none;">
		<div class="row">
			<div class="col-md-12" >
				<div class="box">
					<div class="box-content">
						<table class="table table-hover condensed">
						<colgroup>
							<col style="width:15%;" />
							<col style="width:15%;" />
							<col style="width:30%;" />
							<col style="width:20%;" />
							<col style="width:20%;" />
						</colgroup>
						<thead>
						<tr>
						  <th><div><input type="checkbox" id="allSelectOut" checked="checked"/></div></th>
						  <th><div>종류</div></th>
						  <th><div>회사명</div></th>
						  <th><div>아이디</div></th>
						  <th><div>휴면처리날짜</div></th>
						</tr>
						</thead>
						<tbody>
						<c:if test="${not empty dormanciedList }">
						<c:forEach var="dormancied" items="${dormanciedList}" varStatus="status">
							<tr>
								<td><input type="checkbox" checked="checked" name="checkOut" attr-unchecked="0" value="${dormancied.ID}"/></td>
								<td>${dormancied.AGENT_CD }</td>
								<td>${dormancied.AGENT_NM }</td>
								<td>${dormancied.ID }</td>
								<td>${dormancied.HUMAN_DT }</td>
							</tr>
						</c:forEach>	
						</c:if>	
						<c:if test="${empty dormanciedList }">
						<tr>
							<td colspan="5">검색결과가 없습니다.</td>
						</tr>
						</c:if>						
						</tbody>
						</table>			
					</div>		
				</div>					
				<%-- <!-- paging s -->
				<div class="text-center">
					<ul class="pagination pagination-sm">
						<ui:pagination paginationInfo = "${paginationInfo}" type="bootStrap" jsFunction="paging_Board" />
					</ul>
					<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo}" />
				</div><!--// paging e --> --%>
			</div>
		</div>
	</div>
	</fieldset>
</div>

</body>
</html>