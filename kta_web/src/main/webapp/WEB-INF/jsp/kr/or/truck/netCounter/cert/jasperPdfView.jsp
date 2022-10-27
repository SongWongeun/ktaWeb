<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>증명서발급 미리보기</title>
<style type="text/css">
html{overflow:hidden;}
</style>
</head>

<body>
<h4 style="margin-bottom:5px;">※ PDF 파일로 다운받은 후 출력 가능합니다</h4>
<div>
<input type="hidden" id="downFileName" name="downFileName" value="${downFileName}" />
<input type="hidden" id="pdfFileName" name="pdfFileName" value="${pdfFileName}" />
</div>
<iframe width="100%" height="100%" src="/jasper/web/viewer.html?file=../${pdfFileName}"></iframe>

</body>
</html>