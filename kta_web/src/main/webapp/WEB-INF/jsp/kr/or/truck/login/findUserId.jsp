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
	
	
	<%-- 수정 --%>
	$('a#formSubmit').on('click',function(e){
		e.preventDefault();
		var saupNo1 = $('form#f input#saupja_no1').val();
		var saupNo2 = $('form#f input#saupja_no2').val();
		var saupNo3 = $('form#f input#saupja_no3').val();
		var saupNo = "";
		var agentCd = $('form#f input[name="agentCd"]:checked').val();
		
		if(saupNo1 == ""||saupNo2 == ""||saupNo3 == ""){
			alert("사업자번호를 입력해주세요.");
			return false;
		}else{
			saupNo = saupNo1 + saupNo2 + saupNo3;
		}
		if(saupNo.length != "10"){
			alert("사업자번호를 정확히 입력해주세요");
			return false;
		}
		if(agentCd == null){
			alert("회원유형을 선택해주세요");
			return false;
		}
		window.open('/nc.do', 'popupNameCheck', 'width=584, height=514, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');

	});
	
	<%-- 취소 --%>
	$('a#formCancel').on('click',function(e){
		e.preventDefault();
		location.href = '/login.do';
	});
	

	<%-- 로그인화면으로 --%>
	$('a#findSubmit').on('click',function(e){
		e.preventDefault();
		location.href ='/login.do';
	})
	
	<%-- 레이어팝업 닫기 --%>
	$('a#closePopup').on('click',function(){
		$('#typePopupLayer').hide();
	});
});

function typeSelecter(){
	var jumin1 = $('form#f input#jumin1').val();
	var jumin2 = $('form#f input#jumin2').val();
	var saupnum1 =  $('form#f input#saupja_no1').val();
	var saupnum2 =  $('form#f input#saupja_no2').val();
	var saupnum3 =  $('form#f input#saupja_no3').val();
	var saupnum="";
	
	if(saupnum1 == ""||saupnum3 == ""||saupnum3 == ""){
		alert("사업자번호를 입력해주세요.");
		return false;
	}else{
		saupnum = saupnum1 + saupnum2 + saupnum3;
	}
  
	var agentCd = $('form#f input[name="agentCd"]:checked').val();
	$.ajax({
		url: '/login/findInfoId/checkInfo.do',
		dataType: "html",
		data : {
	       	 "jumin1" : jumin1
           , "jumin2" : jumin2
           , "saupnum" : saupnum
           , "agent_cd" : agentCd
		},
		error: function( e) {
		},
		success : function( e ){

			e = decodeURI(decodeURIComponent(e));
			var code = e.split('|')[0];
			var id = e.split('|')[1];
		
			if(code=="true"){
				alert('입력하신 사업자번호와 주민번호가 \n화물공제조합에 등록이 되어있지 않거나 \n일치하지 않습니다.');
			}else if(code=="false"){
				$('span#findId').html(id);
				$('#typePopupLayer').show();
			}
		}
	});
	
}

</script>

<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
	if(param == 'user.null'){
		alert('회원정보를 찾을 수 없습니다. 사업자번호와 이메일을 다시확인해주세요');
	}else if(param == 'user.noNull'){
		alert('사업자 번호를 입력해주세요');
	}
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
		<!-- header s -->
		<div id="headerWrap" style="height:133px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA | 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
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
						<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<form name="searchForm" method="post" action="/mail/checkUser.do">
						<fieldset>
						<legend>회원인증 통합검색</legend>
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
		<hr /><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2 style="font-size: 38px;font-weight: bolder;color: #143B8F;">아이디 찾기</h2>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/login/findInfoId.do" >아이디  &#183; 비밀번호찾기</a>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<!-- <p class="confirTit">
						<img src="/images/truck/etc/email_cont_tit.gif" alt="만기안내 비밀번호 변경입니다. 사업자번호와 이메일주소를 입력하여 주세요" />
					</p> -->
					<div class="conSection">
						<form id="f" name="f" method="post" action="/checkUserId.do">
						<input type="hidden" name="jumin1" id="jumin1"/>
						<input type="hidden" name="jumin2" id="jumin2"/>
						<input type="hidden" name="sName" id="sName"/>
						<fieldset>
						<legend>회원ID찾기</legend>
						<table class="tbWork_st03" summary="">				
							<colgroup>
								<col width="30%" />
								<col width="70%" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">회원 분류</th>
									<td>
										<input name="agentCd" class="" id="agentCd" type="radio"  value="1" /><label for="agentCd">조합원</label>&nbsp;&nbsp;
										<input name="agentCd" class="" id="agentCd" type="radio" value="2" /><label for="agentCd">차량관리자</label>&nbsp;&nbsp;
										<input name="agentCd" class="" id="agentCd" type="radio" value="3" /><label for="agentCd" class="mR0">거래처</label>
									</td>
								</tr>
								<tr>
									<th scope="row">사업자번호</th>
									<td>
										<label class="hide" for="saupja_no">사업자번호</label>
										<input name="saupja_no1" class="txt" id="saupja_no1" type="text" maxlength="3" style="width:60px" value=""/>&nbsp;&nbsp;-&nbsp;&nbsp;
										<input name="saupja_no2" class="txt" id="saupja_no2" type="text" maxlength="2" style="width:40px" value=""/>&nbsp;&nbsp;-&nbsp;&nbsp;
										<input name="saupja_no3" class="txt" id="saupja_no3" type="text" maxlength="5" style="width:100px" value=""/>
										
									</td>
								</tr>
							</tbody>
						</table>									
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a id="formSubmit" href="#;">확인</a></span>
								<span class="btn_pack btn_type10 icon"><span class="check"></span><a id="formCancel" href="#;">취소</a></span>
							</div>
					
					</fieldset>
					</form>
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
	
		<!-- 회원체크부분(레이어팝업) -->
		<div id="typePopupLayer" style="display:none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"><a id="closePopup" href="#;"><img src="/images/truck/com/close.gif" alt="팝업창닫기"></a></p>
					<p class="layerTit" style="text-align:center;"> 회원정보 확인</p>
					<div class="layerA">
						<table class="tbIn_st01" style="">
							<caption>회원아이디 검색</caption>
							<tbody>
								<tr style="height: 60px;" >
									<td style="text-align:center;">
										회원님의 아이디를 안내해드립니다. 
										 <span id="findId"></span>
									</td>
								</tr>									
							</tbody>
						</table>
							<div class="btnboxC clfix">
								<span class="btn_pack btn_type16"><a id="findSubmit" href="#;">로그인 화면으로</a></span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 회원체크부분(레이어팝업) 종료 -->
</body>
</html>