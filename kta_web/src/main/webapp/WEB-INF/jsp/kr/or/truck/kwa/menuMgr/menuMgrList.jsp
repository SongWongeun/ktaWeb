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
html, body {font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
.icon-plus-sign-alt:hover {content: "\f0fe";color:red;cursor:pointer; }
.icon-cog:hover {content: "\f0fe";color:red;cursor:pointer; }
tr.depth3 td {padding-left: 20px !important;}
tr.depth3:hover {background-color:#B5CAE3 !important;} 
tr.depth2:hover {cursor:default !important;}
table.table {margin-bottom:0px;}
span.title{font-size: 15px !important;}
</style>
<script type="text/javascript">
function searchMenuDetail(menuNo){
	document.boardForm.menuNo.value=menuNo;
	document.boardForm.action = "<c:url value='/kwa/menuMgr/menuDetail.do'/>";
	document.boardForm.submit();
}
function addCustomBoard(menuNo){
	document.boardForm.action = "<c:url value='/kwa/menuMgr/menuAdd.do'/>";
	document.boardForm.menuNo.value = menuNo;
	document.boardForm.submit(); 
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
	<div class="container">
		<form name="boardForm" id="boardForm">
			<input type="hidden" id="menuNo" name="menuNo">
		</form>
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						메뉴 관리
					</h3>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12" >
				<div class="panel panel-primary">
  					<div class="panel-heading">홈페이지 메뉴 관리</div>
					<div class="panel-body">			
						<div>
						<p> </p>
						<p>게시판 형태의 메뉴들만 수정 가능합니다.</p>
						<p>HTML 메뉴나 기능/조회성 메뉴들은 수정이 불가합니다.</p>
						<p>2depth 기본게시판에서는 관리자 추가기능을 사용할 수 있습니다.</p>
						<p>2depth 메뉴 하위에는 게시판들을 추가할 수 있습니다.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12" >
			<div class="col-md-4" >
				<div class="panel panel-primary">
  					<div class="panel-heading">인터넷 창구</div>
					<table class="table ">
						<tbody>
						<c:forEach items="${netCouter}" var="net">	
							<c:if test="${fn:substring(net.HP_MENU_NO, 5, 7) == '00' and fn:substring(net.HP_MENU_NO, 4, 7) != '000'}"> 
								<tr style="font-weight: bold;">
									<td>${net.MENU_NM}</td> 
								</tr>		
							</c:if>	
							<c:if test="${fn:substring(net.HP_MENU_NO, 5, 7) != '00'}"> 
								<tr class="depth3" class="danger">
									<td>${net.MENU_NM}</td>
								</tr>		
							</c:if>	
							<c:if test="${fn:substring(net.HP_MENU_NO, 5, 7) != '00' and net.USE_YN eq 'N'}"> 
								<tr class="depth3">
									<td>${net.MENU_NM}(미사용)</td>
								</tr>		
							</c:if>	
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="col-md-4" >
				<div class="panel panel-primary">
 					<div class="panel-heading">고객광장</div>
					<table class="table">
						<tbody>
							<c:forEach items="${customer}" var="cust">
								<c:if test="${fn:substring(cust.HP_MENU_NO, 5, 7) == '00' and fn:substring(cust.HP_MENU_NO, 4, 7) != '000' and not empty cust.HP_BOARD_MASTER_NO}"> 
									<tr style="font-weight: bold;" class="depth2">
										<td>${cust.MENU_NM}</td>
										<td align="right" width="20px" onclick="searchMenuDetail(${cust.HP_MENU_NO})"><i class="icon-cog"></i></td>
										<td align="right" width="20px" onclick="addCustomBoard(${cust.HP_MENU_NO})"><i class="icon-plus-sign-alt"></i></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(cust.HP_MENU_NO, 5, 7) == '00' and fn:substring(cust.HP_MENU_NO, 4, 7) != '000' and empty cust.HP_BOARD_MASTER_NO}"> 
									<tr style="font-weight: bold;">
										<td>${cust.MENU_NM}</td>
										<td align="right" width="20px" ></td>
										<td align="right" width="20px" colspan="2" onclick="addCustomBoard(${cust.HP_MENU_NO})"><i class="icon-plus-sign-alt"></i></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(cust.HP_MENU_NO, 5, 7) != '00' and cust.USE_YN eq 'Y'}"> 
									<tr class="depth3">
										<td>${cust.MENU_NM}</td>
										<td  align="right" width="20px" ></td>
										<td  align="right" width="20px"  onclick="searchMenuDetail(${cust.HP_MENU_NO})"><i class="icon-cog"></i></td>
									</tr>
								</c:if>	
								<c:if test="${fn:substring(cust.HP_MENU_NO, 5, 7) != '00' and cust.USE_YN eq 'N'}"> 
									<tr class="depth3 danger">
										<td>${cust.MENU_NM}(미사용)</td>
										<td  align="right" width="20px" ></td>
										<td  align="right" width="20px" onclick="searchMenuDetail(${cust.HP_MENU_NO})"><i class="icon-cog"></i></td>
									</tr>		
								</c:if>	
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="col-md-4" >
				<div class="panel panel-primary">
 					<div class="panel-heading">사이버 홍보관</div>
					<table class="table">
						<tbody>
							<c:forEach items="${cyberPr}" var="cyber">
								<c:if test="${fn:substring(cyber.HP_MENU_NO, 5, 7) == '00' and fn:substring(cyber.HP_MENU_NO, 4, 7) != '000' and cyber.HP_MENU_NO != '1060100'}"> 
									<tr style="font-weight: bold;" class="depth2">
										<td >${cyber.MENU_NM}</td>
										<td align="right" width="20px" onclick="searchMenuDetail(${cyber.HP_MENU_NO})"><i class="icon-cog"></i></td>
										<td align="right" width="20px" onclick="addCustomBoard(${cyber.HP_MENU_NO});" ><i class="icon-plus-sign-alt"></i></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(cyber.HP_MENU_NO, 5, 7) != '00' and empty cyber.HP_BOARD_MASTER_NO}"> 
									<tr class="depth3" >
										<td align="right" width="20px" ></td>
										<td colspan="2" >${cyber.MENU_NM}(HTML MENU)</td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(cyber.HP_MENU_NO, 5, 7) != '00' and not empty cyber.HP_BOARD_MASTER_NO and cyber.USE_YN eq 'Y'}"> 
									<tr class="depth3">
										<td align="right" width="20px" ></td>
										<td colspan="2" onclick="searchMenuDetail(${cyber.HP_MENU_NO});"><i class="icon-cog"></i>${cyber.MENU_NM}</td>
									</tr>
								</c:if>
								<c:if test="${cyber.HP_MENU_NO eq '1060100'}"> 
									<tr style="font-weight: bold;">
										<td>${cyber.MENU_NM}</td>
										<td align="right" width="20px" ></td>
										<td align="right" width="20px" onclick="addCustomBoard(${cyber.HP_MENU_NO});" ><i class="icon-plus-sign-alt"></i></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(cyber.HP_MENU_NO, 5, 7) != '00' and cyber.USE_YN eq 'N'}"> 
									<tr class="depth3 danger">
										<td >${cyber.MENU_NM}</td>
										<td align="right" width="20px" ></td>
										<td align="right" width="20px" onclick="searchMenuDetail(${cyber.HP_MENU_NO})"><i class="icon-cog"></i></td>
									</tr>		
								</c:if>	
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
		
		<div class="row">			
		<div class="col-md-12" >
			<div class="col-md-4" >
				<div class="panel panel-primary">
 					<div class="panel-heading">정보마당</div>
					<table class="table">
						<tbody>
							<c:forEach items="${infoLounge}" var="info">
								<c:if test="${fn:substring(info.HP_MENU_NO, 5, 7) == '00' and fn:substring(info.HP_MENU_NO, 4, 7) != '000' and info.HP_MENU_NO != '1020100' and info.HP_MENU_NO != '1020300'  and info.HP_MENU_NO != '1020500'}"> 
									<tr style="font-weight: bold;"  class="depth2">
										<td >${info.MENU_NM}</td>
										<td align="right" width="20px"></td>
										<td align="right" width="20px" onclick="addCustomBoard(${info.HP_MENU_NO});"><i class="icon-plus-sign-alt"></i></td>
									</tr>
								</c:if>
								<c:if test="${info.HP_MENU_NO == '1020100' or info.HP_MENU_NO == '1020300' or info.HP_MENU_NO == '1020500'}"> 
									<tr style="font-weight: bold;"  class="depth2">
										<td >${info.MENU_NM}</td>
										<td align="right" width="20px" onclick="searchMenuDetail(${info.HP_MENU_NO});" ><i class="icon-cog"></i></td>
										<td align="right" width="20px" onclick="addCustomBoard(${info.HP_MENU_NO});"><i class="icon-plus-sign-alt"></i></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(info.HP_MENU_NO, 5, 7) != '00' and empty info.HP_BOARD_MASTER_NO }"> 
									<tr class="depth3" >
										<td >${info.MENU_NM}</td>
										<td align="right" width="20px"></td>
										<td align="right" width="20px"></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(info.HP_MENU_NO, 5, 7) != '00' and not empty info.HP_BOARD_MASTER_NO and info.USE_YN eq 'Y' }"> 
									<tr class="depth3">
										<td >${info.MENU_NM}</td>
										<td align="right" width="20px"></td>
										<td align="right" width="20px" onclick="searchMenuDetail(${info.HP_MENU_NO});"><i class="icon-cog"></i></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(info.HP_MENU_NO, 5, 7) != '00' and info.USE_YN eq 'N'}"> 
									<tr class="depth3">
										<td >${info.MENU_NM}(미사용)</td>
										<td align="right" width="20px"></td>
										<td  align="right" width="20px" onclick="searchMenuDetail(${info.HP_MENU_NO});"><i class="icon-cog"></i></td>
									</tr>		
								</c:if>	
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="col-md-4" >
				<div class="panel panel-primary">
 					<div class="panel-heading">조합소개</div>
					<table class="table">
						<tbody>
							<c:forEach items="${associ}" var="associ">
								<c:if test="${fn:substring(associ.HP_MENU_NO, 5, 7) == '00' and fn:substring(associ.HP_MENU_NO, 4, 7) != '000'}"> 
									<tr style="font-weight: bold;" >
										<td >${associ.MENU_NM}</td>
										<td align="right" width="20px" onclick="addCustomBoard(${associ.HP_MENU_NO})"><i class="icon-plus-sign-alt"></i></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(associ.HP_MENU_NO, 5, 7) != '00' and empty associ.HP_BOARD_MASTER_NO}"> 
									<tr class="depth3">
										<td colspan="2" >${associ.MENU_NM}</td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(associ.HP_MENU_NO, 5, 7) != '00' and not empty associ.HP_BOARD_MASTER_NO and associ.USE_YN eq 'Y'}"> 
									<tr class="depth3">
										<td>${associ.MENU_NM}</td>
										<td onclick="searchMenuDetail(${associ.HP_MENU_NO})"><i class="icon-cog"></i></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(associ.HP_MENU_NO, 5, 7) != '00' and associ.USE_YN eq 'N'}"> 
									<tr class="depth3  danger">
										<td>${associ.MENU_NM}(미사용)</td>
										<td onclick="searchMenuDetail(${associ.HP_MENU_NO})"><i class="icon-cog"></i></td>
									</tr>		
								</c:if>	
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="col-md-4" >
				<div class="panel panel-primary">
 					<div class="panel-heading">공제상품</div>
					<table class="table">
						<tbody>
							<c:forEach items="${deductP}" var="deduct">
								<c:if test="${fn:substring(deduct.HP_MENU_NO, 5, 7) == '00' and fn:substring(deduct.HP_MENU_NO, 4, 7) != '000'}"> 
									<tr style="font-weight: bold;" >
										<td>${deduct.MENU_NM}</td>
										<td align="right" width="20px" onclick="addCustomBoard(${deduct.HP_MENU_NO})"><i class="icon-plus-sign-alt"></i></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(deduct.HP_MENU_NO, 5, 7) != '00' and empty deduct.HP_BOARD_MASTER_NO}"> 
									<tr class="depth3">
										<td colspan="2">${deduct.MENU_NM}</td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(deduct.HP_MENU_NO, 5, 7) != '00' and not empty deduct.HP_BOARD_MASTER_NO and deduct.USE_YN eq 'Y'}"> 
									<tr  class="depth3  danger">
										<td>${associ.MENU_NM}</td>
										<td onclick="searchMenuDetail(${deduct.HP_MENU_NO})"><i class="icon-cog"></i></td>
									</tr>
								</c:if>
								<c:if test="${fn:substring(deduct.HP_MENU_NO, 5, 7) != '00' and deduct.USE_YN eq 'N'}"> 
									<tr  class="depth3  danger">
										<td>${deduct.MENU_NM}(미사용)</td>
										<td colspan="2" onclick="searchMenuDetail(${deduct.HP_MENU_NO})"><i class="icon-cog"></i></td>
									</tr>		
								</c:if>	
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>