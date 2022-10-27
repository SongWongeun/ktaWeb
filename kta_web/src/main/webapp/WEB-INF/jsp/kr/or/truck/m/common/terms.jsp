<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">
</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path07">
		<ul>
			<li class="depth02"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li><a href="/m/terms.do">이용약관</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i00"><img alt="이용약관" src="/images/m_truck/subtop/00top_1.png"></li>
				<li class="txt01">화물공제조합 이용약관과 개인정보보호정책입니다.</li>
			</ul>
		</article>
		<article class="tabWrap">
			<!-- tab -->
			<div class="tabmenu">
				<ul>
					<li class="tab1 w50 on"><a href="#;">이용약관</a></li>
					<li class="tab2 w50"><a href="#;">개인정보보호정책</a></li>
				</ul>
			</div>
			<!-- 이용약관 -->
			<div class="con1">
				<div class="basicCont06">
					<p class="txtTit05">제1조 [목적]</p>
					<p class="txtSt06">본 약관은 화물공제에서 제공하는 서비스에 대한 사항을 규정하여 회원과 공제조합간의 상호신뢰 증진을 목적으로 합니다.</p>
					<p class="txtTit05">제2조 [용어의 정의]</p>
					<p class="txtSt06">홈페이지란 회사가 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 이용자에게 제공하도록 설정한 가상의 영업장을 말한다.</p>
					<p class="txtSt06">이용자란 "홈페이지"에 접속하여 이 약관에 따라 "홈페이지"가 제공하는 서비스를 받는 회원 및 비회원을 말한다.</p>
					<p class="txtTit05">제3조 [약관의 효력과 변경]</p>
					<p class="txtSt06">본 약관의 내용과 변경사항은 서비스 화면에 게시하거나 이용자에게 공시함으로써 그 효력이 발생합니다.</p>
					<p class="txtTit05">제4조 [약관외 준칙]</p>
					<p class="txtSt06">본 약관에 명시되지 않은 사항은 전자거래 기본법, 전자서명법, 통신판매법 및 기타 관계법령의 규정을 따릅니다.</p>
					<p class="txtTit05">제5조 [회원자격의 박탈]</p>
					<p class="txtSt06">회원이 공제조합의 서비스를 이용함에 있어 공제조합이 정한 판단으로 서비스 이용중지를 할 수 있습니다.</p>
					<p class="txtTit05">제6조 [서비스 내용의 추가 및 변경]</p>
					<p class="txtSt06">공제조합은 수시로 서비스 내용 및 종류를 변경할 수 있으며, 변경사항은 공지사항을 통하여 공지합니다.</p>
					<p class="txtTit05">제7조 [서비스 내용 면책고지]</p>
					<p class="txtSt06">홈페이지의 게시물은 개괄적인 정보제공의 목적으로 게시된 것으로서 정확한 정보를 제공하지 않거나 오류가 있을 수 있습니다. 특히, 보험계약에 관한 자세한 내용은 보험증권이나 약관, 보험계약서를 참조하시기 바랍니다.</p>
					<p class="txtTit05">제8조 [제3자가 제공하는 자료]</p>
					<p class="txtSt06">본 사이트는 공제조합이 관리하지 않는 다른 웹사이트와 연결될 수 있습니다. 공제조합은 제3자 웹사이트의 내용에 대해 아무런 책임을 지지 않습니다.</p>
					<p class="txtTit05">제9조 [정보의 소유권]</p>
					<p class="txtSt06">본 사이트의 사용자가 본 사이트를 통하여 공제조합에 제공하는 정보의 소유권은 공제조합에게 있습니다. 따라서 공제조합은 이를 자유롭게 사용할 수 있습니다.</p>
					<p class="txtTit05">제10조[이용의 제한]</p>
					<p class="txtSt06">부정한 이용을 하였다고, 공제조합이 판단하였을때는 임의로 즉시 사용자의 이용을 제한 할 수 있습니다.</p>
					<p class="txtSt06">모바일인터넷 약관 최종변경일자 2014.01</p>
				</div>
			</div>
			<!-- 개인정보보호정책 -->
			<div class="con2">
				<div class="basicCont06">
					<p class="txtSt07">공제조합은 &#40;이하 &#39;회사&#39;는&#41; 고객님의 개인정보를 중요시하며&#44; &#34;정보통신망 이용촉진 및 정보보호&#34;에 관한 법률을 준수하고 있습니다&#46;
						회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며&#44; 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다&#46;
						회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항&#40;또는 개별공지&#41;을 통하여 공지할 것입니다&#46;</p>
					<p class="txtTit05">1. 회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
					<p class="txtTit04">조합원 회원가입</p>
					<p class="txtSt06">대표자명, 대표자 주민번호, 조합원 아이디, 비밀번호, 사업자번호, 회사명, 회사주소, 대표 전화번호, 대표 휴대번호, 대표 이메일 주소, 계약지부</p>
					<p class="txtTit04">차량관리자 회원가입</p>
					<p class="txtSt06">성명, 주민번호, 아이디, 비밀번호, 사업자번호, 주소, 전화번호, 휴대번호, 이메일 주소</p>
					<p class="txtTit04">거래처 회원가입</p>
					<p class="txtSt06">대표자명, 대표자 주민번호, 대표 아이디, 비밀번호, 사업자번호, 회사명, 회사주소, 대표 전화번호, 대표 휴대번호, 대표 이메일 주소</p>
					<p class="txtTit05">2. 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
					<p class="txtSt06">서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 콘텐츠 제공 , 배송 또는 발송 정보 , 본인 인증 , 계약 확인, 회원 관리 </p>
					<p class="txtSt06">서비스 이용에 따른 본인확인 , 개인 식별 , 부정 이용 방지와 비인가 사용 방지 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달</p>
					<p class="txtSt06">마케팅 및 광고에 활용</p>
					<p class="txtTit05">3. 회사는 원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
					<p class="txtTit04">보존항목</p>
					<p class="txtSt06">조합원 : 대표자명, 대표자 주민번호, 조합원 아이디, 비밀번호, 사업자번호, 회사명, 회사주소, 대표 전화번호, 대표 휴대번호, 대표 이메일 주소, 계약지부</p>
					<p class="txtSt06">차량관리자 : 성명, 주민번호, 아이디, 비밀번호, 사업자번호, 주소, 전화번호, 휴대번호, 이메일 주소</p>
					<p class="txtSt06">거래처 : 대표자명, 대표자 주민번호, 대표 아이디, 비밀번호, 사업자번호, 회사명, 회사주소, 대표 전화번호, 대표 휴대번호, 대표 이메일 주소</p>
					<p class="txtTit04">보존근거</p>
					<p class="txtSt06">소송이나 분쟁에 대비한 근거자료의 보존</p>
					<p class="txtTit04">보존기간</p>
					<p class="txtSt06">5년</p>
					<p class="txtTit05">4. 회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.</p>
					<p class="txtTit04">파기절차</p>
					<p class="txtSt06">회원님이 회원가입 등을 위해 입력 또는 제공하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져 (종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.</p>
					<p class="txtTit04">파기방법</p>
					<p class="txtSt06">전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법으로 파기합니다.</p>
					<p class="txtTit05">5. 회사는 귀하의 개인정보를 '개인정보 수집 및 이용안내'에서 고지한 범위내에서 사용하며, 동범위를 초과하여 이용하거나 타인 또는 타기업 · 기관에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>
					<p class="txtSt06">이용자들이 사전에 동의한 경우</p>
					<p class="txtSt06">법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>
					<p class="txtTit05">6. 회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.(홈페이지로 가입한 회원의 정보는 제외합니다)</p>
					<p class="txtSt06">수집한 개인정보의 위탁 취급하는 업무 내용 수탁자 (시스템 개발업체 등)</p>
					<p class="txtSt06">수집된 개인정보를 이용한 금융상품, 서비스소개 각종 금융 및 생활정보 당사와 위탁계약이 업체</p>
					<p class="txtSt06">회원에게 물품, 사이버상품권 등 재화나 서비스 전달. 제공정보, 보유기간, 배송업체(특정 업체명은 개별 안내) </p>
					<p class="txtTit05">7. 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.</p>
					<p class="txtSt06">귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.</p>
					<p class="txtSt06">또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.</p>
					<p class="txtSt06">회사는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 "회사가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</p>
					<p class="txtTit05">8. 회사는 귀하의 정보를 수시로 저장하고 찾아내는 '쿠키(cookie)' 등을 운용합니다.</p>
					<p class="txtSt06">쿠키란 회사의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 회사는 다음과 같은 목적을 위해 쿠키를 사용합니다.</p>
					<p class="txtTit04">쿠키 등 사용 목적</p>
					<p class="txtSt06">회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공</p>
					<p class="txtSt06">귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.</p>
					<p class="txtTit04">쿠키 설정 거부 방법</p>
					<p class="txtSt06">쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.</p>
					<p class="bulSt05">설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보보호 탭 > [개인정보보호 수준]을 조절하시면 됩니다. 단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</p>
					<p class="txtTit05">회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.</p>
					<p class="txtTit04">개인정보관리담당</p>
					<p class="txtSt06">부 서 : 회사 총무부<br/>전화번호: 02)3483-3700</p>
					<p class="txtSt07">개인정보취급방침 시행일자 : 2014. 01.15<br/>개인정보취급방침 최종변경일자 : 2014. 01.15</p>
				</div>
			</div>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>