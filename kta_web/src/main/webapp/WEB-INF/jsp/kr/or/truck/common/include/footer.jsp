<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
							<li><a href="/footer/Policy.do?ph_code=p"><img src="/images/truck/com/foot07.gif" alt="개인정보보호정책 " /></a></li>
							<li><a href="/footer/Policy.do?ph_code=e"><img src="/images/truck/com/foot08.gif" alt="이메일주소무단수집거부" /></a></li>
							<li><a href="/footer/Policy.do?ph_code=u"><img src="/images/truck/com/foot09.gif" alt="이용약관" /></a></li>
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
						<!--<span>
							<script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=www.truck.or.kr&amp;size=XS&amp;use_flash=NO&amp;use_transparent=NO&amp;lang=ko"></script><br />
							 <a href="http://www.verisign.com/products-services/security-services/ssl/ssl-information-center/" target="_blank" title="새창열림" style="font:bold 7px verdana,sans-serif">SSL &#51064;&#51613;&#49436; &#51221;&#48372;</a> 
						</span>-->
						<!--globalsign Certificate Mark-->
							<span id="ss_img_wrapper_110-55_flash_en"><a href="http://www.globalsign.com/" target=_blank><img alt="Globalsign SSL Site Seal" border=0 id="ss_img" src="//seal.globalsign.com/SiteSeal/images/gs_noscript_110-55_en.gif"></a></span><script type="text/javascript" src="//seal.globalsign.com/SiteSeal/gs_flash_110-55_en.js"></script>
						<!--globalsign Certificate Mark-->
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
		<%-- 자동로그아웃 ( 로그인시만 )  --%>
		 <%-- <c:if test="${not empty loginVO }">
			<script type="text/javascript">
			$(document).ready(function(){

				setTimeout("autoLogout();",30*60*1000);
				
				$('div#popupLayer a#closePopup').on('click',function(){
					$('div#popupLayer').hide();
				});
			}); 
			function autoLogout(){
				$.ajax({
					url: '/logout.do',
					dataType: "html",
					error: function( e) {
					},
					success : function( e ){
						$('div#popupLayer').show();
					}
				});
			} 
			</script>
		</c:if> --%>
		
		<div id="popupLayer" style="display:none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"><%-- <a id="closePopup" href="#;"><img src="/images/truck/com/close.gif" alt="팝업창닫기" /></a> --%></p>
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
<!-- AceCounter Log Gathering Script End --> 