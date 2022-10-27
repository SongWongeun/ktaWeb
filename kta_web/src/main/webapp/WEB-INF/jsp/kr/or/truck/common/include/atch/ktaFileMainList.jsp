<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

	String articleNo = (String)request.getAttribute("articleNo");
	request.setAttribute("articleNo",articleNo);
%>
<script type="text/javaScript" language="javascript" defer="defer">
function deleteFile(formNo,fileId,fileNo){
	
	if(!confirm("정말 파일을 삭제하시겠습니까? 지금즉시 삭제됩니다.")){
		return false;
	}
	

	if(fileNo != ''){
		$('input[name="fileSn"]').val(fileNo);
	}

	if('${bmstNo}' != ''){
		$('input[name="boardNo"]').val('${bmstNo}');
	}
	if('${boardNo}' != ''){
		$('input[name="boardNo"]').val('${boardNo}');
	}
	var bmstNo = $('input[name="bmstNo"]').val();
	if(bmstNo != ''){
		$('input[name="boardNo"]').val(bmstNo);
	}
	
	document.boardForm.action='/kwa/deleteFileInfs.do';
	document.boardForm.submit();
}
</script>
<c:if test="${empty inputName}">
	<c:set var="inputName" value="atchFileId" />
</c:if>
<input type="hidden" id="fileSn" name="fileSn"  />
<input type="hidden" id="boardNo" 	name="boardNo" />
<c:if test="${fileListCnt > 0}">
	<ul>
		<c:forEach var="fileVOdown"  varStatus="cnt3" items="${fileList}" >
			<li style="list-style: none;">
				<a href="<c:url value='/cmm/fms/FileDown.do?atchFileId=${fileVOdown.atchFileId}&fileSn=${fileVOdown.fileSn}'/>">
					<c:set var="icon" value="${fileVOdown.orignlFileNm}"/>
					<c:choose>
						<c:when test="${fn:endsWith(icon , '.hwp') or fn:endsWith(icon , '.HWP')}">
							<img src="/images/truck/com/icon_hwp.gif" width="13px" height="13px">
						</c:when>
						<c:when test="${fn:endsWith(icon , '.ppt') or fn:endsWith(icon , '.PPT')}">
							<img src="/images/truck/com/icon_ppt.gif" width="13px" height="13px">
						</c:when>
						<c:when test="${fn:endsWith(icon , '.xls') or fn:endsWith(icon , '.XLS')}">
							<img src="/images/truck/com/icon_xls.gif" width="13px" height="13px">
						</c:when>
						<c:when test="${fn:endsWith(icon , '.jpg') or fn:endsWith(icon , '.JPG')}">
							<img src="/images/truck/com/icon_jpg.gif" width="13px" height="13px">
						</c:when>
						<c:otherwise>
							<img src="/images/truck/board/file.gif" width="13px" height="13px">
						</c:otherwise>
					</c:choose>	
					<c:out value="${fileVOdown.orignlFileNm}"/>&nbsp;<c:if test="${!empty fileVOdown.fileMg}">[<c:out value="${fn:substring(fileVOdown.fileMg /1048576, 0, 4)}"/>&nbsp;MB]</c:if>
				</a>
			</li>
		</c:forEach>
	</ul>
</c:if>
	