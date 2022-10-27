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
/* dropdown 검색 function */
function searchCompany() {	
	
	var searchKeyword = document.boardForm.searchKeyword.value;
	if(searchKeyword == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}
	if(searchKeyword.length < 2){
		alert("검색어는 두글자 이상 입력하셔야 합니다");
		return false;
	}
	document.boardForm.searchDirect.value="";
	document.boardForm.pageIndex.value = 1;
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompanyDirect.do#boardForm'/>";
   	document.boardForm.submit();
}

function searchCompanyLocal() {	
	
	document.boardForm.searchKeyword.value ="";
	document.boardForm.pageIndex.value = 1;
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompanyDirect.do#boardForm'/>";
   	document.boardForm.submit();
}


/* 지도 클릭 검색 function */
function searchMap(location) {
	document.boardForm.searchKeyword.value ="";
	document.boardForm.pageIndex.value = 1;
	document.boardForm.searchDirect.value=location;
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompanyDirect.do#boardForm'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_recommandCompany(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompanyDirect.do#boardForm'/>";
   	document.boardForm.submit();
} 
function searchHospital() {
	document.boardForm.searchCom.value="hospital";
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompanyDirect.do#boardForm'/>";
   	document.boardForm.submit();
}
function searchFactory() {
	document.boardForm.searchCom.value="factory";
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompanyDirect.do#boardForm'/>";
   	document.boardForm.submit();
}
function popupMap(addr,code,name){
	var address = addr+" "+code;
	window.open("",'mapView','toolbar=no,location=no,status=no,menubar=no,width=1050,height=710');
	document.boardForm.address.value=address;
	document.boardForm.name.value=name;
	document.boardForm.action="<c:url value='/infoLounge/dataCenter/recommandCompanyMap.do'/>";
	document.boardForm.target="mapView";
	document.boardForm.submit(); 
//	window.open("",'mapView','toolbar=no,location=no,status=no,menubar=no,width=1050,height=710');
	document.boardForm.action="";
	document.boardForm.target="";
	
}

$(document).ready(function(){
	$(window).on('keydown',function(event){
		if( event.keyCode == 13) {searchCompany();}
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
 						<h2><img src="/images/truck/info/recom_tit.gif" alt="우수협력정비업체" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<span>우수협력정비업체</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
				<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post" action="">
					<input type="hidden" name="searchCom" value="${searchCom}"/>
					<input type="hidden" name="articleNo" />
					<input type="hidden" name="address" />
					<input type="hidden" name="name" />
					<fieldset>
					<legend>우수협력정비업체조회</legend>
					<p class="confirTit"><img src="/images/truck/info/recom_con_tit.gif" alt="고객 중심의 밀착 현장 서비스를 위하여 전국 단위의 고객 만족 중심 정비공장을 파트너로 지정하여 운영하고 있습니다" /></p>
					<div class="conSection">
						<div class="roundBox mB40">
							<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 검색조건 -->
							<div class="bestcSearch clfix">
								<p class="bestcForm">
									<label for="searchSelect"><img src="/images/truck/info/choice_area.gif" alt="지역선택" /></label>
									<form:select path="searchDirect" onchange="searchCompanyLocal()" title="지역선택">
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
									<label for="search"><img src="/images/truck/info/choice_comp.gif" alt="업체명" /></label>
									<form:input path="searchKeyword" title="업체명을 입력해 주세요" class="txt" id="search" type="text" value="" />
									<a class="btn_search" href="#;" onclick="searchCompany();"><img class="vaM" alt="검색하기" src="/images/truck/btn/btn_ksearch.gif"/></a>
								</p>
							</div>
							<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div><!--// 우수협력정비업체조회 e -->
						<div class="bestcArea clfix">
							<h4 class="h4Tit">우수 협력업체 전국 현황</h4>
							<div class="mapArea">
								<div class="map">
									<a href="#;" onclick="searchMap('서울');return false;" class="area01 <c:if test="${local == '서울' }">on</c:if>"><span class="hide">서울</span></a>
									<a href="#;" onclick="searchMap('인천');return false;" class="area02 <c:if test="${local == '인천' }">on</c:if>"><span class="hide">인천</span></a>
									<a href="#;" onclick="searchMap('경기');return false;" class="area03 <c:if test="${local == '경기' }">on</c:if>"><span class="hide">경기</span></a>
									<a href="#;" onclick="searchMap('강원');return false;" class="area04 <c:if test="${local == '강원' }">on</c:if>"><span class="hide">강원</span></a>
									<a href="#;" onclick="searchMap('충북');return false;" class="area05 <c:if test="${local == '충북' }">on</c:if>"><span class="hide">충북</span></a>
									<a href="#;" onclick="searchMap('충남');return false;" class="area06 <c:if test="${local == '충남' }">on</c:if>"><span class="hide">충남</span></a>
									<a href="#;" onclick="searchMap('대구');return false;" class="area07 <c:if test="${local == '대구' }">on</c:if>"><span class="hide">대구</span></a>
									<a href="#;" onclick="searchMap('경북');return false;" class="area08 <c:if test="${local == '경북' }">on</c:if>"><span class="hide">경북</span></a>
									<a href="#;" onclick="searchMap('경남');return false;" class="area09 <c:if test="${local == '경남' }">on</c:if>"><span class="hide">경남</span></a>
									<a href="#;" onclick="searchMap('울산');return false;" class="area10 <c:if test="${local == '울산' }">on</c:if>"><span class="hide">울산</span></a>
									<a href="#;" onclick="searchMap('부산');return false;" class="area11 <c:if test="${local == '부산' }">on</c:if>"><span class="hide">부산</span></a>
									<a href="#;" onclick="searchMap('전북');return false;" class="area12 <c:if test="${local == '전북' }">on</c:if>"><span class="hide">전북</span></a>
									<a href="#;" onclick="searchMap('전남');return false;" class="area13 <c:if test="${local == '전남' }">on</c:if>"><span class="hide">전남</span></a>
									<a href="#;" onclick="searchMap('광주');return false;" class="area14 <c:if test="${local == '광주' }">on</c:if>"><span class="hide">광주</span></a>
									<a href="#;" onclick="searchMap('대전');return false;" class="area15 <c:if test="${local == '대전' }">on</c:if>"><span class="hide">대전</span></a>
									<a href="#;" onclick="searchMap('제주');return false;" class="area16 <c:if test="${local == '제주' }">on</c:if>"><span class="hide">제주</span></a>
								</div><!--// map -->
								<div class="bbsList2"><!-- *게시판리스트 Left 지도위치까지만 노출해주세요 -->
									<table class="tbList_st01" summary="우수협력지역목록. 사업장명, 연락처, 소재지, 상세위치">
										<caption>우수협력지역목록현황게시판</caption>
										<colgroup>
											<col style="width:18%;" />
											<col style="width:20%;" />
											<col style="width:47%;" />
											<col style="width:15%;" />
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
												<td class="brR alL"><c:out value="${result.CODE_NM}"/><%-- <a href="javascript:viewCompany('<c:out value="${result.articleNo}"/>')"><c:out value="${result.companyName}"/></a> --%></td>
												<td class="brR">&#40;<c:out value="${result.TEL_DOM}"/>&#41;<c:out value="${result.TEL_NO}"/></td>
												<td class="brR alL ellipsis"><c:out value="${result.ZIP_NAME}"/> <c:out value="${result.HOME_NO}"/></td>
												<td><a href="#;" onclick="popupMap('${result.ZIP_NAME}','${result.HOME_NO}','${result.CODE_NM}'); return false;" ><img src="/images/truck/btn/btn_mapview.gif" alt="상세위치지도보기" /></a></td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- paging s -->
									<div class="paging">
										<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_recommandCompany" />
										<form:hidden path="pageIndex" />
									</div><!--// paging e -->
								</div><!--// 지역목록 -->
							</div>
						</div>
					</div>
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