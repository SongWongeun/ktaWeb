<%@page import="Kisinfo.Check.IPINClient"%>
<%@page import="NiceID.Check.CPClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
$(document).ready(function(){

	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			totalSearch();
			return false;
		}
	});
	
	$('input[name="agent_cd"]').on('change',function(e){
		
		var a = $('input[name="agent_cd"]:checked').val();
		
		if( a == '2' ){
			$('.infoCheck ul li').show();
			$('.infoCheck ul li:nth-child(2), .infoCheck ul li:nth-child(3)').hide();
		}else if( a == '3' ){
			$('.infoCheck ul li').show();
			$('.infoCheck ul li:last-child').hide();
		}else{
			$('.infoCheck ul li').show();
		}
	});
		
	$('a#certSubmit').on('click',function(e){
		
		var agent_cd = $('input[name="agent_cd"]:checked').val();
		var jumin1 = document.f.jumin1.value;
		var jumin2 = document.f.jumin2.value;
		var saupnum = document.f.s_idn1.value+document.f.s_idn2.value+document.f.s_idn3.value;
		$("#saupnum").val(saupnum);
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
					if(agent_cd == "1"||agent_cd == "3"){
						alert('입력하신 사업자번호로 이미 가입이 되어있습니다.');	
					}else{
						alert('입력하신 주민등록번호로 이미 가입이 되어있습니다.');
					}
					
				}else if(e.split("|")[0]=="exist"){
					var s = decodeURIComponent(e).split("|")[1];
					$("#agentNm").text(s);
					$("#typePopupLayer").show();
				}
			}
		});
	});
	
	$('a#closePopup').on('click',function(){
		$('#typePopupLayer').hide();
	});
	
	$("#checkPopup").on('click',function(){
		$('#typePopupLayer').hide();
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
		<div id="headerWrap" style="height:133px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA | 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<!-- <li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li> -->
						<!-- <li><a href="#;"><img src="/images/truck/main/util01.gif" alt="직원마당" /></a></li> -->
						
							
							
								<li><a href="/join/terms/view.do"><img src="/images/truck/main/util02.gif" alt="회원가입" /></a></li>
								<li><a href="/login.do"><img src="/images/truck/main/util03.gif" alt="로그인" /></a></li>
							 
						
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
							<span class="ut_search"><label for="">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
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
 						<h2><img src="/images/truck/net/join_tit.gif" alt="회원가입" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>회원가입</span>
					</div>
				</div><!--// conTitle e -->
	
				<!-- 20161130 신규 -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/join_con_tit03.gif" alt="화물공제조합 방문을 환영합니다. 회원가입을 위해서 사업자 정보를 입력하여 주시기 바랍니다." /></p>
					<div class="joinStep">
						<img src="/images/truck/net/img_join_step03.gif" alt="약관동의, 실명인증, 사업자 정보확인, 회원정보 확인 중 사업자 정보확인 단계" />
					</div>
			
					<div class="certifyArea">
						<div class="btnboxC">
							<img src="/images/truck/net/img_check_desc02.gif" alt="약관동의, 실명인증, 사업자 정보확인, 회원정보 입력 중 실명인증 단계" />
						</div>
						<br />
						<div class="roundBox certifyBox">
							<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<!-- 20161214 수정 -->
							<div class="infoCheck">
							<h3>회원정보 확인</h3>
							<form id="f" name="f" method="post" action="/join/input/regist.do">
							<ul>
								<li class="rdBox">
									<label class="pL5" style="margin-right:23px;"><input type="radio" id="agent_cd" name="agent_cd" checked="checked" value='1' />조합원</label>
									<label class="pL5" style="margin-right:23px;"><input type="radio" id="agent_cd" name="agent_cd" value='2'/>차량관리자(지입차주)</label>
									<label class="pL5" style="margin-right:23px;"><input type="radio" id="agent_cd" name="agent_cd" value='3'/>거래처</label>
								</li>
								<li>
									<label>
										<strong>사업자번호</strong>
										<input name="s_idn1" class="txt" id="s_idn1" type="text" style="width:83px" maxlength=3/> -
										<input name="s_idn2" class="txt" id="s_idn2" type="text" style="width:71px" maxlength=2/> -
										<input name="s_idn3" class="txt" id="s_idn3" type="text" style="width:108px" maxlength=5/>
									</label>
								</li>
								<li>
									<label>
										<strong>지부선택</strong>
										<select id="gyeyak_jibu" name="gyeyak_jibu" title="지부선택" style="width:327px">
											<option value="">지부선택</option>
											<option value="02">서울</option>
											<option value="03">부산</option>
											<option value="04">대구</option>
											<option value="05">인천</option>
											<option value="06">광주</option>
											<option value="07">대전</option>
											<option value="08">울산</option>
											<option value="09">경기</option>
											<option value="10">강원</option>
											<option value="11">충북</option>
											<option value="12">충남</option>
											<option value="13">전북</option>
											<option value="14">전남</option>
											<option value="15">경북</option>
											<option value="16">경남</option>
											<option value="17">제주</option>
											<option value="18">직할</option>
										</select>
									</label>
								</li>
							</ul>
						</div>
							<input type="hidden" name="jumin1" value="${joinVO.jumin1 }" />
							<input type="hidden" name="jumin2" value="${joinVO.jumin2 }" />
							<input type="hidden" name="sName" value="${joinVO.sName }" />
							<input type="hidden" id="saupnum" name="saupnum" value="" />
							</form>
							<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 20161208 추가 -->
						<div class="btnboxC">
							<a href="#;" id='certSubmit'><img src="/images/truck/btn/btn_confirm.gif" alt="확인" /></a>
						</div>
						<!-- //20161208 추가 -->
					</div>
				</div><!--// conaArea e -->
				<!-- //20161130 신규 -->


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


		<!-- 사업자,실명으로 이미 가입시 알림창 -->
			<div id="typePopupLayer" style="display:none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"><a id="closePopup" href="#;"><img src="/images/truck/com/close.gif" alt="팝업창닫기"></a></p>
					
					<div class="layerA" style="padding:10px !important; font-size:17px;">
						<strong id="agentNm" style="color:blue"></strong> 로(으로) 회원가입이 되어있습니다. <br/>
						 기존 ID로 로그인 후 인터넷창구의 조합원 관리에서<br/>
						 해당 사업자 정보를 추가해 주시기 바랍니다<br/>
						 ID를 모르는경우 ID찾기를 통해 아이디를 확인 하시기 바랍니다.
					</div>
					<div class="btnboxC clfix">
								<span class="btn_pack btn_type16"><a id="checkPopup" href="#;">확인</a></span>
					</div>
				</div>
			</div>
		</div>
		<!-- //사업자,실명으로 이미 가입시 알림창 -->
		
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