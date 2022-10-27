<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">

/* index function */
function goIndex() {
	document.location.href = "/m/main/index.do";
}
/* pagination 페이지 링크 function */
function paging_recommandCompany(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/m/infoLounge/recommandCompany/list.do'/>";
   	document.boardForm.submit();
} 
function popupMap(addr,code,name,tel1,tel2){
	var tel = tel1+"-"+tel2;
	var address = addr+""+code;
	$("#address").val(address);
	$("#tel").val(tel);
	$("#name").val(name);
	//var query = "/m/infoLounge/recommandCompany/view.do?address="+address+"&name="+name+"&tel="+tel;
	var query = "/m/infoLounge/recommandCompany/view.do";
	//query = encodeURIComponent(query);
	window.open("",'window','location=yes');
	document.mapPop.target = "window";
	document.mapPop.action = query;
	document.mapPop.method = "post";
	document.mapPop.submit(); 
}
function searchCompany() {	
	var searchKeyword = document.boardForm.searchKeyword.value;
	if(searchKeyword.trim() == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}
	if(searchKeyword.length < 2){
		alert("검색어는 두글자 이상 입력하셔야 합니다");
		return false;
	}
	document.boardForm.searchDirect.value ="";
	document.boardForm.action = "<c:url value='/m/infoLounge/recommandCompany/list.do'/>";
   	document.boardForm.submit();
}

function searchCompanyLocal() {	
	
	document.boardForm.searchKeyword.value ="";
	document.boardForm.pageIndex.value = 1;
	document.boardForm.action = "<c:url value='/m/infoLounge/recommandCompany/list.do'/>";
   	document.boardForm.submit();
}
$(document).ready(function(){
	$(window).on('keydown',function(event){
		if( event.keyCode == 13) searchCompany();
	});
	
	$('form#searchVO input[name="searchKeyword"]').focus();
});
</script>
</head>
<body>
<form id="mapPop" name="mapPop">
<input type="hidden" name="address" id="address" value=""/>
<input type="hidden" name="name" id="name" value=""/>
<input type="hidden" name="tel" id="tel" value=""/>
</form>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path04">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/infoLounge/index.do">정보마당</a></li>
			<li><a href="/m/infoLounge/recommandCompany/list.do">우수협력정비업체</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
	<form:form commandName="searchVO" name="boardForm" method="post">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i04"><img alt="우수협력정비업체" src="/images/m_truck/subtop/04top_3.png" /></li>
				<li class="txt01">전국 우수한 정비업체를 통해 고객만을 위한 특별한 서비스를 제공하고자 노력합니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<!-- 게시판검색 -->
		<div class="cellFirst searchForm">
			<div class="cellw2">
				<!-- <select id="" name="" title="지역선택" style="width:100%" class="select">
					<option value="">선택</option>
				</select> -->
				<form:select path="searchDirect" title="지역선택"  style="width:100%" class="select" onchange="searchCompanyLocal(); return false;">
					<form:option value="">전국</form:option>
					<form:option value="서울">서울</form:option>
					<form:option value="부산">부산</form:option>
					<form:option value="대구">대구</form:option>
					<form:option value="인천">인천</form:option>
					<form:option value="광주">광주</form:option>
					<form:option value="대전">대전</form:option>
					<form:option value="울산">울산</form:option>
					<form:option value="경기">경기</form:option>
					<form:option value="강원">강원</form:option>
					<form:option value="충북">충북</form:option>
					<form:option value="충남">충남</form:option>
					<form:option value="전북">전북</form:option>
					<form:option value="전남">전남</form:option>
					<form:option value="경북">경북</form:option>
					<form:option value="경남">경남</form:option>
					<form:option value="제주">제주</form:option>
				</form:select>
			</div>
			<div class="cellw9">
				<form:input type="text" id="searchKeyword" path="searchKeyword" placeholder="" />
				<a class="btn" href="#;" onclick="searchCompany()"><i class="icon-search"></i></a>
			</div>
		</div>
		<!-- 목록 -->
		<article class="defaultList">
			<ul>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<li class="mapView" onclick="javascript:popupMap('${result.ZIP_NAME}','${result.HOME_NO}','${result.CODE_NM}','${result.TEL_DOM}','${result.TEL_NO}'); return false;">
					<a href="#;" >
					<span class="title"><c:out value="${result.CODE_NM}"/></span><span class="tel"><c:out value="${result.TEL_DOM}"/>-<c:out value="${result.TEL_NO}"/></span>
					<span class="txtDesc2"><c:out value="${result.ZIP_NAME}"/> <c:out value="${result.HOME_NO}"/></span>
					</a>
				</li>
			</c:forEach>
			</ul>
		</article>
		<!-- pagenavi -->
		<article class="textCenter">
			<ul class="pagination">
				<ui:pagination paginationInfo = "${paginationInfo}" type="mobileImage" jsFunction="paging_recommandCompany" />
				<form:hidden path="pageIndex" />
			</ul>
		</article>
	</form:form>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>