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
	<c:choose>
		<c:when test="${updateFlag=='Y'}">
			<c:if test="${not empty fileList}">
				<div id="fileDelete" ><span>현재 첨부파일</span>
					<div class="row box-section">
						<c:forEach var="fileVO"  varStatus="cnt3" begin="0" end="${fileNo}" items="${fileList}" >
							<div id="origin_fileForm_${cnt3.index}" class="col-md-11">
								<c:set var="icon" value="${fileVO.orignlFileNm}"/>
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
								<c:out value="${fileVO.orignlFileNm}"/>&nbsp;<c:if test="${!empty fileVO.fileMg}">[<c:out value="${fn:substring(fileVO.fileMg /1048576, 0, 4)}"/>&nbsp;MB]</c:if>
							</div>
							<div class="col-md-1">
								<a href="#;" onclick ="deleteFile('${cnt3.index}','${fileVO.atchFileId}','${fileVO.fileSn}'); return false;" style="align:right">
									<img src="<c:url value='/images/egovframework/com/cmm/fms/icon/bu5_close.gif' />" width="19" height="18" alt="파일삭제">
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<div class="divider"></div>
			<c:if test="${fileNo- fn:length(fileList) > 0}">
			<div id="fileUpload"><span>파일 업로드</span>
				<div class="row box-section">
					<div class="col-md-11">
					<c:forEach var="cnt4" begin="1" end="${fileNo- fn:length(fileList)}" >
						<input name="file_${cnt4}" id="egovComFileUploader" type="file" title="첨부파일입력" onchange="checkFileSize(file_${cnt4},'file_${cnt4}');"/><label for="egovComFileUploader" class="hide">첨부파일입력</label>
					</c:forEach>
					</div>
				</div>
			</div>
			</c:if>
		</c:when>
		<c:otherwise>
			<div id="fileDown">
				<c:forEach var="fileVOdown"  varStatus="cnt3" begin="0" end="${fileNo}" items="${fileList}" >
				<div class="row box-section">
					<div class="col-lg-11">
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
					</div>
				</div>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</c:if>
<c:if  test="${updateFlag=='Y'}">
	<c:if test="${empty fileList}">
		<c:forEach var="cnt" begin="1" end="${fileNo}" >
		<input name="file_${cnt}" id="egovComFileUploader" type="file" title="첨부파일입력" onchange="checkFileSize(file_${cnt},'file_${cnt}');"/><label for="egovComFileUploader" class="hide">첨부파일입력</label>
		</c:forEach>
	</c:if>
</c:if>