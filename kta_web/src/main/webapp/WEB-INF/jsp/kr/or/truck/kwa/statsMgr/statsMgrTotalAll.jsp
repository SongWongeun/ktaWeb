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
						전체 통계
					</h3>
				</div>
			</div>
		</div>
	</div>
	
	
	<script src="/webPonent-Chart/lib/comm/raphael.js"></script>
	<script src="/webPonent-Chart/lib/comm/webponent.comm.common.js"></script>
	<script src="/webPonent-Chart/lib/chart/webponent.chart.js"></script>
	<%
		// 
		Map<String, Map<String, Object>> rMap = (Map<String, Map<String, Object>>)request.getAttribute("rMap");
	%>
		
	<div class="container" style="max-width: none;width:1300px;padding:0px;">
		<div class="col-md-6 padded"> 
			<div class="box">
				<div class="box-header"><span class="title">홈페이지 조회수</span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics1"></div>
				</div>
			</div>
		</div>
		<!-- <div class="col-md-4 padded">
			<div class="box">
				<div class="box-header"><span class="title">PC웹,모바일웹 전체 조회수 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics2"></div>
				</div>
			</div>
		</div> -->
		
		<script>
			var options1 = {
				data : {
					data : [
	                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("HP_ALL")%>, "x":"전체" },
	                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("HP_PC")%>, "x":"PC웹" },
			                        { "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("HP_M")%>, "x":"모바일웹 "}
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
			            },
			            s2: {
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
				        "s2": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y'
				        }
				    }
				};
			
			var chart1 = webponent.chart.init($("#xchart-statistics1"), options1, styles, series1);
		</script>
		
		<!-- <div class="col-md-3 padded">
			<div class="box">
				<div class="box-header"><span class="title">모바일웹 홈페이지 전체 조회수 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics3"></div>
				</div>
			</div>
		</div> -->
		<div class="col-md-3 padded">
			<div class="box">
				<div class="box-header"><span class="title">고객광장 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics4"></div>
				</div>
			</div>
		</div>
		
		<div class="col-md-3 padded">
			<div class="box">
				<div class="box-header"><span class="title">칭찬 / 클린센터 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics5"></div>
				</div>
			</div>
		</div>
		
		<!-- <div class="col-md-3 padded">
			<div class="box">
				<div class="box-header"><span class="title">칭찬합시다 전체 조회수 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics6"></div>
				</div>
			</div>
		</div> 
		
		<div class="col-md-3 padded">
			<div class="box">
				<div class="box-header"><span class="title">클린센터 전체 조회수 </span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics7"></div>
				</div>
			</div>
		</div>
	</div> -->
	
		<script>
			var options = {
				data : {
					data : [
	                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("CUSTOMER")%>, "x":"등록" },
	                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("CUSTOMER_PROC")%>, "x":"평균처리시간" }
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
			
			var options1 = {
					data : {
						data : [
		                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("PR")%>, "x":"칭찬" },
		                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("CC")%>, "x":"클린" }
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
			            paddingRight: 20,
			            paddingLeft: 10,
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
			            s2: {
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
				        "s2": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y'
				        }
				    }
				};
			
			var chart1 = webponent.chart.init($("#xchart-statistics4"), options, styles, series);
			var chart2 = webponent.chart.init($("#xchart-statistics5"), options1, styles, series);
		</script>
		
		<div class="col-md-6 padded">
			<div class="box">
				<div class="box-header"><span class="title">증명서 발급</span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics3"></div>
				</div>
			</div>
		</div>
		
		<script>
			var options = {
					data : {
						data : [
		                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("분담금")%>, "x":"분담금" },
		                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("공제가입")%>, "x":"공제가입" },
		                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("공제계약")%>, "x":"공제계약" },
		                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("적재물")%>, "x":"적재물" }
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
			            paddingRight: 20,
			            paddingLeft: 10,
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
			
			var chart1 = webponent.chart.init($("#xchart-statistics3"), options, styles, series);
		</script>
		
		<div class="col-md-6 padded">
			<div class="box">
				<div class="box-header"><span class="title">회원 가입 / 탈퇴</span></div>
				<div class="box-content padded">
					<div class="sine-chart" style="height: 300px" id="xchart-statistics2"></div>
				</div>
			</div>
		</div>
		
		<script>
			var options = {
					data : {
						data : [
		                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("가입")%>, "x":"가입" },
		                        		{ "y":<%=rMap.get("HP_ALL")==null?0:rMap.get("탈퇴")%>, "x":"탈퇴" },
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
			            paddingRight: 20,
			            paddingLeft: 10,
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
			
			var chart1 = webponent.chart.init($("#xchart-statistics2"), options, styles, series);
		</script>
	
	
	
</div>

</body>
</html>
