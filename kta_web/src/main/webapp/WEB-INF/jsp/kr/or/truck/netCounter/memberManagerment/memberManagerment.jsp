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

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="imagetoolbar" content="no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="title" content="KTA 전국화물자동차운송사업자공제조합" />
<title>KTA 전국화물자동차운송사업자공제조합</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/kta.ico" />
<link rel="stylesheet" type="text/css" href="/css/truck/font.css" />
<link rel="stylesheet" type="text/css" href="/css/truck/base.css" />
<link rel="stylesheet" type="text/css" href="/css/truck/base.css" />
<link rel="stylesheet" type="text/css" href="/css/truck/ui_codedesign.css"/>
<link rel="stylesheet" type="text/css" href="/css/truck/sub_codedesign.css" />
<link rel="stylesheet" type="text/css" href="/css/truck/sub_codedesign.css" />
<link rel="stylesheet" type="text/css" href="/css/truck/subindex_codedesign.css" />
<link rel="stylesheet" type="text/css" href="/css/truck/bbs.css" />
<link rel="stylesheet" type="text/css" href="/css/truck/popup_codedesign.css" />
<script type="text/javascript" src="/js/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/js/truck/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	if('<%=request.getParameter("defaultChange")%>'=='Y'){
		alert("대표자가 변경되었습니다 다시 로그인해 주세요");
		location.href="/netCounter/memberManagerment/memberManagermentSessionClear.do";
	}
 	
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchForm();
			return false;
		}
	});
	
	$('input[name="daepyo_yn"]').on("click",function(){

			var agent_no =	$(this).parents("tr").children("td").eq(0).attr("attr-agent_no");
			var saupjang_seq = $(this).parents("tr").children("td").eq(0).attr("attr-saupjang_seq");
			var saupnum =	$(this).parents("tr").children("td").eq(0).attr("attr-saupnum");
			var gyeyak_jibu =	$(this).parents("tr").children("td").eq(0).attr("attr-gyeyak_jibu");
			
			$("#u_agent_no").val(agent_no);
			$("#u_saupjang_seq").val(saupjang_seq);
			$("#u_saupnum").val(saupnum);
			$("#u_gyeyak_jibu").val(gyeyak_jibu);
	
	});
	var agent_no = '';
	var saupjang_seq = '';
	var saupnum = '';
	var gyeyak_jibu = '';
	
	$("a[name='nameMemberDelete']").on("click",function(){
			
			if($(this).parents("tr").children("td").eq(0).children("input").is(":checked")){
				alert("대표로 선택된 사업자는 삭제 할 수 없습니다.");
				return;
			}
		
			if(agent_no==''){
			 agent_no =	$(this).parents("tr").children("td").eq(0).attr("attr-agent_no");
			 saupjang_seq = $(this).parents("tr").children("td").eq(0).attr("attr-saupjang_seq");
			 saupnum =	$(this).parents("tr").children("td").eq(0).attr("attr-saupnum");
			 gyeyak_jibu =	$(this).parents("tr").children("td").eq(0).attr("attr-gyeyak_jibu");
			}else{
				agent_no += "|"+$(this).parents("tr").children("td").eq(0).attr("attr-agent_no");
				saupjang_seq += "|"+$(this).parents("tr").children("td").eq(0).attr("attr-saupjang_seq");
				saupnum += "|"+$(this).parents("tr").children("td").eq(0).attr("attr-saupnum");
				gyeyak_jibu += "|"+$(this).parents("tr").children("td").eq(0).attr("attr-gyeyak_jibu");
			}
			
			$(this).parents("tr").hide();

			alert("수정완료를 누르지 않으면 삭제되지 않습니다.");
			
			$("#d_agent_no").val(agent_no);
			$("#d_saupjang_seq").val(saupjang_seq);
			$("#d_saupnum").val(saupnum);
			$("#d_gyeyak_jibu").val(gyeyak_jibu);

	});

	$("a[name='nameMemberDaepyo']").on("click",function(){
		alert("대표 사업자는 삭제 할 수 없습니다.");
	});
	
});

function searchForm(){
	var keyword = document.searchForm.searchKeywordTotal.value;
	if(keyword.trim() == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}else{
	document.searchForm.searchKeywordT.value = keyword;
	document.searchForm.action = "/main/totalSearch.do";
   	document.searchForm.submit();
	}
}

function memberListUpdate(){
	$("div#tbMemberList").hide();
	$("div#tbMemberUpdate").show();
}

function memberListUpdateCancel(){
	location.href="/netCounter/memberManagerment/memberManagerment.do";
}	
	
function insertSaupMember(){
	location.href="/netCounter/memberManagerment/memberManagermentCheckName.do";
}

function memberListUpdateComplete(){
	
	alert("수정완료");
	$("#f_daepyo_update").submit();
	
}

function goPage(pageNo) {

	document.pagingSaupList.pageIndex.value = pageNo;
	document.pagingSaupList.submit();
}


</script>
</head>
<body>
<form id="f_daepyo_update" method="post" action="/netCounter/memberManagerment/memberManagermentUpdateAndDelete.do">
		<input type="hidden" name="u_agent_no" id="u_agent_no"/>
		<input type="hidden" name="u_saupjang_seq" id="u_saupjang_seq"/>
		<input type="hidden" name="u_saupnum" id="u_saupnum"/>
		<input type="hidden" name="u_gyeyak_jibu" id="u_gyeyak_jibu"/>
		
		<input type="hidden" name="d_agent_no" id="d_agent_no"/>
		<input type="hidden" name="d_saupjang_seq" id="d_saupjang_seq"/>
		<input type="hidden" name="d_saupnum" id="d_saupnum"/>
		<input type="hidden" name="d_gyeyak_jibu" id="d_gyeyak_jibu"/>
</form>
<form name="pagingSaupList">
	<input type="hidden" name="pageIndex" id="pageIndex"/>
</form>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		
		<!-- header s -->
		<c:import url="/common/include/subHeader.do"></c:import>
		<!--// header e -->
		
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">

				<!-- 20161208 신규 -->
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/union_tit.gif" alt="조합원관리" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46; </p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do">인터넷창구</a>
						<span>조합원관리</span>
					</div>
				</div><!--// conTitle e -->

				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/union_con_tit02.gif" alt="회원가입된 사업자 이외에 사업자를 추가로 등록하실 수 있습니다." /></p>
				<div id="tbMemberList">
					<table class="tbWork_st01" summary="조합원 관리 테이블 입니다.">
						<caption>조합원 관리를 할 수 있는 표</caption>
						<colgroup>
							<col style="width:8%;">
							<col style="width:16%;">
							<col style="width:22%;">
							<col style="*">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">대표</th>
								<th scope="col">대표자명 <a href="#" class="mL5"><img src="/images/truck/board/btn_tbl_down.gif" alt="내림차순" /><!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></th>
								<th scope="col">사업자번호</th>
								<th scope="col">회사명 <a href="#" class="mL5"><img src="/images/truck/board/btn_tbl_down.gif" alt="내림차순" /><!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></th>
								<th scope="col">가입지부<a href="#" class="mL5"><img src="/images/truck/board/btn_tbl_down.gif" alt="내림차순" /><!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></th>
							</tr>
						</thead>
						<!-- 20161214 수정 -->
						<tbody>
						<!-- foreach s -->
						<c:forEach var="mVO" items="${saupjaNoList }">
							<tr>
								<td><span
								<c:if test="${mVO.default_yn=='Y' }">
								class="listSelected"
								</c:if>
								><span class="hide">대표 선택됨</span></span></td>
								<td>${mVO.daepyoja_nm }</td>
								<td>${fn:substring(mVO.saupnum,0,3)} - ${fn:substring(mVO.saupnum, 3,5)} - ${fn:substring(mVO.saupnum, 5, 10) }</td>
								<td><strong>${mVO.agent_nm }</strong></td>
								<td>${mVO.gyeyak_jibu_nm }</td>
							</tr>
						</c:forEach>
							<!-- foreach e -->
						</tbody>
						<!-- //20161214 수정 -->
					</table>
					<div class="paging">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="goPage" />
					</div>

					<div class="btnboxR">
						<span class="btn_pack btn_type19"><a href="javascript:insertSaupMember();">조합원 추가</a></span>
						<span class="btn_pack btn_type20"><a href="javascript:memberListUpdate();">수정</a></span>
					</div>
				</div>
				<div id="tbMemberUpdate" style="display:none;">
					<!-- 수정 시 테이블 변환 -->
					<table class="tbWork_st01" summary="조합원 관리 테이블 입니다.">
						<caption>조합원 관리, 삭제를 할 수 있는 표</caption>
						<colgroup>
							<col style="width:8%;">
							<col style="width:14%;">
							<col style="width:20%;">
							<col style="*">
							<col style="width:18%;">
							<col style="width:12%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">대표</th>
								<th scope="col">대표자명<a href="#" class="mL5"><img src="/images/truck/board/btn_tbl_down.gif" alt="내림차순" /><!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></th>
								<th scope="col">사업자번호</th>
								<th scope="col">회사명<a href="#" class="mL5"><img src="/images/truck/board/btn_tbl_down.gif" alt="내림차순" /><!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></th>
								<th scope="col">가입지부<a href="#" class="mL5"><img src="/images/truck/board/btn_tbl_down.gif" alt="내림차순" /><!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="mVO" items="${saupjaNoList }">
							<tr>
								<td attr-agent_no="${mVO.agent_no }" attr-saupjang_seq="${mVO.saupjang_seq }" attr-saupnum="${mVO.saupnum }" attr-gyeyak_jibu="${mVO.gyeyak_jibu }">
								<input type="radio" name="daepyo_yn"
								<c:if test="${mVO.default_yn=='Y' }">
								checked="checked"
								 </c:if>
								 />
								 </td>
								<td>${mVO.daepyoja_nm }</td>
								<td>${fn:substring(mVO.saupnum,0,3)} - ${fn:substring(mVO.saupnum, 3,5)} - ${fn:substring(mVO.saupnum, 5, 10) }</td>
								<td><strong>${mVO.agent_nm }</strong></td>
								<td>${mVO.gyeyak_jibu_nm }</td>
								<td><span class="btn_pack btn_type18"><a href="#;"
								<c:choose>
								<c:when test="${mVO.default_yn=='Y' }">
								 name="nameMemberDaepyo"
								 </c:when>
								 <c:otherwise>
								 name="nameMemberDelete"
								</c:otherwise>
								 </c:choose>
								 >삭제</a></span></td>
							</tr>
						</c:forEach>	
						</tbody>
					</table>
					<div class="paging">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="goPage" />
					</div>

					<!-- 수정 시 버튼 변환 -->
					<div class="btnboxR">
						<span class="btn_pack btn_type19"><a href="javascript:memberListUpdateComplete();">수정완료</a></span>
						<span class="btn_pack btn_type20"><a href="javascript:memberListUpdateCancel();">취소</a></span>
					</div>
				</div>
				</div><!--// conaArea e -->
				<!-- //20161208 신규 -->

			</div><!--// contents e -->
			<!-- quick s -->
    		<div class="quick">
				<ul>
					<li><a href="/customer/inquiry/viewRegistBoard.do" title="1:1문의"><img src="/images/truck/com/menu_quick01.png" alt="1:1문의" /></a></li>
					<li><a href="/cyberPr/echoIndex.do" title="트럭메아리"><img src="/images/truck/com/menu_quick02.png" alt="트럭메아리" /></a></li>
					<!-- <li><a href="/infoLounge/encourIndex.do" title="장학사업"><img src="/images/truck/com/menu_quick03.png" alt="장학사업" /></a></li> -->
					<li><a href="/deductProduct/callInfo.do" title="현장출동"><img src="/images/truck/com/menu_quick04.png" alt="현장출동" /></a></li>
					<li><a href="/footer/comRemote.do" title="원격지원"><img src="/images/truck/com/menu_quick05.png" alt="원격지원" /></a></li>
					<li><a href="#" title="최상단으로 이동"><img src="/images/truck/com/menu_quick06.png" alt="맨위로" /></a></li>
				</ul>
			</div>
			<!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s -->

		<div id="footer">
			<div class="footerArea">
				<div class="footLogo"><img alt="전국화물자동차운송사업연합회공제조합" src="/images/truck/com/foot_logo.gif"/></div>
				<div class="footPolice">
					<div class="linkList">
						<ul>
							<li><a href="/assocIntroduce/assocIntroduceIndex.do"><img src="/images/truck/com/foot01.gif" alt="조합소개 " /></a></li>
							<li><a href="/assocIntroduce/allRoughMap.do"><img src="/images/truck/com/foot02.gif" alt="본부안내" /></a></li>
							<li><a href="/deductProduct/productInfo/manInfo.do"><img src="/images/truck/com/foot03.gif" alt="상품공시" /></a></li>
							<li><a href="/deductProduct/divideCalcu.do"><img src="/images/truck/com/foot04.gif" alt="가격공시" /></a></li>
							<li><a href="/assocIntroduce/introduce/manageInfoList.do"><img src="/images/truck/com/foot05.gif" alt="경영공시" /></a></li>
							<li><img src="/images/truck/com/foot06.gif" alt="사고접수 현장출동서비스 1577-8278" /></li>
						</ul>
						<ul>
							<li><a href="/footer/privacyPolicy.do"><img src="/images/truck/com/foot07.gif" alt="개인정보보호정책 " /></a></li>
							<li><a href="/footer/emailBan.do"><img src="/images/truck/com/foot08.gif" alt="이메일주소무단수집거부" /></a></li>
							<li><a href="/footer/userAgreement.do"><img src="/images/truck/com/foot09.gif" alt="이용약관" /></a></li>
							<li><a href="/footer/comRemote.do"><img src="/images/truck/com/foot10.gif" alt="PC원격지원" /></a></li>
							<li><a href="/footer/progInstall.do"><img src="/images/truck/com/foot11.gif" alt="프로그램설치" /></a></li>
							<li><a href="/footer/netCheck.do"><img src="/images/truck/com/foot12.gif" alt="증명서위변조검증" /></a></li>
						</ul>
					</div>
					<div class="address"><img src="/images/truck/com/address.gif" alt="서울시 서초구 동작대로230 구(서울시 서초구 방배본동 753-5 화련회관) 대표전화 : 02-3483-3700 팩스 : 02-3483-3729" /></div>
					<p class="copyright"><img src="/images/truck/com/copyright.gif" alt="COPYRIGHT(C) 2014 BY KOREA TRUCKING ASSOCIATION All right reserverd" /></p>
				</div>
				<div class="footRight">
					<div class="familySite">
						<p class="arrow_up"><a href="#none"><img src="/images/truck/com/family_tit.gif" alt="관련사이트바로가기" /></a></p>
						<ul class="fsList">
							<li><a href="http://www.kta.or.kr" title="새창열림" target="_blank">전국화물자동차운송사업연합회</a></li>
							<li><a href="http://www.molit.go.kr/portal.do" title="새창열림" target="_blank">국토교통부</a></li>
							<li><a href="http://www.kidi.or.kr/ma/main.asp" title="새창열림" target="_blank">보험개발원</a></li>
							<li><a href="http://www.recaon.com" title="새창열림" target="_blank">리카온</a></li>
							<li><a href="http://www.fordrivers.or.kr" title="새창열림" target="_blank">화물운전자복지재단 </a></li>
							<li><a href="/infoLounge/dataCenter/recommandSite.do" title="새창열림" target="_blank">그 외 관련사이트</a></li>
						</ul>
					</div>
					<div class="mark">
						<!-- <a href="#;" title ="새창열림" target="_blank" class="a1"><img alt="웹접근성마크획득" src="/images/truck/com/kta_wah.gif"/></a> -->
						<span><img alt="KTA모바일QR코드" src="/images/truck/com/kta_moblie_qr.gif"/></span>
						<span>
							<script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=www.truck.or.kr&amp;size=XS&amp;use_flash=NO&amp;use_transparent=NO&amp;lang=ko"></script><br />
							<!-- <a href="http://www.verisign.com/products-services/security-services/ssl/ssl-information-center/" target="_blank" title="새창열림" style="font:bold 7px verdana,sans-serif">SSL &#51064;&#51613;&#49436; &#51221;&#48372;</a> -->
						</span>
					</div>
				</div>
			</div>
		</div>
				<!-- <table width="80" border="0" cellpadding="2" cellspacing="0" title="Click to Verify - This site chose Symantec SSL for secure e-commerce and confidential communications.">
							<tr>
								<td width="80" align="center" valign="top"><script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=www.truck.or.kr&amp;size=XS&amp;use_flash=NO&amp;use_transparent=NO&amp;lang=ko"></script><br />
								<a href="http://www.verisign.com/products-services/security-services/ssl/ssl-information-center/" target="_blank"  style="font:bold 7px verdana,sans-serif">SSL &#51064;&#51613;&#49436; &#51221;&#48372;</a></td>
							</tr>
						</table> -->
		
		
		<!-- 레이어팝업 s -->
		
		
		<div id="popupLayer" style="display:none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"></p>
					<p class="layerTit">자동로그아웃안내</p>
					<p class="layerTxt">고객님의 안전한 서비스 이용을 위해 로그인 후<br />약 10분 동안 서비스 이용이 없어 자동 로그아웃 되었습니다&#46;</p>
					<!-- 버튼 -->
					<div class="btnboxC clfix">
						<span class="btn_pack btn_type16"><a href="/login.do">다시 로그인</a></span>
						<span class="btn_pack btn_type17"><a href="/main/index.do">메인화면으로</a></span>
					</div>
				</div>
			</div>
		</div>
		<!--// 레이어팝업 e-->
		
	<div id="loading_page" style="width: 100%; position: fixed;top:0px; display: none;height: 100%;z-index: 1000;">
		<table style="width: 100%;height: 100%;z-index: 1001;position: fixed;"><tbody><tr><td>
			<img src="/images/ajax-loader.gif" id="loaderImg" style="left: 49%; position: absolute;" ali="로딩이미지" />
		</td></tr></tbody></table>
		<div style="width: 100%;height: 100%;background-color: white;position: fixed; opacity: 0.5;filter: progid:DXImageTransform.Microsoft.Alpha(opacity=40);filter: alpha(opacity=50);-ms-filter:progid:DXImageTransform.Microsoft.Alpha(opacity=50);" >
		</div>
	</div>
										
<!-- AceCounter Log Gathering Script V.72.2013010701 -->
<!-- <script language='javascript'>
if(typeof _GUL == 'undefined'){
var _GUL = 'gtp9.acecounter.com';var _GPT='8080'; var _AIMG = new Image(); var _bn=navigator.appName; var _PR = location.protocol=="https:"?"https://"+_GUL:"http://"+_GUL+":"+_GPT;if( _bn.indexOf("Netscape") > -1 || _bn=="Mozilla"){ setTimeout("_AIMG.src = _PR+'/?cookie';",1); } else{ _AIMG.src = _PR+'/?cookie'; };
document.writeln("<scr"+"ipt language='javascript' src='/acecounter/acecounter_V70.js'></scr"+"ipt>");
}
</script>
<noscript><img src='http://gtp9.acecounter.com:8080/?uid=AM2A38617057808&je=n&' border=0 width=0 height=0></noscript> -->
<!-- AceCounter Log Gathering Script End --> <!--// footer e -->

	</div>
	<!-- //wrap e -->
	<!-- 
	<form id="f" name="f" action="/join/input/regist.do" method="post">
		<input type="hidden" name="jumin1" value="" />
		<input type="hidden" name="jumin2" value="" />
		<input type="hidden" name="sName" value="" />
	</form>
	 -->
</body>
</html>