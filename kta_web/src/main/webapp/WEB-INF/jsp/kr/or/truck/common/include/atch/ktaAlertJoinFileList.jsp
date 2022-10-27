<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:if test="${empty inputName}">
	<c:set var="inputName" value="atchFileId" />
</c:if>

<input type="hidden" name="${inputName}" id="${inputName}" value="${atchFileId}">
<input type="hidden" name="fileListCnt" id="fileListCnt" value="${fileListCnt}">

<c:if test="${fileListCnt > 0}">
		<script type="text/javaScript" language="javascript">
		//Login Check
	    function fn_loginChk_file() {
			alert("해당 커뮤니티에 가입하신 후 이용하실 수 있습니다.") 
	    }
		</script>
	<ul>
		<c:forEach var="fileVO" items="${fileList}" varStatus="status">
		<li>
		<%-- 
			<a href="${requestScope['javax.servlet.forward.request_uri']}" onclick="alert('로그인이 필요합니다.');return false">
		 --%>	
		 	<a href="/mpg/login/login.do?type=login" onclick="fn_loginChk_file();return false;" title="파일 다운로드">
				<img src="/images/nre/frt/icon/save_icon.gif" alt="" style="vertical-align: middle;"/>
				<c:out value="${fileVO.orignlFileNm}"/>&nbsp;<c:if test="${!empty fileVO.fileMg}">[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]</c:if>
			</a>
		</li>
		</c:forEach>
	</ul>
</c:if>
