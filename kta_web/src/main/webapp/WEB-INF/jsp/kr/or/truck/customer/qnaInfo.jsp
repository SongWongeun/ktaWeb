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
 						<h2><img src="/images/truck/cust/qna_tit.gif" alt="문의안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/customer/customerIndex.do">고객광장</a>
						<span>문의안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cust/qna_con_tit.gif" alt="고객문의 서비스의 문의 절차와 내용을 자세하게 알려드립니다" /></p>
					<div class="conSection">
						<p class="consecTit pB0"><img src="/images/truck/cust/qna_sec_tit.gif" alt="화물공제조합 고객광장을 찾아 주신 고객 여러분 감사합니다 언제나 신속하고 정확하게 만족을 드리겠습니다" /></p>
						<div class="qnaArea">
							<dl class="qnaBg01">
								<dt>고객문의 안내</dt>
								<dd>화물공제조합의 문의 안내는 고객님의 맞춤 응대를 해 드리기 위해 1&#58;1 문의 서비스를 제공하고 있습니다&#46;</dd>
								<dd>본인인증절차 이후&#44; 의견을 주시면 각 분야의 담당자에게 바로 접수 되어 조치해 드리고 있습니다&#46;</dd>
								<dd>1&#58;1 문의 서비스는 회신 받고자 하는 개인 이메일이나 홈페이지 본인 인증을 통해 회신 내용 열람이 가능합니다&#46;</dd>
							</dl>
							<dl class="qnaBg02">
								<dt>자주하는질문 안내</dt>
								<dd>궁금한 사항에 대한 고객 문의 전에&#44; 자주하는질문을 한번 확인해 주시기 바랍니다&#46;</dd>
								<dd>자주 문의 되는 질문과 답변을 보실 수 있습니다&#46;</dd>
							</dl>
							<dl class="qnaBg03">
								<dt>칭찬합시다 안내</dt>
								<dd>화물공제조합은 고객님들의 성원과 사랑에 보답하고자 늘 노력합니다&#46;</dd>
								<dd>고객님들께서 남겨주시는 칭찬글 모두 화물공제조합 직원들에게 힘이 되고&#44; 동기 부여가 됩니다&#46;</dd>
								<dd>많은 응원과 칭찬 부탁 드리겠습니다&#46;</dd>
							</dl>
							<dl class="qnaBg04">
								<dt>프로그램설치 및 PC원격지원 안내</dt>
								<dd>회원 고객님들의 서비스 이용 불편을 덜어드리고자&#44; 프로그램 설치 및 PC원격지원과 관련한 상세한 내용을 제공하고 있습니다&#46;</dd>
							</dl>
						</div>
						<div class="btnboxR clfix">
							<span class="btn_pack btn_type06 icon"><span class="prog"></span><a href="/footer/progInstall.do">프로그램 설치</a></span>
							<span class="btn_pack btn_type06 icon"><span class="pc"></span><a href="/footer/comRemote.do">PC원격지원</a></span>
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