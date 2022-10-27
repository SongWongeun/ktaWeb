<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
function goPage(pageNo){
	document.f.pageIndex.value = pageNo;
   	document.f.submit();
}
$(document).ready(function(){
	
	
});

</script>
<style type="text/css">
.formError{display: block;margin: 10px 0px;color: #F00;font-weight: bolder;/* background-color: #FF7; */padding: 5px;}
</style>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s -->
		<div id="headerWrap" style="height:133px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA | 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
						<!-- <li><a href="#;"><img src="/images/truck/main/util01.gif" alt="직원마당" /></a></li> -->
						<c:choose>
							<c:when test="${not empty loginVO }">
								<li><a href="/netCounter/memberPage/myPage/myInfo.do"><img src="/images/truck/main/util04.gif" alt="마이페이지" /></a></li>
							<li><a href="/logout.do"><img src="/images/truck/main/logout.gif" alt="로그아웃" /></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/join/terms/view.do"><img src="/images/truck/main/util02.gif" alt="회원가입" /></a></li>
								<li><a href="/login.do"><img src="/images/truck/main/util03.gif" alt="로그인" /></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<div class="gnbSubGo">
						<a href="/main/guide.do"><img src="/images/truck/main/guide.gif" alt="이용안내가이드" /></a>
						<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<form name="searchForm" method="post" action="/mail/checkUser.do">
						<fieldset>
						<legend>회원인증 통합검색</legend>
							<input type="hidden" name="searchKeywordT"/>
							<span class="ut_search"><label for="searchKeywordTotal">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
							<a class="btn_ut_search" href="#;" onclick="totalSearch(); return false;"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
						</fieldset>
						</form>
					</div>
				</div>
				<!-- gnb s --><!-- subDep01까지만 노출 depth03부터는 display:none과 display:block로 컨트롤  -->
				<div class="gnb" id="Gnb">
					<ul class="gnbList">
						<li class="gnb1Dep01 "><a class="menu1" href="/netCounter/memberPage/myPage/myInfo.do"><span class="hide">인터넷창구</span></a>
						</li><!--// gnb1Dep01 인터넷창구 e -->
						<li class="gnb1Dep02 "><a class="menu2" href="/infoLounge/infoLoungeIndex.do"><span class="hide">정보마당</span></a>
						</li><!--// gnb1Dep02 정보마당 e -->
						<li class="gnb1Dep03 "><a class="menu3" href="/deductProduct/deductProductIndex.do"><span class="hide">공제상품</span></a>
						</li><!--// gnb1Dep03 공제상품 e -->
						<li class="gnb1Dep04 "><a class="menu4" href="/customer/customerIndex.do"><span class="hide">고객광장</span></a>
						</li><!--// gnb1Dep04 고객광장 e -->
						<li class="gnb1Dep05"><a class="menu5" href="/assocIntroduce/assocIntroduceIndex.do"><span class="hide">조합소개</span></a>
						</li><!--// gnb1Dep05 조합소개 e -->
						<li class="gnb1Dep06 "><a class="menu6" href="/cyberPr/cyberPrIndex.do"><span class="hide">사이버홍보관</span></a>
						</li><!--// gnb1Dep06 사이버홍보관 e -->
					</ul>
					<!-- 컨트롤버튼 -->
					<!-- <a href="#;" title="메뉴열기버튼" class="btn_memuopen" ><span class="hide">메뉴열기</span></a>
					<a href="#;" title="메뉴를 고정시킵니다." class="btn_pause pause_on" ><span>고정</span></a> --><!-- 고정버튼 눌렀을 경우 class명 pause_on 추가 -->
					<a href="#;" title="메뉴를 닫습니다." class="btn_close" ><span>닫기</span></a>
				</div><!-- // gnb e -->
			</div>
		</div>
		<hr /><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2 style="font-size: 38px;font-weight: bolder;color: #143B8F;">홈페이지 사용자 선택</h2>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="#;" >홈페이지 사용자 선택</a>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit">
						<img src="/images/truck/etc/email_cont_tit.gif" alt="만기안내 비밀번호 변경입니다. 사업자번호와 이메일주소를 입력하여 주세요" />
					</p>
					<div class="conSection">
						<form:form commandName="searchVO" name="f" method="post" action="/spa/memberList.do">
							<fieldset>
								<legend>자주하는질문</legend>
								<input name="articleNo" type="hidden" />
								<form:input path="searchCategory" type="hidden"/>
								<%-- 검색 --%>
								<div class="roundBox">
									<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
									<!-- 내용 -->
									<div class="findArea">
										<p class="findName"><img src="/images/truck/cust/faq_search_tit.gif" alt="편리하게 검색해보기" /></p>
										<div class="findForm pT20">
											<form:select path="searchCondition" name="searchCondition" title="검색옵션">
												<form:option value="0"  label="전체"/>
												<form:option value="1" label="제목" />
												<form:option value="2" label="본문" />
											</form:select>
											<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" title="검색어를 입력해주세요" style="width:270px" name="search" class="txt" />
											<a class="btn_search" href="#;" onclick="searchFaqBoard(); return false;"><img class="vaM" src="/images/truck/btn/btn_ksearch.gif" alt="검색" /></a>
										</div>
									</div>
									<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
								</div><!--// roundBox e -->
								<%-- //검색 --%>
							
							<div class="tabs">
								<!-- tabs s -->
								<ul class="faqMenu">
									<c:forEach items="${ctgList}" var="ctgIndex" varStatus="status">
										<li class="<c:if test='${status.last == true }'>last</c:if><c:if test='${ctgIndex.CATEGORY_ID ==searchVO.searchCategory}'> on</c:if>"><a href="#;" onclick="searchingCategory('${ctgIndex.CATEGORY_ID}'); return false;">${ctgIndex.CATEGORY_NM}</a></li>
									</c:forEach>
									<%-- <li class="<c:if test="${searchVO.searchCategory == '계약'}">on</c:if>"><a href="javascript:searchCategory('1')">계약</a></li><!-- 선택시 class에 on 추가 -->
									<li class="<c:if test="${searchVO.searchCategory == '보상'}">on</c:if>"><a href="javascript:searchCategory('2')">보상</a></li>                         
									<li class="last<c:if test="${searchVO.searchCategory == '홈페이지'}"> on</c:if>"><a href="javascript:searchCategory('3')">홈페이지</a></li> --%> 
								</ul>
								<!-- tabs e -->
								
								
								<div class="tabContainer">
									<h3 class="hide">계약&#44;보상&#44;홈페이지 분류의 자주하는 질문 컨텐츠입니다.</h3>
									<!-- table list s -->
									<div class="bbsList1">
										<table class="tbList_st01" summary="자주하는질문 게시판입니다. 번호,구분,제목">
											<caption>자주하는질문 게시판</caption>
											<colgroup>
												<col width="7%" />									
												<col width="13%" />
												<col width="20%" />
												<col width="20%" />
												<col width="20%" />
												<col width="20%" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="first">번호</th>
													<th scope="col">지부</th>
													<th scope="col">이름</th>
													<th scope="col">회사명</th>
													<th scope="col">사업자번호</th>
													<th scope="col" class="last">주민번호</th>
												</tr>
											</thead>
											<tbody>
											<c:if test="${not empty resultList}">
												<c:forEach var="result" items="${resultList}" varStatus="status">	
													<c:set var="regDate">
													${fn:replace(result.createTime, '.', '')}
													</c:set>			
													<tr>
													    <td class="left"><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
													    <td class="left">
														</td>
													  </tr>
											 	</c:forEach>
										 	</c:if>
										 	<c:if test="${empty resultList}">
												<tr>
													<td class="tdnone" colspan="6">검색된 내용이 없습니다.</td>
												</tr>
											</c:if>	
											</tbody>
										</table>
										<!-- paging s -->
										<div class="paging">
											<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="goPage" />
											<form:hidden path="pageIndex" />
										</div>
										<!--// paging e -->
									</div>
									<!--// table list e -->
								</div><!--// tabContainer e -->
								
								
							</div>
							<!--// tabs e -->
						</fieldset>
						</form:form>
					
					
					
					
					
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