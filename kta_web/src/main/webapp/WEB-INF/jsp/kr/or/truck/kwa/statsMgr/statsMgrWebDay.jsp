<%@page import="java.util.Calendar"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="egovframework.com.utl.fcc.service.EgovStringUtil"%>
<%@page import="egovframework.com.utl.fcc.service.EgovDateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	//1depth 메뉴
	/*
		메뉴  index
			 when INSTR( url ,'/netCounter/' ) > 0 then '인터넷창구'
		      when INSTR( url ,'/infoLounge/' ) > 0 then '정보마당'
		      when INSTR( url ,'/deductProduct/' ) > 0 then '공제상품'
		      when INSTR( url ,'/customer/' ) > 0 then '고객광장'
		      when INSTR( url ,'/assocIntroduce/' ) > 0 then '조합소개'
		      when INSTR( url ,'/cyberPr/' ) > 0 then '사이버홍보관'
		      when INSTR( url ,'/main/index.do' ) > 0 then '메인'
		      else  '기타'
	*/
	List<String> menuD1List = new ArrayList<String>();
	menuD1List.add("인터넷창구");
	menuD1List.add("정보마당");
	menuD1List.add("공제상품");
	menuD1List.add("고객광장");
	menuD1List.add("조합소개");
	menuD1List.add("사이버홍보관");
	menuD1List.add("메인");
	menuD1List.add("기타");
	
	//결과 Map
	Map<String, Map<String, Object>> rMap = (Map<String, Map<String, Object>>)request.getAttribute("rMap");
	Map<String, Map<String, Object>> rMap_1 = (Map<String, Map<String, Object>>)request.getAttribute("rMap_1");
	Map<String, Map<String, Object>> rMap_t = (Map<String, Map<String, Object>>)request.getAttribute("rMap_t");

	//메뉴 리스트 
	List<List<String>> menuD2List = new ArrayList<List<String>>();
/* 인터넷창구	
		서브메인
		마이페이지
		계약조회
		보상정보조회
		지급내역조회
		회원정보관리
		증명서발급 */
	List<String> a = new ArrayList<String>();
	a.add("서브메인");
	a.add("마이페이지");
	a.add("계약조회");
	a.add("보상정보조회");
	a.add("지급내역조회");
	a.add("회원정보관리");
	a.add("증명서발급");
	a.add("조합원관리");
	a.add("만기안내 비밀번호변경");
	menuD2List.add(a);
	
/* 정보마당	
	서브메인
	공제소식
	보험소식
	입찰공고
	장학사업
	관련사이트
	우수협력정비업체 */
	List<String> b = new ArrayList<String>();
	b.add("서브메인");
	b.add("공제소식");
	b.add("보험소식");
	b.add("입찰공고");
	b.add("장학사업");
	b.add("관련사이트");
	b.add("우수협력정비업체");
	menuD2List.add(b);
	
/* 공제상품	
	서브메인
	가입안내
	상품안내
	보증상품
	보상안내
	보상관련정보
	공제약관
	콜센터안내 */
	List<String> c = new ArrayList<String>();
	c.add("서브메인");
	c.add("가입안내");
	c.add("상품안내");
	c.add("보증상품");
	c.add("보상안내");
	c.add("보상관련정보");
	c.add("공제약관");
	c.add("콜센터안내");
	menuD2List.add(c);

/* 고객광장	
	서브메인
	문의안내
	자주하는 질문
	고객문의
	칭찬합시다
	자료실 */
	List<String> d = new ArrayList<String>();
	d.add("서브메인");
	d.add("문의안내");
	d.add("자주하는질문");
	d.add("고객문의");
	d.add("칭찬합시다");
	d.add("자료실");
	menuD2List.add(d);
	
/* 조합소개	
	서브메인
	인사말
	공제조합소개
	윤리경영
	채용안내
	지부안내
	본부안내 */
	List<String> e = new ArrayList<String>();
	e.add("서브메인");
	e.add("인사말");
	e.add("공제조합소개");
	e.add("윤리경영");
	e.add("채용안내");
	e.add("지부안내");
	e.add("본부안내");
	menuD2List.add(e);
	
/* 사이버홍보관		
	서브메인
	화물공제 30년사
	운전자의 날
	사고예방활동
	트럭메아리
	행사안내
	홍보영상 */
	List<String> f = new ArrayList<String>();
	f.add("서브메인");
	f.add("화물공제30년사");
	f.add("운전자의날");
	f.add("사고예방활동");
	f.add("트럭메아리");
	f.add("행사안내");
	f.add("홍보영상");
	menuD2List.add(f);
	
/* 메인 
	*/
	List<String> g = new ArrayList<String>();
	g.add("메인");
	menuD2List.add(g);
	
/* 기타 
	*/
	List<String> h = new ArrayList<String>();
	h.add("기타");
	menuD2List.add(h);
	
	
%>
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
html{overflow-x:auto;}
body{width:1920px;}
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



	<div class="container" style="max-width: none;width:1460px;margin-left:0px;">
		<div class="col-md-12 padded">
			<div class="box">
			
				<div class="box-header">
					<ul class="nav nav-tabs nav-tabs-left">
						<li class=""><a href="#sts_year" data-toggle="tab" id="label_sts_year">년별 통계</a></li>
						<li class=""><a href="#sts_month" data-toggle="tab" id="label_sts_month">일별 통계</a></li>
						<li class="active"><a href="#sts_day" data-toggle="tab" id="label_sts_day">일별 통계</a></li>
					</ul>
				</div>
				
<%
String today = EgovDateUtil.getToday(); 
//int cY = 2020;//Integer.parseInt( today.substring(0, 4) );
int cY = Integer.parseInt( today.substring(0, 4) ); 
int cM = Integer.parseInt( today.substring(4, 6) );
String reqYear = EgovStringUtil.isEmpty(request.getParameter("year"))?cY+"":request.getParameter("year");
String reqMonth = EgovStringUtil.isEmpty(request.getParameter("month"))?cM+"":request.getParameter("month");

//각 월의 마지막 일
Calendar cal = Calendar.getInstance();
cal.set(Calendar.MONTH, Integer.parseInt(reqMonth)-1);
cal.set(Calendar.YEAR, Integer.parseInt(reqYear));
int lastDay = cal.getActualMaximum(Calendar.DATE);
%>				
				<div class="box-content padded">
					<div class="tab-content">
						<div class="tab-pane" id="sts_year" >
							<button class="btn btn-lg btn-default year" y="">전체</button>
							<%for(int i=2014;i<=cY;i++){ //2014년 부터 %>
								<button class="btn btn-lg btn-default year" y="<%=i%>"><%=i%>년</button>
							<%} %>
						</div>
						<div class="tab-pane active"  id="sts_month">
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





 
<%-- 
	년 선택 
		하단 에 월 리스트 보임
			현재 년 선택시 현재 월까지만 보여줌.
	월 선택 
		선택된 년-월에 대한 통계 페이지 이동  
	표시 
		요청 년월은 항시 붉은색 으로 표시 
		선택 년월은 푸른색 테두리 표시 
 --%>
<script type="text/javascript">
var currentYear = <%=cY%>;
var currentMonth = <%=cM%>;

var menuArray = [
                 <%
                 	for(int q=0;q<menuD1List.size();q++){
                 		if(q>0){
                 %>
                 			,
                 <%
                 		}
                 %>
                 		<%="'"+menuD1List.get(q)+"'"%>
                 <%
                 	}
                 %>
];
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
			location.href = '/kwa/statsMgr/web/year.do?year='+y;
		});
	});

	/* end:년별통계 버튼설정 */
	/* start:일별통계 버튼설정 */
	$('#sts_month .year').each(function(){
		$(this).on('click',function(){
			//선택버튼 강조
			$('#sts_month .year').removeClass('btn-red').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-red');
			
			var y = $(this).attr('y');
			location.href = '/kwa/statsMgr/web/month.do?year='+y;
		});
	});
	/* end:일별통계 버튼설정 */
	/* start:일별통계 버튼설정 */
	$('#sts_day .year').each(function(){
		$(this).on('click',function(){
			//선택버튼 강조
			$('#sts_day .year').removeClass('btn-blue').addClass('btn-default');
			$(this).removeClass('btn-default').addClass('btn-blue');
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
	
	<div class="container">
		<div class="col-md-12 padded"> 
			<div class="box">
				<div class="box-header">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;">
						메뉴별 조회수 ( <%=reqYear %>년 <%=reqMonth %>월  일별 통계 )
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
						전체 조회수 ( <%=reqYear %>년 <%=reqMonth %>월 일별 통계 )
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
		var options1 = {
				data : {
					data : [
	                  		<%
	                  				for(int l=1;l<=lastDay;l++){
                              			String tM = l < 10 ? "0"+l : l+"";
                              			String tYM = reqYear + reqMonth + tM;
                              			Object y1 = rMap_1.get("0_"+tYM)==null?0+"":rMap_1.get("0_"+tYM).get("CNT");
                              			Object y2 = rMap_1.get("1_"+tYM)==null?0+"":rMap_1.get("1_"+tYM).get("CNT");
                              			Object y3 = rMap_1.get("2_"+tYM)==null?0+"":rMap_1.get("2_"+tYM).get("CNT");
                              			Object y4 = rMap_1.get("3_"+tYM)==null?0+"":rMap_1.get("3_"+tYM).get("CNT");
                              			Object y5 = rMap_1.get("4_"+tYM)==null?0+"":rMap_1.get("4_"+tYM).get("CNT");
                              			Object y6 = rMap_1.get("5_"+tYM)==null?0+"":rMap_1.get("5_"+tYM).get("CNT");
                              			Object y7 = rMap_1.get("6_"+tYM)==null?0+"":rMap_1.get("6_"+tYM).get("CNT");
                              			Object y8 = rMap_1.get("7_"+tYM)==null?0+"":rMap_1.get("7_"+tYM).get("CNT");
                              				if(l>1){
                 	        %> 	
                 		                		,
                 		    <%
                 		                	}
                            %>
                            
                            				{"x":<%="'"+l+"일'"%>,"y1":<%=y1%>,"y2":<%=y2%>,"y3":<%=y3%>,"y4":<%=y4%>,"y5":<%=y5%>,"y6":<%=y6%>,"y7":<%=y7%>,"y8":<%=y8%>}
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
				            var tip = '<div class="text">' +date+ ' : ' + String(data.yaxis).format()+'건 </div>';
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
							<%
							
									for(int l=1;l<=lastDay;l++){
										String tM = l < 10 ? "0"+l : l+"";
		                    			String tYM = reqYear + reqMonth + tM;
                              			Object y = rMap_t.get(tYM)==null?0+"":rMap_t.get(tYM).get("CNT");
                              			if( l>1 ) {
                 	        %> 	
                 		                			,
                 		    <%			
                 		                		}
                            %>
                            
                            					{"y":<%=y%>,"x":<%="'"+l+"일'"%>}
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
			            },
			            s2: {
			            	area: {
		            		 normal: {
	                                color: '#2bcdba', opacity: 0.5,
	                                over: {
	                                    color: '#2bcdba', opacity: 1
	                                }
		            		 	}
		            		}
			            },
			            s3: {
			            	area: {
		            		 normal: {
	                                color: '#465866', opacity: 0.5,
	                                over: {
	                                    color: '#465866', opacity: 1
	                                }
		            		 	}
		            		}
			            },
			            s4: {
			            	area: {
		            		 normal: {
	                                color: '#e3e3e3', opacity: 0.5,
	                                over: {
	                                    color: '#e3e3e3', opacity: 1
	                                }
		            		 	}
		            		}
			            },
			            s5: {
			            	area: {
		            		 normal: {
	                                color: '#33a2a4', opacity: 0.5,
	                                over: {
	                                    color: '#33a2a4', opacity: 1
	                                }
		            		 	}
		            		}
			            },
			            s6: {
			            	area: {
		            		 normal: {
	                                color: '#f59c33', opacity: 0.5,
	                                over: {
	                                    color: '#f59c33', opacity: 1
	                                }
		            		 	}
		            		}
			            },
			            s7: {
			            	area: {
		            		 normal: {
	                                color: '#028c8e', opacity: 0.5,
	                                over: {
	                                    color: '#028c8e', opacity: 1
	                                }
		            		 	}
		            		}
			            },
			            s8: {
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
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y1'
				        },
				        "s2": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y2'
				        },
				        "s3": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y3'
				        },
				        "s4": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y4'
				        },
				        "s5": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y5'
				        },
				        "s6": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y6'
				        },
				        "s7": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y7'
				        },
				        "s8": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y8'
				        }
				    }
				};
			
			var series2 = {
				    "main": {
				        "s1": {
				            series: 'column',
				            xaxis: 'x',
				            yaxis: 'y'
				        }
				    }
				};
				
			var chart1 = webponent.chart.init($("#xchart-statistics1"), options1, styles, series1);
			var chart2 = webponent.chart.init($("#xchart-statistics2"), options2, styles, series2);
			
		</script>


		<div class="col-md-12 padded"> 
<%
	for(int u=0;u<8;u++){
		List<String> ml = menuD2List.get(u);
%>
			<div class="box">
				<div class="box-header ">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;" >
						<%=menuD1List.get(u) %> ( <%=reqYear %>년 )
					</span>
				</div> 
				<div class="box-content"> 
					
							<table class="table table-normal">
								<colgroup>
									<col style="width:7%"/>
										<%		                                		
		                                		for(int l=1;l<=lastDay;l++){
		                                %>
		                                			<col style="width:3%"/>
		                                <%	
		                                		}
		                                %>
								</colgroup>
								<thead>
									<tr class="status-pending">
										<td>2depth</td>
										<%		                                		
		                                		for(int l=1;l<=lastDay;l++){
		                                %>
		                                			<td><%=l%>일</td>
		                                <%	
		                                		}
		                                %>
									</tr>
								</thead>
							 	<tbody>
							 		<%
							 			for(int k=0;k<ml.size();k++){
							 				String d2_name = ml.get(k);
							 		%>
							 			<tr >
											<td><%=d2_name %></td>
											<%
												for(int l=1;l<=lastDay;l++){
		                                			String tM = l < 10 ? "0"+l : l+"";
		                                			String tYM = reqYear + reqMonth + tM;
		                                			Object y = rMap.get(u+"_"+d2_name+"_"+tYM)==null?"-":rMap.get(u+"_"+d2_name+"_"+tYM).get("CNT");
											%>
													<td><%=y %></td>
											<%
												}
											%>
										</tr>
							 		<%
							 			}
							 		%>
							 	</tbody>
							</table>				
					
					
				</div>
			</div>	
<%
	}
%>
		</div>
		<div class="col-md-12 padded"> 
			<div class="box">
				<div class="box-header ">
					<span class="title" style="font-size:15px;font-weight:bolder;text-align:left;background-color:rgb(255, 243, 218);color:darkgoldenrod;width:100%;">
						일별 조회수 합계 ( <%=reqYear %>년 ) 
					</span>
				</div> 
				<div class="box-content"> 
					
							<table class="table table-normal">
								<colgroup>
									<col style="width: 7%"/>
										<%		                                		
		                                		for(int l=1;l<=lastDay;l++){
		                                %>
		                                			<col style="width:3%"/>
		                                <%	
		                                		}
		                                %>
								</colgroup>
								<thead>
									<tr class="status-pending">
										<td>2depth</td>
										<%		                                		
		                                		for(int l=1;l<=lastDay;l++){
		                                %>
		                                			<td><%=l%>일</td>
		                                <%	
		                                		}
		                                %>
									</tr>
								</thead>
							 	<tbody>
							 		<tr >
										<td>합계</td>
								 		<%		                                		
		                                		for(int l=1;l<=lastDay;l++){
		                                			String tM = l < 10 ? "0"+l : l+"";
		                                			String tYM = reqYear + reqMonth + tM;
		                                			Object y = rMap_t.get(tYM)==null?"-":rMap_t.get(tYM).get("CNT");
		                                %>
		                                			<td><%=y%></td>
		                                <%	
		                                		}
		                                %>
									</tr> 
							 	</tbody>
							</table>				
					
					
				</div>
			</div>
			
			
			
			
		</div>
	</div>	


















		
		
	
	
</div>

</body>
</html>
