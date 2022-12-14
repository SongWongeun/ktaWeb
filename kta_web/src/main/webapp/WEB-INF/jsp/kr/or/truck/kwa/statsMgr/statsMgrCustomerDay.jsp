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
        #xchart-statistics1 .tip .text, #xchart-statistics2 .tip .text {
            background: #465866;
            color: #fff;
            padding: 5px 10px;
            border: 1px solid #fff;
            border-radius: 2px;
        }
        
       #xchart-statistics1 .tip .arrow, #xchart-statistics2 .tip .arrow {
	       	height:6px;
	       	background: url("/webPonent-Chart/image/tooltip_arrow.png") no-repeat center top; 
	       	margin-top: -1px; 
	       	font-size: 6px;
        }
 </style>
 
<style type="text/css">
html, body{font-family: 'NanumGothic','????????????', ??????, Dotum, Arial, tahoma, sans-serif;}
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
						???????????? ?????? 
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
						<li class=""><a href="#sts_year" data-toggle="tab" id="label_sts_year">?????? ??????</a></li>
						<li class=""><a href="#sts_month" data-toggle="tab" id="label_sts_month">?????? ??????</a></li>
						<li class="active"><a href="#sts_day" data-toggle="tab" id="label_sts_day">?????? ??????</a></li>
						<li class=""><a href="#sts_category" data-toggle="tab" id="label_category">??????????????? ??????</a></li>
						<li class=""><a href="#sts_category" data-toggle="tab" id="label_manager">???????????? ??????</a></li>
						<li class=""><a href="#sts_memUser" data-toggle="tab" id="label_memUser">??????/????????? ??????</a></li>
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


//??? ?????? ????????? ???
Calendar cal = Calendar.getInstance();
cal.set(Calendar.MONTH, Integer.parseInt(reqMonth)-1);
cal.set(Calendar.YEAR, Integer.parseInt(reqYear));
int lastDay = cal.getActualMaximum(Calendar.DATE);
%>				
				<div class="box-content padded">
					<div class="tab-content">
						<div class="tab-pane" id="sts_year" >
							<button class="btn btn-lg btn-default year" y="">??????</button>
						</div>
						<div class="tab-pane "  id="sts_month">
							<%for(int i=startYear;i<=cY;i++){ //2014??? ?????? %>
								<button class="btn btn-lg btn-default year" y="<%=i%>"><%=i%>???</button>
							<%} %>
						</div>
						<div class="tab-pane active"  id="sts_day">
							<%for(int i=startYear;i<=cY;i++){ //2014??? ?????? %>
								<button class="btn btn-lg btn-default year" y="<%=i%>"><%=i%>???</button>
							<%} %>
							<hr style="margin: 10px auto;display:none;" />
							<button class="btn btn-default month" m="01" style="display:none;" >1???</button>
							<button class="btn btn-default month" m="02" style="display:none;" >2???</button>
							<button class="btn btn-default month" m="03" style="display:none;" >3???</button>
							<button class="btn btn-default month" m="04" style="display:none;" >4???</button>
							<button class="btn btn-default month" m="05" style="display:none;" >5???</button>
							<button class="btn btn-default month" m="06" style="display:none;" >6???</button>
							<button class="btn btn-default month" m="07" style="display:none;" >7???</button>
							<button class="btn btn-default month" m="08" style="display:none;" >8???</button>
							<button class="btn btn-default month" m="09" style="display:none;" >9???</button>
							<button class="btn btn-default month" m="10" style="display:none;" >10???</button>
							<button class="btn btn-default month" m="11" style="display:none;" >11???</button>
							<button class="btn btn-default month" m="12" style="display:none;" >12???</button>
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
???????????? ?????? 
?????? ??? ??????
- ????????? ?????? ?????? ????????? ?????? ?????? ?????????.
- ????????? ??? ????????? ?????? ??? ????????? ?????????.  
--%>
function fnSetDisaplyYM(selectedYear,selectedMonth){

	<%-- ???????????? ?????? ????????? ?????????  --%>
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
	
	<%-- ???????????? ?????? --%>
	$('#sts_day .year[y="<%=reqYear%>"]')
			.removeClass('btn-blue').removeClass('btn-default').addClass('btn-red');  
	$('#sts_day .month').removeClass('btn-red').addClass('btn-default');
	if( '<%=reqYear%>' == selectedYear ){
		$('#sts_day .month[m="<%=reqMonth%>"]')
			.removeClass('btn-default').addClass('btn-red');
	}
	<%-- ???????????? ??? ?????? --%>
	$('#sts_day')
			.attr('y',selectedYear)
			.attr('m',selectedMonth);
	$('#sts_day > hr').show();
};

$(document).ready(function(){
	
	$("#label_manager").click(function(){
		location.href = "/kwa/statsMgr/customer/manager.do";
	});
	
	$("#label_category").click(function(){
		location.href = "/kwa/statsMgr/customer/category.do";
	});
	
	$("#label_memUser").click(function(){
		location.href = "/kwa/statsMgr/customer/memUser.do";
	});
	
	<%-- ?????????,??? ?????? --%>
	fnSetDisaplyYM('<%=reqYear%>','<%=reqMonth%>');
	
	
	
	/* start:???????????? ???????????? */
	$('#sts_year .year').each(function(){
		$(this).on('click',function(){
			//???????????? ??????
			$('#sts_year .year').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			
			var y = $(this).attr('y');
			location.href = '/kwa/statsMgr/customer/year.do?year='+y;
		});
	});

	/* end:???????????? ???????????? */
	/* start:???????????? ???????????? */
	$('#sts_month .year').each(function(){
		$(this).on('click',function(){
			//???????????? ??????
			$('#sts_month .year').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			
			var y = $(this).attr('y');
			location.href = '/kwa/statsMgr/customer/month.do?year='+y;
		});
	});
	/* end:???????????? ???????????? */
	/* start:???????????? ???????????? */
	$('#sts_day .year').each(function(){
		$(this).on('click',function(){
			//???????????? ??????
			$('#sts_day .year').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			fnSetDisaplyYM( $(this).attr('y'),$('#sts_day').attr('m') );
		});
	});
	$('#sts_day .month').each(function(){
		$(this).on('click',function(){
			//???????????? ??????
			$('#sts_day .month').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			
			var y = $('#sts_day').attr('y');
			var m = $(this).attr('m');
			location.href = '/kwa/statsMgr/customer/day.do?year='+y+'&month='+m;
		});
	});
	

	/* end:???????????? ???????????? */
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
				<div class="box-header">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;">
						???????????? ???????????? ( <%=reqYear %>??? <%=reqMonth %>??? ?????? )
					</span>
				</div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics1"></div>
					
				</div>
					
			</div>
		</div>
		<div class="col-md-12 padded"> 
			<div class="box">
				<div class="box-header">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;">
						???????????? ?????? ???????????? ( <%=reqYear %>??? <%=reqMonth %>??? ?????? )
					</span>
				</div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics2"></div>
					
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
			Map<String, Map<String, Object>> rMapC = (Map<String, Map<String, Object>>)request.getAttribute("rMapC");
			%>
	
			var options1 = {
				data : {
					data : [
							<%		         
								for(int l=1;l<=lastDay;l++){
	                    			String tM = l < 10 ? "0"+l : l+"";
	                    			String tYM = reqYear + reqMonth + tM;
	                    			Object y = rMap.get(tYM)==null?0+"":rMap.get(tYM).get("CNT");
	                    			if( l>1 ) {
	                       	%> 	
		                                			,
		                    <%			
			                    	}
	                        %>
	                        
                        			{x:<%="'"+l+"???'"%>, y:<%=y%>}
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
			            var tip = '<div class="text">' + date + ': ' + String(data.yaxis).format()+'??? </div>';
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
			    },
			    animate: {
		            speed: 100 
	            }
			};
			
			var options2 = {
					data : {
						data : [
								<%		         
									for(int l=1;l<=lastDay;l++){
	                         			String tM = l < 10 ? "0"+l : l+"";
	                        			String tYM = reqYear + reqMonth + tM;
	                         			Object y = rMapC.get(tYM)==null?0+"":rMapC.get(tYM).get("CNT");
	                         			if( l>1 ) {
		                       	%> 	
			                                			,
			                    <%			
				                    	}
		                        %>
		                        
	                        			{x:<%="'"+l+"???'"%>, y:<%=y%>}
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
				            var tip = '<div class="text">' + date + ' ?????? ???????????? : ' + String(data.yaxis)+'??? </div>';
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
			            paddingRight: 70,
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
			            },
			            s2 :{
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
			
			var series1 = {
				    "main": {
				        "s1": {
				            series: 'line',
				            xaxis: 'x',
				            yaxis: 'y'
				        }
				    }
				};

			var series2 = {
				    "main": {
				        "s2": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y'
				        }
				    }
				};
			var chart1 = webponent.chart.init($("#xchart-statistics1"), options1, styles, series1);
			var chart2 = webponent.chart.init($("#xchart-statistics2"), options2, styles, series2);
		</script>

	</div>	
</div>
</body>
</html>
