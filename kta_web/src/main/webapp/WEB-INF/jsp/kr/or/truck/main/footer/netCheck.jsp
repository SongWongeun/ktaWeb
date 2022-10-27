<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			searchForm();
			return false;
		}
	});
});
function searchForm(){
	var keyword = document.searchForm.searchKeywordTotal.value;
	if(keyword == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}else{
	document.searchForm.searchKeywordT.value = keyword;
	document.searchForm.action = "<c:url value='/main/totalSearch.do'/>";
	document.searchForm.submit();
	}
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
</script>
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
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<!-- 20161130 삭제
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
						//20161130 삭제 -->
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
						<!-- 20161214 삭제 
						<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
						//20161214 삭제 -->
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<form name="searchForm" method="post" action="">
						<fieldset>
						<legend>통합검색</legend>
							<input type="hidden" name="searchKeywordT"/>
							<span class="ut_search"><label for="">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
							<a class="btn_ut_search" href="#;" onclick="totalSearch();"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
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
		<hr />
		<!--// header e -->
		
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/etc/prog_tit02.gif" alt="증명서 진위검증" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>증명서진위검증안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<div class="conSection">
						<div class="progArea">
							<p>화물공제조합 홈페이지에서 발급받은 증명서의 진위여부를 검증 할 수 있습니다&#46;</p>
						</div>
						<table class="tbDetail_st01 mB0 tbTerm" summary="프로그램 설치파일 테이블 입니다.">
							<caption>프로그램 설치파일에 대해서 나타낸 표</caption>
							<colgroup>
								<col style="width:30%;" />
								<col style="width:*;" />
								<col style="width:20%;" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>설치파일</span></th>
									<td>증명서 검증프로그램</td>
									<td class="alC"><span class="btn_pack btn_type07 icon"><span class="down"></span><a href="/RexServer30/cab/markanychecker.exe">다운로드</a></span></td>
								</tr>
								
							</tbody>
						</table>
						
						<div class="txtContent">
							<h4 class="decuh4Tit01">1. 다운로드 받은 증명서 위변조 검증 프로그램 더블클릭하여 실행</h4>
							<p class="pB13"><img src="/images/truck/etc/check01.gif" alt="설치파일 아이콘" /></p>
							<h4 class="decuh4Tit01">2. 프로그램 설치 초기화면</h4>
							<p class="pB13"><img src="/images/truck/etc/check02.gif" alt="설치 초기화면" /></p>
							<h4 class="decuh4Tit01">3. [install] 버튼을 눌러 프로그램 설치</h4>
							<p class="pB13"><img src="/images/truck/etc/check03.gif" alt="설치진행" /></p>
							<h4 class="decuh4Tit01">4. 바탕화면에 검증 프로그램 바로가기 확인</h4>
							<p class="pB13"><img src="/images/truck/etc/check04.gif" alt="바로가기 아이콘확인" /></p>
							<h4 class="decuh4Tit01">5. 바탕화면의 검증프로그램 더블클릭하여 실행 후, 프로그램 메인화면</h4>
							<p class="pB13"><img src="/images/truck/etc/check05.gif" alt="프로그램 메인화면" /></p>
							<h4 class="decuh4Tit01">6. 스캐너를 선택하는 버튼클릭해서 연결되어 있는 스캐너 선택</h4>
							<p class="pB13"><img src="/images/truck/etc/check06.gif" alt="스캐너 선택화면" /></p>
							<ul class="txtListst01">
								<li>PC에 직접 연결된 스캐너만 선택가능(네트워크로 연결된 복합기,스캐너 지원불가)</li>
							</ul>
							<h4 class="decuh4Tit01">7. [증명서 검증] 버튼을 눌러 스캔 시작</h4>
							<p class="pB13"><img src="/images/truck/etc/check07.gif" alt="스캔시작 버튼화면" /></p>
							<h4 class="decuh4Tit01">8. 스캔이 끝나면 자동으로 문서 위변조 검증시작</h4>
							<p class="pB13"><img src="/images/truck/etc/check08.gif" alt="위변조 검증 화면" /></p>
							<h4 class="decuh4Tit01">9. 검증이 끝난 후 아래와 같이 검증확인 메시지가 문서의 발급시간과 함께 표시됨</h4>
							<p class="pB13"><img src="/images/truck/etc/check09.gif" alt="검증결과 확인화면" /></p>
							<h4 class="decuh4Tit01">10. 스캔 이미지와 원본 문서가 함께 화면에 표시됨</h4>
							<p class="pB13"><img src="/images/truck/etc/check10.gif" alt="검증결과 화면" /></p>
							<h4 class="decuh4Tit01">11. 스캔 된 문서와 2D 바코드로부터 추출된 원본 문서를 서로 비교하여 발급문서의 위변조 여부를 판단</h4>
						</div>
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




