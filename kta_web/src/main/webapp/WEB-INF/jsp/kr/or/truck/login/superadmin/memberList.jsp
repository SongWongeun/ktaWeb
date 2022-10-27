<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>

<!-- <link rel="stylesheet" type="text/css" href="/js/DataTables/tableDataPaging.css" />
<script type="text/javascript" src="/js/DataTables/jquery.js"></script>
<script type="text/javascript" src="/js/DataTables/jquery.dataTables.min.js"></script>   -->

<script type="text/javaScript" language="javascript" defer="defer">

var enterId = "";
var enterGb = "";

function pwchgLayoutChange(loginId,loginGb){
	$('#pwchgPopupLayer').show();
	enterId = loginId;
	enterGb = loginGb;
}

$(document).ready(function(){
	/* $("#memListTable").DataTable({
		 "columnDefs": [{
	          "targets": 'no-sort',
	          "orderable": false,
	    }],
		"pagingType": "simple_numbers",
		"order": [[ 0, 'desc' ]],
		"searching" : false,
		"lengthChange": false,
		"info": false,
	}); */
	
	/* var totalPageCount = ${paginationInfo.totalPageCount};
	if(totalPageCount == 1) {// -- 2016.12.15 [HYEON] 추가
		document.boardForm.searchKeyword.value = ""; 
	} */
	var param ='${param.code}';

	
	if(param == 'login.fail'){
		alert('잘못된 접근입니다.');
	}

	<%-- 레이어팝업 닫기 --%>
	$('a#closePopup').on('click',function(){
		$('#pwchgPopupLayer').hide();
	});
	$('a#pwchgLayoutChange').on('click',function(){
		$('#pwchgPopupLayer').show();
		enterId = loginId;
		enterGb = loginGb;
	});	
	
	<%-- 대표자 변경 2016.12.06 [H] 수정--%>
/* 	$('a#pwchgSubmit').on('click',function(e){
		if(confirm('대표자 정보를 변경하시겠습니까?')){
			var name = document.f2.enterName.value;
			var jumin1 = document.f2.jumin1.value;
			var jumin2 = document.f2.jumin2.value;

			var agent_cd2 = enterGb;
			var id2 = enterId ;
			
			agent_cd2 = encodeURI(agent_cd2, "UTF-8");
			name = encodeURI(name, "UTF-8");
			
			if(name==""){
				alert('변경할 대표자 이름을 입력 해주세요.');
				return false;
			}
			if(jumin1=="" || jumin2==""){
				alert('주민등록번호를 바르게 입력 해주세요.');
				return false;
			}
			$.ajax({
				url: '/superadmin/updateAlterCeo.do',
				dataType: "html",
				data : {
					"name": name
	    	       , "jumin1" : jumin1
	               , "jumin2" : jumin2
	               , "agent_cd" : agent_cd2
	               , "id" : id2
				},
				error: function( e) {
				},
				success : function( e ){
					//console.log(e);
					if(e=="false"){
						alert("대표자 변경에 실패하였습니다.");
					}else if(e=="true"){
						alert("대표자 변경에 성공하였습니다.");
						document.f2.name.value = "";
						document.f2.jumin1.value = "";
						document.f2.jumin2.value = "";
						$('#pwchgPopupLayer').hide();
					}else{
						alert(e);
					}
				}
			});
		}
	}); */
	
	
	/* --  2016.12.15 [HYEON] 추가 -- */
	$("#category01").click(function(){
		document.boardForm.category.value = 1;
		document.boardForm.searchKeyword.value = ""; 
		document.boardForm.orderBy.value = ""; 
		searchList();
	});
	$("#category02").click(function(){
		document.boardForm.category.value = 2;
		document.boardForm.searchKeyword.value = ""; 
		document.boardForm.orderBy.value = ""; 
		searchList();
	});
	$("#category03").click(function(){
		document.boardForm.category.value = 3;
		document.boardForm.searchKeyword.value = ""; 
		document.boardForm.orderBy.value = ""; 
		searchList();
	});
	
	$('input#search').on('keydown',function(event){
		if( event.keyCode == 13) {
			searchList();
			return false;
		}
	});
});


function paging_Board(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/superadmin/memberList.do'/>";
   	document.boardForm.submit();
}

function searchList(){
	
	if( document.boardForm.searchCondition.value  == '3'){
		document.boardForm.searchKeyword.value = document.boardForm.searchKeyword.value.replace(/-/g,'');
	}
	document.boardForm.pageIndex.value = 1;
	document.boardForm.action = "<c:url value='/superadmin/memberList.do'/>";
   	document.boardForm.submit();
   	
}
function webMemberReset(id,loginGb){
	if(confirm("선택하신 " + id + "의 패스워드를 초기화 하시겠습니까?")){
		document.boardForm.id.value = id;
		/* var loginGb2;
		if(loginGb=='조합원'){
			loginGb2 = '1';
		}else if(loginGb=='차량관리자'){
			loginGb2 = '2';
		}else{
			loginGb2 = '3';
		}  2016.12.05 [H] 주석처리함*/
		document.boardForm.category.value = loginGb;
		document.boardForm.action = "<c:url value='/superadmin/memberPwReset.do'/>";
	   	document.boardForm.submit();
	   	alert(id + "의 패스워드 초기화가 완료 되었습니다.")
	}
	 
}

function webMemberLogin(id,loginGb){
	if(confirm("선택하신 " + id + " 아이디로 로그인 하시겠습니까?")){
		document.boardForm.id.value = id;
		/* 2016.12.02 [H] 주석처리함
		var loginGb2;
		if(loginGb=='조합원'){
			loginGb2 = '1';
		}else if(loginGb=='차량관리자'){
			loginGb2 = '2';
		}else{
			loginGb2 = '3';
		}
		document.boardForm.category.value = loginGb2; */
		document.boardForm.action = "<c:url value='/superadmin/memberLoginAct.do'/>";
	   	document.boardForm.submit();
	}
}

function sortingNow(num){
	var sortColumn = num;
	var sortStandard = $("#orderBy").val();
	
	if(sortStandard == null || sortStandard == "") {
		$("#orderBy").val("DESC");
	} else if (sortStandard == "DESC") {
		$("#orderBy").val("ASC");
	} else if (sortStandard == "ASC") {
		$("#orderBy").val("DESC");
	}
	$("#orderByCriteria").val(sortColumn);
	searchList();
}

function cmm_window_popup(url,popupwidth,popupheight,popupname){
	Top = (window.screen.height - popupheight)/3;
	Left = (window.screen.width - popupwidth)/2;
	if(Top<0) Top = 0;
	if(Left<0) Left = 0;
	Future = "fullscreen = no, toolbar = no, location = no, " +
			"directories = no, status = yes, scrollbars = yes, " +
			"left ="+Left+",top="+Top+",width="+popupwidth+
			",height="+popupheight;
	popupname = window.open(url, popupname, Future);
	popupname.focus();
}

function goDormancyMemberList(){
	cmm_window_popup("/superadmin/dormancyMemberList.do","400","600","휴면계정관리");
}

</script>

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
	.changePW {color:#fc8403;font-size:20px;letter-spacing:-1px;font-family:'NanumGothicBold';margin-bottom:15px;}
</style>

</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s -->
		<div id="headerWrap" style="height:133px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<!-- 20161130 삭제
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
						//20161130 삭제 -->
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
						<!-- 20161214 삭제 
						<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
						//20161214 삭제 -->
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<form name="searchForm" method="post" action="">
						<fieldset>
						<legend>통합검색</legend>
							<input type="hidden" name="searchKeywordT"/>
							<span class="ut_search"><label for="">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
							<a class="btn_ut_search" href="#;" onclick="totalSearch();"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
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
						<c:if test="${not empty user_id}">
							<h2 style="font-size: 38px;font-weight: bolder;color: #143B8F;">공제조합 담당자 로그인</h2>
						</c:if>
						<c:if test="${empty user_id}">
							<h2 style="font-size: 38px;font-weight: bolder;color: #143B8F;">관리자 전용 로그인</h2>
						</c:if>
					</div>
					<div class="location">
						<!-- 20161206 수정 -->
						<div class="welcomeMsg"><span>${jibu_nm} ${user_name} ${jicwi_nm}님 환영합니다.</span></div>
						<!-- //20161206 수정 -->
						<!-- <a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/superadmin/memberList.do" >관리자 전용 로그인</a> -->
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
					<legend>회원목록</legend>
					</fieldset>
					<input type="hidden" name="articleNo" />
					<input type="hidden" name="id" />
					<input type="hidden" name="employeeYn" value= "Y"/> 
					<input type="hidden" name="category" id="category" value= "${categoryNo}"/> <!-- 2016.12.15 [HYEON] 추가 -->
					<input type="hidden" name="orderByCriteria" id="orderByCriteria" value= "${orderByCriteria}"/> <!-- 2017.01.13 [HYEON] 추가 -->
					<input type="hidden" name="orderBy" id="orderBy" value= "${orderBy}"/> <!-- 2017.01.13 [HYEON] 추가 -->
					<div class="conSection" style="margin-top: 15px;">
						<!-- 20161214 삭제 
						<p class="infosearchWrap">
							<form:select path="category" class="btn btn-default btn-sm">회원 유형
								<form:option value="0" label="전체"/>
								<form:option value="1" label="조합원"/>
								<form:option value="2" label="차량관리자"/>
								<form:option value="3" label="거래처"/>
							</form:select>
							<form:select path="searchCondition" class="btn btn-default btn-sm" cssStyle="width: 100px;">검색 유형
								<form:option value="2" label="이름(상호)"/>
								<form:option value="1" label="ID"/>
								<form:option value="3" label="사업자 번호"/>
							</form:select>
							<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" type="text" title="검색어를 입력해주세요" style="width:173px" name="search" value=""/>
						  	<a id="back" class="btn btn-primary btn-sm" onclick="searchList()" href="#;"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
						</p>
						//20161214 삭제 -->
						<!-- 20161214 추가 -->
						<div class="tblTop type2">
						<c:if test="${categoryNo == '1' }">
							<span class="btn_pack btn_type23" id="spanCategory01"><a href="javascript:;" id="category01">조합원</a></span>
							<span class="btn_pack btn_type24" id="spanCategory02"><a href="javascript:;" id="category02">차량관리자</a></span>
							<span class="btn_pack btn_type24" id="spanCategory03"><a href="javascript:;" id="category03">거래처</a></span>
						</c:if>
						<c:if test="${categoryNo == '2' }">
							<span class="btn_pack btn_type24" id="spanCategory01"><a href="javascript:;" id="category01">조합원</a></span>
							<span class="btn_pack btn_type23" id="spanCategory02"><a href="javascript:;" id="category02">차량관리자</a></span>
							<span class="btn_pack btn_type24" id="spanCategory03"><a href="javascript:;" id="category03">거래처</a></span>
						</c:if>
						<c:if test="${categoryNo == '3' }">
							<span class="btn_pack btn_type24" id="spanCategory01"><a href="javascript:;" id="category01">조합원</a></span>
							<span class="btn_pack btn_type24" id="spanCategory02"><a href="javascript:;" id="category02">차량관리자</a></span>
							<span class="btn_pack btn_type23" id="spanCategory03"><a href="javascript:;" id="category03">거래처</a></span>
						</c:if>
							<div class="right">
								<!-- <span class="btn_pack btn_type24"><a href="javascript:goDormancyMemberList();" >휴면계정관리</a></span> -->
								<form:select path="searchCondition" class="btn btn-default btn-sm" cssStyle="width: 100px;">검색 유형
									<form:option value="2" label="이름(상호)"/>
									<form:option value="1" label="ID"/>
									<form:option value="3" label="사업자 번호"/>
								</form:select>
								<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" type="text" title="검색어를 입력해주세요" style="width:173px" name="search" value=""/>
								<a id="back" class="btn btn-primary btn-sm" onclick="searchList()" href="javascript:;"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
							</div>
						</div>
						<!-- //20161214 추가 -->
						<!-- table list s -->
						<div class="bbsList1">
							<table class="tbList_st01" summary="회원 목록 입니다. 번호,회원유형,아이디,성명,사업자번호,가입일" id="memListTable"><!-- data-page-length="10" class="" -->
								<caption>회원 목록 입니다.</caption>
								<colgroup>
									<!-- 20161201 수정 -->
									<col style="width:9%;" />
									<col style="width:9%;" />
									<col style="width:11%;" />
									<col style="width:11%;" />
									<col style="width:15%;" />
									<col style="width:13%;" />
									<col style="width:9%;" />
									<col style="width:9%;" />
									<col style="width:9%;" />
									<!-- //20161201 수정 -->
								</colgroup>
								<thead>
								<tr>
								  <th><div>번호</div></th>
								  <th><div>회원유형</div></th>
								  <th><div>아이디</div></th>
								  <th><div>성명<a href="#;" onclick="sortingNow('1');" class="mL5"><img src="/images/truck/board/btn_tbl_down.gif" alt="내림차순" /><!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></div></th>	<!-- 20161214 수정 -->
								  <th><div>상호<a href="#;" onclick="sortingNow('2');"  class="mL5"><img src="/images/truck/board/btn_tbl_down.gif" alt="내림차순"  /><!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></div></th>	<!-- 20161214 수정 -->
								  <th><div>사업자번호<a href="#;" onclick="sortingNow('3');"  class="mL5"><img src="/images/truck/board/btn_tbl_down.gif" alt="내림차순"  /><!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></div></th>	<!-- 20161214 수정 -->
								  <th><div>가입지부<a href="#;" onclick="sortingNow('4');"  class="mL5"><img src="/images/truck/board/btn_tbl_down.gif" alt="내림차순"  /><!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></div></th>	<!-- 20161214 수정 -->
								  <th><div>가입일</div></th>
								  <th><div>PW초기화</div></th>
								  <!-- 20161201 삭제 <th><div>대표자변경</div></th>	-->
								</tr>
								</thead>
								<tbody>
									<c:if test="${not empty resultList}">
									<c:forEach var="result" items="${resultList}" varStatus="status">
		  								<tr>
		    								<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
											<c:if test="${result.AGENTCD == '1' }">
												<td class="center">조합원</td>
											</c:if>
											<c:if test="${result.AGENTCD == '2' }">
												<td class="center">차량관리자</td>
											</c:if>
											<c:if test="${result.AGENTCD == '3' }">
												<td class="center">거래처</td>
											</c:if>
											<td class="center" onclick="webMemberLogin('${result.ID}','${result.AGENTCD}')"><font color = blue><u>${result.ID}</u></font></td>
											<td class="center">${result.DAEPYOJANM}</td>
											<td class="center">${result.AGENTNM}</td>
											<td class="center">${fn:substring(result.SAUPJANO, 0, 3)}-${fn:substring(result.SAUPJANO, 3, 5)}-${fn:substring(result.SAUPJANO, 5, 10) }</td>
											<td class="center">${result.GYEYAKJIBUNM}</td>
											<td class="center">${result.JOINDATE}</td>	      									
											<td class="center" onclick="webMemberReset('${result.ID}','${result.AGENTCD}')">
												<div class="btnboxS clfix">
													<span class="btn_pack btn_type0S"><a id="pwchgLayoutReset">초기화</a></span>
												</div>
											</td>
											<!-- 20161201 삭제 
											<td class="center" onclick="pwchgLayoutChange('${result.ID}','${result.GB}')">
												<div class="btnboxS clfix">
													<span class="btn_pack btn_type0S"><a id="pwchgLayoutChange2" href="#;">변경</a></span>
												</div>
											</td>
											//20161201 삭제 -->
		  								</tr>
		 							</c:forEach>		
		 							</c:if>
								</tbody>
							</table>
							<!-- paging s -->							
								<div class="paging" id="pager">
									<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_Board" />
									<form:hidden path="pageIndex" />
								</div><!--// paging e -->
						</div>
						<!-- table list e -->
					</div></form:form>
					<p class="mebInfo2 flL">※ <b>업무과 직원</b> : 담당하는 조합원사와 차량관리자, 거래처 아이디 접속 가능&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>보상, 총무과 직원</b> : 거래처 아이디 접속 가능</p>
					<p class="mebInfo3 flL">※  회원 ID를 클릭하면 해당 조합원/거래처 아이디로 로그인이 됩니다.(클릭 후 접속 시까지 일정시간 소요)</p>
				</div><!-- conaArea e -->
			</div>
		</div>
		
		<!-- 비밀번호변경부분(레이어팝업) -->
		<%-- 2016.12.15 [HYEON] 주석처리함
		<div id="pwchgPopupLayer" style="display:none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"><a id="closePopup" href="#;"><img src="/images/truck/com/close.gif" alt="팝업창닫기"></a></p>
					<p class="layerTit">대표자 변경</p>
					<p class="layerTxt">
						변경할 대표자 정보를 입력해 주세요.&#46;<br/> 
					</p>
					<div class="layerA">
						<form id="f2" name="f2" method="post" action="/join/input/regist.do">
							<input type="hidden" id="id" name="id" value="${result.ID}"/>
							<input type="hidden" id="agent_cd" name="agent_cd" value="${result.GB}"/>	
							<table class="tbIn_st01" style="">
								<caption>대표자 정보 변경</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:70%;" />
								</colgroup>
								<tbody>
									<tr style="height: 40px;">
										<th>
											이름
										</th>
										<td>
											<input name="enterName" class="txt" id="enterName" type="text" value="" style="width:68%;"/>
										</td>
									</tr>
									<tr id="cert_saup" style="height: 40px;">
										<th>
											주민등록번호
										</th>
										<td>
											<input name="jumin1" class="txt" id="jumin1" type="text" value="" style="width:30%;"/>
										-
											<input name="jumin2" class="txt" id="jumin2" type="text" value="" style="width:30%;"/>
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
		</div> --%>
		<!-- 비밀번호변경부분(레이어팝업) 종료 -->
		
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
</body>
</html>