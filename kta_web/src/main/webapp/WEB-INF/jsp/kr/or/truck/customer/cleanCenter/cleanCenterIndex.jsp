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
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}'
	if(param == 'regist.success'){
	 param = '등록이';
	}else if(param == 'update.success'){
		param='수정이';
	}else if(param == 'delete.success'){
		param ='삭제가';
	}
	alert('글'+param+' 완료되었습니다.');
});
</script>
</c:if>
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
 						<h2><img src="/images/truck/asso/clean_tit02.gif" alt="클린센터" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<a href="/customer/cleanCenter/charter.do">윤리경영</a>
						<span>클린센터</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/clean_con_tit.gif" alt="투철한 윤리의식을 지니며, 윤리경영을 실천하겠습니다" /></p>
					<div class="conSection">
						<div class="cleanArea03">
							<h4><img src="/images/truck/asso/clean_tab4_tit01.gif" alt="안녕하십니까. 화물공제조합 클린센터 입니다." /></h4>
							<p class="txt01">클린센터는 화물공제조합 감사실과 제보자와의 직접 접속이 가능하며&#44; 언제 어디서나 누구든지 이용이 가능합니다&#46;</p>
							<p class="txt06">공제계약&#44; 보상처리와 관련된 사항은 고객광장 1 &#58; 1문의로 하시기 바랍니다&#46; </p>
							<div class="btnbox"><span class="btn_pack btn_type08 icon"><span class="clean"></span><a href="/customer/cleanCenter/viewRegistBoard.do">제보하기</a></span></div>
						</div>
						<div class="cleanArea03">
							<div class="cleanConts01">
								<div class="clean01">
									<h5><img src="/images/truck/asso/clean_tab4_tit02.gif" alt="제보대상" /></h5>
									<ul>
										<li>윤리 위반 행위</li>
										<li>임직원의 부정&#44; 비리 행위</li>
									</ul>
								</div>
								<div class="clean02">
									<h5><img src="/images/truck/asso/clean_tab4_tit03.gif" alt="제보방법" /></h5>
									<ul>
										<li class="icon01">02&#45;3483&#45;3780</li>
										<li class="icon02">02&#45;3483&#45;3799</li>
										<li class="icon03">화물공제조합 감사실</li>
									</ul>
								</div>
							</div>
							<div class="cleanConts02">
								<p class="bold">제보자 및 제보내용은 비밀이 보장되며&#44; 제보내용으로 어떠한 불이익도 받지 않습니다&#46;</p>
								<p class="bold">실명 및 연락처가 정확하지 않을 경우에는 제보가 불가합니다&#46;</p>
								<p class="bold">타인의 비방이나 음해 목적으로 이용해서는 아니 되며&#44; 허위로 제보한 것으로 판명될 경우 고발 조치될 수 있습니다&#46;</p>
								<p class="bold">PC방 등 많은 사람들이 이용하는 장소에서 글을 작성하시거나 작성하신 글을 확인하신 경우에는 다른 사람들이 보지 못하도록 웹브라우저&#40;익스플로러 등&#41;를 반드시 종료하시기 바랍니다&#46;</p>
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