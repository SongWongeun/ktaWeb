<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	var param ='${param.code}';
	
	if(param == 'regist.success'){
	 param = '등록이';
		alert('글'+param+' 완료되었습니다.');
	}else if(param == 'update.success'){
		param='수정이';
		alert('글'+param+' 완료되었습니다.');
	}else if(param == 'delete.success'){
		param ='삭제가';
		alert('글'+param+' 완료되었습니다.');
	}
});
/* 글 목록 화면 function */
function listBoard() {
	document.boardForm.action = "<c:url value='/customer/fraud/oaoFraudList.do'/>";
   	document.boardForm.submit();
}
/* 글 보기 화면 function */
function viewArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/customer/fraud/oaoResultIndex.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function viewRegistBoard() {
   	document.boardForm.action = "<c:url value='/customer/fraud/viewRegistBoard.do'/>";
   	document.boardForm.submit();		
} 
/* pagination 페이지 링크 function */
function boardLinkPage(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/customer/fraud/oaoFraudList.do'/>";
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
						<h2><img src="/images/truck/cust/fraudresult_tit.gif" alt="신고결과확인" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/customer/qnaInfo.do" >고객문의</a>
						<span>신고결과확인</span>
					</div>
				</div><!-- conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cust/fraudresult_con_tit.gif" alt="고객님의 신고내용에 대한 처리내역 입니다 추가 문의가 필요하신 분께서는 신고센터를 이용해 주세요" /></p>
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
					<legend>보험사기 신고결과 확인</legend>
					</fieldset>
					<input type="hidden" name="articleNo" />
					<div class="conSection">
						<p class="infosearchWrap">
							<form:select path="searchCondition" title="신고센터 검색옵션" name="" >
								<form:option selected="selected" value = "0">전체</form:option>
								<form:option value="1">제목</form:option>
								<form:option value="2">본문</form:option>
							</form:select>
							<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" type="text" title="검색어를 입력해주세요" style="width:173px" name="search" value=""/>
							<a class="btn_search" href="#;" onclick="listBoard(); return false;"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
						</p>
						<!-- table list s -->
						<div class="bbsList1">
							<table class="tbList_st01" summary="보험사기 신고 목록입니다. 번호,제목,작성일">
								<caption>보험사기제보 목록입니다.</caption>
								<colgroup>
									<col width="9%">
									<col width="79%">
									<col width="12%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<th scope="col">제목</th>
										<th scope="col" class="last">작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty resultList}">
									<c:forEach var="result" items="${resultList}" varStatus="status">	
									<c:set var="regDate">
									${fn:replace(result.createTime, '.', '')}
									</c:set>			
		  								<tr>
		    								<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
		    								<td class="alL ellipsis"><a href="#;" onclick="viewArticle('<c:out value="${result.articleNo}"/>')">${fn:replace(result.title, keyword , highlight )}</a>
		    								<%
											String chkDate = (String)pageContext.getAttribute("regDate",PageContext.PAGE_SCOPE);
											Date regDate = dateFormat.parse(chkDate); 
											long diff = nowDate.getTime() - regDate.getTime(); //현재날짜 - 공지사항등록날짜
											long diffDays = diff / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
											%>
											<%if(diffDays<5){ %>								
											<img  src="/images/truck/main/icon_new_org.png" alt="새글"/>
											<%}%>
											<c:if test="${empty result.forwardId}">
											 	<c:if test="${result.replyAt eq 'Y' }">
													<img src="/images/truck/cust/aicon_03.gif" alt="답변완료" />
											 	</c:if>
												<c:if test="${result.replyAt eq 'N' }">
												<img src="/images/truck/cust/aicon_01.gif" alt="접수완료" />
												</c:if>
											</c:if>
											<c:if test="${not empty result.forwardId}">
											 	<c:if test="${result.replyAt eq 'Y' }">
													<img src="/images/truck/cust/aicon_03.gif" alt="답변완료" />
											 	</c:if>
												<c:if test="${result.replyAt eq 'N' }">
													<img src="/images/truck/cust/aicon_02.gif" alt="처리중" />
											 	</c:if>
											</c:if>
		    								</td>
	      									<td><c:out value="${fn:substring(result.createTime, 0, 11)}"/></td>	      									
		  								</tr>
		 							</c:forEach>		
		 							</c:if>
		 						<c:if test="${empty resultList}">
									<tr>
										<td class="tdnone" colspan="3">검색된 내용이 없습니다.</td>
									</tr>
								</c:if>						
								</tbody>
							</table>
							<!-- paging s -->							
								<div class="paging">
									<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="boardLinkPage" />
									<form:hidden path="pageIndex" />
								</div><!--// paging e -->
						</div>
						<!-- table list e -->
					</div></form:form>
				</div><!-- conaArea e -->
			</div>
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
</body>
</html>