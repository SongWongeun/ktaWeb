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
<script type="text/javaScript" language="javascript" defer="defer">
function searchCompany() {	
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompany.do'/>";
   	document.boardForm.submit();
}
function searchHospital() {
	document.boardForm.searchCom.value="hospital";
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompanyDirect.do'/>";
   	document.boardForm.submit();
}
function searchFactory() {
	document.boardForm.searchCom.value="factory";
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandCompanyDirect.do'/>";
   	document.boardForm.submit();
}
$(document).ready(function(){
	$(window).on('keydown',function(event){
		if( event.keyCode == 13) searchCompany();
	});
	
});
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
 						<h2><img src="/images/truck/info/recom_tit.gif" alt="우수협력업체" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<span>우수협력업체</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/info/recom_con_tit.gif" alt="화물공제조합은 전국 우수한 협력업체를 통해 고객만을 위한 특별한 서비스를 제공하고자 노력합니다" /></p>
					<div class="conSection">
						<p class="consecTit"><img src="/images/truck/info/recom_con.gif" alt="우수협력업체안내-전국망에 걸친 우수 협력 파트너 네트워크를 보유하고 있는 화물공제조합의 우수협력업체 서비스 입니다" /></p>
						<div class="roundBox">
							<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<form:form commandName="searchVO" name="boardForm" method="post" action="">
							<fieldset>
							<legend>우수협력업체</legend>
							<input type="hidden" name="searchCom">
							<div class="findArea">
								<p class="findName"><img src="/images/truck/info/recom_conseabg.gif" alt="이름으로 찾기" /></p>
								<div class="findForm">
									<p>
										<!-- <input id="ch1" name="searchCategory" title="병원" type="radio" value="hospital"/><label for="ch1">병원</label> -->
										<input id="ch2" name="searchCategory" title="정비공장" type="radio" value="factory" checked="checked"/><label for="ch2">정비공장</label>
									</p>
									<p>
										<form:select path="searchDirect" id="searchDirect" title="지역검색옵션">
											<option value="" selected="selected">전국</option>
											<option value="서울">서울</option>                  
											<option value="부산">부산</option>                  
											<option value="대구">대구</option>                  
											<option value="인천">인천</option>                  
											<option value="광주">광주</option>                  
											<option value="대전">대전</option>                  
											<option value="울산">울산</option>                  
											<option value="경기">경기</option>                  
											<option value="강원">강원</option>                  
											<option value="충북">충북</option>                  
											<option value="충남">충남</option>                  
											<option value="전북">전북</option>                  
											<option value="전남">전남</option>                  
											<option value="경북">경북</option>                  
											<option value="경남">경남</option>                  
											<option value="제주">제주</option>                  
										</form:select>
										<label class="hide" for="search">검색어입력</label><input id="search" name="searchKeyword" title="검색어를 입력해주세요" style="width:300px" name="search" class="txt" type="text" type="text" value=""/>
										<a class="btn_search" href="#;" onclick="searchCompany(); return false;"><img class="vaM" src="/images/truck/btn/btn_ksearch.gif" alt="검색" /></a>
									</p>										
								</div>
							</div>
							</fieldset>
							</form:form>
							<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div><!--// roundBox e -->
						<ul class="goPage">
							<!-- <li class="pR40"><a href="#;" onclick="searchHospital()"><img src="/images/truck/info/go_hospital.gif" alt="우수협력병원바로가기" /></a></li> -->
							<li><a href="#;" onclick="searchFactory(); return false;"><img src="/images/truck/info/go_factory.gif" alt="우수협력정비공장바로가기" /></a></li>
						</ul>
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