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
 						<h2><img src="/images/truck/info/reci_tit.gif" alt="장학금지원내역" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<a href="/infoLounge/encourIndex.do" >장학사업</a>
						<span>장학금지원내역</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/info/reci_con_tit.gif" alt="화물공제조합은 장학사업을 통해 따뜻한 나눔과 사랑을 실천하고 있습니다" /></p>
					<div class="conSection">
						<div class="supportCont">
							<p class="consecTit"><img src="/images/truck/info/reci_sec_tit.gif" alt="For a better tomorrow  실천하는 나눔, 행복한 사회" /></p>
							<div class="roundBox">
								<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
								<!-- 내용 -->
								<div class="supportArea">
									<p class="supTxt3"><img src="/images/truck/info/reci_txt04.gif" alt="장학금 지원이 확정 되었습니다" /></p>
									<table class="tbDetail_st02" summary="장학금 지원확정 내역입니다.">
										<caption>장학금 지원내역</caption>
										<colgroup>
											<col style="width:15%;" />
											<col style="width:10%;" />
											<col style="width:10%;" />
											<col style="width:15%;" />
											<col style="width:10%;" />
											<col style="width:20%;" />
											<col style="width:10%;" />
											<col style="width:10%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">지원년도</th>
												<th scope="col">분기</th>
												<th scope="col">학생이름</th>
												<th scope="col">생년월일</th>
												<th scope="col">학생구분</th>
												<th scope="col">학교</th>
												<th scope="col">학년</th>
												<th scope="col">지부</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty resultList}">		
												<c:forEach var="result" items="${resultList }" varStatus="status">
													<tr>
														<td class="tbbg alC"><c:out value="${result.JANGHAK_YYYY}"/>년</td>
														<td class="tbbg alC"><c:out value="${result.BANGI_GB_NM}"/></td>
														<td class="tbbg alC"><c:out value="${result.HAKSAENG_NM}"/></td>
														<td class="tbbg alC"><c:out value="${result.HAKSAENG_JUMIN_NO}"/></td>
														<td class="tbbg alC"><c:out value="${result.HAKSAENG_GB_NM}"/></td>
														<td class="tbbg alC"><c:out value="${result.HAKGYO_NM}"/></td>
														<td class="tbbg alC"><c:out value="${result.HAKNEON_CD}"/>학년</td>
														<td class="tbbg alC"><c:out value="${result.JIBU_NM}"/></td>
														
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${empty resultList}">
												<tr>
													<td class="tbbg alC" colspan="8">지원 내역이 없습니다.</td>
												</tr>
											</c:if>	
										</tbody>
									</table>
									<div class="title">
										<p>* 본인의 학교와 학년이 아닌경우 하단의 장학사업 문의에 글을 남겨주세요&#46;</p><p>&nbsp;</p><p>&nbsp;</p>
									</div>
									
								</div>
								<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
							</div>
							<div class="supportQus">
								<p>화물공제조합에서 진행하는 장학사업이 궁금하신가요&#63; 문의글을 남겨주시면 담당자가 직접 회신 드립니다&#46;</p>
								<a href="/customer/inquiry/viewRegistBoard.do"><img src="/images/truck/info/btn_reci.gif" alt="장학사업문의" /></a>
							</div>
						</div>
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
</body>
</html>