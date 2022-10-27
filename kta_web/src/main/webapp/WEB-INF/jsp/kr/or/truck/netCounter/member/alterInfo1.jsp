<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						/* -- 2016.12.13 [H] 추가 -- */
						$("#withdrawalMem")
								.on(
										'click',
										function() {
											location.href = "/netCounter/memberPage/myPage/withdrawPage.do";
										});
<%-- 이메일 select 구현 --%>
	$('form#f select#p_email_3').on(
								'change',
								function() {
									var selected_p_email_3 = $(this).find(
											'option:selected').val();

									$('form#f input#p_email_2').val('');//초기화
									if (selected_p_email_3 == '0') {

									} else if (selected_p_email_3 == '1') {
										$('form#f input#p_email_2').show();
									} else {
										$('form#f input#p_email_2').hide();
										$('form#f input#p_email_2').val(
												selected_p_email_3);
									}

								});
<%-- 전화번호 select 자동 매핑 --%>
	$(
								'select#p_tel_local_no option[value="${resultMap.TEL_LOCAL_NO }"]')
								.attr('selected', 'selected');
<%-- 팩스번호 select 자동 매핑 --%>
	$(
								'select#p_fax_local_no option[value="${resultMap.FAX_LOCAL_NO }"]')
								.attr('selected', 'selected');
<%-- 휴대폰 번호 select 자동 매핑 --%>
	$(
								'select#p_mobile_com_no option[value="${resultMap.MOBILE_COM_NO }"]')
								.attr('selected', 'selected');
<%-- 이메일 select 자동 매핑 --%>
	if ($(
								'select#p_email_3 option[value="${fn:split(resultMap.EMAIL,"@")[1] }"]')
								.size()) {
							$(
									'select#p_email_3 option[value="${fn:split(resultMap.EMAIL,"@")[1] }"]')
									.attr('selected', 'selected');
						} else if ('${fn:split(resultMap.EMAIL,"@")[1] }' == '') {
							$('select#p_email_3 option[value="0"]').attr(
									'selected', 'selected');
						} else {
							$('form#f input#p_email_2').val(
									'${fn:split(resultMap.EMAIL,"@")[1] }')
									.show();
							$('select#p_email_3 option[value="1"]').attr(
									'selected', 'selected');
						}
<%-- 수정 --%>
	$('a#formSubmit')
								.on(
										'click',
										function(e) {
											e.preventDefault();
											document.f.password.value = $(
													'form#f input#p_password')
													.val();
											document.f.confirmPassword.value = $(
													'form#f input#p_confirmPassword')
													.val();
<%-- <form:hidden path="cust_zipcd" />
<form:hidden path="cust_juso1" />
<form:hidden path="cust_juso2" /> --%>
	document.f.submit();
										});
<%-- 취소 --%>
	$('a#formCancel')
								.on(
										'click',
										function(e) {
											e.preventDefault();
											location.href = '/netCounter/memberPage/myPage/myInfo.do';
										});

						$('a#pwchgSubmit')
								.on(
										'click',
										function(e) {
											if (confirm('비밀번호를 변경하시겠습니까?')) {
												var passwdConfirm = document.f2.passwdConfirm.value;
												var newPasswd = document.f2.newPasswd.value;
												var newPasswdConfirm = document.f2.newPasswdConfirm.value;
												var agent_cd = document.f2.agent_cd.value;
												var id = document.f2.id.value;

												if (passwdConfirm == "") {
													alert('현재 비밀번호 확인을 입력 해주세요.');
													return false;
												}
												if (newPasswd == "") {
													alert('새 비밀번호를 입력 해주세요.');
													return false;
												}
												if (newPasswdConfirm == "") {
													alert('새 비밀번호 확인을 입력 해주세요.');
													return false;
												}
												if (newPasswd != newPasswdConfirm) {
													alert("새 비밀번호와 새 비밀번호 확인의 값이 일치하지 않습니다.");
													return false;
												}
												$
														.ajax({
															url : '/netCounter/memberPage/myPage/updateAlterPw.do',
															dataType : "html",
															data : {
																"passwd" : passwdConfirm,
																"newPasswd" : newPasswd,
																"newPasswdConfirm" : newPasswdConfirm,
																"agent_cd" : agent_cd,
																"id" : id
															},
															error : function(e) {
															},
															success : function(
																	e) {
																//console.log(e);
																if (e == "false") {
																	alert("비밀번호 변경에 실패하였습니다.");
																} else if (e == "true") {
																	alert("비밀번호 변경에 성공하였습니다.");
																	document.f2.passwdConfirm.value = "";
																	document.f2.newPasswd.value = "";
																	document.f2.newPasswdConfirm.value = "";
																	$(
																			'#pwchgPopupLayer')
																			.hide();
																} else {
																	alert(e);
																}
															}
														});
											}
										});
					});

	function searchZip() {
		var addr = "/common/searchZip.do?form_name=f&zip1_name=post1&zip2_name=post2&juso_name=comjuso&new_juso_name=new_juso";
		window
				.open(
						addr,
						'우편번호검색',
						'toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=600,height=600 top=10 left=10');
	}

	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}

	//레이어 팝업 부분
	$(document)
			.ready(
					function() {
<%-- 레이어팝업 닫기 --%>
	$('a#closePopup').on('click', function() {
							$('#pwchgPopupLayer').hide();
						});
						$('a#pwchgLayoutOpen').on('click', function() {
							$('#pwchgPopupLayer').show();
						});

						$('a#a161209').on('click', function() {
							$('#infochgPopupLayer').hide();
						});
						$('a#b161209').on('click', function() {
							$('#infochgPopupLayer').show();
						});

						$("#insertManagerInfo")
								.on(
										"click",
										function() {
											var id = $("#id").val();
											var password = $(
													"#session_password").val();
											var userWritePw = $("#userWritePw")
													.val();
											$
													.ajax({
														url : '/netCounter/memberPage/myPage/checkPasswordAjax.do',
														dataType : "text",
														data : {
															"userWritePw" : userWritePw,
															"id" : id,
															"password" : password
														},
														error : function(e) {
															alert("홈페이지 오류 입니다. 홈페이지 대표전화 02-3483-3700 문의 부탁드립니다.");
														},
														success : function(e) {
															if (e == 'Y') {
																var phone_no1 = $(
																		"#cell1")
																		.val()
																		+ $(
																				"#cell2")
																				.val()
																		+ $(
																				"#cell3")
																				.val();
																$("#phone_no1")
																		.val(
																				phone_no1);
																$(
																		"#f_insertManagerInfo")
																		.submit();

															} else {
																alert("비밀번호를 다시 확인해주세요.");
															}

														}
													});
										});
						var dPNo = "";
						$("a[name=deleteButton]").on("click", function() {
							$("#infodelPopupLayer").show();
							dPNo = $(this).attr("dPNo");

							//$("#delete_pn_no").val(dPNo);
							//$("#f_deleteManager").submit();
						});

						$("#infodelPopupLayerClose").on("click", function() {
							$("#infodelPopupLayer").hide();
						});

						$("#deleteManagerComplete")
								.on(
										"click",
										function() {
											var id = $("#id").val();
											var password = $(
													"#session_password").val();
											var delUserWritePw = $(
													"#delUserWritePw").val();
											$
													.ajax({
														url : '/netCounter/memberPage/myPage/checkPasswordAjax.do',
														dataType : "text",
														data : {
															"userWritePw" : delUserWritePw,
															"id" : id,
															"password" : password
														},
														error : function(e) {
															alert("홈페이지 오류 입니다. 홈페이지 대표전화 02-3483-3700 문의 부탁드립니다.");
														},
														success : function(e) {
															if (e == 'Y') {
																if (confirm("비밀번호가 확인되었습니다. 삭제하시겠습니까?")) {
																	$(
																			"#delete_pn_no")
																			.val(
																					dPNo);
																	$(
																			"#f_deleteManager")
																			.submit();
																}

															} else {
																alert("비밀번호를 다시 확인해주세요.");
															}

														}
													});
										});
						
						$("#EmailChangeLayoutOpen").on("click",function(){
							$("#EmailChangePopupLayer").show();
						});
						$("#EmailChangePopupLayerClose").on("click",function(){
							$("#EmailChangePopupLayer").hide();
						});
						$("#goChangeEmail").on("click",function(){
							var userWriterEmail = $("#userWriterEmail").val();
							if(userWriterEmail==""){
								alert("변경할 이메일을 입력해 주세요.");
								return false;
							}else if(userWriterEmail!=""){

								var re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
								if(userWriterEmail.length<6 || !re.test(userWriterEmail)){
									alert("잘못된 이메일 형식입니다.");
									return false;
								}	
							}
							if(confirm("이메일을 변경 하시겠습니까?")){
								$("#user_writer_email").val(userWriterEmail);
								$("#email_Change").submit();
							}
						});
					});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var param = '${param.code}';
		if (param == 'update.success') {
			alert('회원정보 수정이 완료되었습니다.');
		}
		param = '${code}';
		if (param == 'update.fail') {
			alert('회원정보 수정이 실패하였습니다. 정보를 확인해주세요');
		}
	});
</script>
<style type="text/css">
.formError {
	display: block;
	margin: 10px 0px;
	color: #F00;
	font-weight: bolder; /* background-color: #FF7; */
	padding: 5px;
}
</style>
<style type="text/css">
#pwchgPopupLayer {
	background: url("/images/truck/com/overlay.png") repeat 0% 0%;
	position: fixed;
	left: 0px;
	top: 0px;
	text-align: center;
	z-index: 90000;
	width: 100%;
	height: 100%;
}

#EmailChangePopupLayer {
	background: url("/images/truck/com/overlay.png") repeat 0% 0%;
	position: fixed;
	left: 0px;
	top: 0px;
	text-align: center;
	z-index: 90000;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<form id="f_deleteManager" method="post"
		action="/netCounter/memberPage/myPage/deleteManager.do">
		<input type="hidden" name="agentNo" value="${loginVO.agentNo }" /> <input
			type="hidden" name="saupjangSeq" value="${loginVO.saupjangSeq }" />
		<input type="hidden" id="delete_pn_no" name="pn_no" />
	</form>
	<div class="skipMenu" title="스킵메뉴">
		<a href="#Gnb">대메뉴 바로가기</a> <a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s -->
		<c:import url="/common/include/subHeader.do"></c:import>
		<!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
						<h2>
							<img src="/images/truck/net/member_tit.gif" alt="회원정보관리" />
						</h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do">인터넷창구</a> <span>회원정보관리</span>
					</div>
				</div>
				<!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit">
						<img src="/images/truck/net/member_con_tit.gif"
							alt="아래 내용을 확인 하신 후, 정확히 입력해 주시기 바랍니다" />
					</p>
					<div class="conSection">
						<p class="mebInfo">
							<span class="user">${resultMap.AGENT_NM } 님</span>의 회원정보입니다&#46;
						</p>
						<!-- 회원정보변경 s -->
						<div class="tbWork1">
							<form:form id="f" name="f" commandName="joinVO"
								action="/netCounter/memberPage/myPage/updateAlterInfo.do">
								<fieldset>
									<legend>회원정보변경</legend>
									<form:hidden path="agent_cd" value="${loginVO.agentCd}" />
									<form:hidden path="jumin1" />
									<form:hidden path="jumin2" />
									<form:hidden path="sName" />
									<form:hidden path="password" />
									<form:hidden path="confirmPassword" />
									<!-- 회원정보입력 s -->
									<!-- 20161202 삭제 <div class="tbWork1"> -->
									<table class="tbWork_st03 mB10" summary="회원정보입력 테이블 입니다.">
										<!-- 20161202 수정 -->
										<caption>회원정보입력에 대해서 나타낸 표</caption>
										<colgroup>
											<col width="30%" />
											<col width="70%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">ID</th>
												<td>${resultMap2.ID}</td>
											</tr>
											<tr>
												<th scope="row">대표자명</th>
												<td>${resultMap2.NAME }</td>
												<form:hidden path="name" value="${resultMap2.NAME }" />
											</tr>
											<tr>
												<th scope="row">비밀번호 변경</th>
												<td><span class="btn_pack btn_type01 icon"
													style="padding: 0px 0px 0px 0px;"><a
														id="pwchgLayoutOpen" href="#;">비밀번호 변경</a></span></td>
											</tr>
											<tr>
												<th scope="row">사업자등록번호</th>
												<td>${fn:substring(resultMap2.SAUPNUM, 0,
													3)}-${fn:substring(resultMap2.SAUPNUM, 3,
													5)}-${fn:substring(resultMap2.SAUPNUM, 5, 10) }</td>
												<form:hidden path="saupnum" value="${resultMap2.SAUPNUM }" />
											</tr>
											<tr>
												<th scope="row">회사명</th>
												<td>${resultMap2.COMNAME }</td>
												<form:hidden path="comname" value="${resultMap2.COMNAME }" />
											</tr>
											<tr>
												<th scope="row">가입지부</th>
												<td><c:choose>
														<c:when test="${resultMap.GYEYAK_JIBU_NM eq'본 부' }">
														${resultMap.GYEYAK_JIBU_NM}
													</c:when>
														<c:otherwise>
														${resultMap.GYEYAK_JIBU_NM} 지 부													
													</c:otherwise>
													</c:choose></td>
												<form:hidden path="gyeyak_jibu"
													value="${resultMap.GYEYAK_JIBU_NM }" />
											</tr>
											<tr>
												<th scope="row">주소</th>
												<td><c:if test="${resultMap2.POST1!=null }">
													${resultMap2.POST1}
													</c:if> <c:if test="${resultMap2.COMJUSO!=null }">
														&nbsp;&nbsp;&nbsp;${resultMap2.COMJUSO} ${resultMap2.NEW_JUSO}
													</c:if> <!-- //20161202 수정 --></td>
											</tr>
											<tr>
												<th scope="row">전화번호</th>
												<td><c:if test="${resultMap2.CELL1!=null }">
														${resultMap2.CELL1} - ${resultMap2.CELL2} - ${resultMap2.CELL3}
													</c:if> <!-- //20161202 수정 --></td>
											</tr>
											<tr>
												<th scope="row">핸드폰</th>
												<td><c:if test="${resultMap2.PHONE1!=null }">
														${resultMap2.PHONE1} - ${resultMap2.PHONE2} - ${resultMap2.PHONE3}
													</c:if> <!-- //20161202 수정 --></td>
											</tr>
											<tr>
												<th scope="row">이메일</th>
												<td style="line-height:2.5"><c:if test="${resultMap2.MAIL != null }">
														${resultMap2.MAIL}</c:if>&nbsp;&nbsp;&nbsp; <span class="btn_pack btn_type01 icon"
													style="padding: 0px 0px 0px 0px;"><a
														id="EmailChangeLayoutOpen" href="#;">이메일 변경</a></span>
													 <!-- //20161202 수정 --></td>
											</tr>
										</tbody>
									</table>
									<!-- 20161202 추가 -->
									<span class="desC mB25">정보수정은 가입지부 계약담당자를 통해 할 수 있습니다.</span>
									<!-- //20161202 추가 -->

									<!-- 20161202 추가 -->
									<div class="memBox">
										<span class="btn_pack btn_type18 icon" style="float:right;"><a id='b161209'	href="#;">담당자 추가<span class="plus"></span></a></span>
										<h3 class="netsubTit mB10">
											<span class="blueBul">담당자 정보</span>
										</h3>
										<ul class="mB15">
											<li class="desC">담당자는 최대 6명까지 등록이 가능하며, 등록하면 분담금<br/>납부와 관련된 문자(SMS)알림을 받을 수 있습니다.</li>
										
										</ul>
										<div class="memList">
											<c:set var="stopLoop" value="false" />
											<c:forEach items="${mList }" var="m" varStatus="count">
												<c:if test="${not stopLoop }">
													<c:if test="${count.count==1||count.count==4}">
														<ul>
													</c:if>
													<li>
														<div class="inner">
															<div><span>구분</span><c:choose><c:when test="${m.cmt1 !=null }">${m.cmt1}</c:when><c:otherwise>담당자</c:otherwise></c:choose></div>
															<div>
																<span>이름</span>${m.pn_nm }
															</div>
															<div>
																<span>핸드폰</span>${m.phone_no1 }
															</div>
															<span class="btn_pack btn_type18"><a href="#;"
																dPNo="${m.pn_no }" name="deleteButton">삭제</a></span>
														</div>
													</li>
													<c:if
														test="${count.count/3==1 ||count.count==fn:length(mList)}">
														</ul>
													</c:if>
													<c:if test="${count.count==6 }">
														<c:set var="stopLoop" value="true" />
													</c:if>
												</c:if>
											</c:forEach>
										</div>
									</div>
									<!-- //20161202 추가 -->

									<!-- 20161202 추가 -->
									<!-- <h3 class="netsubTit"><span class="blueBul">비밀번호 확인</span></h3> -->
									<!-- //20161202 추가 -->

								</fieldset>
							</form:form>
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<!-- 20161202 추가 -->
								<div class="btnL">
									<span class="btn_pack btn_type0S"><a href="#"
										id="withdrawalMem">회원탈퇴</a></span>
								</div>
								<!-- //20161202 추가 -->
								<!-- <span class="btn_pack btn_type01 icon"><span class="check"></span><a id="formSubmit" href="#;">확인</a></span>
								<span class="btn_pack btn_type10 icon"><span class="check"></span><a id="formCancel" href="#;">취소</a></span> -->
							</div>
						</div>
						<!--// 회원정보변경 e -->
					</div>
				</div>
				<!--// conaArea e -->
			</div>
			<!--// contents e -->
			<!-- quick s -->
			<c:import url="/common/include/quickMenu.do"></c:import>
			<!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s -->
		<c:import url="/common/include/footer.do"></c:import>
		<!--// footer e -->

		<!-- 비밀번호변경부분(레이어팝업) -->
		<div id="pwchgPopupLayer" style="display: none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose">
						<a id="closePopup" href="#;"><img src="/images/truck/com/close.gif" alt="팝업창닫기"/></a>
					</p>
					<p class="layerTit">비밀번호 변경</p>
					<p class="layerTxt">
						변경할 비밀번호를 입력해 주세요.&#46;<br />
					</p>
					<div class="layerA">
						<form id="f2" name="f2" method="post"
							action="/join/input/regist.do">
							<input type="hidden" id="agent_cd" name="agent_cd"
								value="${loginVO.agentCd}" /> <input type="hidden" id="id"
								name="id" value="${loginVO.id }" />
							<table class="tbIn_st01" style="">
								<caption>비밀번호 변경</caption>
								<colgroup>
									<col style="width: 30%;" />
									<col style="width: 70%;" />
								</colgroup>
								<tbody>
									<tr style="height: 40px;">
										<th>현재 비밀번호 확인</th>
										<td><input name="passwdConfirm" class="txt"
											id="passwdConfirm" type="password" value=""
											style="width: 90%;" /></td>
									</tr>
									<tr id="cert_saup" style="height: 40px;">
										<th>새 비밀번호</th>
										<td><input name="newPasswd" class="txt" id="newPasswd"
											type="password" value="" style="width: 90%;" /></td>
									</tr>
									<tr id="jibuSelect" style="height: 40px;">
										<th>새 비밀번호 확인</th>
										<td><input name="newPasswdConfirm" class="txt"
											id="newPasswdConfirm" type="password" value=""
											style="width: 90%;" /></td>
									</tr>
								</tbody>
							</table>
							<div class="btnboxC clfix">
								<span class="btn_pack btn_type16"><a id="pwchgSubmit"
									href="#;">확인</a></span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 비밀번호변경부분(레이어팝업) 종료 -->

		<!-- 회원정보변경(레이어팝업) :: 20161202 추가 -->
		<div id="infochgPopupLayer" style="display: none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose">
						<a id="a161209" href="#;"><img
							src="/images/truck/com/close.gif" alt="팝업창닫기" /></a>
					</p>
					<p class="layerTit">담당자 정보 추가</p>
					<p class="layerTxt">
						추가 하고자 하는 담당자 정보를 입력해주세요&#46;<br />
					</p>
					<div class="layerA">
						<form id="f_insertManagerInfo" method="post" action="/netCounter/memberPage/myPage/insertManagerInfo.do">
							<table class="tbIn_st01">
								<caption>담당자 정보 입력</caption>
								<colgroup>
									<col style="width: 30%;" />
									<col style="width: 70%;" />
								</colgroup>
								<tbody>
									<tr>
										<th>구분</th>
										<td><input name="cmt1" id="cmt1" type="text" value=""
											style="width: 90%;" /></td>
									</tr>
									<tr>
										<th>이름</th>
										<td><input name="pn_nm" id="pn_nm" type="text" value=""
											style="width: 90%;" /></td>
									</tr>
									<tr class="last">
										<th>핸드폰</th>
										<td><select id="cell1" name="cell1" title="핸드폰 통신사 선택"
											style="width: 75px">
												<option value="010" seleted="seleted">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>

										</select> <span>-</span> <label class="hide" for="cell2">핸드폰
												중간자리</label> <input id="cell2" name="cell2" title="전화번호 중간자리"
											style="width: 63px;" value="" class="txt" type="text"
											size="4" maxlength="4" /> <span>-</span> <label class="hide"
											for="cell3">핸드폰 끝자리</label> <input id="cell3" name="cell3"
											title="전화번호 중간자리" style="width: 63px;" value="" class="txt"
											type="text" size="4" maxlength="4" /></td>
									</tr>
									<!-- 20161208 추가 -->
									<tr class="last">
										<th>비밀번호 확인</th>
										<td><input name="userWritePw" id="userWritePw"
											type="password" value="" style="width: 90%;" /></td>
									</tr>
									<!-- //20161208 추가 -->
								</tbody>
							</table>

							<input type="hidden" name="id" value="${loginVO.id }" /> <input
								type="hidden" name="gyeyakJibuCd"
								value="${loginVO.gyeyakJibuCd }" /> <input type="hidden"
								name="agentNo" value="${loginVO.agentNo }" /> <input
								type="hidden" name="saupjangSeq" value="${loginVO.saupjangSeq }" />
							<input type="hidden" id="phone_no1" name="phone_no1" value="" />
							<input type="hidden" id="session_password"
								name="session_password" value="${loginVO.password }" />
						</form>
						<div class="btnboxC clfix">
							<span class="btn_pack btn_type16"><a id="insertManagerInfo" href="#;">확인</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 회원정보변경(레이어팝업) 종료  :: 20161202 추가 -->

		<!-- 담당자 정보 삭제(레이어팝업) :: 20161208 추가 -->
		<div id="infodelPopupLayer" style="display: none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose">
						<a href="#;" id="infodelPopupLayerClose"><img
							src="/images/truck/com/close.gif" alt="팝업창닫기" /></a>
					</p>
					<p class="layerTit">담당자 정보 삭제</p>
					<p class="layerTxt">
						담당자 정보 삭제를 위해 비밀번호를 입력해주세요&#46;<br />
					</p>
					<div class="layerA">
						<table class="tbIn_st01">
							<caption>담당자 정보 삭제</caption>
							<colgroup>
								<col style="width: 30%;" />
								<col style="width: 70%;" />
							</colgroup>
							<tbody>
								<tr class="last">
									<th>비밀번호 확인</th>
									<td><input id="delUserWritePw" type="password" value=""
										style="width: 90%;" /></td>
								</tr>
							</tbody>
						</table>
						<div class="btnboxC clfix">
							<span class="btn_pack btn_type16"><a
								id="deleteManagerComplete" href="#;">확인</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 담당자 정보 삭제(레이어팝업) 종료  :: 20161208 추가 -->
		
		
		<!-- 이메일 변경(레이어팝업) :: 20170123 추가 -->
		<div id="EmailChangePopupLayer" style="display: none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose">
						<a href="#;" id="EmailChangePopupLayerClose"><img src="/images/truck/com/close.gif" alt="팝업창닫기" /></a>
					</p>
					<p class="layerTit">이메일 변경</p>
					<p class="layerTxt">
						변경할 이메일을 입력해주세요&#46;<br />
					</p>
					<div class="layerA">
						<table class="tbIn_st01">
							<caption>이메일 변경</caption>
							<colgroup>
								<col style="width: 30%;" />
								<col style="width: 70%;" />
							</colgroup>
							<tbody>
								<tr class="last">
									<th>이메일</th>
									<td><input id="userWriterEmail" type="text" value=""
										style="width: 90%;" /></td>
								</tr>
							</tbody>
						</table>
						<div class="btnboxC clfix">
							<span class="btn_pack btn_type16"><a id="goChangeEmail" href="#;">확인</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form id="email_Change" method="post" action="/netCounter/memberPage/myPage/emailChange.do">
			<input type="hidden" name="id" value="${loginVO.id }"/>
			<input type="hidden" id ="user_writer_email" name="mail" value=""/>
		</form>
		<!-- 이메일 변경(레이어팝업) 종료  :: 20170123 추가 -->

	</div>
	<!-- //wrap e -->

</body>
</html>



