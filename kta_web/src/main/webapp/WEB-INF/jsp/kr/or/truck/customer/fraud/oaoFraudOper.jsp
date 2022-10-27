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

<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}'
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
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/cust/fraudoper_tit.gif" alt="운영방안" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/customer/customerIndex.do">고객문의</a>
						<span>운영방안</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cust/fraud_con_tit.gif" alt="화물공제조합 보험사기신고 센터 입니다." /></p>
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">운영방안</h3>
						<!--  운영방안 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">1. 설치 및 운영</h4>
							<p class="txtPoint">ㅇ 보험사기 신고센터 설치 및 운영은 감사실 보험사기조사반(SIU)내에 설치하여 운영한다.</p></br></br>
						
							<h4 class="decuh4Tit">2. 보험사기 신고센터의 업무 </h4>
							<p class="txtPoint">ㅇ 보험범죄 신고 접수 (서면, 유선, 인터넷, 기타 정보인지사항)</p>
							<p class="txtPoint">ㅇ 보험범죄 신고내용 조사 및 처리</p>
							<p class="txtPoint">ㅇ 관할 수사기간에 수사의뢰</p></br></br>
							
							<h4 class="decuh4Tit">3. 보험사기 신고 대상건</h4>
							<p class="txtPoint">ㅇ 사기적인 공제계약 체결</p>
							<p class="txtPoint">ㅇ 보험사고의 고의적 발생 건</p>
							<p class="txtPoint">ㅇ 보험사고의 위장사고건</p>
							<p class="txtPoint">ㅇ 병원 및 정비공장의 허위, 부당 청구건</p>
							<p class="txtPoint">ㅇ 기타 보험사기로 인정 되는 건</p></br></br>
					</div><!--// conSection e -->
				
					
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