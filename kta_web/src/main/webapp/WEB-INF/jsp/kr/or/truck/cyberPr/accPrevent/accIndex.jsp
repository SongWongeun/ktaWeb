<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	var tab = '${searchVO.tabCon}';
	
	if(tab == '1'){
		$("#tab1").attr('style','display:none');
		$("#tab2").attr('style','display:block');
		$(".tabMenu #toptab1").removeAttr("class");
		$(".tabMenu #toptab2").attr("class","active");
	}
	
	<%-- 검색박스 엔터키 설정--%>
	$('form#boardForm input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchAccBoard();
			return false;
		}
	});
	
});

	
/* 글 보기 화면 function */
function viewAccBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/cyberPr/accView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addAccBoard() {
   	document.boardForm.action = "<c:url value='/cyberPr/accAddView.do'/>";
   	document.boardForm.submit();		
}
/* 글 검색 function */
function searchAccBoard() {
	document.boardForm.tabCon.value="1";
	document.boardForm.action = "<c:url value='/cyberPr/accIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_accBoard(pageNo){
	document.boardForm.tabCon.value="1";
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/cyberPr/accIndex.do'/>";
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
						<h2><img src="/images/truck/cyber/acc_tit.gif" alt="사고예방활동" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/cyberPr/cyberPrIndex.do" >사이버홍보관</a>
						<span>사고예방활동</span>
					</div>
				</div><!-- conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cyber/acc_con_tit.gif" alt="화물공제조합 사고예방활동 안내 입니다. 다양한 사고예방활동 내용을 확인 하세요." /></p>
					<div class="accArea">
						<p>사업용 화물자동차의 교통사고 감소를 위한 다각적인 캠페인 시행하고 있는 우리조합에서는<br />대형사고 및 고액사고 감소에 중점을 맞추어 활동을 하고 있습니다&#46;</p>
					</div>
					<!-- tabMenu -->
					<div class="jointabs">
						<ul class="tabMenu">
							<li id="toptab1"><a href="#tab1">사고예방활동 안내</a></li>
							<li id="toptab2"><a href="#tab2">사고예방활동 갤러리 게시판</a></li>
						</ul>
						<div class="tabContainer">
							<!-- 사고예방활동 안내 -->
							<div id="tab1" class="accArea02 tabCont">
								<h3 class="hide">사고예방활동 안내</h3>
								<div class="txtContent">
									<h3 class="h3Tit">1&#46; 정기 교통사고예방활동</h3>
									<p class="txtPoint">1&#41; 목표</p>
									<ul class="txtListst01">
										<li>화물자동차 운전자의 교통안전 의식 고취</li>
										<li>화물자동차 교통사고 감소를 통한 경영 안정화 기대</li>
									</ul>
									<p class="txtPoint">2&#41; 활동개요</p>
									<ul class="txtListst01 pB5">
										<li>활동기간 &#58; 매년 3월 &#126; 매년 10월&#40;8개월&#41;</li>
										<li>활동인원 &#58; 활동장소 1개 장소 당 3 &#126; 4명</li>
										<li>활동횟수 &#58; 월 2회&#40;격주 시행&#41;</li>
										<li>활동계획</li>
									</ul>
									<table class="tbDetail_st01 mB10" summary="정기교통사고예방활동활동계획">
										<caption>정기교통사고예방활동활동계획</caption>
										<colgroup>
											<col style="width:15%;" />
											<col style="width:17%;" />
											<col style="width:18%;" />
											<col style="width:15%;" />
											<col style="width:17%;" />
											<col style="width:18%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" colspan="3">주간활동계획</th>
												<th scope="col" colspan="3">야간활동계획</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>3월&#126;10월</td>
												<td>년10회 이상</td>
												<td>14&#58;00&#126;17&#58;00</td>
												<td>5&#44;6&#44;10월</td>
												<td>년4회 이상</td>
												<td>18&#58;00&#126;20&#58;00</td>
											</tr>
										</tbody>
									</table>
									<p class="txtPoint03 alR"><span class="orgBar">위 시간을 기준으로 업무에 지장이 없는 범위 내에서 예산을 감안하여 지부 자체계획 하에 시행</span></p>
								</div>
								<div class="txtContent">
									<h3 class="h3Tit">2&#46; 무사고100일운동</h3>
									<p class="txtPoint">1&#41; 목표</p>
									<ul class="txtListst01">
										<li>인적&#44; 계절적 요인에 의한 교통사고 발생율이 높은 시기에 정예인원과 물자를 집중적으로 투입하여 교통사고예방 성과 극대화</li>
									</ul>
									<p class="txtPoint">2&#41; 활동개요</p>
									<ul class="txtListst01 pB5">
										<li>활동계획</li>
									</ul>
									<table class="tbDetail_st01 mB10" summary="무사고100일운동활동계획">
										<caption>무사고100일운동활동계획</caption>
										<colgroup>
											<col style="width:33%;" />
											<col style="width:34%;" />
											<col style="width:33%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">기간&#40;월별&#41;</th>
												<th scope="col">횔동시간</th>
												<th scope="col">회수</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>4&#46;1&#126;7&#46;9</td>
												<td>14&#58;00&#126;17&#58;00</td>
												<td>8회</td>
											</tr>
										</tbody>
									</table>
									<p class="txtPoint03 alR"><span class="orgBar pR25">활동시간&#44; 장소&#44; 비용처리는 정기 사고예방활동을 기준으로 시행</span><span class="orgBar">월별 정기사고예방활동과 별도로 시행</span></p>
									<p class="txtPoint">3&#41; 추진방향</p>
									<p class="txtPoint">유관기관과의 협력활동 적극 추진</p>
									<ul class="txtListst01">
										<li>고속도로순찰대&#44; 교통안전공단&#44; 한국도로공사 등 유관기관과 합동 사고예방활동 등의 인적교류 실시</li>
										<li>각 기관이 제작한 교통안전용품&#44; 전단지&#44; 홍보용품 등의 물적교류도 함께 실시</li>
									</ul>
									<p class="txtPoint">각 지부에서는 조합원사를 독려하여 무사고 100일 운동에 참여할 수 있도록 활동 추진</p>
									<p class="txtPoint">무사고 100일 운동 사고예방활동 기간 동안 사고율이 현저하게 감소한 업체의 운전자를 선정하여 화물자동차운전자의 날 행사에서 포상</p>
								</div>
								<div class="txtContent mB50">
									<h3 class="h3Tit">3&#46; 교통사고예방활동 발대식</h3>
									<p class="txtPoint">1&#41; 목표</p>
									<ul class="txtListst01">
										<li>교통사고예방활동의 성공적 완수 다짐</li>
										<li>교통사고예방활동 시작 선포</li>
									</ul>
									<p class="txtPoint">2&#41; 시행방법</p>
									<ul class="txtListst01">
										<li>전 지부 동시 시행&#40;지부별 활동장소 선정 시행&#41;</li>
									</ul>
									<p class="txtPoint">3&#41; 본부행사 일시&#44; 장소 및 참석자&#40;예정&#41;</p>
									<table class="tbDetail_st01" summary="본부행사 일시&#44; 장소 및 참석자&#40;예정&#41;">
										<caption>본부행사 일시&#44; 장소 및 참석자&#40;예정&#41;</caption>
										<colgroup>
											<col style="width:35%;" />
											<col style="width:65%;" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" class="bB1">행사일정</th>
												<td>매년 4월 초</td>
											</tr>
											<tr>
												<th scope="row" class="bB1">행사장소</th>
												<td>서해안 고속도로 화성휴게소&#40;미정&#41;</td>
											</tr>
											<tr>
												<th scope="row" rowspan="4">참석자</th>
												<td>화물자동차 운전자</td>
											</tr>
											<tr>
												<td>우리조합 임 &#183; 직원</td>
											</tr>
											<tr>
												<td>정부관계공무원</td>
											</tr>
											<tr>
												<td>유관단체 및 기자</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="txtContent mB50">
									<h3 class="h3Tit">4&#46; 전국 사고예방 활동 장소</h3>
									<table class="tbDetail_st01" summary="전국 사고예방 활동 장소">
										<caption>전국 사고예방 활동 장소</caption>
										<colgroup>
											<col style="width:20%;" />
											<col style="width:60%;" />
											<col style="width:20%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">지부</th>
												<th scope="col">시행휴게소&#40;고속도로 휴게소 및 화물터미널&#41;</th>
												<th scope="col">비고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>본부</td>
												<td class="alL">화성휴게소&#40;下&#41;</td>
												<td class="alL">서해안</td>
											</tr>
											<tr>
												<td>서울</td>
												<td class="alL">하남휴게소&#40;下&#41;</td>
												<td class="alL">중부</td>
											</tr>
											<tr>
												<td>부산</td>
												<td class="alL">언양휴게소&#40;上&#41;&#44; 진영휴게소&#40;下&#41;</td>
												<td class="alL">경부&#44; 남해</td>
											</tr>
											<tr>
												<td>대구</td>
												<td class="alL">칠곡휴게소&#40;上&#41;</td>
												<td class="alL">경부</td>
											</tr>
											<tr>
												<td>인천</td>
												<td class="alL">SK내트럭하우스&#44; 인천트럭터미널</td>
												<td class="alL">&#45;</td>
											</tr>
											<tr>
												<td>광주</td>
												<td class="alL">정읍휴게소&#40;上&#44;下&#41;&#44;</td>
												<td class="alL">&#45;</td>
											</tr>
											<tr>
												<td>대전</td>
												<td class="alL">옥천휴게소&#40;下&#41;</td>
												<td class="alL">경부</td>
											</tr>
											<tr>
												<td>울산</td>
												<td class="alL">경주휴게소&#40;下&#41;</td>
												<td class="alL">경부</td>
											</tr>
											<tr>
												<td>경기</td>
												<td class="alL">기흥휴게소&#40;下&#41;&#44; 의왕ICD</td>
												<td class="alL">경부</td>
											</tr>
											<tr>
												<td>강원</td>
												<td class="alL">횡성휴게소&#40;上&#44;下&#41;&#44; 문막휴게소&#40;下&#41;</td>
												<td class="alL">영동</td>
											</tr>
											<tr>
												<td>충북</td>
												<td class="alL">청원휴게소&#40;上&#41;&#44; 옥산휴게소&#40;上&#41;</td>
												<td class="alL">경부</td>
											</tr>
											<tr>
												<td>충남</td>
												<td class="alL">예산휴게소&#40;上&#41;&#44; 신탄진휴게소&#40;上&#41;</td>
												<td class="alL">대전&#45;당진&#44; 경부</td>
											</tr>
											<tr>
												<td>전북</td>
												<td class="alL">여산휴게소&#40;上&#44;下&#41;</td>
												<td class="alL">호남</td>
											</tr>
											<tr>
												<td>전남</td>
												<td class="alL">주암휴게소&#40;上&#44;下&#41;&#44; 곡성휴게소&#44; 함평휴게소&#44; 섬진강휴게소</td>
												<td class="alL">호남</td>
											</tr>
											<tr>
												<td>경북</td>
												<td class="alL">칠곡휴게소&#40;下&#41;</td>
												<td class="alL">경부</td>
											</tr>
											<tr>
												<td>경남</td>												
												<td class="alL">진영휴게소&#40;上&#41;</td>
												<td class="alL">남해</td>
											</tr>
										
											<tr>
												<td>제주</td>
												<td class="alL">제주항</td>
												<td class="alL">&#45;</td>
											</tr>
											<tr>
												<td>합계</td>
												<td class="alL">휴게소 등 30개소</td>
												<td class="alL"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div><!--// tab1 e -->
							<!-- 사고예방활동 갤러리 게시판 -->
							<div id="tab2" class="tabCont">
								<h3 class="hide">사고예방활동 갤러리 게시판</h3>
								<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post" action="">
								<fieldset>
								<legend>사고예방활동 목록</legend>
								<input type="hidden" name="articleNo" />
								<p class="infosearchWrap">
									<form:select path="searchCondition" title="사고예방활동검색옵션" name="" >
										<form:option selected="selected" value = "0">전체</form:option>
										<form:option value="1">제목</form:option>
										<form:option value="2">본문</form:option>
									</form:select>
									<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" type="text" title="검색어를 입력해주세요" style="width:173px" name="search" value=""/>
									<a class="btn_search" href="#;" onclick="searchAccBoard()"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
									<form:input path="tabCon" type="hidden"/>
								</p>
								<!-- table list s -->
								<div class="bbsList1">
									<table class="tbList_st01" summary="사고예방활동목록 게시판입니다. 번호,제목,작성일,조회수">
										<caption>사고예방활동목록 게시판</caption>
										<colgroup>
											<col width="9%" />
											<col width="70%" />
											<col width="12%" />
											<col width="9%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first">번호</th>
												<th scope="col">제목</th>
												<th scope="col">작성일</th>
												<th scope="col" class="last">조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty resultList}">
											<c:forEach var="result" items="${resultList }" varStatus="status">
											<c:set var="regDate">
											${fn:replace(result.createTime, '.', '')}
											</c:set>				
											 <tr>
												<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
												<td class="alL ellipsis"><a href="#;" onclick="viewAccBoard('<c:out value="${result.articleNo}"/>')">${fn:replace(result.title, keyword , highlight )}</a>
												<%
												String chkDate = (String)pageContext.getAttribute("regDate",PageContext.PAGE_SCOPE);
												Date regDate = dateFormat.parse(chkDate); 
												long diff = nowDate.getTime() - regDate.getTime(); //현재날짜 - 공지사항등록날짜
												long diffDays = diff / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
												%>
												<%if(diffDays<5){ %>								
												<img  src="/images/truck/main/icon_new_org.png" alt="새글"/>
												<%}%>
												</td>
												<td><c:out value="${fn:substring(result.createTime, 0, 11)}"/></td>
												<td><c:out value="${result.rdcount}"/></td>
											 </tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty resultList}">
												<tr>
													<td class="tdnone" colspan="4">검색된 내용이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
									<!-- paging s -->
									<div class="paging">
										<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_accBoard" />
										<form:hidden path="pageIndex" />
									</div><!--// paging e -->
								</div><!-- table list e -->
								</fieldset>
								</form:form>
							</div><!--// tab2 e -->
						</div><!--// tabContainer e -->
					</div><!--// tabMenu e -->
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

