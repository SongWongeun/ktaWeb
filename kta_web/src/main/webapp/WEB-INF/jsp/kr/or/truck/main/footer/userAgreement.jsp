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
						<h2><img src="/images/truck/etc/agree_tit.gif" alt="이용약관" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>이용약관</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/etc/agree_con_tit.gif" alt="화물공제조합 웹사이트 이용과 관련하여 필요한 사항을 규정합니다." /></p>
					<div>${result.ph_contents}</div><!--  2016.12.20 [HYEON] 추가 -->
					<!-- 2016.12.20 [HYEON] 주석처리함
					<div class="conSection">
						이용약관 s
						<div class="userAgree">
							이용약관 바로가기
							<div class="roundBox mB50">
								<div class="round"><span class="rtL"></span><span class="rtR"></span></div>상단라운드
								내용
								<div class="privacyQuick clfix">
									<dl>
										<dt>제1조</dt>
										<dd><a href="#a01">목적</a></dd>
										<dt>제2조</dt>
										<dd><a href="#a02">용어의 정의</a></dd>
										<dt>제3조</dt>
										<dd><a href="#a03">약관의 효력과 변경</a></dd>
										<dt>제4조</dt>
										<dd><a href="#a04">약관 외 준칙</a></dd>
										<dt>제5조</dt>
										<dd><a href="#a05">회원가입 및 탈퇴</a></dd>
										<dt>제6조</dt>
										<dd><a href="#a06">회원자격의 박탈</a></dd>
										<dt>제7조</dt>
										<dd><a href="#a07">서비스 내용의 추가 및 변경</a></dd>
										<dt>제8조</dt>
										<dd><a href="#a08">서비스 내용 면책고지</a></dd>
										<dt>제9조</dt>
										<dd><a href="#a09">제3자가 제공하는 자료</a></dd>
										<dt>제10조</dt>
										<dd><a href="#a10">컨텐츠 사용 제한</a></dd>
									</dl>
									<dl>
										<dt>제11조</dt>
										<dd><a href="#a11">준거법</a></dd>
										<dt>제12조</dt>
										<dd><a href="#a12">정보의 소유권</a></dd>
										<dt>제13조</dt>
										<dd><a href="#a13">공제조합의 의무와 권리</a></dd>
										<dt>제14조</dt>
										<dd><a href="#a14">이용의 제한</a></dd>
										<dt>제15조</dt>
										<dd><a href="#a15">공인인증서의 사용</a></dd>
										<dt>제16조</dt>
										<dd><a href="#a16">약관의 명시 및 변경 등</a></dd>
										<dt>제17조</dt>
										<dd><a href="#a17">분쟁조정</a></dd>
									</dl>
								</div>
								<div class="round"><span class="rbL"></span><span class="rbR"></span></div>하단라운드
							</div>
							제1조
							<div class="txtContent"  id="a01">
								<h3 class="etch3Tit">제1조 &#91;목적&#93;</h3>
								<p class="txtPoint08">본 약관은 화물공제에서 제공하는 서비스에 대한 사항을 규정하여 회원과 공제조합간의 상호신뢰 증진을 목적으로 합니다&#46;</p>
							</div>
							제2조
							<div class="txtContent"  id="a02">
								<h3 class="etch3Tit">제2조 &#91;용어의 정의&#93;</h3>
								<p class="txtPoint08">홈페이지란 회사가 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 이용자에게 제공하고 거래할 수 있도록 설정한 가상의 영업장을 말한다&#46;</p>
								<p class="txtPoint08">이용자란 &#34;홈페이지&#34;에 접속하여 이 약관에 따라 &#34;홈페이지&#34;가 제공하는 서비스를 받는 회원 및 비회원을 말한다&#46;</p>
								<p class="txtPoint08">회원이라 함은 &#34;홈페이지&#34;에 개인정보를 제공하여 회원등록을 한 자로서&#44; &#34;홈페이지&#34;의 정보를 지속적으로 제공받으며 &#34;홈페이지&#34;가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말한다&#46;</p>
								<p class="txtPoint08">비회원이라 함은 회원에 가입하지 않고&#34;홈페이지&#34;가 제공하는 서비스를 이용하는 자를 말한다&#46;</p>
								<p class="txtPoint08">게시물이라 함은 회원이 홈페이지를 이용함에 있어서 홈페이지에 게시한 부호&#44; 문자&#44; 음성&#44; 음향&#44; 화상&#44; 동영상 등의 정보 형태의 글&#44; 사진&#44; 동영상 및 각종 파일과 링크 등을 의미한다&#46;</p>
							</div>
							제3조
							<div class="txtContent"  id="a03">
								<h3 class="etch3Tit">제3조 &#91;약관의 효력과 변경&#93;</h3>
								<p class="txtPoint08">본 약관의 내용은 서비스 화면에 게시하거나 이용자에게 공시함으로써 그 효력이 발생합니다&#46;</p>
								<p class="txtPoint08">공제조합은 본 약관을 변경할 수 있으며&#44; 변경된 약관은 제 1항과 동일한 방법으로 공지함으로써 효력이 발생합니다&#46;</p>
							</div>
							제4조
							<div class="txtContent"  id="a04">
								<h3 class="etch3Tit">제4조 &#91;약관 외 준칙&#93;</h3>
								<p class="txtPoint08">본 약관에 명시되지 않은 사항은 전자거래 기본법&#44; 전자서명법&#44; 통신판매법 및 기타 관계법령의 규정을 따릅니다&#46;</p>
							</div>
							제5조
							<div class="txtContent"  id="a05">
								<h3 class="etch3Tit">제5조 &#91;회원가입 및 탈퇴&#93;</h3>
								<p class="txtPoint08">회원가입은 조합원사가 회원가입을 신청하고 회원약관에 동의함으로써 성립됩니다&#46;</p>
								<p class="txtPoint08">회원가입은 한 조합원사가 회원번호&#40;ID&#41; 하나만을 갖는 것을 원칙으로 합니다&#46;</p>
								<p class="txtPoint08">회원은 회원가입 신청시 기재한 사항이 변경되었을 경우에는 온라인을 통해 수정할 수 있으나 아이디는 변경이 불가능하므로 작성시 주의해야 합니다&#46;</p>
								<p class="txtPoint08">회원 가입 시 작성하는 모든 회원 정보들은 서비스 제공에 필요한 경우를 제외하고&#44; 다른 목적으로 사용되지 않습니다&#46;</p>
								<p class="txtPoint08">허위정보를 기재하였을 경우 발생하는 불이익은 책임지지 않으며&#44; 서비스 제한 조치를 받을 수 있습니다&#46;</p>
								<p class="txtPoint08">타인의 명의&#40;이름 및 주민등록번호&#41;를 도용하여 가입 신청을 한 회원의 모든 ID는 삭제되며&#44; 관계법령에 따라 처벌을 받을 수 있습니다&#46;</p>
								<p class="txtPoint08">회원은 가입시 등록한 회원정보의 변경이 발생한 경우 즉시 &#34;홈페이지&#34;에서 직접 수정 또는 전자우편&#44; 기타방법으로 &#34;홈페이지&#34;에 그 변경 사실을 알려야 한다&#46;</p>
							</div>
							제6조
							<div class="txtContent"  id="a06">
								<h3 class="etch3Tit">제6조 &#91;회원자격의 박탈&#93;</h3>
								<p class="txtPoint08">회원이 공제조합의 서비스를 이용함에 있어 다음의 사항에 해당하는 행위를 한 것이 발견될 경우 이용계약을 임의 해지하거나 공제조합이 정한 일정기간동안 서비스 이용중지를 할 수 있습니다&#46;</p>
								<ol class="txtListst03">
									<li>공공질서 및 미풍양속에 반하는 경우</li>
									<li>범죄적 행위에 관련되는 경우</li>
									<li>국익 또는 공익에 저해되는 목적으로 서비스를 이용한 경우</li>
									<li>서비스에 위해를 가하는 등 서비스의 건전한 이용에 저해한 경우</li>
									<li>타인의 아이디 및 비밀번호를 도용하거나 타인의 명예를 훼손한 경우</li>
									<li>기타 관계법령이나 공제조합이 정한 약관에 위배되는 경우</li>
								</ol>
							</div>
							제7조
							<div class="txtContent"  id="a07">
								<h3 class="etch3Tit">제7조 &#91;서비스 내용의 추가 및 변경&#93;</h3>
								<p class="txtPoint08">공제조합은 수시로 서비스 내용 및 종류를 변경할 수 있으며&#44; 변경사항은 공지사항을 통하여 공지합니다&#46;</p>
								<p class="txtPoint08">서비스 내용이 추가 및 변경됨으로써 이용에 필요한 사항이 변경될 경우 공제조합은 공지 사항을 통하여 이를 회원에게 사전 공지합니다&#46;</p>
							</div>
							제8조
							<div class="txtContent"  id="a08">
								<h3 class="etch3Tit">제8조 &#91;서비스 내용 면책고지&#93;</h3>
								<p class="txtPoint08">공제조합은 본 사이트의 내용을 최신 상태로 유지하기 위하여 노력하고 있으나 본 사이트의 게시물은 개괄적인 정보제공의 목적으로 게시된 것으로서 정확한 정보를 제공하지 않거나 오류가 있을 수 있습니다&#46;</p>
								<p class="txtPoint08">관련법이 허용하는 한도에서 공제조합은 위와 같은 오류로 발생하는 손해에 대하여 책임을 지지 않습니다&#46; 특히&#44; 보험계약에 관한 자세한 내용은 보험증권이나 약관&#44; 보험계약서를 참조하시기 바랍니다&#46;</p>
							</div>
							제9조
							<div class="txtContent"  id="a09">
								<h3 class="etch3Tit">제9조  &#91;제3자가 제공하는 자료&#93;</h3>
								<p class="txtPoint08">본 사이트는 공제조합이 관리하지 않는 다른 웹사이트&#40;이하 &#34;제3자 웹사이트&#34;라 합니다&#41;와 연결될 수 있습니다&#46;</p>
								<p class="txtPoint08">공제조합은 제3자 웹사이트의 내용에 대해 아무런 책임을 지지 않습니다&#46;</p>
								<p class="txtPoint08">본 사이트가 제공하는 제3자 웹사이트와의 Link는 정확히 작동하지 않을 수 있습니다&#46;</p>
								<p class="txtPoint08">더불어 위와 같은 Link로 발생할 수 있는 일체의 손해에 대하여도 공제조합은 아무런 책임을 지지 않습니다&#46;</p>
							</div>
							제10조
							<div class="txtContent"  id="a10">
								<h3 class="etch3Tit">제10조  &#91;컨텐츠 사용 제한&#93;</h3>
								<p class="txtPoint08">본 사이트는 공제조합에 의하여 운영되고 관리되는 사이트입니다&#46;</p>
								<p class="txtPoint08">공제조합 또는 관련법이 허용하지 않는 한 본 사이트의 게시물 기타 내용을 어떠한 방법으로든 사용할 수 없습니다&#46;</p>
							</div>
							제11조
							<div class="txtContent"  id="a11">
								<h3 class="etch3Tit">제11조 &#91;준거법&#93;</h3>
								<p class="txtPoint08">공제조합은 본 사이트의 내용이 모든 국가에서 관련법상 규제에 부합하고 있음을 보증하지 않습니다&#46;</p>
								<p class="txtPoint08">본 사이트의 내용은 한국법을 준거법으로 하여 한국법에 따라 해석됩니다&#46;</p>
							</div>
							제12조
							<div class="txtContent"  id="a12">
								<h3 class="etch3Tit">제12조 &#91;정보의 소유권&#93;</h3>
								<p class="txtPoint08">본 사이트의 사용자가 본 사이트를 통하여 공제조합에 제공하는 정보의 소유권은 공제조합에게 있습니다&#46; 따라서 공제조합은 이를 자유롭게 사용할 수 있습니다&#46;</p>
							</div>
							제13조
							<div class="txtContent"  id="a13">
								<h3 class="etch3Tit">제13조  &#91;공제조합의 의무와 권리&#93;</h3>
								<p class="txtPoint08">회원은 자신의 회원번호&#40;ID&#41; 및 비밀번호를 공제조합의 사전승낙없이 타인에게 양도&#44; 임대할 수 없습니다&#46;</p>
								<p class="txtPoint08">회원에게 부여된 회원번호&#40;ID&#41; 및 비밀번호에 대한 모든 관리책임은 회원에게 있습니다&#46;</p>
								<p class="txtPoint08">회원은 자신의 회원번호&#40;ID&#41;가 부정하게 이용된 것을 인지한 즉시 공제조합에 그 사실을 통지해야 합니다&#46;</p>
								<p class="txtPoint08">회원은 본 약관 및 관계법령에서 규정한 사항을 준수해야 합니다&#46;</p>
							</div>
							제14조
							<div class="txtContent"  id="a14">
								<h3 class="etch3Tit">제14조 &#91;이용의 제한&#93;</h3>
								<p class="txtPoint08">부정한 이용을 하였다고&#44; 공제조합이 판단하였을때는 임의로 즉시 사용자의 이용을 제한 할 수 있습니다&#46;</p>
							</div>
							제15조
							<div class="txtContent"  id="a15">
								<h3 class="etch3Tit">제15조 &#91;공인인증서의 사용&#93;</h3>
								<p class="txtPoint08">이용자는 전자서명법에 의한 공인인증서를 사용하실 수 있으며&#44; 또한 공제조합이 제공한 공인된 인증수단으로 로그인하실 수 있습니다&#46; 이때 관련 정보는 공제조합이 저장하지 않습니다&#46;</p>
							</div>
							제16조
							<div class="txtContent"  id="a16">
								<h3 class="etch3Tit">제16조 &#91;약관의 명시 및 변경 등&#93;</h3>
								<ol class="txtListst03">
									<li>회사가 이 약관을 변경하고자 할 때에는 변경사유&#44; 변경내용 및 적용일자 등을 명시하여 변경일 기준 1개월전에 게시 가능한 전자적 장치에 게시하고 이용자에게 통지하여야 한다&#46; 다만&#44; 법령의 개정이나 제도의 개선 등으로 인하여 긴급히 이 약관을 변경할 경우에는 즉시 이를 게시하고 통지한다&#46;</li>
									<li>회사는 법령의 개정으로 인하여 긴급하게 약관을 변경한 때에는 변경된 약관을 전자적 장치에 최소 1월 이상 게시하고 이용자에게 통지한다&#46;</li>
								</ol>
							</div>
							제17조
							<div class="txtContent"  id="a17">
								<h3 class="etch3Tit">제17조 &#91;분쟁조정&#93;</h3>
								<ol class="txtListst03">
									<li>이용자는 관련법의 처리에 관하여 이의가 있을 때에는 회사에 그 해결을 요구하거나 관련기관에 분쟁조정을 신청할 수 있다&#46;</li>									
									<li>이용자가 회사의 본점이나 영업점 또는 회사에 이의를 제기한 경우 회사는 15일 이내에 이에 대한 조사 또는 처리결과를 이용자에게 알려야 한다&#46;</li>
									<li>이 약관에서 정하지 아니한 사항은 대한민국법령을 적용한다&#46;</li>
								</ol>
							</div>
							부칙
							<div class="txtContent">
								<h3 class="txtPoint08">&#60;부칙&#62;</h3>
								<ul class="txtListst01">
									<li>인터넷회원가입 약관 버전번호 v1&#46;2</li>
									<li>인터넷회원가입 약관 최종변경일자 2014&#46;01</li>
								</ul>
							</div>
						</div>
					</div> --><!--// conSection e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<!--// container e -->
		<hr />
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>









