<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	var hash = location.hash;
	
	if(hash == '#tab1'){
		$(".tab01").trigger('click');		
	}else if(hash == '#tab2'){
		$(".tab02").trigger('click');		
	}else if(hash == '#tab3'){
		$(".tab03").trigger('click');
	}else if(hash == '#tab4'){
		$(".tab04").trigger('click');
	}else if(hash == '#tab5'){
		$(".tab05").trigger('click');
	}
	
});
function detailPupup(ele){ 
	window.open('/pyo/pyo_no'+$(ele).parent().parent().find('td:eq(0)').text()+'.html','name','resizable=no,width=900,height=800,scrollbars=yes ');
}
</script>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
						<h2><img src="/images/truck/dedu/datacenter_tit.gif" alt="보상관련정보" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/deductProductIndex.do" >보상관련정보</a>
						<span>유형별과실비율</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/fault_con_tit.gif" alt="유형별 과실비율을 상황에 따라 도표로 안내합니다. 상황과 조건을 잘 살펴보세요." /></p>				
					<div class="conSection">
						<!-- 유형별과실비율 -->
						<!-- 참조사항 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="faultArea">
								<p class="faultTxt1">참조사항</p>
								<p class="faultTxt2">유형별 과실비율 인정기준은 손해보험협회 홈페이지에서 직접 제공합니다&#46;<br/>아래 과실기준 보기를 클릭하시면 서비스를 바로 이용할 수 있습니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						
						<p style="text-align:center; border-top:1px dashed #cdd3d5;"></p>
						<p class="confirTit" style="text-align:center; margin-top:15px;"><a href="http://accident.knia.or.kr" target="_blank"><img src="/images/truck/dedu/fault_img.gif" alt="유형별 과실비율 바로가기 버튼" /></p>
					
						
						
						<!-- faultTab s -->
						<%-- <div class="faultTabs">
							<ul class="tabMenu">
								<li class="tab01"><a href="#tab1"><span class="hide">자동차와 보행자의 사고</span></a></li>
								<li class="tab02"><a href="#tab2"><span class="hide">상체&#183;팔</span></a></li>
								<li class="tab03"><a href="#tab3"><span class="hide">척추</span></a></li>
								<li class="tab04"><a href="#tab4"><span class="hide">하체&#183;다리</span></a></li>
								<li class="tab05"><a href="#tab5"><span class="hide">가슴&#183;배</span></a></li>
							</ul><!--// tabMenu e -->
							<div class="tabContainer">
								<!-- 자동차와 보행자의 사고 -->
								<div id="tab1" class="tabCont">
									<h3 class="hide">자동차와 보행자의 사고</h3>
									<!-- 횡단보행중의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">횡단보행중의 사고</h4>
										<p class="txtPoint">&#40;1&#41; 횡단보도상의 사고</p>
										<ul class="txtListst01 pB0">
											<li>가&#46; 신호기가 있는 횡단보도상의 사고</li>
										</ul>												
										<p class="txtPoint04">차량이 교차로 통과 후 사고</p>
										<table class="tbDetail_st01 tbfault" summary="차량이 교차로 통과 후 사고 상세정보 테이블 입니다.">
											<caption>차량이 교차로 통과 후 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>101</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false;//window.open('/pyo/pyo_no'+$(this).parent().parent().find('td:eq(0)').text()+'.html','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93; 녹색에 교차로 진입<br/>&#91;보행자&#93; 적색에 횡단 개시&#44; 적색에 충돌 &#9315;</a></td>
												</tr>
												<tr>
													<td>102</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no101_102.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93; 황색에 교차로 진입<br/>&#91;보행자&#93; 적색에 횡단 개시&#44; 적색에 충돌</a></td>
												</tr>
												<tr>
													<td>103</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no103_104.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93; 황색에 교차로 진입<br/>&#91;보행자&#93; &#9312; 적색에 횡단 개시&#44; 녹색&#40;녹점 &#9313;&#41;에 충돌</a></td>
												</tr>
												<tr>
													<td>104</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no103_104.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93; 황색에 교차로 진입<br/>&#91;보행자&#93; 녹색에 횡단 개시&#44; 녹색&#40;점멸&#41;에 충돌</a></td>
												</tr>
												<tr>
													<td>105</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no105_106.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93; 적색에 교차로 진입<br/>&#91;보행자&#93; 녹색에 횡단 개시&#44; 녹색&#40;녹점&#41;에 충돌&#9312;</a></td>
												</tr>
												<tr>
													<td>106</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no105_106.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93; 적색에 교차로 진입<br/>&#91;보행자&#93; 적색에 횡단 개시&#44; 적색에 충돌</a></td>
												</tr>
												<tr>
													<td>107</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no107.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93; 적색에 교차로 진입<br/>&#91;보행자&#93; 녹색&#40;녹점&#41;에 횡단 개시&#44; 적색에 충돌 &#9312;</a></td>
												</tr>
											</tbody>
										</table><!--// 차량이 교차로 통과 후 사고 e -->											
										<p class="txtPoint04">차량이 교차로 통과 후 사고</p>
										<table class="tbDetail_st01 tbfault" summary="차량이 교차로 통과 후 사고 상세정보 테이블 입니다.">
											<caption>차량이 교차로 통과 후 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>108</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no108_109.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;보행자&#93;적색에 횡단 개시&#44; 적색에 충돌</a></td>
												</tr>
												<tr>
													<td>109</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no108_109.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;보행자&#93;적색에 횡단 개시&#44; 녹색에 충돌 &#9314;</a></td>
												</tr>
												<tr>
													<td>110</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no110_111.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;보행자&#93;녹색에 횡단 개시&#44; 녹색&#40;녹점&#41;에 충돌 &#9312;</a></td>
												</tr>
												<tr>
													<td>111</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no110_111.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;보행자&#93;녹색&#40;녹점&#41;에 횡단 개시&#44; 작색에 충돌 &#9313;</a></td>
												</tr>
												<tr>
													<td>112</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no112.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;보행자&#93;녹색점멸에 횡단개시&#44; 녹색점멸에 충돌</a></td>
												</tr>
											</tbody>
										</table><!--// 차량이 교차로 통과 후 사고 e -->
										<ul class="txtListst01 pB0">
											<li>나&#46; 신호기가 없는 횡단보도상의 사고</li>
										</ul>				
										<table class="tbDetail_st01 tbfault" summary="신호기가 없는 횡단보도상의 사고 상세정보 테이블 입니다.">
											<caption>신호기가 없는 횡단보도상의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>113</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no113.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">통상의 횡단보도상의 횡단</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기가 없는 횡단보도상의 사고 e -->	
										<p class="txtPoint txtSep">&#40;2&#41; 횡단보도 부근의 사고</p>
										<ul class="txtListst01 pB0">
											<li>가&#46; 신호기가 있는 횡단보도 부근의 사고</li>
										</ul>												
										<p class="txtPoint04">차량이 횡단보도로 통과 후 사고</p>
										<table class="tbDetail_st01 tbfault" summary="차량이 횡단보도로 통과 후 사고 상세정보 테이블 입니다.">
											<caption>차량이 횡단보도로 통과 후 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>114</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no114.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93;적색신호 직진 또는 좌회전 &#9314;&#9315;</a></td>
												</tr>
												<tr>
													<td>115</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no115_116.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93;황색신호 직진 또는 좌회전 &#9312;</a></td>
												</tr>
												<tr>
													<td>116</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no115_116.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93;녹색신호 직진 또는 좌회전 &#9315;</a></td>
												</tr>
												<tr>
													<td>117</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no117_118.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93;우회전 허용안될 때 &#9312;</a></td>
												</tr>
												<tr>
													<td>118</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no117_118.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93;우회전 허용될 때</a></td>
												</tr>
											</tbody>
										</table><!--// 차량이 횡단보도로 통과 후 사고 e -->											
										<p class="txtPoint04">차량이 횡단보도로 통과 전 사고</p>
										<table class="tbDetail_st01 tbfault" summary="차량이 횡단보도로 통과 전 사고 상세정보 테이블 입니다.">
											<caption>차량이 횡단보도로 통과 전 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>119</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no119.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;자동차&#93;횡단보도 통과전</a></td>
												</tr>
											</tbody>
										</table><!--// 차량이 횡단보도로 통과 전 사고 e -->
										<ul class="txtListst01 pB0">
											<li>나&#46; 신호기가 없는 횡단보도 육교 및 지하도 부근의 사고</li>
										</ul>				
										<table class="tbDetail_st01 tbfault" summary="신호기가없는 횡단보도 육교 및 지하도 부근의 사고 상세정보 테이블 입니다.">
											<caption>신호기가없는 횡단보도 육교 및 지하도 부근의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>120</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no120_121.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">신호등 없는 통상의 횡단보도 부근 &#9313;</a></td>
												</tr>
												<tr>
													<td>121</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no120_121.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">육교 및 지하도 부근의 사고 &#9317;</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기가없는 횡단보도 육교 및 지하도 부근의 사고 e -->			
										<p class="txtPoint txtSep">&#40;3&#41; 그 밖의 장소에서의 사고</p>
										<ul class="txtListst01 pB0">
											<li>가&#46; 교차로에서의 사고</li>
										</ul>	
										<table class="tbDetail_st01 tbfault" summary="교차로에서의 사고 상세정보 테이블 입니다.">
											<caption>교차로에서의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>122</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no122.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">교차로에서의 횡단중 사고 &#9313;</a></td>
												</tr>
											</tbody>
										</table><!--// 교차로에서의 사고 e -->		
										<ul class="txtListst01 pB0">
											<li>나&#46; 단일로&#40;직선로 또는 곡선로&#41; 에서의 사고</li>
										</ul>	
										<table class="tbDetail_st01 tbfault" summary="단일로(직선로 또는 곡선로) 에서의 사고 상세정보 테이블 입니다.">
											<caption>단일로&#40;직선로 또는 곡선로&#41; 에서의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>123</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no123.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">통상도로의 횡단</a></td>
												</tr>
											</tbody>
										</table><!--// 단일로(직선로 또는 곡선로) 에서의 사고 e -->																		
									</div>
									<!-- 도로를 따라 보행중의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">도로를 따라 보행중의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 보차도의 구별이 있는 도로</p>
										<table class="tbDetail_st01 tbfault" summary="보차도의 구별이 있는 도로 사고 상세정보 테이블 입니다.">
											<caption>보차도의 구별이 있는 도로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>124</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no124_126.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">보도상 보행중</a></td>
												</tr>
												<tr>
													<td>125</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no124_126.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">차도상&#40;차도 통행이 허용된 경우&#41; &#9314;</a></td>
												</tr>
												<tr>
													<td>126</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no124_126.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">차도상&#40;차도 통행이 허용되지 않음&#41; &#9315;</a></td>
												</tr>
											</tbody>
										</table><!--// 보차도의 구별이 있는 도로 e -->
										<p class="txtPoint txtSep pB0">&#40;2&#41; 보차도의 구별이 있는 도로</p>
										<table class="tbDetail_st01 tbfault" summary="보차도의 구별이 있는 도로 사고 상세정보 테이블 입니다.">
											<caption>보차도의 구별이 있는 도로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>127</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no127_128.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;보행자&#93;도로의 측단 보행</a></td>
												</tr>
												<tr>
													<td>128</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no127_128.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;보행자&#93;도로의 중앙부분 통행 &#9313;</a></td>
												</tr>
											</tbody>
										</table><!--// 보차도의 구별이 있는 도로 e -->		
										<p class="txtPoint txtSep pB0">&#40;3&#41; 보차도의 구별이 있는 도로</p>
										<table class="tbDetail_st01 tbfault" summary="보차도의 구별이 있는 도로 사고 상세정보 테이블 입니다.">
											<caption>보차도의 구별이 있는 도로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>129</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no129.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">보행자용 도로 &#9312;</a></td>
												</tr>
											</tbody>
										</table><!--// 보차도의 구별이 있는 도로 e -->																		
									</div>		
									<!-- 도로에 누워 있는 자 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">도로에 누워 있는 자</h4>
										<table class="tbDetail_st01 tbfault" summary="도로에 누워 있는 자 사고 상세정보 테이블 입니다.">
											<caption>도로에 누워 있는 자 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>130</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no130.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;보행자&#93; 도로에 누워 있음</a></td>
												</tr>
											</tbody>
										</table><!--// 도로에 누워 있는 자 e -->			
									</div>		
									<!-- 후진차에 의한 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">후진차에 의한 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="후진차에 의한 사고 상세정보 테이블 입니다.">
											<caption>후진차에 의한 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>131</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no131_132.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;보행자&#93;차의 직후를 횡단한 경우 &#9312;</a></td>
												</tr>
												<tr>
													<td>132</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no131_132.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">직후 횡단 이외의 경우 &#9315;</a></td>
												</tr>
											</tbody>
										</table><!--// 후진차에 의한 사고 e -->			
									</div>			
									<!-- 기타 도로외 장소에서의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">기타 도로외 장소에서의 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="기타 도로외 장소에서의 사고 상세정보 테이블 입니다.">
											<caption>기타 도로외 장소에서의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>133</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no133.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">횡단중 사고</a></td>
												</tr>
											</tbody>
										</table><!--// 기타 도로외 장소에서의 사고 e -->			
									</div>															
								</div>
								<div id="tab2" class="tabCont">
									<h3 class="hide">자동차와 자동차의 사고</h3>
									<!-- 교차로에서 직진차 상호간의 충돌사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">교차로에서 직진차 상호간의 충돌사고</h4>
										<p class="txtPoint">&#40;1&#41; 신호기에 의해 교통정리가 이루어지고 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>신호기에 의해 교통정리가 이루어지고 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>201</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no201.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 녹색 진입<br/>&#91;B&#93; 적색 진입</a></td>
												</tr>
												<tr>
													<td>202</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no202.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93;&#40;가&#41;녹색에 진입하였으나 아직 교차로를 벗어나지 못한 경우 &#9312;<br/>&#40;나&#41;황색에 진입하였으나 아직 교차로를 벗어나지 못한 경우 &#9313;<br/>&#91;B&#93; 녹색 진입</a></td>
												</tr>
												<tr>
													<td>203</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no203.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 황색 진입 &#9312;<br/>&#91;B&#93; 적색 진입</a></td>
												</tr>
												<tr>
													<td>204</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no204.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 적색 진입<br/>&#91;B&#93; 적색 진입</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기에 의해 교통정리가 이루어지고 있는 교차로 e -->	
										<p class="txtPoint txtSep">&#40;2&#41; 신호기에 의해 교통정리가 이루어지고 있지 않는 교차로</p>										
										<p class="txtPoint04">동일 폭의 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="동일 폭의 교차로 사고 상세정보 테이블 입니다.">
											<caption>동일 폭의 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>205</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no205.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 우측차<br/>&#91;B&#93; 좌측차</a></td>
												</tr>
											</tbody>
										</table><!--// 동일 폭의 교차로 e -->											
										<p class="txtPoint04">대소로 차이가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="대소로 차이가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대소로 차이가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>206</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no206.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 대로차<br/>&#91;B&#93; 소로차</a></td>
												</tr>
											</tbody>
										</table><!--// 대소로 차이가 있는 교차로 e -->											
										<p class="txtPoint04">한쪽에 일시정지표지&#40;또는 일방통행표지&#41;가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="한쪽에 일시정지표지(또는 일방통행표지)가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지&#40;또는 일방통행표지&#41;가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>207</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no207_208.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93;일시정지표지 없음<br/>&#91;B&#93; 일시정지표지 있음</a></td>
												</tr>
												<tr>
													<td>208</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no207_208.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 일방통행 위반하지 않은 차<br/>&#91;B&#93; 일방통행 위반한 차 &#9314;</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지(또는 일방통행표지)가 있는 교차로 e -->																		
									</div>
									<!-- 교차로에서 좌회전차화 직진차와의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">교차로에서 좌회전차화 직진차와의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 같은 도로의 대향방향에서 진입해 온 경우</p>
										<ul class="txtListst01 pB0">
											<li>가&#46; 신호기에 의해 교통정리가 이루어지고 있는 교차로</li>
										</ul>												
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>신호기에 의해 교통정리가 이루어지고 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>209</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no209.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 적색&#40;직진&#41;<br/>&#91;B&#93; 녹색화살표시 좌회전</a></td>
												</tr>
												<tr>
													<td>210</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no210.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 녹색&#40;직진&#41;<br/>&#91;B&#93; 녹색&#40;좌회전&#41;</a></td>
												</tr>
												<tr>
													<td>211</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no211.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 황색진입&#40;직진&#41;<br/>&#91;B&#93; 녹색진입&#40;황색신호의 좌회전&#41;</a></td>
												</tr>
												<tr>
													<td>212</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no212.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 황&#40;적&#41;색 직진<br/>&#91;B&#93; 황&#40;적&#41;색 좌회전</a></td>
												</tr>
												<tr>
													<td>213</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no213.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93;&#40;가&#41;녹색화살표에 좌화전 진입하였으나 아직 교차로를 벗어나지  못한 경우<br/>&#40;나&#41;황색에 좌회전 진입하였으나 아직 교차로를 벗어나지 못한 경우<br/>&#91;B&#93; 녹색 진입</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기에 의해 교통정리가 이루어지고 있는 교차로 e -->
										<ul class="txtListst01 pB0">
											<li>나&#46; 신호기에 의해 교통정리가 이루어지고 있지 않는 교차로</li>
										</ul>												
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 사고 상세정보 테이블 입니다.">
											<caption>신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>214</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no214.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진<br/>&#91;B&#93; 좌회전</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 e -->
										<p class="txtPoint txtSep pB0">&#40;2&#41; 교차도로에서 진입해 온 경우</p>
										<ul class="txtListst01 pB0">
											<li>가&#46; 신호기에 의해 교통정리가 이루어지고 있는 교차로</li>
										</ul>												
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>신호기에 의해 교통정리가 이루어지고 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>215</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no215_216.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 적색&#40;직진&#41;<br/>&#91;B&#93; 녹색화살표 &#40;좌회전&#41;</a></td>
												</tr>
												<tr>
													<td>216</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no215_216.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 적색&#40;직진&#41;<br/>&#91;B&#93; 적색&#40;좌회전&#41;</a></td>
												</tr>
												<tr>
													<td>217</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no217_218.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 황색&#40;직진&#41; &#9312;<br/>&#91;B&#93; 적색&#40;좌회전&#41;</a></td>
												</tr>
												<tr>
													<td>218</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no217_218.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 적색&#40;직진&#41;<br/>&#91;B&#93; 황색&#40;좌회전&#41;</a></td>
												</tr>
												<tr>
													<td>219</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no219.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93;&#40;가&#41;녹색화살표에 좌화전 진입하였으나 아직 교차로를 벗어나지 못한 경우<br/>&#40;나&#41;황색에 좌회전 진입하였으나 아직 교차로를 벗어나지 못한 경우<br/>&#91;B&#93; 녹색 진입</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기에 의해 교통정리가 이루어지고 있는 교차로 e -->
										<ul class="txtListst01 pB0">
											<li>나&#46;신호기에 의해 교통정리가 이루어지고 있지 않는 교차로</li>
										</ul>												
										<p class="txtPoint04">동일폭 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 중 동일폭 교차로 사고 상세정보 테이블 입니다.">
											<caption>동일폭 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>220</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no220_221.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진&#40;좌측차&#41;<br/>&#91;B&#93; 좌회전&#40;우측차&#41;</a></td>
												</tr>
												<tr>
													<td>221</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no220_221.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진&#40;우측차&#41;<br/>&#91;B&#93; 좌회전&#40;좌측차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 동일폭 교차로 e -->												
										<p class="txtPoint04">대&#183;소로 차이가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 중 대·소로 차이가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대&#183;소로 차이가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>222</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no222_223.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진&#40;대로&#41;<br/>&#91;B&#93; 좌회전&#40;소로&#41;</a></td>
												</tr>
												<tr>
													<td>223</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no222_223.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진&#40;소로&#41;<br/>&#91;B&#93; 좌회전&#40;대로&#41;</a></td>
												</tr>
												<tr>
													<td>224</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no224.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진&#40;소로&#41;<br/>&#91;B&#93; 좌회전&#40;대로&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 대·소로 차이가 있는 교차로 e -->												
										<p class="txtPoint04">한쪽에 일시정지표지가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 중 한쪽에 일시정지표지가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>225</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no225.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진<br/>&#91;B&#93; 좌회전&#40;일시정지 위반&#41;</a></td>
												</tr>
												<tr>
													<td>226</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no226_227.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진&#40;일시정지 위반 &#9312;&#41;<br/>&#91;B&#93; 좌회전&#40;우측차&#41;</a></td>
												</tr>
												<tr>
													<td>227</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no226_227.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진&#40;일시정지위반&#41;<br/>&#91;B&#93; 좌회전&#40;좌측차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지가 있는 교차로 e -->																		
									</div>		
									<!-- 교차로에서의 기타 형태의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">교차로에서의 기타 형태의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 한쪽 방향에만 교통정리가 이루어지는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="한쪽 방향에만 교통정리가 이루어지는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽 방향에만 교통정리가 이루어지는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>228</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no228.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진&#40;좌&#183;우회전 포함&#41;<br/>&#91;B&#93; 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽 방향에만 교통정리가 이루어지는 교차로 e -->		
										<p class="txtPoint">&#40;2&#41; 우회전차와 직진차와의 사고</p>
										<p class="txtPoint04">한쪽에 일시정지표지가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="우회전차와 직진차와의 사고 중 한쪽에 일시정지표지가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>229</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no229.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 우회전&#40;우측차&#41;<br/>&#91;B&#93; 직진&#40;좌측차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지가 있는 교차로 e -->		
										<p class="txtPoint04">대&#183;소로 차이가있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="우회전차와 직진차와의 사고 중 대·소로 차이가있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대&#183;소로 차이가있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>230</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no230_231.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 우회전&#40;소로&#41;<br/>&#91;B&#93; 직진&#40;대로&#41;</a></td>
												</tr>
												<tr>
													<td>231</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no230_231.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 우회전&#40;대로&#41;<br/>&#91;B&#93; 직진&#40;소로&#41; &#9312;</a></td>
												</tr>
											</tbody>
										</table><!--// 대·소로 차이가있는 교차로 e -->				
										<p class="txtPoint04">한쪽에 일시정지표지가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="우회전차와 직진차와의 사고 중 한쪽에 일시정지표지가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>232</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no232_233.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 우회전차&#40;일시정지 위반&#41;<br/>&#91;B&#93; 직진차&#40;일시정지표지 없음&#41;</a></td>
												</tr>
												<tr>
													<td>233</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no232_233.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진차&#40;일시정지 위반&#41;<br/>&#91;B&#93; 우회전차&#40;일시정지표지 없음&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지가 있는 교차로 e -->			
										<p class="txtPoint">&#40;3&#41; 좌회전차와 상호간의 사고</p>
										<p class="txtPoint04">동일폭의 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="좌회전차와 상호간의 사고 중 동일폭의 교차로 사고 상세정보 테이블 입니다.">
											<caption>동일폭의 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>234</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no234.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 좌회전&#40;우측차&#41;<br/>&#91;B&#93; 좌회전&#40;좌측차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 동일폭의 교차로 e -->		
										<p class="txtPoint04">대&#183;소로 차이가있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="좌회전차와 상호간의 사고 중 대·소로 차이가있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대&#183;소로 차이가있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>235</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no235.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 소로차<br/>&#91;B&#93; 대로차</a></td>
												</tr>
											</tbody>
										</table><!--// 대·소로 차이가있는 교차로 e -->				
										<p class="txtPoint04">한쪽에 일시정지표지가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="좌회전차와 상호간의 사고 중 한쪽에 일시정지표지가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>236</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no236.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 일시정지표지 있음<br/>&#91;B&#93; 일시정지표지 없음</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지가 있는 교차로 e -->				
										<p class="txtPoint">&#40;4&#41; 좌&#183;우회전차와 후속 직진차와의 사고</p>
										<p class="txtPoint04">좌회전차와 추월 직진차와의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="좌회전차와 추월 직진차와의 사고 사고 상세정보 테이블 입니다.">
											<caption>좌회전차와 추월 직진차와의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>237</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no237.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 추월직진<br/>&#91;B&#93; 좌회전</a></td>
												</tr>
											</tbody>
										</table><!--// 좌회전차와 추월 직진차와의 사고 e -->		
										<p class="txtPoint04">미리 중앙으로 다가서지 않은 좌&#183;우회전차와 후속 직진차와의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="미리 중앙으로 다가서지 않은 좌·우회전차와 후속 직진차와의 사고 상세정보 테이블 입니다.">
											<caption>대&#183;소로 차이가있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>238</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no238.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 후속 직진<br/>&#91;B&#93; 좌&#40;우&#41;회전&#40;중앙 또는 우측단으로 다가서는 지장이 없는 경우&#41; &#9312;</a></td>
												</tr>
												<tr>
													<td>239</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no239.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 후속 직진<br/>&#91;B&#93; 좌&#40;우&#41;회전&#40;중앙 또는 우측단으로 다가서는 지장이 있는 경우&#41; &#9312;</a></td>
												</tr>
											</tbody>
										</table><!--// 미리 중앙으로 다가서지 않은 좌·우회전차와 후속 직진차와의 사고 e -->					
										<p class="txtPoint pB0">&#40;5&#41; T자형 교차로에서의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="T자형 교차로에서의 사고 상세정보 테이블 입니다.">
											<caption>T자형 교차로에서의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>240</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no240.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직선로 직진차<br/>&#91;B&#93; 좌&#40;우&#41;회전차</a></td>
												</tr>
												<tr>
													<td>241</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no241.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 좌회전차<br/>&#91;B&#93; 좌회전차</a></td>
												</tr>
											</tbody>
										</table><!--// 좌회전차와 추월 직진차와의 사고 e -->	
									</div>				
									<!-- 도로외 출입차와 직진차와의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">도로외 출입차와 직진차와의 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="도로외 출입차와 직진차와의 사고 상세정보 테이블 입니다.">
											<caption>도로외 출입차와 직진차와의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>242</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no242.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진차<br/>&#91;B&#93; 노외차&#40;도로외 출입차&#41; &#9312;</a></td>
												</tr>
												<tr>
													<td>243</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no243.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진차<br/>&#91;B&#93; 노외로 좌회전차 &#9312;</a></td>
												</tr>
											</tbody>
										</table><!--// 도로외 출입차와 직진차와의 사고 e -->			
									</div>				
									<!-- 주차장 내 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">주차장 내 사고</h4>			
										<p class="txtPoint pB0">&#40;1&#41; 주차 해제 후 진행하는 차와 직진차와의 사고 &#9312;</p>
										<table class="tbDetail_st01 tbfault" summary="주차 해제 후 진행하는 차와 직진차와의 사고 ① 상세정보 테이블 입니다.">
											<caption>주차 해제 후 진행하는 차와 직진차와의 사고 ①에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>244</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no244.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진차<br/>&#91;B&#93; 진행차 &#9313;</a></td>
												</tr>
											</tbody>
										</table><!--// 주차 해제 후 진행하는 차와 직진차와의 사고 ① e -->			
									</div>				
									<!-- 고속도로가 아닌 도로에서의 다중사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">고속도로가 아닌 도로에서의 다중사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 선행사고 차량에 대한 추돌 사고 &#9312;</p>
										<table class="tbDetail_st01 tbfault" summary="선행사고 차량에 대한 추돌 사고 ① 상세정보 테이블 입니다.">
											<caption>선행사고 차량에 대한 추돌 사고 ①에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>245</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no245.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 추돌차<br/>&#91;B&#93; 피추돌차 &#9313;</a></td>
												</tr>
											</tbody>
										</table><!--// 선행사고 차량에 대한 추돌 사고 ① e -->			
									</div>				
									<!-- 차로 감소시 발생 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">차로 감소시 발생 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 차로 감소 지점 사고 &#9312;</p>
										<table class="tbDetail_st01 tbfault" summary="(1) 차로 감소 지점 사고 ① 상세정보 테이블 입니다.">
											<caption>&#40;1&#41; 차로 감소 지점 사고 ①에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>246</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no246.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 본선차<br/>&#91;B&#93; 합류차</a></td>
												</tr>
											</tbody>
										</table><!--// 차로 감소시 발생 사고 e -->			
									</div>				
									<!-- 대소우회전, 대소좌회전 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">대소우회전, 대소좌회전</h4>
										<p class="txtPoint pB0">&#40;1&#41; 차로 감소 지점 사고 ①</p>
										<table class="tbDetail_st01 tbfault" summary="차로 감소 지점 사고 ① 상세정보 테이블 입니다.">
											<caption>차로 감소 지점 사고 ①에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>247</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no247.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 우&#47;좌회전&#40;우&#47;좌측차&#41;<br/>&#91;B&#93; 우&#47;좌회전&#40;좌&#47;우측차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 차로 감소 지점 사고 ① e -->			
									</div>				
									<!-- 개문시 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">개문시 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 문개방 사고 &#9312;</p>
										<table class="tbDetail_st01 tbfault" summary="(1) 문개방 사고 ① 상세정보 테이블 입니다.">
											<caption>&#40;1&#41; 문개방 사고 ①에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>248</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no248.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 후행 차량<br/>&#91;B&#93; 개문 차량</a></td>
												</tr>
											</tbody>
										</table><!--// 문개방 사고 ① e -->			
									</div>				
									<!-- 대항차량간의 사고(중앙선 침범) -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">대항차량간의 사고&#40;중앙선 침범&#41;</h4>
										<table class="tbDetail_st01 tbfault" summary="대항차량간의 사고(중앙선 침범) 상세정보 테이블 입니다.">
											<caption>대항차량간의 사고&#40;중앙선 침범&#41;에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>249</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no249.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진<br/>&#91;B&#93; 중앙선 침범</a></td>
												</tr>
											</tbody>
										</table><!--// 대항차량간의 사고(중앙선 침범) e -->			
									</div>				
									<!-- 동일방향으로 진행하는 차량간의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">동일방향으로 진행하는 차량간의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 추월&#40;앞지르기&#41; 중의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="(1) 추월(앞지르기) 중의 사고 상세정보 테이블 입니다.">
											<caption>&#40;1&#41; 추월&#40;앞지르기&#41; 중의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>250</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no250.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;앞지르기 금지 장소&#93;<br/>&#91;A&#93; 선행 직진<br/>&#91;B&#93; 후행 추월</a></td>
												</tr>
												<tr>
													<td>251</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no251.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;앞지르기 금지 장소가 아닌 장소&#93;<br/>&#91;A&#93; 선행 직진<br/>&#91;B&#93; 후행 추월</a></td>
												</tr>
											</tbody>
										</table><!--// (1) 추월(앞지르기) 중의 사고 e -->	
										<p class="txtPoint pB0">&#40;2&#41; 진로변경차와 후속직진차와의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="(2) 진로변경차와 후속직진차와의 사고 상세정보 테이블 입니다.">
											<caption>&#40;2&#41; 진로변경차와 후속직진차와의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>252</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no252.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 후속 직진<br/>&#91;B&#93; 선행 진로변경</a></td>
												</tr>
											</tbody>
										</table><!--// (2) 진로변경차와 후속직진차와의 사고 e -->	
										<p class="txtPoint pB0">&#40;3&#41; 추돌 사고 </p>
										<table class="tbDetail_st01 tbfault" summary="(3) 추돌 사고  상세정보 테이블 입니다.">
											<caption>&#40;3&#41; 추돌 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>253</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no253.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 후속&#40;추돌차&#41;<br/>&#91;B&#93; 선행&#40;피추돌차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// (3) 추돌 사고 e -->			
									</div>				
									<!-- 회전(U-turn)차와 직진차와의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">회전&#40;U-turn&#41;차와 직진차와의 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="회전(U-turn)차와 직진차와의 사고 상세정보 테이블 입니다.">
											<caption>회전&#40;U-turn&#41;차와 직진차와의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>254</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no254.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 직진차<br/>&#91;B&#93; 회전&#40;U&#45;turn&#41;차</a></td>
												</tr>
											</tbody>
										</table><!--// 회전(U-turn)차와 직진차와의 사고 e -->			
									</div>					
									<!-- 주차 중의 사고(정차 중 포함) -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">주차 중의 사고&#40;정차 중 포함&#41;</h4>
										<table class="tbDetail_st01 tbfault" summary="주차 중의 사고(정차 중 포함) 상세정보 테이블 입니다.">
											<caption>주차 중의 사고&#40;정차 중 포함&#41;에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>255</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no255.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;A&#93; 주&#40;정&#41;차중인 차<br/>&#91;B&#93; 추돌차</a></td>
												</tr>
											</tbody>
										</table><!--// 주차 중의 사고(정차 중 포함) e -->			
									</div>					
									<!-- 기타 도로외 장소에서의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">기타 도로외 장소에서의 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="기타 도로외 장소에서의 사고 상세정보 테이블 입니다.">
											<caption>기타 도로외 장소에서의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>256</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no256.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">주차장 내 사고<br/>&#91;A&#93; 직진차<br/>&#91;B&#93; 진행차</a></td>
												</tr>
											</tbody>
										</table><!--// 기타 도로외 장소에서의 사고 e -->			
									</div>		
								</div>
								<!-- 자동차와 2륜차의 사고 -->
								<div id="tab3" class="tabCont">		
									<h3 class="hide">자동차와 2륜차의 사고</h3>			
									<!-- 교차로에서 직진차 상호간의 충돌사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">교차로에서 직진차 상호간의 충돌사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 신호기에 의해 교통정리가 이루어지고 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>신호기에 의해 교통정리가 이루어지고 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>301</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no301_302.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 녹색진입<br/>자동차B 적색 진입 &#9315;</a></td>
												</tr>
												<tr>
													<td>302</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no301_302.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 적색 진입<br/>자동차B 녹색 진입</a></td>
												</tr>
												<tr>
													<td>303</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no302_304.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 황색 진입<br/>자동차B 적색 진입</a></td>
												</tr>
												<tr>
													<td>304</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no302_304.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 적색진입<br/>자동차B 황색 진입</a></td>
												</tr>
												<tr>
													<td>305</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no305.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 적색신호 진입<br/>자동차B 적색신호 진입</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기에 의해 교통정리가 이루어지고 있는 교차로 e -->		
										<p class="txtPoint pB0">&#40;2&#41; 신호기에 의해 교통정리가 이루어지고 있지 않는 교차로</p>
										<p class="txtPoint04">동일 폭의 교차로 &#9313;</p>
										<table class="tbDetail_st01 tbfault" summary="동일 폭의 교차로② 사고 상세정보 테이블 입니다.">
											<caption>동일 폭의 교차로② 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>306</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no306_307.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 우측차<br/>자동차B 좌측차</a></td>
												</tr>
												<tr>
													<td>307</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no306_307.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌측차<br/>자동차B 우측차</a></td>
												</tr>
											</tbody>
										</table><!--// 동일 폭의 교차로② e -->	
										<p class="txtPoint04">대소로 차이가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="대소로 차이가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대소로 차이가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>308</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no308_309.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 대로<br/>자동차B 소로</a></td>
												</tr>
												<tr>
													<td>309</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no308_309.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 소로<br/>자동차B 대로</a></td>
												</tr>
											</tbody>
										</table><!--// 대소로 차이가 있는 교차로 e -->		
										<p class="txtPoint04">한쪽에 일시정지표지&#40;또는 일방통행표지&#41;가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="한쪽에 일시정지표지(또는 일방통행표지)가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지&#40;또는 일방통행표지&#41;가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>310</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no310_311.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 일시정지표지 없음<br/>자동차B 일시정지표지 있음</a></td>
												</tr>
												<tr>
													<td>311</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no310_311.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 일시정지표지 있음<br/>자동차B 일시정지표지 없음</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지(또는 일방통행표지)가 있는 교차로 e -->		
									</div>
									<!-- 교차로에서 좌회전차화 직진차와의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">교차로에서 좌회전차화 직진차와의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 같은 도로의 대향방향에서 진입해 온 경우</p>
										<ul class="txtListst01 pB0">
											<li>가&#46; 신호기에 의해 교통정리가 이루어지고 있는 교차로</li>
										</ul>												
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>신호기에 의해 교통정리가 이루어지고 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>312</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no312_313.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 적색직진<br/>자동차B 녹색화살표 좌회전</a></td>
												</tr>
												<tr>
													<td>313</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no312_313.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 녹색화살표 좌회전<br/>자동차B 적색직진</a></td>
												</tr>
												<tr>
													<td>314</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no314_315.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 녹색 직진<br/>자동차B 녹색 좌회전 &#9312;</a></td>
												</tr>
												<tr>
													<td>315</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no314_315.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 녹색 좌회전<br/>자동차B 녹색 직진 &#9312;</a></td>
												</tr>
												<tr>
													<td>316</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no316_317.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 황&#40;적&#41;색 직진<br/>자동차B 녹색진입 황&#40;적&#41;색 좌회전</a></td>
												</tr>
												<tr>
													<td>317</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no316_317.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 녹색진입 황&#40;적&#41;색 좌회전<br/>자동차B 황&#40;적&#41;색 직진</a></td>
												</tr>
												<tr>
													<td>318</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no318_319.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 황&#40;적&#41;색 직진<br/>자동차B 황&#40;적&#41;색 좌회전</a></td>
												</tr>
												<tr>
													<td>319</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no318_319.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 황&#40;적&#41;색 좌회전<br/>자동차B 황&#40;적&#41;색 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기에 의해 교통정리가 이루어지고 있는 교차로 e -->
										<ul class="txtListst01 pB0">
											<li>나&#46; 신호기에 의해 교통정리가 이루어지고 있지 않는 교차로</li>
										</ul>												
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 사고 상세정보 테이블 입니다.">
											<caption>신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>320</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no320_321.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진<br/>자동차B 좌회전</a></td>
												</tr>
												<tr>
													<td>321</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no320_321.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌회전<br/>자동차B 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 e -->
										<p class="txtPoint txtSep pB0">&#40;2&#41; 교차도로에서 진입해 온 경우</p>
										<ul class="txtListst01 pB0">
											<li>가&#46; 신호기에 의해 교통정리가 이루어지고 있는 교차로</li>
										</ul>												
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>신호기에 의해 교통정리가 이루어지고 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>322</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no322_323.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 녹색직진<br/>자동차B 적색 좌화전</a></td>
												</tr>
												<tr>
													<td>323</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no322_323.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 적색좌회전<br/>자동차B 녹색 직진</a></td>
												</tr>
												<tr>
													<td>324</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no324_325.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 녹색화살표 좌회전<br/>자동차B 적색 직진</a></td>
												</tr>
												<tr>
													<td>325</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no324_325.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 적색 직진<br/>자동차B 녹색화살표 좌회전</a></td>
												</tr>
												<tr>
													<td>326</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no326_327.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진<br/>자동차B 좌회전</a></td>
												</tr>
												<tr>
													<td>327</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no326_327.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌회전<br/>자동차B 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기에 의해 교통정리가 이루어지고 있는 교차로 e -->
										<ul class="txtListst01 pB0">
											<li>나&#46;신호기에 의해 교통정리가 이루어지고 있지 않는 교차로</li>
										</ul>												
										<p class="txtPoint04">동일폭 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 중 동일폭 교차로 사고 상세정보 테이블 입니다.">
											<caption>동일폭 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>328</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no328_329.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;좌측차&#41;<br/>자동차B 좌회전&#40;우측차&#41;</a></td>
												</tr>
												<tr>
													<td>329</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no328_329.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌회전&#40;우측차&#41;<br/>자동차B 직진&#40;좌측차&#41;</a></td>
												</tr>
												<tr>
													<td>330</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no330_331.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;우측차&#41;<br/>자동차B 좌회전&#40;좌측차&#41;</a></td>
												</tr>
												<tr>
													<td>331</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no330_331.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌회전&#40;우측차&#41;<br/>자동차B 직진&#40;우측차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 동일폭 교차로 e -->												
										<p class="txtPoint04">대&#183;소로 차이가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 중 대·소로 차이가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대&#183;소로 차이가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>332</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no332_333.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;대로&#41;<br/>자동차B 좌회전&#40;소로&#41;</a></td>
												</tr>
												<tr>
													<td>333</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no332_333.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌회전&#40;소로&#41;<br/>자동차B 직진&#40;대로&#41;</a></td>
												</tr>
												<tr>
													<td>334</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no334_335.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌회전&#40;대로&#41;<br/>자동차B 직진&#40;소로&#41;</a></td>
												</tr>
												<tr>
													<td>335</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no334_335.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;소로&#41;<br/>자동차B 좌회전&#40;대로&#41;</a></td>
												</tr>
												<tr>
													<td>336</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no336_337.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 동일방향 좌회전&#40;대로&#41;<br/>자동차B 직진&#40;소로&#41;</a></td>
												</tr>
												<tr>
													<td>337</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no336_337.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;소로&#41;<br/>자동차B 동일방향 좌회전&#40;대로&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 대·소로 차이가 있는 교차로 e -->												
										<p class="txtPoint04">한쪽에 일시정지표지가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있지 않는 교차로 중 한쪽에 일시정지표지가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>338</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no338_339.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 동일방향 좌회전<br/>자동차B 직진&#40;일시정지 위반&#41;</a></td>
												</tr>
												<tr>
													<td>339</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no338_339.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;일시정지 위반&#41;<br/>자동차B 동일방향 좌회전</a></td>
												</tr>
												<tr>
													<td>340</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no340_341.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;일시정지 위반&#41;<br/>자동차B 대향방향 좌회전</a></td>
												</tr>
												<tr>
													<td>341</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no340_341.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 대향방향 좌회전<br/>자동차B 직진&#40;일시정지 위반&#41;</a></td>
												</tr>
												<tr>
													<td>342</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no342_343.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진<br/>자동차B 좌회전&#40;일시정지 위반&#41;</a></td>
												</tr>
												<tr>
													<td>343</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no342_343.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌회전&#40;일시정지 위반&#41;<br/>자동차B 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지가 있는 교차로 e -->																		
									</div>		
									<!-- 교차로에서의 기타 형태의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">교차로에서의 기타 형태의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 우회전차와 직진차와의 사고</p>
										<p class="txtPoint04">동일폭의 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="동일폭의 교차로 사고 상세정보 테이블 입니다.">
											<caption>동일폭의 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>344</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no344_345.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 우회전&#40;우측차&#41;<br/>자동차B 직진&#40;좌측차&#41;</a></td>
												</tr>
												<tr>
													<td>345</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no344_345.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;좌측차&#41;<br/>자동차B 우회전&#40;우측차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 동일폭의 교차로 e -->	
										<p class="txtPoint04">대&#183;소로 차이가있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="대·소로 차이가있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대&#183;소로 차이가있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>346</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no346_347.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 우회전&#40;소로&#41;<br/>자동차B 직진&#40;대로&#41;</a></td>
												</tr>
												<tr>
													<td>347</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no346_347.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;대로&#41;<br/>자동차B 우회전&#40;소로&#41;</a></td>
												</tr>
												<tr>
													<td>348</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no348_349.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 우회전&#40;대로&#41;<br/>자동차B 직진&#40;소로&#41;</a></td>
												</tr>
												<tr>
													<td>349</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no348_349.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;소로&#41;<br/>자동차B 우회전&#40;대로&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 대·소로 차이가있는 교차로 e -->		
										<p class="txtPoint04">한쪽에 일시정지표지가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="한쪽에 일시정지표지가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>350</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no350_351.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 우회전&#40;일시정지 위반&#41;<br/>자동차B 직진&#40;일시정지표지 없음&#41;</a></td>
												</tr>
												<tr>
													<td>351</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no350_351.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;일시정지표시 없음&#41; 자동차B 우회전&#40;일시정지 위반&#41;</a></td>
												</tr>
												<tr>
													<td>352</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no352_353.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 우회전&#40;일시정지표지 없음&#41;<br/>자동차B 직진&#40;일시정지위반&#41;&#9312;</a></td>
												</tr>
												<tr>
													<td>353</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no352_353.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진&#40;일시정지 위반&#41;<br/>자동차B 우회전&#40;일시정지표지 없음&#41;&#9312;</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지가 있는 교차로 e -->		
										<p class="txtPoint">&#40;2&#41; 좌회전차와 상호간의 사고</p>
										<p class="txtPoint04">동일폭의 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="좌회전차와 상호간의 사고 중 동일폭의 교차로 사고 상세정보 테이블 입니다.">
											<caption>동일폭의 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>354</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no354_355.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 우측차<br/>자동차B 좌측차</a></td>
												</tr>
												<tr>
													<td>355</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no354_355.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌측차<br/>자동차B 우측차</a></td>
												</tr>
											</tbody>
										</table><!--// 동일폭의 교차로 e -->	
										<p class="txtPoint04">대&#183;소로 차이가있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="대·소로 차이가있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대&#183;소로 차이가있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>356</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no356_357.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 소로차<br/>자동차B 대로차</a></td>
												</tr>
												<tr>
													<td>357</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no356_357.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 대로차<br/>자동차B 소로차</a></td>
												</tr>
											</tbody>
										</table><!--// 대소로 차이가 있는 교차로 e -->		
										<p class="txtPoint04">한쪽에 일시정지표지가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="한쪽에 일시정지표지가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>358</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no358_359.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 일시정지표지 있음<br/>자동차B 일시정지표지 없음</a></td>
												</tr>
												<tr>
													<td>359</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no358_359.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 일시정지표지 없음<br/>자동차B 일시정지표지 있음</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지가 있는 교차로 e -->		
										<p class="txtPoint pB0">&#40;3&#41; 좌&#183;우회전차와 후속 직진차와의 사고</p>
										<p class="txtPoint04">동일방향에서 진행해 온 경우</p>
										<table class="tbDetail_st01 tbfault" summary="동일방향에서 진행해 온 경우 상세정보 테이블 입니다.">
											<caption>동일방향에서 진행해 온 경우에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>360</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no360_361.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 후행 직진<br/>자동차B 선행 우회전&#40;좌회전 포함&#41;</a></td>
												</tr>
												<tr>
													<td>361</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no360_361.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 선행 직진 &#9312;<br/>자동차B 후행 우회전&#40;좌회전 포함&#41;</a></td>
												</tr>
												<tr>
													<td>362</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no362_363.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 선행 우회전&#40;좌회전 포함&#41;<br/>자동차B 후속 직진 &#9312;</a></td>
												</tr>
												<tr>
													<td>363</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no362_363.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 추월 우회전<br/>자동차B 직진 &#9314;</a></td>
												</tr>
											</tbody>
										</table><!--// 동일방향에서 진행해 온 경우 e -->	
										<p class="txtPoint04">좌회전차와 추월직진차와의 사고 </p>
										<table class="tbDetail_st01 tbfault" summary="좌회전차와 추월직진차와의 사고  상세정보 테이블 입니다.">
											<caption>좌회전차와 추월직진차와의 사고 에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>364</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no364_365.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌회전<br/>자동차B 추월 직진</a></td>
												</tr>
												<tr>
													<td>365</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no364_365.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 추월 직진<br/>자동차B 좌회전</a></td>
												</tr>
												<tr>
													<td>366</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no366_367.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 후속 직진<br/>자동차B 좌&#40;우&#41;회전&#40;중앙 또는 우측단으로 다가서는데 지장이 있는 경우 &#9312;&#41;</a></td>
												</tr>
												<tr>
													<td>367</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no366_367.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌&#40;우&#41;회전&#40;중앙 또는 우측단으로 다가서는데 지장이 있는 경우 &#9312;&#41;<br/>자동차B 후속 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 좌회전차와 추월직진차와의 사고  e -->			
										<p class="txtPoint pB0">&#40;4&#41; T자형 교차로에서의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="T자형 교차로에서의 사고 상세정보 테이블 입니다.">
											<caption>T자형 교차로에서의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>368</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no368_371.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진차 자동차B 좌&#40;우&#41;회전차</a></td>
												</tr>
												<tr>
													<td>369</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no368_371.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌&#40;우&#41; 회전차<br/>자동차B 직진차</a></td>
												</tr>
												<tr>
													<td>370</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no368_371.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌회전차&#40;우측차&#41; 자동차B 좌회전차&#40;좌측차&#41;</a></td>
												</tr>
												<tr>
													<td>371</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no368_371.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌회전차&#40;좌측차&#41;<br/>자동차B 좌회전차&#40;우측차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// T자형 교차로에서의 사고 e -->				
										<p class="txtPoint pB0">&#40;5&#41; 정체중의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="정체중의 사고 상세정보 테이블 입니다.">
											<caption>정체중의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>372</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no372.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진 <br/> 자동차B 직진 횡단&#40;좌회전&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 정체중의 사고 e -->	
									</div>		
									<!-- 도로외 출입차와 직진차와의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">도로외 출입차와 직진차와의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 노외차가 도로에 진입할 때의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="노외차가 도로에 진입할 때의 사고 상세정보 테이블 입니다.">
											<caption>노외차가 도로에 진입할 때의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>373</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no373_374.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진차<br/>자동차B 노외차</a></td>
												</tr>
												<tr>
													<td>374</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no373_374.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 노외차<br/>자동차B 직진차</a></td>
												</tr>
											</tbody>
										</table><!--// 노외차가 도로에 진입할 때의 사고 e -->	
										<p class="txtPoint pB0">&#40;2&#41; 노외로 나가기 위하여 좌회전 할 때의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="노외로 나가기 위하여 좌회전 할 때의 사고 상세정보 테이블 입니다.">
											<caption>노외로 나가기 위하여 좌회전 할 때의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>375</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no375_376.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진차<br/>자동차B 노외로 좌회전</a></td>
												</tr>
												<tr>
													<td>376</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no375_376.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 노외로 좌회전<br/>자동차B 직진차</a></td>
												</tr>
											</tbody>
										</table><!--// 노외로 나가기 위하여 좌회전 할 때의 사고 e -->	
										<p class="txtPoint pB0">&#40;2&#41; 노외로 나갈 때 인도로 진행하는 차와의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="노외로 나갈 때 인도로 진행하는 차와의 사고 상세정보 테이블 입니다.">
											<caption>노외로 나갈 때 인도로 진행하는 차와의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>377</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no377.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 인도로 진행<br/>자동차B 노외로 진입</a></td>
												</tr>
											</tbody>
										</table><!--// 노외로 나갈 때 인도로 진행하는 차와의 사고 e -->	
									</div>		
									<!-- 대항차량간의 사고(중앙선 침범) -->
									<div class="txtContent2">
										<table class="tbDetail_st01 tbfault" summary="대항차량간의 사고(중앙선 침범) 상세정보 테이블 입니다.">
											<caption>대항차량간의 사고&#40;중앙선 침범&#41;에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>378</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no378_379.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 중앙성 침범<br/>자동차B 직진</a></td>
												</tr>
												<tr>
													<td>379</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no378_379.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진<br/>자동차B 중앙선 침범</a></td>
												</tr>
											</tbody>
										</table><!--// 대항차량간의 사고(중앙선 침범) e -->
									</div>			
									<!-- 동일방향으로 진행하는 차량간의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">동일방향으로 진행하는 차량간의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 추월&#40;앞지르기&#41; 중의 사고 </p>
										<table class="tbDetail_st01 tbfault" summary="추월(앞지르기) 중의 사고 상세정보 테이블 입니다.">
											<caption>추월&#40;앞지르기&#41; 중의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>380</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no380_381.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;앞지르기 금지장소&#93;<br/>이륜차A 후행 추월<br/>자동차B 선행 직진</a></td>
												</tr>
												<tr>
													<td>381</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no380_381.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;앞지르기 금지장소&#93;<br/>이륜차A 선행 직진<br/>자동차B 후행 추월</a></td>
												</tr>
												<tr>
													<td>382</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no382_383.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;앞지르기 금지가 아닌 장소&#93;<br/>이륜차A 후행 추월<br/>자동차B 선행 직진</a></td>
												</tr>
												<tr>
													<td>383</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no382_383.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">&#91;앞지르기 금지가 아닌 장소&#93;<br/>이륜차A 선행 직진<br/>자동차B 후행 추월</a></td>
												</tr>
											</tbody>
										</table><!--// 추월(앞지르기) 중의 사고 e -->	
										<p class="txtPoint pB0">&#40;2&#41; 진로변경차와 후속직진차와의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="진로변경차와 후속직진차와의 사고 상세정보 테이블 입니다.">
											<caption>진로변경차와 후속직진차와의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>384</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no384_385.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자동차 진로 변경</a></td>
												</tr>
												<tr>
													<td>385</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no384_385.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차 진로 변경</a></td>
												</tr>
											</tbody>
										</table><!--// 진로변경차와 후속직진차와의 사고 e -->	
										<p class="txtPoint pB0">&#40;3&#41;추돌 사고</p>
										<table class="tbDetail_st01 tbfault" summary="추돌 사고 상세정보 테이블 입니다.">
											<caption>추돌 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>386</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no386_387.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차가 자동차 추돌</a></td>
												</tr>
												<tr>
													<td>387</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no386_387.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자동차가 이륜차 추돌</a></td>
												</tr>
											</tbody>
										</table><!--// 노외로 나갈 때 인도로 진행하는 차와의 사고 e -->	
									</div>
									<!-- 회전(U-trun)차와 직진차와의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">회전&#40;U-trun&#41;차와 직진차와의 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="회전(U-trun)차와 직진차와의 사고 상세정보 테이블 입니다.">
											<caption>회전&#40;U-trun&#41;차와 직진차와의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>388</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no388_389.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 직진<br/>자동차B 회전중</a></td>
												</tr>
												<tr>
													<td>389</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no388_389.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 회전중<br/>자동차B 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 회전(U-trun)차와 직진차와의 사고 e -->	
									</div>	
									<!-- 주차중의 사고(정차 중 포함) -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">주차중의 사고&#40;정차 중 포함&#41;</h4>
										<p class="txtPoint pB0">&#40;1&#41; 대&#40;소&#41;우회전, 대&#40;소&#41;좌회전 중 사고</p>
										<table class="tbDetail_st01 tbfault" summary="대(소)우회전, 대(소)좌회전 중 사고 상세정보 테이블 입니다.">
											<caption>대&#40;소&#41;우회전&#44; 대&#40;소&#41;좌회전 중 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>390</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no390.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 추돌차<br/>자동차B 주&#40;정&#41;차중</a></td>
												</tr>
											</tbody>
										</table><!--// 대(소)우회전, 대(소)좌회전 중 사고 e -->	
									</div>	
									<!-- 개문시 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">개문시 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 문개방 사고</p>
										<table class="tbDetail_st01 tbfault" summary="문개방 사고 상세정보 테이블 입니다.">
											<caption>문개방 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>391</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no391.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 후속차<br/>자동차B 문개방차</a></td>
												</tr>
											</tbody>
										</table><!--// 문개방 사고 e -->	
									</div>		
									<!-- 기타 도로외 장소에서의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">기타 도로외 장소에서의 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="기타 도로외 장소에서의 사고 상세정보 테이블 입니다.">
											<caption>기타 도로외 장소에서의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>392</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no392.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이륜차A 좌&#40;우&#41;회전차<br/>자동차B 직진차</a></td>
												</tr>
											</tbody>
										</table><!--// 기타 도로외 장소에서의 사고 e -->	
									</div>				
								</div>
								<!-- 자동차와 자전거(농기계포함)의 사고 -->
								<div id="tab4" class="tabCont">		
									<h3 class="hide">자동차와 자전거&#40;농기계포함&#41;의 사고</h3>			
									<!-- 교차로에서 직잔차 상호간의 충돌사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">교차로에서 직잔차 상호간의 충돌사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 신호기에 의해 교통정리가 이루어지고 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="신호기에 의해 교통정리가 이루어지고 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>신호기에 의해 교통정리가 이루어지고 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>401</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no401_402.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 녹색진입<br/>자동차B 적색 진입</a></td>
												</tr>
												<tr>
													<td>402</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no401_402.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 적색진입<br/>자동차B 녹색 진입</a></td>
												</tr>
												<tr>
													<td>403</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no403_404.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 황색진입<br/>자동차B 적색 진입 &#9312;&#9313;&#9314;</a></td>
												</tr>
												<tr>
													<td>404</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no403_404.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 적색진입 &#9316;<br/>자동차B 황색 진입</a></td>
												</tr>
												<tr>
													<td>405</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no405.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 적색진입<br/>자동차B 적색 진입 &#9312;&#9313;</a></td>
												</tr>
											</tbody>
										</table><!--// 신호기에 의해 교통정리가 이루어지고 있는 교차로 e -->		
										<p class="txtPoint pB0">&#40;2&#41; 신호기에 의해 교통정리가 이루어지고 있지 않는 교차로</p>
										<p class="txtPoint04">동일 폭의 교차로 &#9313;</p>
										<table class="tbDetail_st01 tbfault" summary="동일 폭의 교차로② 사고 상세정보 테이블 입니다.">
											<caption>동일 폭의 교차로② 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>406</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no406_407.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 우측차<br/>자동차B 좌측차 &#9313;</a></td>
												</tr>
												<tr>
													<td>407</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no406_407.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 좌측차<br/>자동차B 우측차</a></td>
												</tr>
											</tbody>
										</table><!--// 동일 폭의 교차로② e -->	
										<p class="txtPoint04">대소로 차이가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="대소로 차이가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대소로 차이가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>408</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no408_409.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 대로에서 진입<br/>자동차B 소로에서 진입 &#9313;&#9314;</a></td>
												</tr>
												<tr>
													<td>409</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no408_409.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 소로에서 진입<br/>자동차B 대로에서 진입 &#9313;&#9314;</a></td>
												</tr>
											</tbody>
										</table><!--// 대소로 차이가 있는 교차로 e -->		
										<p class="txtPoint04">한쪽에 일시정지표지&#40;또는 일방통행표지&#41;가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="한쪽에 일시정지표지(또는 일방통행표지)가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지&#40;또는 일방통행표지&#41;가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>410</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no410_411.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 일시정지표지 있음<br/>자동차B 일시정지표지 없음 &#9313;</a></td>
												</tr>
												<tr>
													<td>411</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no410_411.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 일시정지표지 없음<br/>자동차B 일시정지표지 있음 &#9313;</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지(또는 일방통행표지)가 있는 교차로 e -->		
										<p class="txtPoint04">일방통행도로의 통행방법을 위반하여 교차로에 진입 하는 경우 &#9312;</p>
										<table class="tbDetail_st01 tbfault" summary="일방통행도로의 통행방법을 위반하여 교차로에 진입 하는 경우 ① 사고 상세정보 테이블 입니다.">
											<caption>일방통행도로의 통행방법을 위반하여 교차로에 진입 하는 경우 ①사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>412</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no412_413.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 일방통행방법 위반<br/>자동차B 정상주행</a></td>
												</tr>
												<tr>
													<td>413</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no412_413.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 정상주행<br/>자동차B 일방통행방법 위반</a></td>
												</tr>
											</tbody>
										</table><!--// 일방통행도로의 통행방법을 위반하여 교차로에 진입 하는 경우 ① e -->		
									</div>			
									<!-- 교차로에서 좌회전차와 직진차와의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">교차로에서 좌회전차와 직진차와의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 같은 도로의 대향방향에서 진입해 온 경우 &#9312;&#9313;</p>
										<table class="tbDetail_st01 tbfault" summary="같은 도로의 대향방향에서 진입해 온 경우①② 상세정보 테이블 입니다.">
											<caption>같은 도로의 대향방향에서 진입해 온 경우①②에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>414</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no414_415.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진<br/>자동차B 좌회전</a></td>
												</tr>
												<tr>
													<td>415</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no414_415.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 좌회전<br/>자동차B 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 같은 도로의 대향방향에서 진입해 온 경우①② e -->		
										<p class="txtPoint pB0">&#40;2&#41; 교차도로에서 진입해 온 경우</p>
										<p class="txtPoint04">동일 폭의 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="동일 폭의 교차로 사고 상세정보 테이블 입니다.">
											<caption>동일 폭의 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>416</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no416_417.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;좌측차&#41;<br/>자동차B 좌회전&#40;우측차&#41;</a></td>
												</tr>
												<tr>
													<td>417</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no416_417.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 좌회전&#40;우측차&#41;<br/>자동차B 직진&#40;좌측차&#41;</a></td>
												</tr>
												<tr>
													<td>418</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no418_419.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;우측차&#41;<br/>자동차B 좌회전&#40;좌측차&#41; </a></td>
												</tr>
												<tr>
													<td>419</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no418_419.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 좌회전&#40;좌측차&#41;<br/>자동차B 직진&#40;우측차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 동일 폭의 교차로 e -->	
										<p class="txtPoint04">대소로 차이가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="대소로 차이가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대소로 차이가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>420</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no420_421.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;대로&#41;<br/>자동차B 좌회전&#40;소로&#41;</a></td>
												</tr>
												<tr>
													<td>421</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no420_421.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 좌회전&#40;소로&#41;<br/>자동차B 직진&#40;대로&#41;</a></td>
												</tr>
												<tr>
													<td>422</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no422_423.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 좌회전&#40;대소로&#41;<br/>자동차B 직진&#40;소로&#41;</a></td>
												</tr>
												<tr>
													<td>423</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no422_423.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;소로&#41;<br/>자동차B 좌회전&#40;대로&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 대소로 차이가 있는 교차로 e -->		
										<p class="txtPoint04">한쪽에 일시정지표지가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="한쪽에 일시정지표지가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>424</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no424_425.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 좌회전&#40;일시정지 표지 없음&#41;<br/>자동차B 직진&#40;일시정지 표지 있음&#41; &#9313;</a></td>
												</tr>
												<tr>
													<td>425</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no424_425.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;일시정지 표지 있음&#41;<br/>자동차B 좌회전&#40;일시정지 표지 없음&#41;</a></td>
												</tr>
												<tr>
													<td>426</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no426_427.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;일시정지표지 없음&#41;<br/>자동차B 좌회전&#40;일시정지표지 있음&#41;&#9312;</a></td>
												</tr>
												<tr>
													<td>427</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no426_427.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 좌회전&#40;일시정지표지 있음&#41; ①<br/>자동차B 직진&#40;일시정지표지 없음&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지가 있는 교차로 e -->			
									</div>			
									<!-- 교차로에서 우회전차와 직진차와의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">교차로에서 우회전차와 직진차와의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 우회전차와 직진차와의 사고</p>		
										<p class="txtPoint04">동일 폭의 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="동일 폭의 교차로 상세정보 테이블 입니다.">
											<caption>동일 폭의 교차로에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>428</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no428_429.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 우회전&#40;우측차&#41;&#9312;<br/>자동차B 직진&#40;좌측차&#41;</a></td>
												</tr>
												<tr>
													<td>429</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no428_429.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;좌측차&#41;<br/>자동차B 우회전&#40;우측차&#41;</a></td>
												</tr>
											</tbody>
										</table><!--// 동일 폭의 교차로 e -->	
										<p class="txtPoint04">대소로 차이가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="대소로 차이가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>대소로 차이가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>430</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no430_431.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 우회전&#40;소로&#41;<br/>자동차B 직진&#40;대로&#41;</a></td>
												</tr>
												<tr>
													<td>431</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no430_431.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;대로&#41;<br/>자동차B 우회전&#40;소로&#41;</a></td>
												</tr>
												<tr>
													<td>432</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no432_433.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 우회전&#40;대로&#41; &#9312;<br/>자동차B 우회전&#40;소로&#41;</a></td>
												</tr>
												<tr>
													<td>433</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no432_433.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;소로&#41;<br/>자동차B 우회전&#40;대로&#41; &#9312;</a></td>
												</tr>
											</tbody>
										</table><!--// 대소로 차이가 있는 교차로 e -->		
										<p class="txtPoint04">한쪽에 일시정지표지가 있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="한쪽에 일시정지표지가 있는 교차로 사고 상세정보 테이블 입니다.">
											<caption>한쪽에 일시정지표지가 있는 교차로 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>434</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no434_435.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 우회전&#40;일시정지표지 있음&#41; &#9312;<br/>자동차B 직진&#40;일시정지표지 없음&#41;</a></td>
												</tr>
												<tr>
													<td>435</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no434_435.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;일시정지표지 없음&#41;<br/>자동차B 우회전&#40;일시정지표지 있음&#41; &#9312;</a></td>
												</tr>
												<tr>
													<td>436</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no436_437.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진&#40;일시정지표지 있음&#41; &#9312;<br/>자동차B 우회전&#40;일시정지표지 없음&#41;</a></td>
												</tr>
												<tr>
													<td>437</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no436_437.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 우회전&#40;일시정지 표지 없음&#41;<br/>자동차B 직진&#40;일시정지표지 있음&#41; &#9312;</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지가 있는 교차로 e -->			
										<p class="txtPoint04">동일 방향에서 진행해 온 경우</p>
										<table class="tbDetail_st01 tbfault" summary="동일 방향에서 진행해 온 경우 상세정보 테이블 입니다.">
											<caption>동일 방향에서 진행해 온 경우에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>438</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no438_439.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 후행 직진&#40;일시정지표지 있음&#41; &#9312;<br/>자동차B 우회전&#40;미리 우측단으로 다가서지않음&#41;</a></td>
												</tr>
												<tr>
													<td>439</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no438_439.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 후행 직진<br/>자동차B 우회전&#40;미리 우측단으로 다가섬&#41; </a></td>
												</tr>
												<tr>
													<td>440</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no440_441.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 우회전&#40;미리 우측단으로 다가서지 않음&#41; &#9312;<br/>자동차B 직진</a></td>
												</tr>
												<tr>
													<td>441</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no440_441.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 우회전&#40;미리 우측단으로 다가섬&#41;<br/>자동차B 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 한쪽에 일시정지표지가 있는 교차로 e -->			
									</div>					
									<!-- 대항차량간의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">대항차량간의 사고</h4>			
										<p class="txtPoint04">대&#183;소로 차이가있는 교차로</p>
										<table class="tbDetail_st01 tbfault" summary="대·소로 차이가있는 교차로 상세정보 테이블 입니다.">
											<caption>대&#183;소로 차이가있는 교차로에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>442</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no442_443.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 횡단 &#9312;<br/>자동차B 직진</a></td>
												</tr>
												<tr>
													<td>443</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no442_443.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 좌측단으로 통행 &#9313;<br/>자동차B 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 대·소로 차이가있는 교차로 e -->	
									</div>		
									<!-- 동일방향으로 진행하는 차량간의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">동일방향으로 진행하는 차량간의 사고</h4>
										<p class="txtPoint pB0">&#40;1&#41; 진로변경차와 후속직진차와의 사고</p>
										<table class="tbDetail_st01 tbfault" summary="진로변경차와 후속직진차와의 사고  상세정보 테이블 입니다.">
											<caption>진로변경차와 후속직진차와의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>444</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no444_445.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 좌우로 진로 변경 &#9313;<br/>자동차B 직진</a></td>
												</tr>
												<tr>
													<td>445</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no444_445.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 직진<br/>자동차B 좌우로 진로 변경</a></td>
												</tr>
											</tbody>
										</table><!--// 진로변경차와 후속직진차와의 사고  e -->	
										<p class="txtPoint pB0">&#40;2&#41; 추돌 사고</p>
										<table class="tbDetail_st01 tbfault" summary="진로변경차와 후속직진차와의 사고  상세정보 테이블 입니다.">
											<caption>진로변경차와 후속직진차와의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>446</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no446_447.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자동차가 자전거를 추돌한 경우</a></td>
												</tr>
												<tr>
													<td>447</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no446_447.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거가 자동차를 추돌한 경우</a></td>
												</tr>
											</tbody>
										</table><!--// 진로변경차와 후속직진차와의 사고  e -->			
									</div>				
									<!-- 기타 도로외 장소에서의 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">기타 도로외 장소에서의 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="기타 도로외 장소에서의 사고  상세정보 테이블 입니다.">
											<caption>기타 도로외 장소에서의 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>448</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no448.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">자전거A 횡단<br/>자동차B 직진</a></td>
												</tr>
											</tbody>
										</table><!--// 기타 도로외 장소에서의 사고  e -->		
									</div>									
								</div>
								<!-- 고속도로(자동차전용도로 포함)의 사고 -->
								<div id="tab5" class="tabCont">		
									<h3 class="hide">고속도로&#40;자동차전용도로 포함&#41;의 사고</h3>			
									<!-- 합류지점사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">합류지점사고</h4>
										<table class="tbDetail_st01 tbfault" summary="합류지점사고 상세정보 테이블 입니다.">
											<caption>합류지점사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>501</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no501.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">A 본선차<br/>B 합류차</a></td>
												</tr>
											</tbody>
										</table><!--// 합류지점사고 e -->	
									</div>			
									<!-- 차로 감소지점 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">차로 감소지점 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="차로 감소지점 사고 상세정보 테이블 입니다.">
											<caption>차로 감소지점 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>502</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no502.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">A 본선차<br/>B 합류차</a></td>
												</tr>
											</tbody>
										</table><!--// 차로 감소지점 사고 e -->	
									</div>		
									<!-- 진로 변경에 따른 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">진로 변경에 따른 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="진로 변경에 따른 사고 상세정보 테이블 입니다.">
											<caption>진로 변경에 따른 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>503</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no503_504.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">A 추월선 진행<br/>B 주행선 진행중 추원선으로 진로 변경</a></td>
												</tr>
												<tr>
													<td>504</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no503_504.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">A 후행직진차<br/>B 기타진로변경 &#9315;</a></td>
												</tr>
											</tbody>
										</table><!--// 진로 변경에 따른 사고 e -->	
									</div>		
									<!-- 추돌 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">추돌 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="추돌 사고 상세정보 테이블 입니다.">
											<caption>추돌 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>505</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no505.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">차로 주정차중 추돌사고<br/>A 추돌차<br/>B 피추돌차</a></td>
												</tr>
												<tr>
													<td>506</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no506.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">갓길 주정차중 추돌사고<br/>A 추돌차<br/>B 피추돌차</a></td>
												</tr>
												<tr>
													<td>507</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no507.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">진행중 추돌사고<br/>A 추돌차<br/>B 피추돌차</a></td>
												</tr>
												<tr>
													<td>508</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no508.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">A 후속차<br/>B 선행차</a></td>
												</tr>
											</tbody>
										</table><!--// 추돌 사고 e -->	
									</div>		
									<!-- 보행자 사고 -->
									<div class="txtContent2">
										<h4 class="decuh4Tit">보행자 사고</h4>
										<table class="tbDetail_st01 tbfault" summary="보행자 사고 상세정보 테이블 입니다.">
											<caption>보행자 사고에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:20%;" />
												<col style="width:80%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">도표</th>
													<th scope="col">사고 상황</th>
												</tr>													
											</thead>
											<tbody>
												<tr>
													<td>509</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no509_510.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이유없는 보행자</a></td>
												</tr>
												<tr>
													<td>510</td>
													<td class="accCase"><a href="#;" onclick="detailPupup(this); return false; //window.open('/pyo2/pyo_no509_510.jsp','name','resizable=yes,width=904,scrollbars=yes ');return false">이유있는 보행자 &#9313;</a></td>
												</tr>
											</tbody>
										</table><!--// 보행자 사고 e -->	
									</div>														
								</div>
							</div><!--// tabContainer e -->
						</div><!--// faultTab e -->		 --%>				
					</div><!--// conSection e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<!--// container e -->
		<hr />
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->

</body>
</html>