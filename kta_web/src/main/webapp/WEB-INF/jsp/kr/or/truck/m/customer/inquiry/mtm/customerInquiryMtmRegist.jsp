<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">

// 글 등록 function  
function registBoard() {
	var f = document.f;
	var content = f.contentHtml.value;
	f.contentText.value = content;
	f.category.value = f.categorySelect.options[f.categorySelect.selectedIndex].value;
	var phone1 = f.phoneSelect.options[f.phoneSelect.selectedIndex].value;		
	var phone = phone1+"-"+f.phone2.value+"-"+f.phone3.value;
	f.phone.value = phone;
	
	if(f.writerName.value == ""){ 
		alert("업체명(성명)을 입력해주세요."); 
		f.writerName.focus();
		return false; 
	}
	if( !/^\d{3,4}$/.test(f.phone2.value)){
		alert("유효하지 않은 연락처입니다. 확인해주세요.");
		f.phone2.focus();
		return false;
	}
	if( !/^\d{4}$/.test(f.phone3.value)){
		alert("유효하지 않은 연락처입니다. 확인해주세요.");
		f.phone3.focus();
		return false;
	}
	var email = f.email01.value;
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if(!re.test(email)){ 
		alert("유효하지 않은 email입니다. 확인해주세요."); f.email01.value = ""; 
		f.email01.focus();
		return false;
	}
	if(f.title.value == ""){ 
		alert("제목을 입력해주세요."); 
		f.title.focus();
		return false; 
	}
	if(content == ""){ 
		alert("내용을 입력해주세요."); 
		f.contentHtml.focus();
		return false; 
	}
	if(f.post1.value==null || f.post1.value==""){
		alert("우편번호를 입력해주세요");
		return;
	}
	if(f.addr.value==""||f.new_addr.value==""){
		alert("주소를 입력해주세요");
		return;
	}
	
    f.action = "<c:url value='/m/customer/inquiry/mtm/actRegist.do'/>";
    f.submit(); 	
} 
function maxLengthCheck(object){
   if (object.value.length > object.maxLength){
    object.value = object.value.slice(0, object.maxLength);
   }    
}
function searchZip(){
	var addr = "/m/common/searchZip.do?form_name=f&zip1_name=post1&zip2_name=post2&juso_name=addr&new_juso_name=new_addr";
	window.open(addr,'우편번호검색','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=600,height=600 top=10 left=10');
}
</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path02">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/customer/index.do">고객광장</a></li>
			<li><a href="/m/customer/inquiry/main/view.do">고객문의</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
	<form:form commandName="inquiryBoardVO" name="f" id="f" enctype="multipart/form-data">
	<input type="hidden" name="phone" />
	<form:hidden path="articleNo"/>
	<form:hidden path="modifyId"/>
	<form:hidden path="modifyName"/>
	<form:hidden path="modifyTime"/>
	<form:hidden path="contentText"/>
	<form:hidden path="writerId" />
	<input type="hidden" name="category"/>
		<!-- 1:1문의하기 -->
		<article class="basicCont02">
			<div class="textTitle"><h2 class="txtTit03">1:1 문의하기</h2></div>
			<table class="tbSt02">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span class="bulSt04">문의분야</span></th>
						<td>
							<select class="select" id="" name="categorySelect"  style="width:100%;">
						    	<option value="1" label="전체"></option>
						    	<option value="2" label="계약"></option>
						    	<option value="3" label="보상"></option>
						    	<option value="4" label="홈페"></option>
						    	<option value="5" label="장학사업"></option>
						    	<option value="6" label="기타"></option>
							</select>
						</td>
					</tr>					
					<tr>
						<th scope="row"><span class="bulSt04">업체명 <br/>(성명)</span></th>
						<td>${name}
							<form:hidden path="writerName" value="${name}"/>
							<form:hidden path="birth" value="${birth}"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">연락처</span></th>
						<td>
							<select id="" name="phoneSelect" class="select tel01" title="휴대폰 첫번째 자리">    
							    <option value="010">010</option>
							    <option value="011">011</option>    
							    <option value="016">016</option>
							    <option value="017">017</option>
							    <option value="018">018</option>
							    <option value="019">019</option> 
							</select>
							<span class="gab01">-</span>
							<span class="tel01"><input type="number" name="phone2" class="input" id="" value="" title="" maxlength="4" oninput="maxLengthCheck(this)"/></span>
							<span class="gab01">-</span>
							<span class="tel01"><input type="number" name="phone3" class="input" id="" value="" title="" maxlength="4" oninput="maxLengthCheck(this)"/></span>
						</td>
					</tr>
					<tr>
					<th scope="row"><span class="bulSt04">주소</span></th>
						<td>
							<div class="cellFirst">
								<span class="cellw1"><form:input path="post1"  id="home_zip_1" class="input" title="우편번호 앞자리" style="width:100%;" readonly="true"/></span>
								<span class="cellDesh">-</span>
								<span class="cellw1"><form:input path="post2"  id="home_zip_2" class="input" title="우편번호 뒷자리" style="width:100%;" readonly="true"/></span>
								<span class="cellBt"><span class="cellpg"><a href="#;" onclick="searchZip();" id="zipPopup" class="btnGray_s ww">우편번호</a></span></span> 
							</div>
							<div class="cell"><form:input path="addr" title="주소" style="width:100%;" class="input" type="text" /></div>
							<div class="cell"><form:input path="new_addr" title="나머지주소" style="width:100%;" class="input" type="text" /></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">E-mail</span></th>
						<td><form:input path="email" type="text" class="input" id="email01" name="email01" value="" title="이메일 입력"  style="width:100%;"/></td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">제목</span></th>
						<td><form:input path="title" type="text" class="input" id="" name="" value="" title="제목" style="width:100%;"/></td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">내용</span></th>
						<td><form:textarea path="contentHtml" id="" name="" class="textarea" style="width:100%;"/></td>
					</tr>
				</tbody>
			</table>
			<div class="btn_r_area">
				<a href="/m/customer/inquiry/main/view.do" class="btn btn-white">취소</a>
				<a href="#;"; onclick="registBoard(); return false;" class="btn btn-black">등록</a>
			</div>
		</article>
		</form:form>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>