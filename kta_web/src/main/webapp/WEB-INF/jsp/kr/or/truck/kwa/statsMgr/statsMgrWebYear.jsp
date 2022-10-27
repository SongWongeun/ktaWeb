<%@page import="egovframework.com.utl.fcc.service.EgovStringUtil"%>
<%@page import="egovframework.com.utl.fcc.service.EgovDateUtil"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
<!-- Always force latest IE rendering engine or request Chrome Frame -->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800">
<!-- Use title if it's in the page YAML frontmatter -->
<title>KTA Admin page</title>

<link href="/bootStrap/stylesheets/application_statistics.css" media="all" rel="stylesheet" type="text/css" />

<script src="/js/jquery/jquery-1.10.2.min.js"></script>
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>

<style>
        .sine-chart .tip .text{
            background: #465866;
            color: #fff;
            padding: 5px 10px;
            border: 1px solid #fff;
            border-radius: 2px;
        }
        
       .sine-chart .tip .arrow{
       	height:6px;
       	background: url("/webPonent-Chart/image/tooltip_arrow.png") no-repeat center top; 
       	margin-top: -1px; 
       	font-size: 6px;
        }
 </style>
 
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
.main.l2 rect{fill: #4da944;}
.main.l3 rect{fill: #f26522;}
.main.l4 rect{fill: #c6080d;}
.main.l5 rect{fill: #672d8b;}
.main.l6 rect{fill: #ce1797;}
button.btn:hover{background:#3c91bc !important;box-shadow: inset 0 1px 2px #6eb0d1 !important;border: 1px solid #337ca1 !important;color: #fff !important;}

</style>

</head>

<body>


<!-- header s -->
<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
<c:import url="/kwa/common/left.do"></c:import>
<!--// left e -->


<div class="main-content">
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						홈페이지 접속 통계
					</h3>
				</div>
			</div>
		</div>
	</div>

 

	<div class="container" style="max-width: none;width:1460px;padding:0px;">
		<div class="col-md-12 padded">
			<div class="box">
			
				<div class="box-header">
					<ul class="nav nav-tabs nav-tabs-left">
						<li class="active"><a href="#sts_year" data-toggle="tab">년별 통계</a></li>
						<li class=""><a href="#sts_month" data-toggle="tab">월별 통계</a></li>
						<li class=""><a href="#sts_day" data-toggle="tab">일별 통계</a></li>
					</ul>
				</div>
<%
String today = EgovDateUtil.getToday(); 
//int cY = 2020;//Integer.parseInt( today.substring(0, 4) );
int cY = Integer.parseInt( today.substring(0, 4) );
int cM = Integer.parseInt( today.substring(4, 6) );

String reqYear = EgovStringUtil.isEmpty(request.getParameter("year"))?""+"":request.getParameter("year");
String reqMonth = EgovStringUtil.isEmpty(request.getParameter("month"))?cM+"":request.getParameter("month");
%>				
				<div class="box-content padded">
					<div class="tab-content">
						<div class="tab-pane active" id="sts_year" >
							<button class="btn btn-lg btn-default year" y="">전체</button>
							<%for(int i=2014;i<=cY;i++){ //2014년 부터 %>
								<button class="btn btn-lg btn-default year" y="<%=i%>"><%=i%>년</button>
							<%} %>
						</div>
						<div class="tab-pane"  id="sts_month">
							<%for(int i=2014;i<=cY;i++){ //2014년 부터 %>
								<button class="btn btn-lg btn-default year" y="<%=i%>"><%=i%>년</button>
							<%} %>
						</div>
						<div class="tab-pane"  id="sts_day">
							<%for(int i=2014;i<=cY;i++){ //2014년 부터 %>
								<button class="btn btn-lg btn-default year" y="<%=i%>"><%=i%>년</button>
							<%} %>
							<hr style="margin: 10px auto;display:none;" />
							<button class="btn btn-default month" m="01" style="display:none;" >1월</button>
							<button class="btn btn-default month" m="02" style="display:none;" >2월</button>
							<button class="btn btn-default month" m="03" style="display:none;" >3월</button>
							<button class="btn btn-default month" m="04" style="display:none;" >4월</button>
							<button class="btn btn-default month" m="05" style="display:none;" >5월</button>
							<button class="btn btn-default month" m="06" style="display:none;" >6월</button>
							<button class="btn btn-default month" m="07" style="display:none;" >7월</button>
							<button class="btn btn-default month" m="08" style="display:none;" >8월</button>
							<button class="btn btn-default month" m="09" style="display:none;" >9월</button>
							<button class="btn btn-default month" m="10" style="display:none;" >10월</button>
							<button class="btn btn-default month" m="11" style="display:none;" >11월</button>
							<button class="btn btn-default month" m="12" style="display:none;" >12월</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
var curruntYear = <%=cY%>;
var currentMonth = <%=cM%>;
	
<%-- 
	현재 월 세팅
	- 현재년 보다 적을 경우는 전체 월을 보여줌.
	- 현재년 과 같으면 현재 월 까지만 보여줌.  
--%>
function fnSetMonth(selectedYear){
	if( selectedYear == undefined || selectedYear == '' ) {
		selectedYear = curruntYear;
	}
	if( selectedYear < curruntYear ){
		$('#sts_day .month').show();
	}else if( selectedYear == curruntYear ){
		$('#sts_day .month').hide();
		for(var k=0;k<currentMonth;k++){
			$('#sts_day .month:eq('+k+')').show();
		}
	}
	
	<%-- 일별통계 탭의 선택월에서 사용--%>
	$('#sts_day').attr('y',selectedYear);
	$('#sts_day > hr').show();
};
	
$(document).ready(function(){
	
	<%-- 선택년,월 세팅 --%>
	$('#sts_year .year[y="<%=reqYear%>"]').removeClass('btn-default').addClass('btn-red');
	
	
	/* start:년별통계 버튼설정 */
	$('#sts_year .year').each(function(){
		$(this).on('click',function(){
			//선택버튼 강조
			$('#sts_year .year').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			
			var y = $(this).attr('y');
			location.href = '/kwa/statsMgr/web/year.do?year='+y;
		});
	});

	/* end:년별통계 버튼설정 */
	/* start:월별통계 버튼설정 */
	$('#sts_month .year').each(function(){
		$(this).on('click',function(){
			//선택버튼 강조
			$('#sts_month .year').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			
			var y = $(this).attr('y');
			location.href = '/kwa/statsMgr/web/month.do?year='+y;
		});
	});
	/* end:월별통계 버튼설정 */
	/* start:일별통계 버튼설정 */
	$('#sts_day .year').each(function(){
		$(this).on('click',function(){
			fnSetMonth( $(this).attr('y') );
			//선택버튼 강조
			$('#sts_day .year').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
		});
	});
	$('#sts_day .month').each(function(){
		$(this).on('click',function(){
			//선택버튼 강조
			$('#sts_day .month').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			
			var y = $('#sts_day').attr('y');
			var m = $(this).attr('m');
			location.href = '/kwa/statsMgr/web/day.do?year='+y+'&month='+m;
		});
	});
	

	/* end:일별통계 버튼설정 */
    var tt = document.createElement('div'),
    leftOffset = -($('html').css('padding-left').replace('px', '') + $('body').css('margin-left').replace('px', '')),
    topOffset = -32;
	tt.className = 'ex-tooltip';
	document.body.appendChild(tt);
	
});
</script>

	<div class="container" style="max-width: none;width:1300px;padding:0px;">
		<div class="col-md-12 padded"> 
			<div class="box">
				<div class="box-header"><span class="title">인터넷창구</span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics1"></div>
				</div>
			</div>
		</div>

		<div class="col-md-12 padded">
			<div class="box">
				<div class="box-header"><span class="title">정보마당 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics2"></div>
				</div>
			</div>
		</div>
		
		<div class="col-md-6 padded">
			<div class="box">
				<div class="box-header"><span class="title">공제상품 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics3"></div>
				</div>
			</div>
		</div>
		
		<div class="col-md-6 padded">
			<div class="box">
				<div class="box-header"><span class="title">고객광장 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics4"></div>
				</div>
			</div>
		</div>
		
		<div class="col-md-6 padded">
			<div class="box">
				<div class="box-header"><span class="title">조합소개 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics5"></div>
				</div>
			</div>
		</div>
		
		<div class="col-md-6 padded">
			<div class="box">
				<div class="box-header"><span class="title">정보마당 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics6"></div>
				</div>
			</div>
		</div>
		
		<script src="/webPonent-Chart/lib/comm/raphael.js"></script>
		<script src="/webPonent-Chart/lib/comm/webponent.comm.common.js"></script>
		<script src="/webPonent-Chart/lib/chart/webponent.chart.js"></script>

		<script>
			<%
				// 
				Map<String, Map<String, Object>> rMap = (Map<String, Map<String, Object>>)request.getAttribute("rMap");
			%>
	
			var options1 = {
				data : {
					data : [
							{ "y":<%=rMap.get("0_서브메인")==null?0:rMap.get("0_서브메인").get("CNT")%>, "x":"서브메인" },
	                        { "y":<%=rMap.get("0_마이페이지")==null?0:rMap.get("0_마이페이지").get("CNT")%>, "x":"마이페이지" },
	                        { "y":<%=rMap.get("0_계약조회")==null?0:rMap.get("0_계약조회").get("CNT")%>, "x":"계약조회" },
	                        { "y":<%=rMap.get("0_보상정보조회")==null?0:rMap.get("0_보상정보조회").get("CNT")%>, "x":"보상정보조회" },
	                        { "y":<%=rMap.get("0_지급내역조회")==null?0:rMap.get("0_지급내역조회").get("CNT")%>, "x":"지급내역조회" },
	                        { "y":<%=rMap.get("0_회원정보관리")==null?0:rMap.get("0_회원정보관리").get("CNT")%>, "x":"회원정보관리" },
	                        { "y":<%=rMap.get("0_증명서발급")==null?0:rMap.get("0_증명서발급").get("CNT")%>, "x":"증명서발급" },
	                        { "y":<%=rMap.get("0_조합원관리")==null?0:rMap.get("0_조합원관리").get("CNT")%>, "x":"조합원관리" },
	                        { "y":<%=rMap.get("7_만기안내비밀번호변경")==null?0:rMap.get("7_만기안내비밀번호변경").get("CNT")%>, "x":"만기안내비밀번호변경" }
	                        
	                        
		               ]	
				},
				format: {
			        xAxis: function(value){
						return value;
			        },
			        yAxis: function(value){
			            return String(value).format(); 
			        }
			    },
			    func: {
			        tip: function(tipElement, data, rect) {
			            var date = data.xaxis;
			            var tip = '<div class="text">' + date + ' : ' + String(data.yaxis).format()+'건 </div>';
			            tipElement.html(tip).show();
			            
						var arrow = '<div class="arrow" style="width: '+tipElement.width() + 'px;"></div>';

						tipElement.html(tipElement.html() + arrow).css({
							left: rect.x - (tipElement.width() / 2), top: rect.y - 35
						});
			        }
			    },
			    use: {
			        animate: true,
			        aCrossLine: false
			    }
			};
			
			var options2 = {
					data : {
						data : [
								{ "y":<%=rMap.get("1_서브메인")==null?0:rMap.get("1_서브메인").get("CNT")%>, "x":"서브메인" },
		                        { "y":<%=rMap.get("1_공제소식")==null?0:rMap.get("1_공제소식").get("CNT")%>, "x":"공제소식" },
		                        { "y":<%=rMap.get("1_보험소식")==null?0:rMap.get("1_보험소식").get("CNT")%>, "x":"보험소식" },
		                        { "y":<%=rMap.get("1_입찰공고")==null?0:rMap.get("1_입찰공고").get("CNT")%>, "x":"입찰공고" },
		                        { "y":<%=rMap.get("1_장학사업")==null?0:rMap.get("1_장학사업").get("CNT")%>, "x":"장학사업" },
		                        { "y":<%=rMap.get("1_관련사이트")==null?0:rMap.get("1_관련사이트").get("CNT")%>, "x":"관련사이트" },
		                        { "y":<%=rMap.get("1_우수협력정비업체")==null?0:rMap.get("1_우수협력정비업체").get("CNT")%>, "x":"우수협력정비업체" }
			               ]	
					},
					format: {
				        xAxis: function(value){
							return value;
				        },
				        yAxis: function(value){
				            return String(value).format(); 
				        }
				    },
				    func: {
				        tip: function(tipElement, data, rect) {
				            var date = data.xaxis;
				            var tip = '<div class="text">' + date + ' : ' + String(data.yaxis).format()+'건 </div>';
				            tipElement.html(tip).show();
				            
							var arrow = '<div class="arrow" style="width: '+tipElement.width() + 'px;"></div>';

							tipElement.html(tipElement.html() + arrow).css({
								left: rect.x - (tipElement.width() / 2), top: rect.y - 35
							});
				        }
				    },
				    use: {
				        animate: true,
				        aCrossLine: false
				    }
				};
			
			var options3 = {
					data : {
						data : [
								{ "y":<%=rMap.get("2_서브메인")==null?0:rMap.get("2_서브메인").get("CNT")%>, "x":"서브메인" },
		                        { "y":<%=rMap.get("2_가입안내")==null?0:rMap.get("2_가입안내").get("CNT")%>, "x":"가입안내" },
		                        { "y":<%=rMap.get("2_상품안내")==null?0:rMap.get("2_상품안내").get("CNT")%>, "x":"상품안내" },
		                        { "y":<%=rMap.get("2_보증상품")==null?0:rMap.get("2_보증상품").get("CNT")%>, "x":"보증상품" },
		                        { "y":<%=rMap.get("2_보상안내")==null?0:rMap.get("2_보상안내").get("CNT")%>, "x":"보상안내" },
		                        { "y":<%=rMap.get("2_보상관련정보")==null?0:rMap.get("2_보상관련정보").get("CNT")%>, "x":"보상관련정보" },
		                        { "y":<%=rMap.get("2_공제약관")==null?0:rMap.get("2_공제약관").get("CNT")%>, "x":"공제약관" },
		                        { "y":<%=rMap.get("2_콘센터안내")==null?0:rMap.get("2_콘센터안내").get("CNT")%>, "x":"콜센터안내" }
			               ]	
					},
					format: {
				        xAxis: function(value){
							return value;
				        },
				        yAxis: function(value){
				            return String(value).format(); 
				        }
				    },
				    func: {
				        tip: function(tipElement, data, rect) {
				            var date = data.xaxis;
				            var tip = '<div class="text">' + date + ' : ' + String(data.yaxis).format()+'건 </div>';
				            tipElement.html(tip).show();
				            
							var arrow = '<div class="arrow" style="width: '+tipElement.width() + 'px;"></div>';

							tipElement.html(tipElement.html() + arrow).css({
								left: rect.x - (tipElement.width() / 2), top: rect.y - 35
							});
				        }
				    },
				    use: {
				        animate: true,
				        aCrossLine: false
				    }
				};
			
			var options4 = {
					data : {
						data : [
								{ "y":<%=rMap.get("3_서브메인")==null?0:rMap.get("3_서브메인").get("CNT")%>, "x":"서브메인" },
		                        { "y":<%=rMap.get("3_문의안내")==null?0:rMap.get("3_문의안내").get("CNT")%>, "x":"문의안내" },
		                        { "y":<%=rMap.get("3_자주하는질문")==null?0:rMap.get("3_자주하는질문").get("CNT")%>, "x":"자주하는 질문" },
		                        { "y":<%=rMap.get("3_고객문의")==null?0:rMap.get("3_고객문의").get("CNT")%>, "x":"고객문의" },
		                        { "y":<%=rMap.get("3_칭찬합시다")==null?0:rMap.get("3_칭찬합시다").get("CNT")%>, "x":"칭찬합시다" },
		                        { "y":<%=rMap.get("3_자료실")==null?0:rMap.get("3_자료실").get("CNT")%>, "x":"자료실" }
			               ]	
					},
					format: {
				        xAxis: function(value){
							return value;
				        },
				        yAxis: function(value){
				            return String(value).format(); 
				        }
				    },
				    func: {
				        tip: function(tipElement, data, rect) {
				            var date = data.xaxis;
				            var tip = '<div class="text">' + date + ' : ' + String(data.yaxis).format()+'건 </div>';
				            tipElement.html(tip).show();
				            
							var arrow = '<div class="arrow" style="width: '+tipElement.width() + 'px;"></div>';

							tipElement.html(tipElement.html() + arrow).css({
								left: rect.x - (tipElement.width() / 2), top: rect.y - 35
							});
				        }
				    },
				    use: {
				        animate: true,
				        aCrossLine: false
				    }
				};
			
			var options5 = {
					data : {
						data : [
								{ "y":<%=rMap.get("4_서브메인")==null?0:rMap.get("4_서브메인").get("CNT")%>, "x":"서브메인" },
		                        { "y":<%=rMap.get("4_인사말")==null?0:rMap.get("4_인사말").get("CNT")%>, "x":"인사말" },
		                        { "y":<%=rMap.get("4_공제조합소개")==null?0:rMap.get("4_공제조합소개").get("CNT")%>, "x":"공제조합소개" },
		                        { "y":<%=rMap.get("4_윤리경영")==null?0:rMap.get("4_윤리경영").get("CNT")%>, "x":"윤리경영" },
		                        { "y":<%=rMap.get("4_채용안내")==null?0:rMap.get("4_채용안내").get("CNT")%>, "x":"채용안내" },
		                        { "y":<%=rMap.get("4_지부안내")==null?0:rMap.get("4_지부안내").get("CNT")%>, "x":"지부안내" },
		                        { "y":<%=rMap.get("4_본부안내")==null?0:rMap.get("4_본부안내").get("CNT")%>, "x":"본부안내" }
			               ]	
					},
					format: {
				        xAxis: function(value){
							return value;
				        },
				        yAxis: function(value){
				            return String(value).format(); 
				        }
				    },
				    func: {
				        tip: function(tipElement, data, rect) {
				            var date = data.xaxis;
				            var tip = '<div class="text">' + date + ' : ' + String(data.yaxis).format()+'건 </div>';
				            tipElement.html(tip).show();
				            
							var arrow = '<div class="arrow" style="width: '+tipElement.width() + 'px;"></div>';

							tipElement.html(tipElement.html() + arrow).css({
								left: rect.x - (tipElement.width() / 2), top: rect.y - 35
							});
				        }
				    },
				    use: {
				        animate: true,
				        aCrossLine: false
				    }
				};
			
			var options6 = {
					data : {
						data : [
								{ "y":<%=rMap.get("5_서브메인")==null?0:rMap.get("5_서브메인").get("CNT")%>, "x":"서브메인" },
		                        { "y":<%=rMap.get("5_화물공제30년사")==null?0:rMap.get("5_화물공제30년사").get("CNT")%>, "x":"화물공제30년사" },
		                        { "y":<%=rMap.get("5_운전자의날")==null?0:rMap.get("5_운전자의날").get("CNT")%>, "x":"운전자의 날" },
		                        { "y":<%=rMap.get("5_사고예방활동")==null?0:rMap.get("5_사고예방활동").get("CNT")%>, "x":"사고예방활동" },
		                        { "y":<%=rMap.get("5_트럭메아리")==null?0:rMap.get("5_트럭메아리").get("CNT")%>, "x":"트럭메아리" },
		                        { "y":<%=rMap.get("5_행사안내")==null?0:rMap.get("5_행사안내").get("CNT")%>, "x":"행사안내" },
		                        { "y":<%=rMap.get("5_홍보영상")==null?0:rMap.get("5_홍보영상").get("CNT")%>, "x":"홍보영상" }
			               ]	
					},
					format: {
				        xAxis: function(value){
							return value;
				        },
				        yAxis: function(value){
				            return String(value).format(); 
				        }
				    },
				    func: {
				        tip: function(tipElement, data, rect) {
				            var date = data.xaxis;
				            var tip = '<div class="text">' + date + ' : ' + String(data.yaxis).format()+'건 </div>';
				            tipElement.html(tip).show();
				            
							var arrow = '<div class="arrow" style="width: '+tipElement.width() + 'px;"></div>';

							tipElement.html(tipElement.html() + arrow).css({
								left: rect.x - (tipElement.width() / 2), top: rect.y - 35
							});
				        }
				    },
				    use: {
				        animate: true,
				        aCrossLine: false
				    }
				};
			
			var styles = {
			    main: {
			        layout: {
			            paddingTop: 30,
			            paddingRight: 30,
			            paddingLeft: -15,
			            color: '#f8f8f8'
			        },
			        xAxis: {
			            paddingTop: 13,
			            height: 10,
			            text: {
			                family: 'Nanum Gothic',
			                size: 10,
			                color: '#666'
			            },
			            line: {
			                color: '#e3e3e3',
			                width: 1
			            }
			        },
			        yAxis: {
			            line: {
			                color: '#cccccc',
			                width: 1,
			                opacity: 1
			            },
			            text: {
			                family: 'Nanum Gothic',
			                size: 12,
			                color: '#666',
			                align: 'right'
			            }
			        },
			        tip: {
			            className: 'tip'
			        },
			        series: {
			            s1: {
			            	area: {
		            		 normal: {
	                                color: '#3880aa', opacity: 0.5,
	                                over: {
	                                    color: '#3880aa', opacity: 1
	                                }
		            		 	}
		            		}
			            }
			        }
			    }
			};
			
			var series = {
				    "main": {
				        "s1": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y'
				        }
				    }
				};
			
			var chart1 = webponent.chart.init($("#xchart-statistics1"), options1, styles, series);
			var chart2 = webponent.chart.init($("#xchart-statistics2"), options2, styles, series);
			var chart3 = webponent.chart.init($("#xchart-statistics3"), options3, styles, series);
			var chart4 = webponent.chart.init($("#xchart-statistics4"), options4, styles, series);
			var chart5 = webponent.chart.init($("#xchart-statistics5"), options5, styles, series);
			var chart6 = webponent.chart.init($("#xchart-statistics6"), options6, styles, series);
			
		</script>
		
	</div>
</div>

</body>
</html>
