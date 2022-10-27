<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 보기 화면 function */
function viewCompany(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompanyView.do'/>";
   	document.boardForm.submit();		
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
/* 글 검색 function */
function searchCompany() {
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompany.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_recommandCompany(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompany.do'/>";
   	document.boardForm.submit();
}

function popupMap(addr,code,name){
	var address = addr+""+code;
	var query = "/infoLounge/dataCenter/recommandCompanyMap.do?address="+address+"&name="+name;
	window.open(query,"Window");
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
 						<h2><img src="/images/truck/info/recom_tit.gif" alt="우수협력업체" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<span>우수협력업체</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<input type="hidden" name="articleNo" />
					<fieldset>
					<legend>우수협력업체</legend>
					<p class="confirTit"><img src="/images/truck/info/recom_con_tit.gif" alt="화물공제조합은 전국 우수한 협력업체를 통해 고객만을 위한 특별한 서비스를 제공하고자 노력합니다" /></p>
					<div class="conSection">
						<div class="roundBox">
							<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							
							<div class="findArea">
								<p class="findName"><img src="/images/truck/info/recom_conseabg.gif" alt="이름으로 찾기" /></p>
								<div class="findForm">
									<p>
										<!-- <input id="ch1" name="searchCategory" title="병원" type="radio" value="hospital" checked="checked"/><label for="ch1">병원</label> -->
										<form:input id="ch2" path="searchCategory" title="정비공장" type="radio" value="factory" checked="checked"/><label for="ch2">정비공장</label>
									</p>
									<p>
										<form:select id="searchDirect" path="searchDirect" title="지역검색옵션">
											<form:option value="" selected="selected">전국</form:option>
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
										<label class="hide" for="search">검색어입력</label><input id="search" name="searchKeyword" title="검색어를 입력해주세요" style="width:300px" name="search" class="txt" type="text" value="${searchVO.searchKeyword }"/>
										<a class="btn_search" href="#;" onclick="searchCompany(); return false;"><img class="vaM" src="/images/truck/btn/btn_ksearch.gif" alt="검색" /></a>
									</p>										
								</div>
							</div>							
							<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div><!--// roundBox e -->
						<!-- table list s -->
						<div class="bbsList1">
							<table class="tbList_st01" summary="이름으로찾기 검색결과 목록. 사업장명, 연락처, 소재지, 상세위치">
								<caption>이름으로찾기검색결과목록</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:15%;" />
									<col style="width:55%;" />
									<col style="width:10%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">사업장명</th>
										<th scope="col">연락처</th>
										<th scope="col">소재지</th>
										<th scope="col" class="last">상세위치</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<tr>
										<td><c:out value="${result.CODE_NM}"/><%-- <a href="javascript:viewCompany('<c:out value="${result.articleNo}"/>')"><c:out value="${result.companyName}"/></a> --%></td>
										<td><c:out value="${result.TEL_DOM}"/>-<c:out value="${result.TEL_NO}"/></td>
										<td class="alL"><c:out value="${result.ZIP_NAME}"/> <c:out value="${result.HOME_NO}"/></td>
										<td><a href="#;" onclick="popupMap('${result.ZIP_NAME}','${result.HOME_NO}','${result.CODE_NM}'); return false;" ><img src="/images/truck/btn/btn_mapview.gif" alt="상세위치지도보기" /></a></td>
									</tr>
									</c:forEach>									
								</tbody>
							</table>
							<!-- paging s -->
							<div id="map">
							</div>
							<div class="paging">
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_recommandCompany" />
								<form:hidden path="pageIndex" />
							</div><!--// paging e -->
						</div>
						<!--// table list e -->
					</div></fieldset></form:form>
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

