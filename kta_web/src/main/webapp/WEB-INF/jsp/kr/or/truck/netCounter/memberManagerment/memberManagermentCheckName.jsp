<%@page import="Kisinfo.Check.IPINClient"%>
<%@page import="NiceID.Check.CPClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<link rel="stylesheet" type="text/css" href="/css/truck/ui_codedesign.css"/>
<link rel="stylesheet" type="text/css" href="/css/truck/sub_codedesign.css" />
<link rel="stylesheet" type="text/css" href="/css/truck/subindex_codedesign.css" />
<link rel="stylesheet" type="text/css" href="/css/truck/bbs.css" />
<link rel="stylesheet" type="text/css" href="/css/truck/popup_codedesign.css" />
<%
	HttpSession s = request.getSession(true);
	s.putValue("NmChkSec","98u9iuhuyg87");
%>
<script type="text/javascript" src="/js/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/js/truck/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	if('${accordJumin}'=='NO'){
		alert("가입 시 입력한 대표자 정보와 일치하지 않습니다. <br/>현재 가입 된 아이디와 대표자가 동일한 경우에만 추가가 가능합니다.");
	}
	
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchForm();
			return false;
		}
	});

	$('a#certSubmit').on('click',function(e){
		
		var agent_cd = $('input[name="agent_cd"]:checked').val();
		var jumin1 = document.f.jumin1.value;
		var jumin2 = document.f.jumin2.value;
		var saupnum = document.f.s_idn1.value+document.f.s_idn2.value+document.f.s_idn3.value;
		var gyeyak_jibu = document.f.gyeyak_jibu.value;
		
		if(agent_cd=="1"||agent_cd=="3"){
			if( !/\d{10}/g.test( saupnum ) ){
				alert('사업자번호를 정확히 입력해주세요.');
				$('input#s_idn1').focus();
				return false;
			}
		}
		if(agent_cd=="1"){
			if(gyeyak_jibu==""){
				alert('지부를 선택 해주세요.');
				return false;
			}
		}
		
		$.ajax({
			url: '/join/terms/viewChk.do',
			dataType: "html",
			data : {
				"agent_cd": agent_cd
    	       , "jumin1" : jumin1
               , "jumin2" : jumin2
               , "saupnum" : saupnum
               , "gyeyak_jibu" : gyeyak_jibu
			},
			error: function( e) {
			},
			success : function( e ){
				//console.log(e);
				if(e=="truetrue"){
					document.f.saupnum.value = saupnum;
					document.f.submit();
				}else if(e=="falsetrue"){
					alert('입력하신 사업자번호와 주민번호가 \n화물공제조합에 등록이 되어있지 않거나 \n일치하지 않습니다.');
				}else if(e=="truefalse"||e=="falsefalse"){
					alert('입력하신 사업자번호로 이미 가입이 되어있습니다.');
				}
			}
		});
	});
});


function totalSearch(){
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


//실명확인 function 
function fnSubmit()
{
	with(document.form1)
	{
		if (jumin1.value.length != 6 )
		{
			alert('주민번호를 확인하세요.');
			jumin1.focus();
			return;
		}

		if (jumin2.value.length != 7 )
		{
			alert('주민번호를 확인하세요.');
			jumin2.focus();
			return;
		}

		
		if ( name.value == '' )
		{
			alert('성명을 입력하십시요.');
			name.focus();
			return;
		}
	}
	
	document.form1.action = "/nc_memberManagerment.do";
	document.form1.submit();
}
function hitEnterKey(e){
	if(e.keyCode == 13){
		fnSubmit();
		return false;
	}
} 
</script>
<style type="text/css">
	#typePopupLayer{
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
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do">인터넷창구</a>
						<span>조합원관리</span>
					</div>
				</div><!--// conTitle e -->

				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/union_con_tit02.gif" alt="회원가입된 사업자 이외에 사업자를 추가로 등록하실 수 있습니다." /></p>

					<div class="certifyArea">
						<div class="btnboxC">
							<img src="/images/truck/net/img_check_desc.gif" alt="약관동의, 실명인증, 사업자 정보확인, 회원정보 입력 중 실명인증 단계" />
						</div>
						<br />
						<div class="roundBox certifyBox">
							<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<h3>실명인증</h3>
							<form name='form1' method='post'>
							<ul>
								<li>
									<label>
										<strong>이름(한글실명)</strong>
										<input name="name" class="txt" id="" type="text" style="width:310px" />
									</label>
								</li>
								<li>
									<label>
										<strong>주민등록번호</strong>
										<input name="jumin1" class="txt" id="" type="text" style="width:140px" maxlength=6 /> -
										<input name="jumin2" class="txt" id="" type="password" style="width:140px" maxlength=7/>
									</label>
								</li>
							</ul>
							</form>
							<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<div class="btnboxR">
							<a href="javascript:fnSubmit();"><img src="/images/truck/btn/btn_certify_name.gif" alt="실명 확인" /></a>
						</div>
						<div class="btnboxC" style="margin-top: 50px;">
							<img src="/images/truck/net/img_join_step02_desc02.gif" alt="약관동의, 실명인증, 사업자 정보확인, 회원정보 입력 중 실명인증 단계" />
							<!-- //20161208 추가
							<ul class="txtPoint12">
								<li class="grenBar">당 사이트는 회원 여러분의 개인정보보호를 위해 최선을 다하고 있습니다.</li>
								<li class="grenBar">당 사이트에서는 원활한 서비스 이용과 익명사용자로 인한 명예훼손 등의 피해를 방지하기 위하여 회원 가입 실명제를 원칙으로 하고 있습니다.</li>
								<li class="grenBar">관련법률에 따라 다른 사람의 주민등록번호를 도용하여 인터넷 서비스에 가입하는 경우는 명백한 범죄행위로 3년 이하의 징역 또는 1천만원 이하의<br />벌금에 처해지므로 반드시 본인 실명으로만 가입해 주시기 바랍니다.</li>
							</ul>
							<ul class="txtPoint12 mT25">
								<li>
									<span class="grenBar">당 사이트의 실명확인은 나이스신용평가정보㈜의 실명확인 서비스를 통해 이루어 집니다.</span>
									<ul>
										<li>-실명확인 시 입력되는 주민등록번호는 고객의 실명확인을 위한 이름과 주민등록번호의 일치여부 확인에만 이용되며 당 사이트에는 주민등록번호를 저장하지 않습니다.</li>
										<li>-실명확인에 대한 문의가 있으신 분은 나이스신용평가정보㈜의 실명확인 콜 센터에 문의 주시기 바랍니다.</li>
									</ul>
								</li>
							</ul>
							 -->
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


		<!-- 회원체크부분(레이어팝업) -->
		<div id="typePopupLayer" style="display:none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"><a id="closePopup" href="#;"><img src="/images/truck/com/close.gif" alt="팝업창닫기"></a></p>
					<p class="layerTit">회원유형 및 회원정보 확인</p>
					<p class="layerTxt">
						회원유형을 선택하여 필요한 정보를 입력해주세요&#46;<br/> 
					</p>
					<div class="layerA">
						<form id="f" name="f" method="post" action="/join/input/regist.do">
							<table class="tbIn_st01" style="">
								<caption>입찰공문내용</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:70%;" />
								</colgroup>
								<tbody>
									<tr style="height: 40px;">
										<th>
											회원유형
										</th>
										<td>
											<input type="radio" id="agent_cd" name="agent_cd" value="1" checked="checked" /><label for="agent_cd" class="pL5" style="margin-right:20px;">조합원</label>
											<input type="radio" id="agent_cd" name="agent_cd" value="2" /><label for="agent_cd" class="pL5" style="margin-right:20px;">차량관리자</label>
											<input type="radio" id="agent_cd" name="agent_cd" value="3" /><label for="agent_cd" class="pL5" style="margin-right:20px;">거래처</label>
										</td>
									</tr>
									<tr id="cert_saup" style="height: 40px;">
										<th>
											사업자번호
										</th>
										<td>
											<label class="hide" for="idn1">사업자번호 첫번째</label>
											<input name="s_idn1" class="txt alC" id="s_idn1" type="text" value="" maxlength="3" style="width:40px;"/>
											<span>&#45;</span>
											<label class="hide" for="idn1">사업자번호 두번째</label>
											<input name="s_idn2" class="txt alC" id="s_idn2" type="text" value="" maxlength="2" style="width:30px;"/>
											<span>&#45;</span>
											<label class="hide" for="idn1">사업자번호 세번째</label>
											<input name="s_idn3" class="txt alC" id="s_idn3" type="text" value="" maxlength="5" style="width:50px;"/>
										</td>
									</tr>
									<tr id="jibuSelect" style="height: 40px;">
										<th>
											지부선택 : 
										</th>
										<td>
											<label class="hide" for="gyeyak_jibu">계약지부</label>
											<select id="gyeyak_jibu" name="gyeyak_jibu" path="gyeyak_jibu" class="txt" style="width:100px"  title="지부선택">
												<option value="">지부선택</option>
												<option value="01">본부</option><option value="02">서울</option><option value="03">부산</option><option value="04">대구</option><option value="05">인천</option><option value="06">광주</option><option value="07">대전</option><option value="08">울산</option><option value="09">경기</option><option value="10">강원</option><option value="11">충북</option><option value="12">충남</option><option value="13">전북</option><option value="14">전남</option><option value="15">경북</option><option value="16">경남</option><option value="17">제주</option><option value="18">직할</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btnboxC clfix">
								<span class="btn_pack btn_type16"><a id="certSubmit" href="#;">확인</a></span>
							</div>
							<input type="hidden" name="jumin1" value="" />
							<input type="hidden" name="jumin2" value="" />
							<input type="hidden" name="sName" value="" />
							<input type="hidden" name="saupnum" value="" />
						</form>
						<!-- 
						<form id="f" name="f" method="post" action="/join/input/regist.do"> 
							<p class="pB10" style="font-size:18px;font-weight: bolder;">
								<input type="radio" id="agent_cd" name="agent_cd" value="1" checked="checked" /><label for="agent_cd" class="pL5" style="margin-right:20px;">조합원</label>
								<input type="radio" id="agent_cd" name="agent_cd" value="2" /><label for="agent_cd" class="pL5" style="margin-right:20px;">차량관리자</label>
								<input type="radio" id="agent_cd" name="agent_cd" value="3" /><label for="agent_cd" class="pL5" style="margin-right:20px;">거래처</label>
							</p>
							<p id="cert_saup" style="padding-bottom: 10px !important;">
								<label class="hide" for="idn1">사업자번호 첫번째</label>
								<input name="s_idn1" class="txt alC" id="s_idn1" type="text" value="" maxlength="3" style="width:40px;"/>
								<span>&#45;</span>
								<label class="hide" for="idn1">사업자번호 두번째</label>
								<input name="s_idn2" class="txt alC" id="s_idn2" type="text" value="" maxlength="2" style="width:30px;"/>
								<span>&#45;</span>
								<label class="hide" for="idn1">사업자번호 세번째</label>
								<input name="s_idn3" class="txt alC" id="s_idn3" type="text" value="" maxlength="5" style="width:50px;"/>
							</p>
							<p id="jibuSelect">
								지부선택 : 
								<label class="hide" for="gyeyak_jibu">계약지부</label>
								<select id="gyeyak_jibu" name="gyeyak_jibu" path="gyeyak_jibu" class="txt" style="width:100px"  title="지부선택">
									<option value="">지부선택</option>
									<option value="01">본부</option><option value="02">서울</option><option value="03">부산</option><option value="04">대구</option><option value="05">인천</option><option value="06">광주</option><option value="07">대전</option><option value="08">울산</option><option value="09">경기</option><option value="10">강원</option><option value="11">충북</option><option value="12">충남</option><option value="13">전북</option><option value="14">전남</option><option value="15">경북</option><option value="16">경남</option><option value="17">제주</option><option value="18">직할</option>
								</select>
							</p>
							<div class="btnboxC clfix">
								<span class="btn_pack btn_type16"><a id="certSubmit" href="#;">확인</a></span>
							</div>
							<input type="hidden" name="jumin1" value="" />
							<input type="hidden" name="jumin2" value="" />
							<input type="hidden" name="sName" value="" />
							<input type="hidden" name="saupnum" value="" />
						</form>
						 -->
					</div>
				</div>
			</div>
		</div>
		<!-- 회원체크부분(레이어팝업) 종료 -->
		
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