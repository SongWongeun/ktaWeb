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
<script type="text/javascript">
$(document).ready(function(){
	$('a#f_recruit').on('click',function(){
		document.f.submit();
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
 						<h2><img src="/images/truck/asso/recruit_tit.gif" alt="채용안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<span>채용안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/recruit_con_tit.gif" alt="인재와 함께 크는 기업이 되겠습니다" /></p>
					<div class="conSection">
						<div class="recruitArea">
							<div class="recruitConts">
								<h3><img src="/images/truck/asso/recruit_sub_tit01.gif" alt="화물공제조합에 지원하세요.당신의 꿈과 미래를 함께합니다." /></h3>
								<div class="btnboxL"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/cmm/fms/FileDown.do?atchFileId=FILE_000000000008016&fileSn=0">이력서 양식 다운로드</a></span>&nbsp;<span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/cmm/fms/FileDown.do?atchFileId=FILE_000000000008017&fileSn=0">자기소개서 양식 다운로드</a></span></div>
								<!-- <div class="btnboxL"><span class="btn_pack btn_type09 icon"><span class="news"></span><a href="#;" id="f_recruit" >채용공고 바로가기</a></span></div>-->
							</div>
							<!-- 채용 지원 유의 사항 안내 -->
							<div class="recruitConts">
								<h4><img src="/images/truck/asso/recruit_sub_tit02.gif" alt="채용 지원 유의 사항 안내" /></h4>
								<ul>
									<li>입사지원서는 우리 <span class="unLine">공제조합 서식</span>에 한 합니다&#46;</li>
									<li>지원서 작성내용 및 제출서류가 <span class="unLine">허위 혹은 위조임이 판명</span>되거나 고의로 누락 또는 추가한 사항이 확인되면 합격한<br />경우라도 합격이 취소됨은 물론&#44; 향후 우리 공제조합 직원 선발에서의 응시자격이 제한됩니다&#46;</li>
									<li>신입사원 및 경력사원의 처우 조건 등은 <span class="unLine">입사일 현재 관련 규정</span>을 적용합니다&#46;</li>
									<li>&#8968;국가유공자 등 예우 및 지원에 관한 법률&#8971; 및 &#8968;5 &#183;18민주유공자예우에 관한 법률&#8971; 에 의거한 취업보호 및 취업지원대상자&#44;<br />&#8968;장애인고용촉진  및 직업재활법&#8971;에 의거한 장애인은 <span class="unLine">관계법령과 공제조합 규정에 의거 우대</span>합니다&#46;</li>
									<li><span class="unLine">입사지원서 작성내용 및 증빙서류</span>에 대해 관계기관에 사실 여부를 조회할 예정 입니다&#46;</li>
									<li>보다 구체적인 사항은 채용공고를 반드시 참조하시기 바랍니다&#46;</li>
								</ul>
								<div class="btnbox"></div>
								<form id="f" name="f" action="/infoLounge/deductNewsView.do?articleNo=DEDUC_00000000681821" method="post">
								<fieldset>
								<legend>채용공고 검색</legend>
									<input id="searchKeyword" name="searchKeyword" type="hidden" value="채용" />
									<input id="searchCondition" name="searchCondition" type="hidden" value="1" />
								</fieldset>
								</form>
							</div>
							<!-- 인사규정에 따른 채용 결격 사유 안내" -->
							<div class="recruitConts">
								<h4><img src="/images/truck/asso/recruit_sub_tit02.gif" alt="인사규정에 따른 채용 결격 사유 안내" /></h4>
								<ul>
									<li>금치산자와 한정치산자</li>
									<li>금고이상의 형을 받고 그 집행이 종료되거나 집행을 아니하기로 확정된 후 3년을 경과하지 아니한 자</li>
									<li>파산자로서 복권되지 아니한 자</li>
									<li>법률에 의해 의하여 공민권이 정지 또는 박탈된 자 </li>
									<li>전 직장에서 부정행위&#44; 근무태만 등으로 인하여 파면된 자</li>
									<li>병역기피자</li>
									<li>관계법령에 의한 근로 금지자</li>
									<li>기타 결격사유가 있다고 인정되는 자</li>
								</ul>
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