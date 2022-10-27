<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javascript">
$(document).ready(function(){
	
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
		location.href = '/m/netCounter/index.do';
	});
});

function searchZip(){
	var addr = "/m/common/searchZip.do?form_name=f&zip1_name=post1&zip2_name=post2&juso_name=comjuso&new_juso_name=new_juso";
	window.open(addr,'우편번호검색','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=600,height=600 top=10 left=10');
}

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
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path08">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/netCounter/index.do">인터넷창구</a></li>
			<li><a href="/m/netCounter/userInfo/view.do">회원정보관리</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i08"><img alt="회원정보관리" src="/images/m_truck/subtop/08top_6.png" /></li>
				<li class="txt01">아래 내용을 확인 하신 후, 정확히 입력해 주시기 바랍니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="userTitie">
			<p class="userBox">
				<c:choose>
					<c:when test="${loginVO.agentCd == '1'}">
						<span class="color">${resultMap2.COMNAME }</span>님의 회원정보입니다.</p>
					</c:when>
					<c:when test="${loginVO.agentCd == '2'}">
						<span class="color">${loginVO.carmgrNm }</span>님의 회원정보입니다.</p>
					</c:when>
					<c:when test="${loginVO.agentCd == '3'}">
						<span class="color">${loginVO.companyNm }</span>님의 회원정보입니다.</p>
					</c:when>
				</c:choose>
		</article>
		<article class="basicCont02 ">
		<form:form id="f" name="f" commandName="joinVO" action="/m/netCounter/userInfo/actUpdate.do">
		<form:hidden path="agent_cd" value="${loginVO.agentCd}"/>
		<form:hidden path="id" value="${loginVO.id}"/>
		<form:hidden path="jumin1" />
		<form:hidden path="jumin2" />
		<form:hidden path="sName" />
		<form:hidden path="password" />
		<form:hidden path="confirmPassword" />
			<table class="tbSt05 mb0" summary="회원정보관리">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tbody>
					<c:if test="${loginVO.agentCd == '1' || loginVO.agentCd == '3'}">
						<tr>
							<th scope="row">상호</th>
							<td>${resultMap2.COMNAME }</td>
							<form:hidden path="comname" value="${resultMap2.COMNAME }" />
						</tr>					
					</c:if>
					<tr>
						<th scope="row">대표자</th>
						<td>${resultMap2.NAME }</td>
						<form:hidden path="name" value ="${resultMap2.NAME }"/>
					</tr>
					<tr>
						<th scope="row">비밀번호변경</th>
						<td>
							<span class="cellBt"><span class="cellpg"><a href="/m/netCounter/userInfo/viewPw.do" id="pwChange" class="btnGray_s ww">비밀번호변경</a></span></span>
						</td>
					</tr>
					<tr>
						<th scope="row">사업자번호</th>
						<td>${fn:substring(resultMap2.SAUPNUM, 0, 3)}-${fn:substring(resultMap2.SAUPNUM, 3, 5)}-${fn:substring(resultMap2.SAUPNUM, 5, 10) }</td>
						<form:hidden path="saupnum" value="${resultMap2.SAUPNUM }" />
					</tr>
					<c:if test="${loginVO.agentCd == '1'}">
						<tr>
							<th scope="row">가입지부</th>
							<td>${resultMap.GYEYAK_JIBU_NM }</td>
							<form:hidden path="gyeyak_jibu" value="${resultMap.GYEYAK_JIBU_NM }" />
						</tr>					
					</c:if>
					<tr>
						<th scope="row">주소</th>
						<td>
							<div class="cellFirst">
								<span class="cellw1"><form:input path="post1"  id="home_zip_1" class="input" title="우편번호 앞자리" style="width:100%;" value="${resultMap2.POST1}" /></span>
								<span class="cellDesh">-</span>
								<span class="cellw1"><form:input path="post2"  id="home_zip_2" class="input" title="우편번호 뒷자리" style="width:100%;" value="${resultMap2.POST2}" /></span>
								<span class="cellBt"><span class="cellpg"><a href="#;" onclick="searchZip();" id="zipPopup" class="btnGray_s ww">우편번호</a></span></span> 
							</div>
							<div class="cell"><form:input path="comjuso" title="주소" style="width:100%;" class="input" type="text" value="${resultMap2.COMJUSO}"/></div>
							<div class="cell"><form:input path="new_juso" title="나머지주소" style="width:100%;" class="input" type="text" value="${resultMap2.NEW_JUSO}" /></div>
						</td>
					</tr>
					<tr>
						<th scope="row">전화번호</th>
						<td>
							<div class="cellFirst">
								<span class="cellw1">  
									<form:select path="phone1" title="지역번호 선택" class="select" style="width:100%">
										<form:option value="0">선택</form:option>
										<c:forEach items="${telList }" var="t"><form:option value="${t.CODE }">${t.CODE }</form:option></c:forEach>
									</form:select>
								</span>
								<span class="cellw8"><span class="cellpg"><form:input path="phone2"  type="number" class="input" id="" title="전화번호 첫번째 자리" style="width:100%;" value="${resultMap2.PHONE2}" /></span></span>
								<span class="cellDesh">-</span>
								<span class="cellw8"><form:input path="phone3"  class="input" id="" type="number"  title="전화번호 두번째 자리" style="width:100%;" value="${resultMap2.PHONE3}" /></span>
							</div>
							<form:errors cssClass="formError" path="phone1" />
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>
							<div class="cellFirst">
								<span class="cellw3">
								<form:input path="mail" class="input" style="width:100%;"  title="이메일 아이디"  value="${resultMap2.MAIL}"  />
								<form:errors cssClass="formError" path="mail" />
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">이메일 수신 동의</th>
						<td>
							<span class="cellw4"><form:radiobutton path="mail_yn" value="Y" type="radio" class="" /><label for="sms_yn">받습니다.</label></span>
							<span class="cellw4"><form:radiobutton path="mail_yn" value="N" type="radio" class="" /><label for="sms_yn">받지 않습니다.</label></span>
						</td>
					</tr>
					<tr>
						<th scope="row">핸드폰</th>
						<td>
							<div class="cellFirst">
								<span class="cellw1"> 
									<form:select path="cell1" title="핸드폰 통신사 선택"  class="select" style="width:100%">
										<form:option value="0">선택</form:option>
										<c:forEach items="${cellList }" var="t">
											<form:option value="${t.CODE }">${t.CODE }</form:option>
										</c:forEach>
									</form:select>
								</span>
								<span class="cellw8"><span class="cellpg"><form:input path="cell2" type="number"  maxlength="4" class="input" id="" title="휴대폰 두번째 자리" style="width:100%;" value="${resultMap2.CELL2}"/></span></span>
								<span class="cellDesh">-</span>
								<span class="cellw8"><form:input path="cell3" type="number" maxlength="4" class="input" id=""  title="휴대폰 세번째 자리" style="width:100%;" value="${resultMap2.CELL3}"/></span>
							</div>
							<form:errors cssClass="formError" path="cell1" />
						</td>
					</tr>
					<tr>
						<th scope="row">문자수신동의</th>
						<td>
							<span class="cellw4"><form:radiobutton path="sms_yn" value="Y" type="radio" class="" /><label for="sms_yn">받습니다.</label></span>
							<span class="cellw4"><form:radiobutton path="sms_yn" value="N" type="radio" class="" /><label for="sms_yn">받지 않습니다.</label></span>
						</td>
					</tr>
			
				<c:if test="${loginVO.certType == 'IDPW' }">	
					<tr>
						<th scope="row">아이디</th>
						<td>${loginVO.id }</td>
					</tr>
					<tr>
						<th scope="row">비밀번호 확인</th>
						<td><input name="p_password" class="input" id="p_password" type="password" style="width:100%" value=""/>
						<form:errors cssClass="formError" path="password" />
						</td>						
					</tr>
					<!-- 
					<tr>
						<th scope="row">비밀번호확인</th>
						<td><input name="p_confirmPassword" class="input" id="p_confirmPassword" type="password" style="width:100%" value=""/>
						<form:errors cssClass="formError" path="confirmPassword" />
						</td>
					</tr>
					 -->
				</c:if>
				</tbody>
			</table>
			</form:form>
			<div class="btn_r_area">
				<a href="#;" id="formCancel" class="btn btn-white">취소</a>
				<a href="#;" id="formSubmit" class="btn btn-black">등록</a>
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
