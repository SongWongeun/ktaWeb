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
		
		var chk1 = document.f.contractYn.value;
		if(chk1!='Y'){
			alert("계약확인을 해주세요.");
			return false;
		}
		
		document.f.submit();
	});
	
	$('a#contractConfirm').on('click',function(e){
		var nameConfirm = document.f.nameConfirm.value;
		var jumin1 = document.f.jumin1.value;
		var jumin2 = document.f.jumin2.value;
		var saupjaNoConfirm1 = document.f.saupjaNoConfirm1.value;
		var saupjaNoConfirm2 = document.f.saupjaNoConfirm2.value;
		var saupjaNoConfirm3 = document.f.saupjaNoConfirm3.value;
		
		if(saupjaNoConfirm1=="" || saupjaNoConfirm2=="" || saupjaNoConfirm3==""){
			alert('사업자번호를 입력해주세요.');
			return false;
		}
		if(nameConfirm==""){
			alert('대표자명을 입력해주세요.');
			return false;
		}
		if(document.f.nameConfirm.value.length>5){
			alert('대표자는 1명만 입력 가능합니다.');
			return false;
		}
		if(jumin1==""){
			alert('주민등록번호를 확인해주세요.');
			return false;
		}
		if(jumin2==""){
			alert('주민등록번호를 확인해주세요.');
			return false;
		}
		$.ajax({
			url: '/memberPage/myPage/contractConfirm.do',
			dataType: "html",
			data : {
				"nameConfirm": encodeURIComponent(nameConfirm)
    	       , "juminNo" : jumin1 + jumin2
               , "saupjaNoConfirm" : saupjaNoConfirm1 + saupjaNoConfirm2 + saupjaNoConfirm3
			},
			error: function( e) {
			},
			success : function( e ){
				if(e=='true'){
					alert("공제계약 확인이 되었습니다.");
					document.f.contractYn.value ='Y';
				}else{
					alert("공제 유지중인 대표자 정보와 일치하지 않습니다.");
					document.f.contractYn.value ='N';
				}
			}
		});
	});
});
function contractChange(){
	document.f.contractYn.value ='N';
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	var param ='${code}';
	var param2 ='${code2}';
	if(param == 'passwd.fail'){
		$('#passworderrors').show();
	}
	if(param2 == 'passwd.empty'){
		$('#passwordfail').show();
	}
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
 						<h2><img src="/images/truck/net/jo_tit.gif" alt="회원정보수정" /></h2>
						<p></p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>조합원 확인</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/jo_con_tit.gif" alt="정확한 본인 확인을 위해 다시 한번 비밀번호를 입력해 주세요" /></p>
					<div class="pinfoArea">
						<p>홈페이지 가입정보가 일치 하지 않습니다&#46; </p>
						<p>&nbsp;</p>
						<p>변경된 대표자 정보를 입력/확인 후 정상적으로 사용이 가능합니다. </p>
					</div>
					<div class="conSection">
						<!-- 회원정보수정 s -->
						<div class="tbWork1">
							<form:form id="f" name="f" commandName="cloginVO" action="/memberPage/myPage/updateCeoInfo.do">
								<input type="hidden" id="agentCd" name="agentCd" value="${cloginVO.agentCd}" />
								<table class="tbWork_st03" summary="비밀번호확인 테이블 입니다.">
									<caption>회원정보변경에 대해서 나타낸 표</caption>
									<colgroup>
										<col width="30%" />
										<col width="70%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">현재 등록되어 있는 대표자명</th>
											<td>
												${cloginVO.name}
												<input name="name" class="txt" id="name" type="hidden" value="${cloginVO.name}"/>
												<input name="id" class="txt" id="id" type="hidden" value="${cloginVO.id}"/>
											</td>
										</tr>
										<tr>
											<th scope="row">사업자번호</th>
											<td>
												<label class="hide" for="userPw1">사업자번호</label>
												<input name="saupjaNoConfirm1" class="txt" id="saupjaNoConfirm1" type="text" style="width:40px" />
												- <input name="saupjaNoConfirm2" class="txt" id="saupjaNoConfirm2" type="text" style="width:30px" />
												- <input name="saupjaNoConfirm3" class="txt" id="saupjaNoConfirm3" type="text" style="width:70px" />
												<!-- 
												<input name="saupjaNo" class="txt" id="saupjaNo" type="text" style="width:150px" />
												 -->
												<!--<span class="desc02">사업자번호는 (-)을 빼고 숫자만 입력해주세요.</span>-->
												<form:errors cssClass="formError" path="saupjaNo" />
											</td>
										</tr>
									</tbody>
								</table>
								<table class="tbWork_st03" summary="비밀번호확인 테이블 입니다.">
									<caption>회원정보변경에 대해서 나타낸 표</caption>
									<colgroup>
										<col width="30%" />
										<col width="70%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">변경 된 대표자명</th>
											<td>
												<label class="hide" for="userPw1">대표자명</label>
												<input name="nameConfirm" class="txt" id="nameConfirm" type="text" style="width:160px" onchange="contractChange();"/>
												<form:errors cssClass="formError" path="name" />
											</td>
										</tr>
										<tr>
											<th scope="row">변경 된 대표자 주민등록번호</th>
											<td>
												<label class="hide" for="userPw1">주민등록번호</label>
												<input name="jumin1" class="txt" id="jumin1" type="text" style="width:90px" onchange="contractChange();"/> -
												<input name="jumin2" class="txt" id="jumin2" type="password" style="width:90px" onchange="contractChange();"/>
												<input type="hidden" name="contractYn" id="contractYn"/>
												<a id="contractConfirm" href="#;" class="btn_pack btn_type16"><span>계약확인</span></a>
												<form:errors cssClass="formError" path="juminNo" />
											</td>
										</tr>
									</tbody>
								</table>
								<table class="tbWork_st03" summary="비밀번호확인 테이블 입니다.">
									<caption>회원정보변경에 대해서 나타낸 표</caption>
									<colgroup>
										<col width="30%" />
										<col width="70%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">비밀번호 확인</th>
											<td>
												<input path="password" name="password" class="txt" id="password" type="password" style="width:160px"/>
												<form:errors cssClass="formError" path="password" />
											</td>
										</tr>
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



