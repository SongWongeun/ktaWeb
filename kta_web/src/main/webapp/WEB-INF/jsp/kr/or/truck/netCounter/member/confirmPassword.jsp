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
$(document).ready(function(){
	<%-- 취소 --%>
	$('a#formCancel').on('click',function(e){
		e.preventDefault();
		location.href = '/netCounter/memberPage/myPage/myInfo.do';
	});
	$('a#formSubmit').on('click',function(e){
		e.preventDefault();
		document.f.submit();
	});
	
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
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/pw_tit.gif" alt="회원정보수정" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<span>회원정보수정</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/pw_con_tit.gif" alt="정확한 본인 확인을 위해 다시 한번 비밀번호를 입력해 주세요" /></p>
					<div class="conSection">
						<!-- 회원정보수정 s -->
						<div class="tbWork1">
							<form:form id="f" name="f" commandName="joinVO" action="/netCounter/memberPage/myPage/alterInfo.do">
								<input type="hidden" id="agent_cd" name="agent_cd" value="${loginVO.agentCd}" />
								<table class="tbWork_st03" summary="비밀번호확인 테이블 입니다.">
									<caption>회원정보변경에 대해서 나타낸 표</caption>
									<colgroup>
										<col width="30%" />
										<col width="70%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">아이디</th>
											<td>
												<input type="hidden" name="id" id="id" value="${loginVO.id}"/>
												${loginVO.id}
											</td>
										</tr>
										<tr>
											<th scope="row">비밀번호</th>
											<td>
												<label class="hide" for="userPw1">비밀번호</label>
												<input name="password" class="txt" id="password" type="password" style="width:150px"/>
												<%-- <form:errors cssClass="formError" path="password" /> --%>
											</td>
										</tr>
										<!-- 
										<tr>
											<th scope="row">비밀번호 확인</th>
											<td>
												<label class="hide" for="userPw2">비밀번호 확인</label>
												<input name="confirmPassword" class="txt" id="confirmPassword" type="password" style="width:150px"/>
												<span class="desc02">비밀번호를 확인 하기 위해 입력하신 비밀번호를 다시 입력하세요</span>
												<form:errors cssClass="formError" path="confirmPassword" />
											</td>
										</tr>
										 -->
									</tbody>
								</table>
							</form:form>
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a id="formSubmit" href="#;">확인</a></span>
								<span class="btn_pack btn_type10 icon"><span class="check"></span><a id="formCancel" href="#;">취소</a></span>
							</div>
						</div><!--// 회원정보변경 e -->
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



