<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	//New이미지를 보여주기 위해 현재날짜 가져오기
 	GregorianCalendar calender = new GregorianCalendar();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
 	Date nowDate = calender.getTime();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	var tab = '${searchVO.tabCon}';
	
	if(tab == '1'){
		$("#tab1").attr('style','display:none');
		$("#tab2").attr('style','display:block');
		$(".tabMenu #toptab1").removeAttr("class");
		$(".tabMenu #toptab2").attr("class","active");
	}
	
	<%-- 검색박스 엔터키 설정--%>
	$('form#boardForm input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchDriverBoard();
			return false;
		}
	});
	
});

/* 글 보기 화면 function */
function viewDriverBoard(no) {
	document.boardForm.tabCon.value="1";
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/cyberPr/driversDayView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addDriverBoard() {
   	document.boardForm.action = "<c:url value='/cyberPr/driversDayAddView.do'/>";
   	document.boardForm.submit();		
}
/* 글 검색 function */
function searchDriverBoard() {
	document.boardForm.tabCon.value="1";
	document.boardForm.action = "<c:url value='/cyberPr/driversDayIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_driverBoard(pageNo){
	document.boardForm.tabCon.value="1";
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/cyberPr/driversDayIndex.do'/>";
   	document.boardForm.submit();
}
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
						<h2><img src="/images/truck/cyber/driver_tit.gif" alt="운전자의 날" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/cyberPr/cyberPrIndex.do" >사이버홍보관</a>
						<span>운전자의 날</span>
					</div>
				</div><!-- conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cyber/driver_con_tit.gif" alt="화물공제조합 운전자의 날 행사 안내 입니다. 각종 기념 행사 내용을 확인하세요." /></p>
					<div class="driverArea">
						<p>어려운 여건 속에서도 묵묵히 우리나라 경제의 대동맥 역할을 해 온 화물자동차운전자의 노고를 격려하고<br />사기를 진작하기 위해 국토교통부 후원으로 2001년부터 정부포상행사와 축하공연 등의 기념 행사를 실시하고 있습니다&#46;</p>
					</div>
					<!-- tabMenu -->
					<div class="jointabs">
						<ul class="tabMenu">
							<li id="toptab1"><a href="#tab1">운전자의날 안내</a></li>
							<li id="toptab2"><a href="#tab2">운전자의날 공지사항</a></li>
						</ul>
						<div class="tabContainer">
							<!-- 운전자의날 안내 -->
							<div id="tab1" class="driverArea02 tabCont">
								<h3 class="hide">운전자의날 안내</h3>
								<div class="txtContent">
									<h3 class="h3Tit">시행 배경</h3>
									<p class="txtPoint">우리나라 최초 화물운송사업 시작일&#40;1945&#46; 10&#46; 8&#41;을 기념하기 위해 2001년부터 화물자동차 운전자의 날을 제정 매년 시행</p>
									<p class="txtPoint">2006년부터 장학금 지원 확대</p>
								</div>
								<div class="txtContent">
									<h3 class="h3Tit">시행 목적</h3>
									<p class="txtPoint">동북아 물류중심 국가로 도약함에 있어 화물자동차 운전자의 역할이 중요함을 홍보하고&#44; 운전자의 사기 진작을 위함&#46;</p>
									<p class="txtPoint">사업용 회물자동차의 교통사고 감소 기대</p>
								</div>
								<div class="txtContent">
									<h3 class="h3Tit">참석 대상</h3>
									<p class="txtPoint">화물자동차 운전자</p>
									<p class="txtPoint">우리 조합 본부 및 수도권 임직원</p>
									<p class="txtPoint">국토교통부 장관 및 관계공무원</p>
									<p class="txtPoint">유관 단체 임직원</p>
									<p class="txtPoint">연합회 및 협회 임직원</p>
									<p class="txtPoint">포상 수상자 및 가족&#44; 화물운송업체 임직원</p>
								</div>
								<div class="txtContent">
									<h3 class="h3Tit">장학금 지원사업</h3>
									<p class="txtPoint">추진 배경 및 목적</p>
									<ul class="txtListst01">
										<li>최일선에서 우리나라 경제 발전의 원동력이 되어 온 화물자동차 운전자들의 노고를 격려하기 위함&#46;</li>
										<li>장학사업을 통해 우리조합의 발전에 큰 기여를 한 관련자들에게 장학금을 지급하여 조합원들의 복지증진과 일체감 조성을 위함&#46;</li>
									</ul>
									<p class="txtPoint">지원 대상자</p>
									<ul class="txtListst01 pB0">
										<li>우리조합에 공제 계약이 유지되고 있는 화물자동차운전자&#40;지입차주포함&#41; 자녀 &#40;대표이사 자녀는 제외&#41;</li>
										<li>교통사고로 사망 또는 부상을 당했으며&#44; 사고 당시 공제조합에 계약을 유지하고 있던 화물자동차운전자&#40;지입차주 포함&#41;의 자녀</li>
										<li>업계 종사자의 자녀</li>
										<li>상기 대상자 중 학업성적이 우수하거나 가정형편이 어려운 자</li>
									</ul>
								</div>
								<div class="txtContent">
									<h3 class="h3Tit">우수 조합원 &#183; 우수차량관리자 표창</h3>
									<p class="txtPoint">추진 배경 및 목적</p>
									<ul class="txtListst01">
										<li>우리화물공제조합과 조합원사의 협력을 도모하고 공제조합 발전을 위해 헌신적으로 노력한 조합원 및 차량관리자를 선발하여 공로를 치하하며&#44;</li>
										<li>공제조합 제도 홍보 차량계약대수 확충 및 화물자동차 교통사고 감소를 통해 공제조합의 경영개선을 이루기 위함&#46;</li>
									</ul>
								</div>
							</div><!--// tab1 e -->
							<!-- 운전자의날 공지사항 -->
							<div id="tab2" class="tabCont">
								<h3 class="hide">운전자의날 공지사항</h3>
								<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post" action="">
								<fieldset>
								<legend>운전자의날 공지사항</legend>
								<input type="hidden" name="articleNo" />
								<p class="infosearchWrap">
									<form:select path="searchCondition" title="운전자의날검색옵션" name="" >
										<form:option selected="selected" value = "0">전체</form:option>
										<form:option value="1">제목</form:option>
										<form:option value="2">본문</form:option>
									</form:select>
									<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" title="검색어를 입력해주세요" style="width:173px" value=""/>
									<a class="btn_search" href="#;" onclick="searchDriverBoard();"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
									<form:input path="tabCon" type="hidden"/>
								</p>
								<!-- table list s -->
								<div class="bbsList1">
									<table class="tbList_st01" summary="운전자의날 게시판 목록입니다. 번호,제목,작성일,조회수">
										<caption>운전자의날 게시판 목록</caption>
										<colgroup>
											<col width="9%">
											<col width="70%">
											<col width="12%">
											<col width="9%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first">번호</th>
												<th scope="col">제목</th>
												<th scope="col">작성일</th>
												<th scope="col" class="last">조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty resultList}">
											<c:forEach var="result" items="${resultList }" varStatus="status">	
											<c:set var="regDate">
											${fn:replace(result.createTime, '.', '')}
											</c:set>		
											 <tr>
												<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
												<td class="alL ellipsis"><a href="#;" onclick="viewDriverBoard('<c:out value="${result.articleNo}"/>')">${fn:replace(result.title, keyword , highlight )}</a>
												<%
												String chkDate = (String)pageContext.getAttribute("regDate",PageContext.PAGE_SCOPE);
												Date regDate = dateFormat.parse(chkDate); 
												long diff = nowDate.getTime() - regDate.getTime(); //현재날짜 - 공지사항등록날짜
												long diffDays = diff / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
												%>
												<%if(diffDays<5){ %>								
												<img  src="/images/truck/main/icon_new_org.png" alt="새글"/>
												<%}%>
												</td>
												<td><c:out value="${fn:substring(result.createTime, 0, 11)}"/></td>
												<td><c:out value="${result.rdcount}"/></td>
											 </tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty resultList}">
												<tr>
													<td class="tdnone" colspan="4">검색된 내용이 없습니다.</td>
												</tr>
											</c:if>	
										</tbody>
									</table>
									<!-- paging s -->
									<div class="paging">
										<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_driverBoard" />
										<form:hidden path="pageIndex" />
									</div><!--// paging e -->
								</div><!--// table list e -->
								</fieldset>
								</form:form>
							</div><!--// tab2 e -->
						</div><!--// tabContainer e -->
					</div>
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




