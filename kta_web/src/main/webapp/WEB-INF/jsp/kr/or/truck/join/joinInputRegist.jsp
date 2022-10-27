<%@page import="Kisinfo.Check.IPINClient"%>
<%@page import="NiceID.Check.CPClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* 우편번호
	$('#zipPopup').on('click',function(e){
		e.preventDefault();
		var addr = "/common/searchZip.do?form_name=f&zip1_name=post1&zip2_name=post2&juso_name=comjuso&new_juso_name=new_juso";
		window.open(addr,'우편번호검색','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=600,height=600 top=10 left=10');
	});
	 */
	$('#formSubmit').on('click',function(e){
		e.preventDefault();
		if(document.f.idchkresult.value != 'true'){
			alert("아이디 중복체크를 해주세요!");
			return false;
		}
		/* var email = $("#ide_mail").val();
		if(email==""){
			alert("이메일은 필수 항목입니다 반드시 입력해 주세요.");
			return;
		}else if(email!=""){
		
		var re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if(email.length<6 || !re.test(email)){
				alert("잘못된 이메일 형식입니다. 다시 입력해주세요.");
				$("#ide_mail").val("");
				return false;
			}	
		}
		
		document.f.sName.value = $("#ide_name").text();
		document.f.mail.value = $("#ide_mail").val(); */
		document.f.submit();
	}); 
	$('#formCancel').on('click',function(e){
		e.preventDefault();
		location.href='/main/index.do';
	});
	<%-- flow 변경에 따른 주석
	$('input[name="agent_cd"]').on('change',function(e){
		var a = $('input[name="agent_cd"]:checked').val();
		if( a == '2' ){
			$('input[name="comname"]').parent().parent().hide();
			$('select[name="gyeyak_jibu"]').parent().parent().hide();
		}else{
			$('input[name="comname"]').parent().parent().show();
			$('select[name="gyeyak_jibu"]').parent().parent().show();
		}
	});
	--%>
	var a = $('input[name="agent_cd"]').val();
	if( a == '2' ){
		$('input[name="comname"]').parent().parent().hide();
		$('#gyeyak_jibu_view').hide();
	}else if( a == '3' ){
		$('input[name="comname"]').parent().parent().show();
		$('#gyeyak_jibu_view').hide();
	}else{
		$('input[name="comname"]').parent().parent().show();
		$('#gyeyak_jibu_view').show();
	}
	
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchForm();
			return false;
		}
	});
	
	<%-- 아이디 중복확인 --%>
	$('a#idChk').on('click',function(e){
		var id = document.f.id.value;
		
		$.ajax({
			url: '/join/terms/idChk.do',
			dataType: "html",
			data : {
				"id": id
			},
			error: function( e) {
			},
			success : function( e ){
				//console.log(e);
				if(e=="true"){
					document.f.idchkresult.value = "true";
					alert('입력하신 ID는 사용가능합니다.');
				}else {
					document.f.idchkresult.value = "false";
					alert('입력하신 ID는 중복되어서 사용하실 수 없습니다.');
				}
			}
		});
	});
});

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}

function searchForm(){
	var keyword = document.searchForm.searchKeywordTotal.value;
	if(keyword.trim() == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}else{
	document.searchForm.searchKeywordT.value = keyword;
	document.searchForm.action = "<c:url value='/main/totalSearch.do'/>";
   	document.searchForm.submit();
	}
}
function idChg(){
	document.f.idchkresult.value = "false";
}
</script>
<c:if test="${code == 'noMember' }">
<script type="text/javascript">
$(window).load(function(){
	alert('입력하신 사업자번호와 주민번호가 \n화물공제조합에 등록이 되어있지 않거나 \n일치하지 않습니다.');
});
</script>
</c:if>
<c:if test="${code == 'arleayMember' }">
<script type="text/javascript">
$(window).load(function(){
	alert('입력하신 사업자번호로 이미 가입이 되어있습니다.');
});
</script>
</c:if>
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
		<%-- <!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e --> --%>
		<!-- header s -->
		<div id="headerWrap" style="height:133px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA | 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<!-- <li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림" ><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li> -->
						<!-- <li><a href="#;"><img src="/images/truck/main/util01.gif" alt="직원마당" /></a></li> -->
						<c:choose>
							<c:when test="${not empty loginVO }">
								<li><a href="/netCounter/memberPage/myPage/myInfo.do"><img src="/images/truck/main/util04.gif" alt="마이페이지" /></a></li>
							<li><a href="/logout.do"><img src="/images/truck/main/logout.gif" alt="로그아웃" /></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/join/terms/view.do"><img src="/images/truck/main/util02.gif" alt="회원가입" /></a></li>
								<li><a href="/login.do"><img src="/images/truck/main/util03.gif" alt="로그인" /></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<div class="gnbSubGo">
						<a href="/main/guide.do"><img src="/images/truck/main/guide.gif" alt="이용안내가이드" /></a>
						<!-- <a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a> -->
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<form name="searchForm" method="post" action="">
						<fieldset>
						<legend>회원가입 통합검색</legend>
							<input type="hidden" name="searchKeywordT"/>
							<span class="ut_search"><label for="searchKeywordTotal">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
							<a class="btn_ut_search" href="#;" onclick="totalSearch(); return false;"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
						</fieldset>
						</form>
					</div>
				</div>
				<!-- gnb s --><!-- subDep01까지만 노출 depth03부터는 display:none과 display:block로 컨트롤  -->
				<div class="gnb" id="Gnb">
					<ul class="gnbList">
						<li class="gnb1Dep01 "><a class="menu1" href="/netCounter/memberPage/myPage/myInfo.do"><span class="hide">인터넷창구</span></a>
						</li><!--// gnb1Dep01 인터넷창구 e -->
						<li class="gnb1Dep02 "><a class="menu2" href="/infoLounge/infoLoungeIndex.do"><span class="hide">정보마당</span></a>
						</li><!--// gnb1Dep02 정보마당 e -->
						<li class="gnb1Dep03 "><a class="menu3" href="/deductProduct/deductProductIndex.do"><span class="hide">공제상품</span></a>
						</li><!--// gnb1Dep03 공제상품 e -->
						<li class="gnb1Dep04 "><a class="menu4" href="/customer/customerIndex.do"><span class="hide">고객광장</span></a>
						</li><!--// gnb1Dep04 고객광장 e -->
						<li class="gnb1Dep05"><a class="menu5" href="/assocIntroduce/assocIntroduceIndex.do"><span class="hide">조합소개</span></a>
						</li><!--// gnb1Dep05 조합소개 e -->
						<li class="gnb1Dep06 "><a class="menu6" href="/cyberPr/cyberPrIndex.do"><span class="hide">사이버홍보관</span></a>
						</li><!--// gnb1Dep06 사이버홍보관 e -->
					</ul>
					<!-- 컨트롤버튼 -->
					<!-- <a href="#;" title="메뉴열기버튼" class="btn_memuopen" ><span class="hide">메뉴열기</span></a>
					<a href="#;" title="메뉴를 고정시킵니다." class="btn_pause pause_on" ><span>고정</span></a> --><!-- 고정버튼 눌렀을 경우 class명 pause_on 추가 -->
					<a href="#;" title="메뉴를 닫습니다." class="btn_close" ><span>닫기</span></a>
				</div><!-- // gnb e -->
			</div>
		</div>
		<hr />
		<!--// header e -->
		
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/join_tit02.gif" alt="회원정보입력" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>회원가입</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/member_con_tit.gif" alt="아래 내용을 확인 하신 후, 정확히 입력해 주시기 바랍니다" /></p>
					<div class="conSection">
						<form:form id="f" name="f" commandName="joinVO" action="/join/input/actRegist.do">
							<form:hidden path="jumin1" />
							<form:hidden path="jumin2" />
							<form:hidden path="sName" />
							<form:hidden path="agent_cd" />
							<form:hidden path="gyeyak_jibu" />
							<form:hidden path="mail" />
								<!-- 회원정보입력 s -->
								<div class="tbWork1">
									<table class="tbWork_st03" summary="회원정보입력 테이블 입니다.">
										<caption>회원정보입력에 대해서 나타낸 표</caption>
										<colgroup>
											<col width="30%" />
											<col width="70%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">회원구분</th>
												<td>
													<c:if test="${joinVO.agent_cd==1}">조합원</c:if>
													<c:if test="${joinVO.agent_cd==2}">차량관리자</c:if>
													<c:if test="${joinVO.agent_cd==3}">거래처</c:if>
													<!-- 
													<form:radiobutton path="agent_cd" value="1" /><label for="">조합원</label>
													<form:radiobutton path="agent_cd" value="2" /><label for="">차량관리자</label>
													<form:radiobutton path="agent_cd" value="3" /><label for="">거래처</label>
													<span class="desc02">회원구분 정확히 체크 요망</span>
													 -->
													<form:errors cssClass="formError" path="agent_cd" />
												</td>
											</tr>
										</tbody>
									</table>
									<span class="tbWork_st07">표시는 필수 항목입니다.</span>
									<div class="tbWork1">
										<table class="tbWork_st03" summary="회원정보입력 테이블 입니다.">
											<caption>회원정보입력에 대해서 나타낸 표</caption>
											<colgroup>
												<col width="30%" />
												<col width="70%" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">* 아이디</th>
													<td>
														<label class="hide" for="id">아이디</label>
														<form:input path="id" class="txt" style="width:250px" maxlength="10"  onkeyup="idChg();false;"/>
														<form:errors cssClass="formError" path="id" />
														<a id="idChk" href="#;" class="btn_pack btn_type15"><span>ID 중복확인</span></a>
														<span class="desc02">영문자와 숫자만 사용가능(최대 10자, 기호불가) </span>
														<input type="hidden" name="idchkresult" id="idchkresult"/>
													</td>
												</tr>
												<tr>
													<th scope="row">* 비밀번호</th>
													<td>
														<label class="hide" for="password">비밀번호</label>
														<form:password path="password" class="txt" style="width:250px"  />
														<span class="desc02">6자이상, 영문자와 숫자를 혼용해야합니다</span>
														<form:errors cssClass="formError" path="password" />
													</td>
												</tr>
												<tr>
													<th scope="row">* 비밀번호 확인</th>
													<td>
														<label class="hide" for=confirmPassword>비밀번호 확인</label>
														<form:password path="confirmPassword" class="txt" style="width:250px"  />
														<span class="desc02">동일한 비밀번호를 다시 한 번 입력하세요</span>
														<form:errors cssClass="formError" path="confirmPassword" />
													</td>
												</tr>
												<tr>
													<th scope="row">* 대표자명</th>
													<td id="ide_name">${joinUserInfo.name }</td>
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
												<c:if test="${joinVO.agent_cd!=2 }">
												<tr>
													<th scope="row">* 사업자등록번호</th>
													<td>	
															<form:hidden path="saupnum" />
															<c:if test="${joinUserInfo.saupnum!=null }" >
															${fn:substring(joinUserInfo.saupnum,0,3)}-${fn:substring(joinUserInfo.saupnum,3,5)}-${fn:substring(joinUserInfo.saupnum,5,10)}
															</c:if>
													</td>
												</tr>
												<tr>
													<th scope="row">* 회사명</th>
													<td>
															<c:if test="${joinUserInfo.comname!=null }" >
																${joinUserInfo.comname }
															</c:if>
													</td>
												</tr>
												</c:if>
												<tr>
													<th scope="row">* 주소</th>
													<td>
														${joinUserInfo.post1 }<br/>
														${joinUserInfo.comjuso }
														
													</td>
												</tr>
												<tr>
													<th scope="row">* 전화번호</th>
													<td>
													<c:if test="${joinUserInfo.cell1!=null }">
														${joinUserInfo.cell1 } - ${joinUserInfo.cell2 } - ${joinUserInfo.cell3 }
													</c:if>	
													</td>
												</tr>
												<c:if test="${joinVO.agent_cd!=3 }">
												<tr>
													<th scope="row">핸드폰</th>
													<td>
													<c:if test="${joinUserInfo.phone1!=null }">
														${joinUserInfo.phone1 } - ${joinUserInfo.phone2 } - ${joinUserInfo.phone3 }	
													</c:if>										
													</td>
												</tr>
												<tr>
													<th scope="row">* 이메일</th>
													<td><input id="ide_mail" type="text" class="txt" style="width:250px" value="<c:if test="${joinUserInfo.mail!=null }">${joinUserInfo.mail}</c:if>"/></td>
												</tr>
												</c:if>
												<c:if test="${joinVO.agent_cd==1}">
												<tr id="gyeyak_jibu_view">
													<th scope="row">* 계약지부</th>
													<td>
														<c:forEach items="${jibuList }" var="jibu">
															<c:if test="${joinVO.gyeyak_jibu==jibu.CODE_NO}">${jibu.CODE_NAME }</c:if>
														</c:forEach>
													</td>
												</tr>
												</c:if>
											</tbody>
										</table>
										<c:if test="${mList !=null && joinVO.agent_cd==1}">
										<ul class="mB15">
											<li class="desC">담당자 목록입니다. 가입 후 회원정보관리를 통하여 추가/삭제 할수 있습니다</li>
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
															<div>
																<span>구분</span>
																<c:choose>
																	<c:when test="${m.cmt1 !=null }">${m.cmt1}</c:when>
																	<c:otherwise>담당자</c:otherwise>
																</c:choose>
															</div>
															<div>
																<span>이름</span>${m.pn_nm }
															</div>
															<div>
																<span>핸드폰</span>${m.phone_no1 }
															</div>
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
										</c:if>
										<!-- 버튼 -->
										<div class="btnboxR clfix">
											<span class="btn_pack btn_type01 icon"><a id="formSubmit" href="#;">확인</a></span>
											<span class="btn_pack btn_type10 icon"><a id="formCancel" href="#;">취소</a></span>
										</div>
									</div>
								<!--// 회원정보입력 e -->
								</div>
						</form:form>
					</div><!--// conaArea e -->
				</div><!--// contents e -->
			</div>
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>

