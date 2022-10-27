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
 						<h2><img src="/images/truck/cust/fraudbounty.gif" alt="신고포상금 지급기준" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/customer/customerIndex.do">고객문의</a>
						<span>신고포상금 지급기준</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cust/fraud_con_tit.gif" alt="화물공제조합 보험사기신고 센터 입니다." /></p>
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">신고포상금 지급기준</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea manBg">
								<p class="lossTxt1">신고포상금 지급기준</p>
								<p class="lossTxt2" style="line-height:28px; letter-spacing:0px"><b>신고인 또는 보상담당자의 신고포상금</b> 지급은“위장사고 포상기준”을 준용하며 <b>적발금액의 10%의 포상금</b>을 지급하고 사고당 <u>최저 30만원, 최고 500만원</u> 한도로 한다.</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">현장출동요원·견인기사 신고포상금 지급기준</h4>
							<table class="tbDetail_st01 mB5" summary="긴급출동 서비스 특약 서비스내용 테이블 입니다.">
								<caption>현장출동요원·견인기사 신고포상금 지급기준</caption>
								<colgroup>
									<col style="width:60%;" />
									<col style="width:40%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">적발금액 인정액</th>
										<th scope="col">포상금(만원)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>5천만원 이상</td>
										<td>100</td>
									</tr>
									<tr>
										<td>3천만원 이상 ~ 5천만원 미만</td>
										<td>80</td>
									</tr>
									<tr>
										<td>2천만원 이상 ~ 3천만원 미만</td>
										<td>60</td>
									</tr>
									<tr>
										<td>1천만원 이상 ~ 2천만원 미만</td>
										<td>40</td>
									</tr>
									<tr>
										<td>5백만원 이상 ~ 1천만원 미만</td>
										<td>30</td>
									</tr>
									<tr>
										<td>5백만원 미만</td>
										<td>20</td>
									</tr>
								</tbody>
							</table><!--// 긴급출동 서비스 특약 서비스내용 표 e -->
							<p>&nbsp;</p><p>&nbsp;</p>
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