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
 						<h2><img src="/images/truck/net/mypage_tit.gif" alt="조합원 마이페이지" /></h2>
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
							<p class="mebInfo flL"><span class="user">${loginVO.carmgrNm } 님</span>의 회원정보입니다&#46;</p>
							<!-- 20161202 수정 -->
							<div class="flR">
								<strong>최근 접속일시</strong>
								<span class="date">${RecentVO.recent_dt }</span>
								<span class="time">${RecentVO.recent_tm }</span>
								<span class="ip">IP&nbsp;&nbsp;${RecentVO.recent_ip }</span>
								<!-- 20161202 삭제
								<a href="/netCounter/memberPage/myPage/alterInfo.do" class="btn_myp"><span class="icoArr01">회원정보관리</span></a>
								<a href="/netCounter/inquiryService/contractInquiry/carInquiry.do" class="btn_myp"><span class="icoArr02">계약 조회</span></a>
								//20161202 삭제 -->
							</div>
							<!-- //20161202 수정 -->
						</div>
						<!-- 마이페이지 s -->
						<div class="mySection">
							<div class="myL">
								<!-- 20161202 수정 -->
								<!-- 계약관리 -->
								<div class="section01">
									<div class="myBox01">
										<h4>계약관리<span>현재유지중인 공제계약</span></h4>
										<p class="more"><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do">더보기</a></p>
										<ul class="rbox01">
											<li><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do">가입차량<span>${carTotCnt }</span></a></li>
											<li><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do">자동차공제<span>${carTotCnt }</span></a></li>
											<li><a href="/netCounter/inquiryService/contractInquiry/accInquiry.do">재해공제<span>${accTotCnt }</span></a></li>
											<li><a href="/netCounter/inquiryService/contractInquiry/carryInquiry.do">적재물공제<span>${carryTotCnt }</span></a></li>
										</ul>
									</div>
								</div>
								<div class="myWrap">
									<!-- 분담금 수납대상 -->
									<div class="section01 flL">
										<div class="myBox02">
											<h4>분담금 수납대상<span>현재 날짜기준으로 수납대상 공제계약</span></h4>
											<p class="more"><a href="/netCounter/inquiryService/contractInquiry/divideInquiry.do">더보기</a></p>
											<div class="rbox02">
												<p><a href="/netCounter/inquiryService/contractInquiry/divideInquiry.do">적재물공제<span>${divideTotCnt }</span></a></p>
											</div>
										</div>									</div> 
									<!-- 보상정보 -->
									<div class="section01 flR">
										<div class="myBox02">
											<h4>보상정보<span>최근 6개월간의 사고처리 내역</span></h4>
											<p class="more"><a href="/netCounter/inquiryService/accountInquiry/compenInfo.do">더보기</a></p>
											<div class="rbox02">
												<p><a href="/netCounter/inquiryService/accountInquiry/compenInfo.do">총 보상 건수<span>${carAccidentTotCnt }</span></a></p>
											</div>
										</div>
										<span class="titBar"><fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> 기준</span>
									</div>
								</div>
								<!-- //20161202 수정 -->

								<!-- 나의 문의 내역 -->
								<div class="section01">
								<form:form commandName="searchVO" name="boardForm" method="post" action="">
								<fieldset>
								<legend>문의결과 확인</legend>
								<input type="hidden" name="articleNo" />
									<h4 class="mypTit02">나의 문의 내역<span class="titBar02">최근 3년간 문의 내역 입니다</span></h4>
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
												<c:when test="${not empty oaoList  }">									
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
								<!-- 담당지부 및 직원 -->
								<div class="section02">
									<h4>담당지부 및 직원</h4>
									<div class="myBox02">
										<p class="myTit01">안녕하십니까 &#63; <br /><span class="bold">${manager.jibu_nm } ${manager.sawon_nm }</span> 입니다&#46;</p>
										<p class="myTit02">공제가입 및 계약과 관련한 내용을 보다 <br />빠르고 편안하게 도와 드리겠습니다&#46;</p>
										<div class="infoU">
											<dl>
												<dt>
													<p class="typeF01"><span class="typesF">${manager.sawon_nm }</span> ${manager.jicwi_nm } <span class="typeF02">${manager.jibu_nm } 담당자</span></p>
												</dt>
												<dd class="infoDd01">${manager.tel_no }&nbsp;</dd>
												<dd class="infoDd02">${manager.fax_no }&nbsp;</dd>
												<!-- <dd class="infoDd03">???? </dd> -->
												<dd class="pic"><img width="92" height="114" alt="담당자사진" src="/netCounter/inquiryService/managerPicture.do?agent_no=${loginVO.agentNo }&saupjang_seq=${loginVO.saupjangSeq }"/></dd>
											</dl>
										</div>
									</div>
								</div>
								<!-- 서비스 바로가기 -->
								<div class="section02">
									<h4 class="hide">서비스 바로가기</h4>
									<!-- 20161214 수정 -->
									<div class="myBox03">
										<ul>
											<li class="myService01">
												<p><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><img alt="계약조회" src="/images/truck/net/mp_icon01.gif"/></a></p>
												<p class="btn_quck"><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do" class="icoAcc">계약조회</a></p>
											</li>
											<li class="myService02">
												<p><a href="/netCounter/memberPage/myPage/alterInfo.do"><img alt="회원정보관리" src="/images/truck/net/mp_icon02.gif"/></a></p>
												<p class="btn_quck"><a href="/netCounter/memberPage/myPage/alterInfo.do" class="icoAcc">회원정보관리</a></p>
											</li>
											<!-- <li class="myService03">
												<p><a href="/netCounter/certSerivce/certServiceIndex.do"><img alt="증명서발급" src="/images/truck/net/mp_icon03.gif"/></a></p>
												<p class="btn_quck"><a href="/netCounter/certSerivce/certServiceIndex.do" class="icoAcc">증명서발급</a></p>
											</li> -->
											<li class="myService03">
												<p><a href="/netCounter/inquiryService/accountInquiry/compenInfo.do"><img alt="보상정보조회" src="/images/truck/net/mp_icon04.gif"/></a></p>
												<p class="btn_quck"><a href="/netCounter/inquiryService/accountInquiry/compenInfo.do" class="icoAcc">보상정보조회</a></p>
											</li>
											<li class="myService04">
												<p><a href="/netCounter/inquiryService/contractInquiry/divideInquiry.do"><img alt="분담금납입현황" src="/images/truck/net/mp_icon05.gif"/></a></p>
												<p class="btn_quck"><a href="/netCounter/inquiryService/contractInquiry/divideInquiry.do" class="icoAcc">분담금납입현황</a></p>
											</li>
											<li class="myService05">
												<p><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do" ><img alt="차량현황조회" src="/images/truck/net/mp_icon06.gif"/></a></p>
												<p class="btn_quck"><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do" class="icoAcc">차량현황조회</a></p>
											</li>
										</ul>
									</div>
									<!-- //20161214 수정 -->
									<p class="myService07"><img alt="24시간사고접수현장출동서비스1577-8278" src="/images/truck/net/mp_custel.gif"/></p>
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