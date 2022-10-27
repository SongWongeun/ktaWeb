<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Kisinfo.Check.IPINClient"%>
<%@page import="NiceID.Check.CPClient"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<%

	String rURL = (String)request.getParameter("rURL");// 본인인증 후 이동할 URL.  url encoding 되어있음.
	
	/************************************
	휴대폰 본인인증 서비스 ( 안심본인인증)
	
	*********************************** */
    CPClient niceCheck = new  NiceID.Check.CPClient();
    
    String sSiteCodeHp = "G5143";				// NICE로부터 부여받은 사이트 코드
    String sSitePasswordHp = "WO2VPY6UTLBU";		// NICE로부터 부여받은 사이트 패스워드
    
    String sRequestNumberHp = "REQ0000000001";        	// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
                                                    	// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
    sRequestNumberHp = niceCheck.getRequestNO(sSiteCodeHp);
  	session.setAttribute("REQ_SEQ_HP" , sRequestNumberHp);	// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
  	
   	String sAuthTypeHp = "M";      	// 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
   	
   	String popgubunHp 	= "N";		//Y : 취소버튼 있음 / N : 취소버튼 없음
	String customizeHp 	= "";			//없으면 기본 웹페이지 / Mobile : 모바일페이지
		
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
   // String sReturnUrl = "http://localhost:8080/checkplus_success.do";      // 성공시 이동될 URL
  //  String sErrorUrl = "http://localhost:8080/checkplus_fail.do";          // 실패시 이동될 URL
   String sReturnUrlHp = "http://"+request.getServerName()+":8080/customer/eventSucc.do";      // 성공시 이동될 URL
   String sErrorUrlHp = "http://"+request.getServerName()+":8080/customer/eventFail.do";          // 실패시 이동될 URL

    // 입력될 plain 데이타를 만든다.
    String sPlainDataHp = "7:REQ_SEQ" + sRequestNumberHp.getBytes().length + ":" + sRequestNumberHp +
		                        "8:SITECODE" + sSiteCodeHp.getBytes().length + ":" + sSiteCodeHp +
		                        "9:AUTH_TYPE" + sAuthTypeHp.getBytes().length + ":" + sAuthTypeHp +
		                        "7:RTN_URL" + sReturnUrlHp.getBytes().length + ":" + sReturnUrlHp +
		                        "7:ERR_URL" + sErrorUrlHp.getBytes().length + ":" + sErrorUrlHp +
		                        "11:POPUP_GUBUN" + popgubunHp.getBytes().length + ":" + popgubunHp +
		                        "9:CUSTOMIZE" + customizeHp.getBytes().length + ":" + customizeHp;
    
    String sMessageHp = "";
    String sEncDataHp = "";
    
    int iReturnHp = niceCheck.fnEncode(sSiteCodeHp, sSitePasswordHp, sPlainDataHp);
    if( iReturnHp == 0 )
    {
        sEncDataHp = niceCheck.getCipherData();
    }
    else if( iReturnHp == -1)
    {
        sMessageHp = "암호화 시스템 에러입니다.";
    }    
    else if( iReturnHp == -2)
    {
        sMessageHp = "암호화 처리오류입니다.";
    }    
    else if( iReturnHp == -3)
    {
        sMessageHp = "암호화 데이터 오류입니다.";
    }    
    else if( iReturnHp == -9)
    {
        sMessageHp = "입력 데이터 오류입니다.";
    }    
    else
    {
        sMessageHp = "알수 없는 에러 입니다. iReturn : " + iReturnHp;
    }
%>




<!doctype html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="title" content="KTA | 전국화물자동차공제조합" />
    <title>KTA | 전국화물자동차공제조합</title>
    <link rel="stylesheet" type="text/css" href="/css/truck/font.css" />
    <link rel="stylesheet" type="text/css" href="/css/truck/base.css" />
    <link rel="stylesheet" type="text/css" href="/css/truck/event_good.css" />

    <script type="text/javascript" src="/js/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/js/truck/event_good.js"></script>	
	<title>event page</title>

	<!-- <link href="/bootStrap/stylesheets/application.css" media="screen" rel="stylesheet" type="text/css" /> -->
	<link href="/css/truck/admin.css" rel="stylesheet" type="text/css" />
	<!-- <script src="/bootStrap/javascripts/application.js" type="text/javascript"></script> -->
	<style type="text/css">
		html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
	</style>
	
	<script type="text/javaScript" >
		window.name ="Parent_window";
		$(document).ready(function(){
		<%-- hp 로그인 submit event --%>
		$('#alinkHp').on('click',function(e){
			e.preventDefault();
			window.open('', 'popupChkHp', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	
			document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
			
			document.form_chk.target = "popupChkHp";
			document.form_chk.param_r1.value = 'authenticate';
			document.form_chk.param_r2.value = '<%=rURL%>';
			document.form_chk.param_r3.value = 'HP';
			document.form_chk.submit();
		});
	});	
	</script>

</head>
<body> 

	<form id="form_chk" name="form_chk" method="post">
		<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
		<input type="hidden" name="EncodeData" value="<%= sEncDataHp %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	    <input type="hidden" name="param_r1" value="">
	    <input type="hidden" name="param_r2" value="">
	    <input type="hidden" name="param_r3" value="">
	</form>
		
    <div id="wrap_event">
        <header class="header_event">
            <h1>
                <img src="/images/truck/event/title_good.png" alt="화물공제조합과 KB국민카드가 함께하는 굿! 드라이버 : 화물차 60일 무사고 프로젝트">
            </h1>
        </header>

        <div class="cont_event">
            <form id='insertForm' name='insertForm'>
                <h3>
                    <label class="checkbox">
                        <input type="checkbox" id="chk00">
                        <span>개인정보 활용 전체 동의</span>
                    </label>
                </h3>
                <div class="agree_box">
                    <ul>
                        <li>
                            <label class="checkbox">
                                <input type="checkbox" id="chk01">
                                <span>개인정보 수집 및 이용 동의<i class="i_ess" >(필수)</i></span>
                            </label>
                            <button type="button" onclick="fnModalOpen(1)">상세보기</button>
                        </li>
                        <li>
                            <label class="checkbox">
                                <input type="checkbox"  id="chk02">
                                <span>개인정보의 제3자 제공 동의<i class="i_ess">(필수)</i></span>
                            </label>
                            <button type="button" onclick="fnModalOpen(2)">상세보기</button>
                        </li>
                    </ul>
                </div>
				<!--
				<p class="agree_all">
                    <label class="checkbox">
                        <input type="checkbox">
                        <span>개인정보 활용 전체 동의</span>
                    </label>
				</p>
				-->

                <h3>이벤트 참여 정보 입력</h3>
                <table class="event_table" summary="">
                    <colgroup>
                        <col width="120px">
                        <col width="*">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">차량번호<i class="ess">필수항목</i></th>
                            <td>
								<div class="inp_box">
									<input type="text" class="inp_carnum" id="carNoC" name="carNo" placeholder="공백 없이 입력해주세요">
									
									<button type="button" id="searchCrNm">조회하기</button>
									<p id="warn">화물공제조합에 공제계약을 유지중인 차량만 참여 가능합니다.</p>
								</div>
								
								<input type="hidden" name="carDtct" value="N">
                            </td>
                        </tr>
                        
                         <tr>
                            <th scope="row">본인인증<i class="ess">필수항목</i></th>
                            <td>
                            
								<div class="inp_box">
								  							  
									<button type="button" id="alinkHp">본인인증(PASS)</button>
									<p>본인인증(PASS)를 통해 차주명과 휴대폰번호 입력이 가능합니다.</p>
								</div>
                               
                               <input type="hidden"  name="di" value="" readonly >
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <th scope="row">차주명<i class="ess">필수항목</i></th>
                            <td>
                            
								<div class="inp_box">
								     <input type="text" class="inp_carnum" readonly name="name" >
								</div>
                                
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">휴대폰 번호<i class="ess">필수항목</i></th>
                            <td>
                                <input type="text" class="inp_carnum" value="" readonly  name="phone">
                                
                                <input type="checkbox" id="chkYN" name="smsYN"/>
                                <label for="chkYN">SMS(문자) 수신 동의</label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>

            <div class="btn_box">
                <button type="button" class="btn blue" id="submitBtn">이벤트 참여하기</button>
            </div>

            <h3>유의사항 안내</h3>
            <ul class="info_li">
                <li>본 이벤트는 1인당 1차량 본인인증(PASS) 기준 1회 참여할 수 있습니다.</li>
                <li>이벤트 참여 시 입력한 차량번호가 화물공제조합에 공제계약을 유지중이어야 합니다.</li>
                <li>이벤트 참여 시 입력한 차량이 무사고 실천기간 내 공제계약 해지, 휴대폰 번호 변경, 차량번호 변경 등 정보변경 시 혜택 제공 대상에서 제외됩니다.</li>
                <li>부정확한 차량번호 입력 시 혜택 제공 대상에서 제외될 수 있습니다.</li>
                <li>이벤트 당첨자 발표는 이벤트 종료 후 12월 중 홈페이지 내 발표되며, 경품은 이벤트 종료 및 추첨 후 12월 중 발송됩니다.</li>
                <li>경품에 대한 제세공과금은 KB국민카드에서 부담하며, 당첨가액은 당첨자 기타소득으로 포함됩니다.</li>
                <li class="add">(경품 당첨자에게는 제세공과금 신고를 위해 별도 개인정보 확인용 LMS 발송 예정이며, LMS 수신 후 15일 이내 응답이 없으면 당첨이 취소됩니다.)</li>
                <li>경품은 양도/양수가 되지 않으며, 타 상품으로 교환 및 환불이 불가합니다.</li>
                <li>경품은 SK모바일 주유상품권이며 당첨자 휴대폰으로 개별 발송됩니다.</li>
                <li>모바일 주유상품권의 유효기간은 발행일로부터 180일이며, 주유상품권의 유효기간 만료 후 기간 연장 및 재전송은 불가합니다.</li>
                <li>본 이벤트는 화물공제조합 및 KB국민카드의 영업정책 등에 따라 변경 또는 중단될 수 있습니다.</li>
            </ul>

            
        </div>

<!-- modal -->
<div class="modal m_agree1">
	<div class="modal_wrap">
		<div class="modal_inner">
			<div class="modal_header">
				<h1>개인정보 수집 및 이용동의서<i class="i_ess">(필수)</i></h1>
				<button type="button" onclick="fnModalClose()" class="close">닫기</button>
			</div>
			<div class="modal_conts">
				<div class="pre">
					<p class="mB15">전국화물자동차공제조합은 개인정보보호법 등 관련 법령에 의거하여, 개인정보를 수집&middot;이용함에 있어 정보주체로부터의 이용 동의 여부를 사전에 고지하고 있습니다. 정보주체가 되는 이용자께서는 아래 내용을 확인하시고, 동의 여부를 결정하여 주시기 바랍니다.</p>
					<ol class="agree_list">
						<li>
							<dl>
								<dt>1. 개인정보의 수집 및 이용 목적</dt>
								<dd>이벤트 신청, 당첨자 선정, 상품 및 경품지급 등 이벤트 진행과 당첨자의 게시에 활용</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>2. 수집하는 개인정보의 항목</dt>
								<dd>수집항목 : 이름, 전화번호(경품발송용), 차량번호, 주민등록번호(제세공과금 납부용)</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>3. 개인정보의 보유 및 이용 기간</dt>
								<dd>경품 전달 목적이 달성될 때까지 보유 및 이용
									<p class="adv">상법 등 법률 및 기타 관계 법령에 의해 요구되는 바에 따라 개인정보를 보유해야 할 필요가 있는 경우, 당사는 관계 법령에 따라 해당 개인정보를 보유하며, 오로지 해당 법령에 따른 목적으로만 이용됩니다.</p>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>4. 동의를 거부할 권리 및 동의 거부에 따른 안내</dt>
								<dd>이용자는 개인정보 수집에 대한 거부를 할 수 있습니다. 단, 동의하지 않을 경우 본 이벤트에 참여하실 수 없습니다.</dd>
							</dl>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal m_agree2">
	<div class="modal_wrap">
		<div class="modal_inner">
			<div class="modal_header">
				<h1>개인정보의 제3자 제공 동의<i class="i_ess">(필수)</i></h1>
				<button type="button" onclick="fnModalClose()" class="close">닫기</button>
			</div>
			<div class="modal_conts">
				<div class="pre">
					<ol class="agree_list">
						<li>
							<dl>
								<dt>1. 제공받는자</dt>
								<dd>텔코인 주식회사</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>2. 개인정보의 제3자 제공 목적</dt>
								<dd>경품지급(모바일쿠폰 발송) 및 제세공과금 대납</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>3. 제공하는 개인정보의 항목</dt>
								<dd>제공항목 : 이름, 전화번호(휴대폰), 주민등록번호</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>4. 개인정보를 제공받는 자의 개인정보 이용기간 및 보유기간</dt>
								<dd>경품지급 완료 시까지
									<p class="adv">개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.</p>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>5. 개인정보 제3자 제공에 대한 동의를 거부할 권리 및 동의 거부에 따른 안내</dt>
								<dd>이용자는 개인정보 제3자 제공에 대한 거부를 할 수 있습니다. 단, 동의하지 않을 경우 본 이벤트에 참여하실 수 없습니다.</dd>
							</dl>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
    </div>

</body>
</html>