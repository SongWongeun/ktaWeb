<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	//if('${logintf}'=='t'){
		if('${loginVO.recent_dt}'!=''&&'${loginVO.recent_tm}'!=''&&'${loginVO.recent_ip}'!=''){
			//alert("회원님의 최종접속 일시 ${loginVO.recent_dt} ${loginVO.recent_tm}                                       최종접속IP ${loginVO.recent_ip} 입니다.");
			$("#RecentPopupLayer").show();
		}
	//}
	
	$("#RecentPopupLayerPopupLayerHide").on("click",function(){
		var lengthB =  '<c:out value="${fn:length(nxtBunAlert)}"/>';
		var lengthG = '<c:out value="${fn:length(gyeyakAlert)}"/>';
		if(lengthB > 0 || lengthG >0) {
			$("#alertGyeyakPopupLayer").show();
		}
		$("#RecentPopupLayer").hide();
	});
});
/* 글 보기 화면 function */
function viewArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/netCounter/memberPage/myPage/qnaView.do'/>";
   	document.boardForm.submit();		
}
</script>
<style>
#ChangeCodePopupLayer{
		
		position: fixed;
		left: 0px;
		top: 0px;
		text-align: center;
		z-index: 90000;
		width: 100%;
		height: 100%;
		font-size:13px;
	}
#RecentPopupLayer{
		
		position: fixed;
		left: 0px;
		top: 0px;
		text-align: center;
		z-index: 90000;
		width: 100%;
		height: 100%;
		font-size:13px;
	}	
</style>
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
 						<h2><img src="/images/truck/net/mypage_tit.gif" alt="거래처 마이페이지" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<span>마이페이지</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/mypage_con_tit.gif" alt="공제계약확인 보상정보 조회 상담내역까지 화물공제조합의 모든 정보를 확인하실 수 있습니다" /></p>
					<div class="conSection">
						<div class="mypageBox">
							<p class="mebInfo flL"><span class="user">${loginVO.custNm } 님</span>의 회원정보입니다&#46;</p>
							<!-- 20161202 수정 -->
							<div class="flR">
								<strong>최근 접속일시</strong>
								<span class="date">${RecentVO.recent_dt }</span>
								<span class="time">${RecentVO.recent_tm }</span>
								<span class="ip">IP&nbsp;&nbsp;${RecentVO.recent_ip }</span>
								<!-- 20161202 삭제
								<a href="/netCounter/memberPage/myPage/alterInfo.do" class="btn_myp"><span class="icoArr01">회원정보관리</span></a>
								//20161202 삭제 -->
							</div>
							<!-- //20161202 수정 -->
						</div>
						<!-- 마이페이지 s -->
						<div class="mySection">
							<div class="myL">
								<!-- 20161202 수정 -->
								<!--지급내역 조회 -->
								<div class="section01">
									<div class="myBox02">
										<h4>지급내역 조회<span>최근 6개월간의 지급내역 조회</span></h4>
										<p class="more"><a href="/netCounter/inquiryService/accountInquiry/paymentListInquiry.do">더보기</a></p>
										<div class="rbox02 company">
											<p><a href="/netCounter/inquiryService/accountInquiry/paymentListInquiry.do">지급내역<span>${accountTotCnt }</span></a></p>
										</div>
									</div>
									<span class="titBar"><fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> 기준</span>
								</div>
								<div class="netsubBoth clfix" style="margin: -30px 0 30px 0;">
									<div class="flL">
										<span class="txtPoint06">자세한 지급내역은 '더보기'를 클릭하여 확인하실 수 있습니다.</span>
									</div>
								</div>
								<!-- //20161202 수정 -->

								<!-- 나의 문의 내역 -->
								<div class="section01">
								<form:form commandName="searchVO" name="boardForm" method="post" action="">
								<fieldset>
								<legend>문의결과 확인</legend>
								<input type="hidden" name="articleNo" />
									<h4 class="mypTit02">나의 문의 내역<span class="titBar02">최근 6개월간 문의 내역 입니다</span></h4>
									<p class="more"><a href="/netCounter/memberPage/myPage/qnaList.do">더보기</a></p>
									<div class="tbWork3">
										<table class="tbWork_st06" summary="나의 문의 내역 상세정보 테이블 입니다  제목,접수일,상태">
											<caption>나의 문의 내역 상세정보 테이블 입니다</caption>
											<colgroup>
												<col style="width:65%;" />
												<col style="width:20%;" />
												<col style="width:15%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">제목</th>
													<th scope="col">접수일</th>
													<th scope="col">상태</th>
												</tr>
											</thead>
											<tbody>											
												<c:choose>
													<c:when test="${not empty oaoList }">									
														<c:forEach var="result" items="${oaoList}" varStatus="status">
							  								<tr>
							    								<td class="alL ellipsis"><a href="#;" onclick="viewArticle('<c:out value="${result.articleNo}"/>')"><c:out value="${result.title}"/></a></td>
						      									<td><c:out value="${fn:substring(result.createTime, 0, 11)}"/></td>	      									
							  									<c:if test="${result.replyAt eq 'Y'}">
							  										<td><img src="/images/truck/com/answer.gif" alt="답변" /></td>
							  									</c:if>
							  									<c:if test="${result.replyAt eq 'N'}">
							  										<td><img src="/images/truck/com/notanswer.gif" alt="미답변" /></td>
							  									</c:if>
							  								</tr>
						 								</c:forEach>
					 								</c:when>
					 								<c:otherwise>
					 									<td colspan="3">문의내역이 없습니다.</td>
					 								</c:otherwise>
				 								</c:choose>
											</tbody>
										</table>
									</div>
									</fieldset>
									</form:form>
								</div>
							</div><!--// 마이페이지 왼쪽 -->
							<div class="myR">
								<!-- 서비스 바로가기 -->
								<div class="section02">
									<h4 class="hide">서비스 바로가기</h4>
									<div class="myBox03">
										<div class="myService08">
											<!-- <p><a href="/netCounter/certSerivce/certServiceIndex.do"><img alt="증명서발급" src="/images/truck/net/mp_icon03.gif"/></a></p>
											<p class="btn_quck"><a href="/netCounter/certSerivce/certServiceIndex.do" class="icoAcc">증명서발급</a></p> -->
											<p><a href="/netCounter/inquiryService/accountInquiry/paymentListInquiry.do"><img alt="지급내역조회" src="/images/truck/net/mp_icon01.gif" /></a></p>
											<p class="btn_quck"><a href="/netCounter/inquiryService/accountInquiry/paymentListInquiry.do" class="icoAcc">지급내역조회</a></p>
										</div>
									</div>
									<p class="myService09"><img alt="24시간사고접수현장출동서비스1577-8278" src="/images/truck/net/mp_custel.gif"/></p>
								</div>
							</div><!--// 마이페이지 오른쪽 -->
						</div><!--// 마이페이지 e -->
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
	<div id="RecentPopupLayer" style="display:none;">
		<div class="layerBox">
			<div class="layerContents">
				<p class="topClose"></p>
				<p class="layerTxt">
				<p class="layerTit" style="text-align: center">최근 접속 알림</p>
				<div style="color:#585858; line-height:25px;">
						최종접속 일시 <span style="color:#23618c; font-weight:bold;"><span id="recent_dt_span">${loginVO.recent_dt}</span> <span id="recent_tm_span">${loginVO.recent_tm}</span></span><br/> 
						IP <span style="color:#23618c; font-weight:bold;">${loginVO.recent_ip}</span>
				</div>		
					<div class="btnboxC clfix">
							<span class="btn_pack btn_type16"><a id="RecentPopupLayerPopupLayerHide" href="#;">확인</a></span>
					</div>
				</p>	
			</div>
		</div>
	</div>
</body>
</html>