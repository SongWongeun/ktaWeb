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
	
	$("#withdrawalMem").on('click', function(){
		location.href="/netCounter/memberPage/myPage/withdrawPage.do";
	});
	
	<%-- 이메일 select 구현 --%>
	$('form#f select#p_email_3').on('change',function(){
		var selected_p_email_3 = $(this).find('option:selected').val();
		
		$('form#f input#p_email_2').val('');//초기화
		if( selected_p_email_3 == '0'){
			
		}else if( selected_p_email_3 == '1' ){
			$('form#f input#p_email_2').show();
		}else{
			$('form#f input#p_email_2').hide();
			$('form#f input#p_email_2').val( selected_p_email_3 );	
		}
		
		
	});
	
	<%-- 전화번호 select 자동 매핑 --%>
	$('select#p_tel_local_no option[value="${resultMap.TEL_LOCAL_NO }"]').attr('selected','selected');
	
	<%-- 팩스번호 select 자동 매핑 --%>
	$('select#p_fax_local_no option[value="${resultMap.FAX_LOCAL_NO }"]').attr('selected','selected');
	
	<%-- 휴대폰 번호 select 자동 매핑 --%>
	$('select#p_mobile_com_no option[value="${resultMap.MOBILE_COM_NO }"]').attr('selected','selected');
	
	<%-- 이메일 select 자동 매핑 --%>
	if( $('select#p_email_3 option[value="${fn:split(resultMap.EMAIL,"@")[1] }"]').size() ){
		$('select#p_email_3 option[value="${fn:split(resultMap.EMAIL,"@")[1] }"]').attr('selected','selected');
	}else if( '${fn:split(resultMap.EMAIL,"@")[1] }' == ''){
		$('select#p_email_3 option[value="0"]').attr('selected','selected');
	}else{
		$('form#f input#p_email_2')
			.val('${fn:split(resultMap.EMAIL,"@")[1] }')
			.show();
		$('select#p_email_3 option[value="1"]').attr('selected','selected');
	}
	
	
	<%-- 수정 --%>
	$('a#formSubmit').on('click',function(e){
		e.preventDefault();
		document.f.password.value = $('form#f input#p_password').val();
		document.f.confirmPassword.value = 	$('form#f input#p_confirmPassword').val();	
<%-- <form:hidden path="cust_zipcd" />
<form:hidden path="cust_juso1" />
<form:hidden path="cust_juso2" /> --%>
		document.f.submit();
	});
	<%-- 취소 --%>
	$('a#formCancel').on('click',function(e){
		e.preventDefault();
		location.href = '/netCounter/memberPage/myPage/myInfo.do';
	});
	
	$('a#pwchgSubmit').on('click',function(e){
		if(confirm('비밀번호를 변경하시겠습니까?')){
			var passwdConfirm = document.f2.passwdConfirm.value;
			var newPasswd = document.f2.newPasswd.value;
			var newPasswdConfirm = document.f2.newPasswdConfirm.value;
			var agent_cd = document.f2.agent_cd.value;
			var id = document.f2.id.value;
			
			if(passwdConfirm==""){
				alert('현재 비밀번호 확인을 입력 해주세요.');
				return false;
			}
			if(newPasswd==""){
				alert('새 비밀번호를 입력 해주세요.');
				return false;
			}
			if(newPasswdConfirm==""){
				alert('새 비밀번호 확인을 입력 해주세요.');
				return false;
			}
			if(newPasswd!=newPasswdConfirm){
				alert("새 비밀번호와 새 비밀번호 확인의 값이 일치하지 않습니다.");
				return false;
			}
			$.ajax({
				url: '/netCounter/memberPage/myPage/updateAlterPw.do',
				dataType: "html",
				data : {
					"passwd": passwdConfirm
	    	       , "newPasswd" : newPasswd
	               , "newPasswdConfirm" : newPasswdConfirm
	               , "agent_cd" : agent_cd
	               , "id" : id
				},
				error: function( e) {
				},
				success : function( e ){
					//console.log(e);
					if(e=="false"){
						alert("비밀번호 변경에 실패하였습니다.");
					}else if(e=="true"){
						alert("비밀번호 변경에 성공하였습니다.");
						document.f2.passwdConfirm.value = "";
						document.f2.newPasswd.value = "";
						document.f2.newPasswdConfirm.value = "";
						$('#pwchgPopupLayer').hide();
					}else{
						alert(e);
					}
				}
			});
		}
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

function searchZip(){
	var addr = "/common/searchZip.do?form_name=f&zip1_name=post1&zip2_name=post2&juso_name=comjuso&new_juso_name=new_juso";
	window.open(addr,'우편번호검색','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=600,height=600 top=10 left=10');
}


//레이어 팝업 부분
$(document).ready(function(){
	<%-- 레이어팝업 닫기 --%>
	$('a#closePopup').on('click',function(){
		$('#pwchgPopupLayer').hide();
	});
	$('a#pwchgLayoutOpen').on('click',function(){
		$('#pwchgPopupLayer').show();
	});
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
	if(param == 'update.success'){
	alert('회원정보 수정이 완료되었습니다.');
	}
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
	if(param == 'update.success'){
		alert('회원정보 수정이 완료되었습니다.');
	}
	param ='${code}';
	if(param == 'update.fail'){
		alert('회원정보 수정이 실패하였습니다. 정보를 확인해주세요');
	}	
});
</script>
<style type="text/css">
.formError{display: block;margin: 10px 0px;color: #F00;font-weight: bolder;/* background-color: #FF7; */padding: 5px;}
</style>
<style type="text/css">
	#pwchgPopupLayer{
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
 						<h2><img src="/images/truck/net/member_tit.gif" alt="회원정보관리" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<span>회원정보관리</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/member_con_tit.gif" alt="아래 내용을 확인 하신 후, 정확히 입력해 주시기 바랍니다" /></p>
					<div class="conSection">
						<p class="mebInfo"><span class="user">${loginVO.carmgrNm } 님</span>의 회원정보입니다&#46;</p>
						<!-- 회원정보변경 s -->
						<div class="tbWork1">
							<form:form id="f" name="f" commandName="joinVO" action="/netCounter/memberPage/myPage/updateAlterInfo.do">
							<fieldset>
							<legend>회원정보변경</legend>
							<form:hidden path="agent_cd" value="${loginVO.agentCd}"/>
							<form:hidden path="jumin1" />
							<form:hidden path="jumin2" />
							<form:hidden path="sName" />
							<form:hidden path="password" />
							<form:hidden path="confirmPassword" />
								<!-- 회원정보입력 s -->
										<div class="tbWork1">
										<table class="tbWork_st03 mB10" summary="회원정보입력 테이블 입니다.">
											<caption>회원정보입력에 대해서 나타낸 표</caption>
											<colgroup>
												<col width="30%" />
												<col width="70%" />
											</colgroup>
											<tbody>
												<!-- 20161208 추가 -->
												<tr>
													<th scope="row">ID</th>
													<td>${resultMap2.ID }</td>
												</tr>
												<!-- //20161208 추가 -->
												<tr>
													<th scope="row">성명</th>
													<td>${resultMap2.NAME }</td>
														<form:hidden path="name" value ="${resultMap2.NAME }"/>
												</tr>
												<tr>
													<th scope="row">비밀번호 변경</th>
													<td>
														<span class="btn_pack btn_type01 icon" style="padding: 0px 0px 0px 0px;"><a id="pwchgLayoutOpen" href="#;">비밀번호 변경</a></span>
													</td>
												</tr>
												<%--<tr>
													<th scope="row">주민등록번호</th>
													<td><label class="hide" for="">주민등록번호</label><input name="" class="txt" id="" type="text" style="width:250px" value=""/></td>
												</tr>
												<tr>
													<th scope="row">ID</th>
													<td><label class="hide" for="">ID</label><input name="" class="txt" id="" type="text" style="width:250px" value=""/></td>
												</tr>
												<tr>
													<th scope="row">비밀번호</th>
													<td>
														<label class="hide" for="p_password">비밀번호</label>
														<input name="p_password" class="txt" id="p_password" type="password" style="width:250px" value=""/>
														<span class="desc02">6&#126;8자 영문자&#47;숫자 혼용가능</span>
													</td>
												</tr>
												<tr>
													<th scope="row">비밀번호 확인</th>
													<td>
														<label class="hide" for="p_confirmPassword">비밀번호 확인</label>
														<input name="p_confirmPassword" class="txt" id="p_confirmPassword" type="password" style="width:250px" value=""/>
														<span class="desc02">비밀번호를 확인 하기 위해 입력하신 비밀번호를 다시 입력하세요</span>
													</td>
												</tr>--%>
												<tr>
													<th scope="row">사업자등록번호</th>
													<td>${fn:substring(resultMap2.SAUPNUM, 0, 3)}-${fn:substring(resultMap2.SAUPNUM, 3, 5)}-${fn:substring(resultMap2.SAUPNUM, 5, 10) }</td>
													<form:hidden path="saupnum" value="${resultMap2.SAUPNUM }" />
												</tr>
												<%-- <tr>
													<th scope="row">가입지부</th>
													<td>${resultMap.GYEYAK_JIBU_NM }</td>
													<form:hidden path="gyeyak_jibu" value="${resultMap.GYEYAK_JIBU_NM }" />
												</tr> --%>
												<tr>
													<th scope="row">주소</th>
													<td>
														<%-- <p class="mB3">
															<label class="hide" for="post1">우편번호앞자리</label>
															<form:input path="post1" class="txt" style="width:100px;"  readonly="readonly" value="${resultMap2.POST1}" />
															<span>&#45;</span>
															<label class="hide" for="post2">우편번호뒷자리</label>
															<form:input path="post2" class="txt" style="width:100px;" readonly="readonly" value="${resultMap2.POST2}"  />
															<a id="zipPopup" href="#;" onclick="searchZip();" class="btn_pack btn_type15"><span>우편번호</span></a>
														</p>
														<p class="mB3">
															<label class="hide" for="comjuso">주소</label>
															<form:input path="comjuso" class="txt" style="width:500px;"  value="${resultMap2.COMJUSO}" />
														</p>
														<p>
															<label class="hide" for="new_juso">상세주소</label>
															<form:input path="new_juso" class="txt" style="width:500px;"  value="${resultMap2.NEW_JUSO}" />
															<form:errors cssClass="formError" path="post1" />
														</p> --%>
														<c:if test="${resultMap2.POST1!=null }">
														${resultMap2.POST1}<!-- - -->${resultMap2.POST2}
														</c:if>
														<c:if test="${resultMap2.COMJUSO!=null }">
														<br />${resultMap2.COMJUSO} ${resultMap2.NEW_JUSO}
														</c:if>
													</td>
												</tr>
												<tr>
													<th scope="row">전화번호</th>
													<td>
														<%-- <form:select path="phone1" title="지역번호 선택" style="width:95px">
															<form:option value="0">선택</form:option>
															<c:forEach items="${telList }" var="t"><form:option value="${t.CODE }">${t.CODE }</form:option></c:forEach>
														</form:select>
														<span>&#45;</span>
														<label class="hide" for="phone2">전화번호 중간자리</label>
														<form:input path="phone2" maxlength="4" size="4" class="txt" style="width:95px;" title="전화번호 중간자리" value="${resultMap2.PHONE2}" />
														<span>&#45;</span>
														<label class="hide" for="phone3">전화번호 끝자리</label>
														<form:input path="phone3" maxlength="4" size="4" class="txt" style="width:95px;" title="전화번호 중간자리" value="${resultMap2.PHONE3}" />
														<form:errors cssClass="formError" path="phone1" /> --%>
														<c:if test="${resultMap2.CELL1!=null }">
														${resultMap2.CELL1} - ${resultMap2.CELL2} - ${resultMap2.CELL3}
														</c:if>
													</td>
												</tr>
												<tr>
													<th scope="row">핸드폰</th>
													<td>
															<%-- <form:select path="cell1" title="핸드폰 통신사 선택" style="width:95px">
																<form:option value="0">선택</form:option>
																<c:forEach items="${cellList }" var="t"><form:option value="${t.CODE }">${t.CODE }</form:option></c:forEach>
															</form:select>
															<span>&#45;</span>
															<label class="hide" for="cell2">핸드폰 중간자리</label>
															<form:input path="cell2" maxlength="4" size="4" class="txt" style="width:95px;" title="전화번호 중간자리"  value="${resultMap2.CELL2}" />
															<span>&#45;</span>
															<label class="hide" for="cell3">핸드폰 끝자리</label>
															<form:input path="cell3" maxlength="4" size="4" class="txt" style="width:95px;" title="전화번호 중간자리"  value="${resultMap2.CELL3}" />
															<form:checkbox path="sms_yn" value="Y"  class="check" /><form:errors cssClass="formError" path="sms_yn" />
															<label for="sms_yn">문자메세지 수신여부</label>
															<form:errors cssClass="formError" path="cell1" /> --%>
															<c:if test="${resultMap2.PHONE1!=null }">
															${resultMap2.PHONE1} - ${resultMap2.PHONE2} - ${resultMap2.PHONE3}
															</c:if>
													</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td style="line-height:2.5">
														<%-- <label class="hide" for="mail">이메일 주소</label>
														<form:input path="mail" class="txt" style="width:337px;"  title="이메일 아이디"  value="${resultMap2.MAIL}"  />
														<form:checkbox path="mail_yn" value="Y" class="check" />
														<label for="mail_yn">E-mail 수신여부</label>
														<form:errors cssClass="formError" path="mail" /> --%>
														<c:if test="${resultMap2.MAIL != null }">
														${resultMap2.MAIL}</c:if>&nbsp;&nbsp;&nbsp; <span class="btn_pack btn_type01 icon"
													style="padding: 0px 0px 0px 0px;"><a
														id="EmailChangeLayoutOpen" href="#;">이메일 변경</a></span>
														
													</td>
												</tr>
											</tbody>
										</table>
									<c:if test="${loginVO.certType == 'IDPW' }">					
									<%-- <table class="tbWork_st03" summary="회원정보변경 테이블 입니다.">
										<caption>회원정보변경에 대해서 나타낸 표</caption>
										<colgroup>
											<col width="30%" />
											<col width="70%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">아이디</th>
												<td>${loginVO.id }</td>
												<form:hidden path="id" value="${loginVO.id }"/>
											</tr>
											<tr>
												<th scope="row">비밀번호 확인</th>
												<td>
													<label class="hide" for="p_password">비밀번호</label>
													<input name="p_password" class="txt" id="p_password" type="password" style="width:150px" value=""/>
													<span class="desc02">회원 정보를 변경 하기 위해 사용중인 비밀번호를 입력하세요</span>
													<form:errors cssClass="formError" path="password" />
												</td>
											</tr>
											<!-- 
											<tr>
												<th scope="row">비밀번호 확인</th>
												<td>
													<label class="hide" for="p_confirmPassword">비밀번호 확인</label>
													<input name="p_confirmPassword" class="txt" id="p_confirmPassword" type="password" style="width:150px" value=""/>
													<span class="desc02">비밀번호를 확인 하기 위해 입력하신 비밀번호를 다시 입력하세요</span>
													<form:errors cssClass="formError" path="confirmPassword" />
												</td>
											</tr>
											 -->
										</tbody>
									</table> --%>
							</c:if>
							</fieldset>
							</form:form>
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<!-- 20161202 추가 -->
								<div class="btnL">
									<span class="btn_pack btn_type0S"><a href="#" id="withdrawalMem">회원탈퇴</a></span>
								</div>
								<!-- //20161202 추가 -->
								<!-- <span class="btn_pack btn_type01 icon"><span class="check"></span><a id="formSubmit" href="#;">확인</a></span>
								<span class="btn_pack btn_type10 icon"><span class="check"></span><a id="formCancel" href="#;">취소</a></span> -->
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
		
		<!-- 비밀번호변경부분(레이어팝업) -->
		<div id="pwchgPopupLayer" style="display:none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"><a id="closePopup" href="#;"><img src="/images/truck/com/close.gif" alt="팝업창닫기"></a></p>
					<p class="layerTit">비밀번호 변경</p>
					<p class="layerTxt">
						변경할 비밀번호를 입력해 주세요.&#46;<br/> 
					</p>
					<div class="layerA">
						<form id="f2" name="f2" method="post" action="/join/input/regist.do">
						<input type="hidden" id="agent_cd" name="agent_cd" value="${loginVO.agentCd}"/>
						<input type="hidden" id="id" name="id" value="${loginVO.id }"/>
							<table class="tbIn_st01" style="">
								<caption>비밀번호 변경</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:70%;" />
								</colgroup>
								<tbody>
									<tr style="height: 40px;">
										<th>
											현재 비밀번호 확인
										</th>
										<td>
											<input name="passwdConfirm" class="txt" id="passwdConfirm" type="password" value="" style="width:90%;"/>
										</td>
									</tr>
									<tr id="cert_saup" style="height: 40px;">
										<th>
											새 비밀번호
										</th>
										<td>
											<input name="newPasswd" class="txt" id="newPasswd" type="password" value="" style="width:90%;"/>
										</td>
									</tr>
									<tr id="jibuSelect" style="height: 40px;">
										<th>
											새 비밀번호 확인
										</th>
										<td>
											<input name="newPasswdConfirm" class="txt" id="newPasswdConfirm" type="password" value="" style="width:90%;"/>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btnboxC clfix">
								<span class="btn_pack btn_type16"><a id="pwchgSubmit" href="#;">확인</a></span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 비밀번호변경부분(레이어팝업) 종료 -->
		
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



