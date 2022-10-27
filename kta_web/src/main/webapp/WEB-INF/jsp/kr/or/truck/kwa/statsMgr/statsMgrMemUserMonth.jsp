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
						회원 통합 통계 
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
						<li class="active"><a href="#sts_month" data-toggle="tab" id="label_sts_month">월별 통계</a></li>
						<li class=""><a href="#sts_day" data-toggle="tab" id="label_sts_day">일별 통계</a></li>
					</ul>
				</div>
				
<%
String today = EgovDateUtil.getToday(); 
//int cY = 2020;//Integer.parseInt( today.substring(0, 4) );
int cY = Integer.parseInt( today.substring(0, 4) );
int cM = Integer.parseInt( today.substring(4, 6) );
int startYear = 2014;
String reqYear = EgovStringUtil.isEmpty(request.getParameter("year"))?""+"":request.getParameter("year");
String reqMonth = EgovStringUtil.isEmpty(request.getParameter("month"))?cM+"":request.getParameter("month");

%>				
				<div class="box-content padded">
					<div class="tab-content">
						<div class="tab-pane" id="sts_year" >
							<button class="btn btn-lg btn-default year" y="">전체</button>
						</div>
						<div class="tab-pane active"  id="sts_month">
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
현재 월 세팅
- 현재년 보다 적을 경우는 전체 월을 보여줌.
- 현재년 과 같으면 현재 월 까지만 보여줌.  
--%>
function fnSetMonth(selectedYear){
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
	
	$('#sts_day').attr('y',selectedYear);<%-- 일별통계 탭의 선택월에서 사용--%>
	$('#sts_day > hr').show();
};

$(document).ready(function(){
	
	<%-- 선택년,월 세팅 --%>
	$('#sts_month .year[y="<%=reqYear%>"]').removeClass('btn-default').addClass('btn-red');
	
	
	
	/* start:년별통계 버튼설정 */
	$('#sts_year .year').each(function(){
		$(this).on('click',function(){
			//선택버튼 강조
			$('#sts_year .year').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			
			var y = $(this).attr('y');
			location.href = '/kwa/statsMgr/memUser/year.do?year='+y;
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
			location.href = '/kwa/statsMgr/memUser/month.do?year='+y;
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
			location.href = '/kwa/statsMgr/memUser/day.do?year='+y+'&month='+m;
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
		<div class="col-md-12 padded"> <!-- col-md-12 : 하나씩 / col-md-6 : 두개씩 -->
			<div class="box">
				<div class="box-header">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;">
						회원 가입 ( <%=reqYear %>년 통계 )
					</span>
				</div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 250px" id="xchart-statistics1"></div>
				</div>
					
			</div>
		</div>
		<div class="col-md-12 padded"> 
			<div class="box">
				<div class="box-header">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;">
						회원 탈퇴 ( <%=reqYear %>년 통계 )
					</span>
				</div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 250px" id="xchart-statistics2"></div>
				</div>
			</div>
		</div>
		<div class="col-md-12 padded"> 
			<div class="box">
				<div class="box-header">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;">
						휴면 회원
					</span>
				</div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 250px" id="xchart-statistics3"></div>
				</div>
			</div>
		</div>
		
		<script src="/webPonent-Chart/lib/comm/raphael.js"></script>
		<script src="/webPonent-Chart/lib/comm/webponent.comm.common.js"></script>
		<script src="/webPonent-Chart/lib/chart/webponent.chart.js"></script>

		<script>
			<%
				// 
				Map<String, Map<String, Object>> rMapMem = (Map<String, Map<String, Object>>)request.getAttribute("rMapMem");
				Map<String, Map<String, Object>> rMapNoMem = (Map<String, Map<String, Object>>)request.getAttribute("rMapNoMem");
				Map<String, Map<String, Object>> rMapHuMem = (Map<String, Map<String, Object>>)request.getAttribute("rMapHuMem");
			%>
	
			var options = {
					data : {
						data : [
							<%		         
								for(int l=1;l<=12;l++){
									String tM = l < 10 ? "0"+l : l+"";
									String tYM = reqYear + tM;
									Object rMapM = rMapMem.get(tYM)==null?0+"":rMapMem.get(tYM).get("CNT");
									Object rMapNoM = rMapNoMem.get(tYM)==null?0+"":rMapNoMem.get(tYM).get("CNT");
									Object rMapHuM = rMapHuMem.get(l+"")==null?0+"":rMapHuMem.get(l+"").get("CNT");
									if( l>1 ) {
							%> 	
							        			,
							<%			
									}
							%>
	                        
                        			{month:<%="'"+l+"월'"%>, rMapM:<%=rMapM%>,rMapNoM:<%=rMapNoM%>,rMapHuM:<%=rMapHuM%>}
	                        <%	
                        		}
	                        %>
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
				            var tip = '<div class="text">' + date + ': ' + String(data.yaxis).format()+'건 </div>';
				            tipElement.html(tip).show();
				            
							var arrow = '<div class="arrow" style="width: '+tipElement.width() + 'px;"></div>';

							tipElement.html(tipElement.html() + arrow).css({
								left: rect.x - (tipElement.width() / 2), top: rect.y - 35
							});
				        }
				    },
				    use: {
				        aCrossLine: false
				    }
				};
			
			var styles = {
				    main: {
				        layout: {
				            paddingTop: 30,
				            paddingRight: 50,
				            color: '#f8f8f8',
				        },
				        xAxis: {
				            paddingTop: 13,
				            height: 10,
				            text: {
				                family: 'Nanum Gothic',
				                size: 12,
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
				                align: 'center'
				            }
				        },
				        tip: {
				            className: 'tip'
				        },
				        series: {
				            s1: {
				            	line: {
				                    normal: {
				                        color: '#3880aa',
				                        width: 3,
				                        over: {
				                            color: '#00a693',
				                            width: 3
				                        }
				                    }
				                },
				            	tick: {
									style: 'circle', size: 5, overSize: 1.5,
									area: {
										normal: {
											color: '#fff', over: {color: '#fff'}
										}
									},
									line: {
										normal: {
											color: '#3880aa', width: 3, over: {color: '#465866', width: 3}
										}
									}
								}
				            }
				        }
				    }
				};
			
			var series1 = {
				    "main": {
				        "s1": {
				            series: 'line',
				            xaxis: 'month',
				            yaxis: 'rMapM'
				        }
				    }
				};
			var series2 = {
				    "main": {
				        "s1": {
				            series: 'line',
				            xaxis: 'month',
				            yaxis: 'rMapNoM'
				        }
				    }
				};
			var series3 = {
				    "main": {
				        "s1": {
				            series: 'line',
				            xaxis: 'month',
				            yaxis: 'rMapHuM'
				        }
				    }
				};
			
			var chart1 = webponent.chart.init($("#xchart-statistics1"), options, styles, series1);
			var chart2 = webponent.chart.init($("#xchart-statistics2"), options, styles, series2);
			var chart3 = webponent.chart.init($("#xchart-statistics3"), options, styles, series3);
			
		</script>

	</div>	

</body>
</html>
