<%@page import="java.util.Calendar"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="egovframework.com.utl.fcc.service.EgovStringUtil"%>
<%@page import="egovframework.com.utl.fcc.service.EgovDateUtil"%>
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
       .sine-chart .tip .text {
            background: #465866;
            color: #fff;
            padding: 5px 10px;
            border: 1px solid #fff;
            border-radius: 2px;
        }
        .sine-chart .tip .arrow {
            height: 6px;
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
						방문자 통계 
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
						<li class=""><a href="#sts_year" data-toggle="tab" id="label_sts_year">년별 통계</a></li>
						<li class=""><a href="#sts_month" data-toggle="tab" id="label_sts_month">월별 통계</a></li>
						<li class=""><a href="#sts_day" data-toggle="tab" id="label_sts_day">일별 통계</a></li>
						<li class="active"><a href="#sts_visCon" data-toggle="tab" id="label_visCon">사용자 환경</a></li>
					</ul>
				</div>
				
<%
String today = EgovDateUtil.getToday(); 
//int cY = 2020;//Integer.parseInt( today.substring(0, 4) );
int cY = Integer.parseInt( today.substring(0, 4) );
int cM = Integer.parseInt( today.substring(4, 6) );
int startYear = 2014;
String reqYear = EgovStringUtil.isEmpty(request.getParameter("year"))?cY+"":request.getParameter("year");
String reqMonth = EgovStringUtil.isEmpty(request.getParameter("month"))?cM+"":request.getParameter("month");
%>				
				<div class="box-content padded">
					<div class="tab-content">
						<div class="tab-pane" id="sts_year" >
							<button class="btn btn-lg btn-default year" y="">전체</button>
						</div>
						<div class="tab-pane "  id="sts_month">
							<%for(int i=startYear;i<=cY;i++){ //2014년 부터 %>
								<button class="btn btn-lg btn-default year" y="<%=i%>"><%=i%>년</button>
							<%} %>
						</div>
						<div class="tab-pane"  id="sts_day">
							<%for(int i=startYear;i<=cY;i++){ //2014년 부터 %>
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
var currentYear = <%=cY%>;
var currentMonth = <%=cM%>;

var menuArray = [];

<%-- 
요청년월 세팅 
현재 월 세팅
- 현재년 보다 적을 경우는 전체 월을 보여줌.
- 현재년 과 같으면 현재 월 까지만 보여줌.  
--%>
function fnSetDisaplyYM(selectedYear,selectedMonth){

	<%-- 선택년에 따라 표시될 월세팅  --%>
	if( selectedYear == undefined || selectedYear == '' ) {
		selectedYear = currentYear;
	}
	if( selectedYear < currentYear ){
		$('#sts_day .month').show();
	}else if( selectedYear == currentYear ){
		$('#sts_day .month').hide();
		for(var k=0;k<currentMonth;k++){
			$('#sts_day .month:eq('+k+')').show();
		}
	}
	
	<%-- 요청년월 고정 --%>
	$('#sts_day .year[y="<%=reqYear%>"]')
			.removeClass('btn-blue').removeClass('btn-default').addClass('btn-red');  
	$('#sts_day .month').removeClass('btn-red').addClass('btn-default');
	if( '<%=reqYear%>' == selectedYear ){
		$('#sts_day .month[m="<%=reqMonth%>"]')
			.removeClass('btn-default').addClass('btn-red');
	}
	<%-- 선택년월 값 저장 --%>
	$('#sts_day')
			.attr('y',selectedYear)
			.attr('m',selectedMonth);
	$('#sts_day > hr').show();
};

$(document).ready(function(){
	
	<%-- 선택년,월 세팅 --%>
	fnSetDisaplyYM('<%=reqYear%>','<%=reqMonth%>');
	
	
	
	/* start:년별통계 버튼설정 */
	$('#sts_year .year').each(function(){
		$(this).on('click',function(){
			//선택버튼 강조
			$('#sts_year .year').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			
			var y = $(this).attr('y');
			location.href = '/kwa/statsMgr/visit/year.do?year='+y;
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
			location.href = '/kwa/statsMgr/visit/month.do?year='+y;
		});
	});
	/* end:월별통계 버튼설정 */
	/* start:일별통계 버튼설정 */
	$('#sts_day .year').each(function(){
		$(this).on('click',function(){
			//선택버튼 강조
			$('#sts_day .year').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			fnSetDisaplyYM( $(this).attr('y'),$('#sts_day').attr('m') );
		});
	});
	$('#sts_day .month').each(function(){
		$(this).on('click',function(){
			//선택버튼 강조
			$('#sts_day .month').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			
			var y = $('#sts_day').attr('y');
			var m = $(this).attr('m');
			location.href = '/kwa/statsMgr/visit/day.do?year='+y+'&month='+m;
		});
	});
	

	/* end:일별통계 버튼설정 */
    var tt = document.createElement('div'),
    leftOffset = -($('html').css('padding-left').replace('px', '') + $('body').css('margin-left').replace('px', '')),
    topOffset = -32;
	tt.className = 'ex-tooltip';
	document.body.appendChild(tt);
	
	$("#label_visCon").click(function(){
		location.href = "/kwa/statsMgr/visit/visCon.do";
	});
	
});
</script>

<div class="container" style="max-width: none;width:1300px;padding:0px;">
		<div class="col-md-4 padded"> 
			<div class="box">
				<div class="box-header">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;">
						PC / MOBILE 
					</span>
				</div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics1"></div>
				</div>
			</div>
		</div>
		<div class="col-md-4 padded"> 
			<div class="box">
				<div class="box-header">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;">
						브라우저
					</span>
				</div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics2"></div>
				</div>
			</div>
		</div>
		<div class="col-md-4 padded"> 
			<div class="box">
				<div class="box-header">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;">
						운영체제
					</span>
				</div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics3"></div>
				</div>
			</div>
		</div>
		
		<script src="/webPonent-Chart/lib/comm/raphael.js"></script>
		<script src="/webPonent-Chart/lib/visual/webponent.visual.pie.js"></script>

		<script>
			<%
			// 
			Map<String, Object> rMapC = (Map<String, Object>)request.getAttribute("pcMobile");
			Map<String, Object> rMapD = (Map<String, Object>)request.getAttribute("brow");
			Map<String, Object> rMapE = (Map<String, Object>)request.getAttribute("os");
			%>
	
			var options1 = {
					data : {
						data : [
								<%	
									for (String mapkey : rMapC.keySet()){
		                       	%> 	
	                        			{x:<%="'"+mapkey+"'"%>, y:<%=rMapC.get(mapkey)%>},
		                        <%	
	                        		}
		                        %>
				               ],
				               use: 'y'
					},
					legend: {
		                format: ['MOBILE','PC']
					},
					toolTip: {
		                use: true,
		                className: 'tip',
		                func: function(pie, data, tipElement) {

		                    var dataTotalValue = pie.settings.data.dataTotalValue;
		                    var setData = Math.round(data.y / dataTotalValue * 1000)/10.0 + '%';
		                    var tip = '<div class="text">' + setData + '</div>';
		                    var arrow = '<div class="arrow" style="width: ' +
		                        tipElement.width() + 'px;"></div>';

		                    tipElement.html(tip);
		                    tipElement.html(tipElement.html() + arrow);
		                }
		            },
		            resize: {
		                use: true
		            }
				};
			
			var options2 = {
					data : {
						data : [
								<%	
									for (String mapkey : rMapD.keySet()){
		                       	%> 	
	                        			{x:<%="'"+mapkey+"'"%>, y:<%=rMapD.get(mapkey)%>},
		                        <%	
	                        		}
		                        %>
				               ],
				               use: 'y'
					},
					legend: {
		                format: ['Android','iPhone','Opera','Msie','Chrome']
					},
					toolTip: {
		                use: true,
		                className: 'tip',
		                func: function(pie, data, tipElement) {

		                    var dataTotalValue = pie.settings.data.dataTotalValue;
		                    var setData = Math.round(data.y / dataTotalValue * 1000)/10.0 + '%';
		                    var tip = '<div class="text">' +setData + '</div>';
		                    var arrow = '<div class="arrow" style="width: ' +
		                        tipElement.width() + 'px;"></div>';

		                    tipElement.html(tip);
		                    tipElement.html(tipElement.html() + arrow);
		                }
		            },
		            resize: {
		                use: true
		            }
				};
			
			var options3 = {
					data : {
						data : [
								<%	
									for (String mapkey : rMapE.keySet()){
		                       	%> 	
	                        			{x:<%="'"+mapkey+"'"%>, y:<%=rMapE.get(mapkey)%>},
		                        <%	
	                        		}
		                        %>
				               ],
				               use: 'y'
					},
					legend: {
		                format: ['Window', 'Linux', 'Macintosh']
					},
					toolTip: {
		                use: true,
		                className: 'tip',
		                func: function(pie, data, tipElement) {

		                    var dataTotalValue = pie.settings.data.dataTotalValue;
		                    var setData = Math.round(data.y / dataTotalValue * 1000)/10.0 + '%';
		                    var tip = '<div class="text">' +setData + '</div>';
		                    var arrow = '<div class="arrow" style="width: ' +
		                        tipElement.width() + 'px;"></div>';

		                    tipElement.html(tip);
		                    tipElement.html(tipElement.html() + arrow);
		                }
		            },
		            resize: {
		                use: true
		            }
				};
			
			var styles = {
					layout : {
						position : {
							x : 0,
							y : 0
						}
					},
					pie : {
						radius : 45,
						area : {
							color : ['#3880aa', '#3880aa']
						},
						line: {
		                    color: '#fff',
		                    width: 3
		                },
		                animate: {
		                    use: true,
		                    step: 80,
		                    type: 'easeInOutExpo' /* linear | easeInOutExpo | none */
		                },
		                hover: {
		                    use: true,
		                    area: {
		                        color: {
		                            src: '/webPonent-Chart/image/pattern_hover.png'
		                        }
		                    }
		                }
		            },
		            base: {
		                use: true,
		                radius: 50,
		                area: {
		                    color: '#fff'
		                },
		                line: {
		                    color: '#d3efed',
		                    width: 1
		                }
	
		            },
		            legend: {
		                use: true,
		                stackedGap: 5,
		                type: 'brokenLine',
		                text: {
		                    family: 'Nanum Gothic',
		                    size: 12,
		                    color: '#333333',
		                    style: 'normal',
		                    /* normal | italic */
		                    weight: 'bold',
		                    /* normal | bold */
		                    opacity: 1
		                },
		                pin: {
		                    color: '#8397a6',
		                    width: 1,
		                    length: 20,
		                    opacity: 1
		                },
		                pinHead: {
		                    color: '#8397a6',
		                    length: 20,
		                    width: 3,
		                    opacity: 1
		                }
		            }
				};
			
			var pie1 = webponent.visual.pie.init($("#xchart-statistics1"), styles, options1);
			var pie2 = webponent.visual.pie.init($("#xchart-statistics2"), styles, options2);
			var pie3 = webponent.visual.pie.init($("#xchart-statistics3"), styles, options3);
		</script>

	</div>	
</div>
</body>
</html>
