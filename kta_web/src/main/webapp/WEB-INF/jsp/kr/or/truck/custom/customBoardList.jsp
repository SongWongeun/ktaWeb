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
function viewCustomBoard(no){
	document.boardForm.customNo.value = no;
   	document.boardForm.action = "<c:url value='/customboard/view.do'/>";
   	document.boardForm.submit();		
}

function writeCustomBoard(){
   	document.boardForm.action = "<c:url value='/customboard/addView.do'/>";
   	document.boardForm.submit();		
}

function searchCustomBoard(){
   	document.boardForm.action = "<c:url value='/customboard/list.do'/>";
   	document.boardForm.submit();		
}
</script>
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ="${param.code}";
	if(param == 'regist.success'){
	 param = '등록이';
	}else if(param == 'update.success'){
		param='수정이';
	}else if(param == 'delete.success'){
		param ='삭제가';
	}
	alert('글'+param+' 완료되었습니다.');
});
</script>
</c:if>
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
				<div class="conTitle" style="margin-bottom: 10px;">
					<div class="title">
						<h2 style="font-size: 38px;font-weight: bolder;color: #143B8F;"> ${BOARD_NM}</h2>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>${BOARD_NM}</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
				<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post" action="">
				<fieldset>
					<legend>${BOARD_NM} list</legend>
					<form:hidden path="upperNo"/>
					<form:hidden path="boardNo"/>
					<form:hidden path="customNo"/>
						<div class="conSection">
						<p class="infosearchWrap">
							<form:select path="searchCondition" title="검색옵션" >
								<form:option selected="selected" value="0">전체</form:option>
								<form:option value="1">제목</form:option>
								<form:option value="2">본문</form:option>
							</form:select>
							<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" title="검색어를 입력해주세요" style="width:173px" />
							<a class="btn_search" href="#;" onclick="searchCustomBoard(); return false;"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
						</p><!-- table list s -->
						<div class="bbsList1">
							<c:if test="${DISPLAY_TYPE eq 'board' }">
							<table class="tbList_st01" summary="custom 게시판입니다. 번호,제목,작성일,조회수">
								<caption>custom 게시판</caption>
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
									${fn:replace(result.REGIST_DATE, '.', '')}
									</c:set>			
									 <tr>
									 	<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
									 	<td class="alL ellipsis"><a href="#;" onclick="viewCustomBoard('<c:out value="${result.HP_CUSTOM_BOARD_NO}"/>'); return false;">${fn:replace(result.TITLE, keyword , highlight )}</a>
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
									 	<td><c:out value="${fn:substring(result.REGIST_DATE, 0, 11)}"/></td>
									 	<td><c:out value="${result.READ_COUNT}"/></td>
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
							</c:if>
							<c:if test="${DISPLAY_TYPE eq 'gallery' }">
								<div class="eventbgTop">
									<div class="conSection eventBg">
									<h3 class="hide">gallery</h3>
									<ul class="imgGallery" style="margin-left :230px;">
									<c:forEach var="result" items="${resultList}" varStatus="status">
									      <c:if test="${!empty result.ATCH_FILE_ID}">
								         	 <li><a href="#;" onclick="viewCustomBoard('<c:out value="${result.HP_CUSTOM_BOARD_NO}"/>'); return false;">
								         	 <img src="/com/atch/getThumbImage.do?atchFileId=${result.ATCH_FILE_ID}" alt="<c:out value="${result.ATCH_FILE_ID}" /> 이미지" width="128" height="84"/></a></li>
								         </c:if>
								          <c:if test="${empty result.ATCH_FILE_ID}">
								         	  사진없음
								         </c:if>
									</c:forEach>
									</ul>																		
									</div>
								</div>
							</c:if>
							<c:if test="${DISPLAY_TYPE eq 'gallery_board' }">
								<div class="eventbgTop">
									<div class="eventtabs">
									<div class="conSection eventBg">
										<h3 class="hide">gallery_board</h3>
										<ul class="evtxtList" style="margin-left :230px;">
											<c:if test="${not empty resultList}">
											<c:forEach var="result" items="${resultList}" varStatus="status">		
											<c:set var="regDate">
											${fn:replace(result.REGIST_DATE, '.', '')}
											</c:set>		
											<li>
										        <a href="#;" onclick="viewCustomBoard('<c:out value="${result.HP_CUSTOM_BOARD_NO}"/>'); return false;">
										        	<img src="/com/atch/getThumbImage.do?atchFileId=${result.ATCH_FILE_ID}" alt="<c:out value="${result.ATCH_FILE_ID}" /> 이미지" width="200"/>
													<span>${fn:replace(result.TITLE, keyword , highlight )}
													<%
													String chkDate = (String)pageContext.getAttribute("regDate",PageContext.PAGE_SCOPE);
													Date regDate = dateFormat.parse(chkDate); 
													long diff = nowDate.getTime() - regDate.getTime(); //현재날짜 - 공지사항등록날짜
													long diffDays = diff / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
													%>
													<%if(diffDays<5){ %>								
													<img style="width:12px; height:12px;" src="/images/truck/main/icon_new_org.png" alt="새글"/>
													<%}%>
													</span>
												</a>
											</li>
											</c:forEach>
											</c:if>
											<c:if test="${empty resultList}">
												<tr>
													<td class="tdnone" colspan="2">검색된 내용이 없습니다.</td>
												</tr>
											</c:if>	
											</ul>
										</div>
										</div>
									</div>
							</c:if>
							<!-- paging s -->
							<div class="paging">
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_insuranceBoard" />
								<form:hidden path="pageIndex" />
							</div>							
							<!--// paging e -->
							<!-- button s -->
							<c:if test="${USE_ADMIN_YN eq 'N'}">
								<div class="btnboxR clfix">
									<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="writeCustomBoard();">글쓰기</a></span>
								</div>
							</c:if><!-- button e -->
						</div><!--// table list e -->
					</div>
				</fieldset>
				</form:form>
				</div>
			</div><!--// conaArea e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div><!--// contents e -->
		
	</div>
	<hr />
	<!--// container e -->
	<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
</body>
</html>