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
	}else if(hash == '#tab6'){
		$(".tab06").trigger('click');
	}
	
});

function changeTab(tabNo){
	for(var i = 1; i<=6; i++){
		$(".injureBox #tab0"+i).removeClass();
		$(".injureTabs #tab0"+i).removeClass();	
		if(i == tabNo){ 
			$("#tab"+i).css('display','block');
			$(".injureBox #tab0"+i).addClass('tab0'+i+" on");
			$(".injureTabs #tab0"+i).addClass('tab0'+i+" active on");
		}else{
			$("#tab"+i).css('display','none');
			$(".injureBox #tab0"+i).addClass('tab0'+i);
			$(".injureTabs #tab0"+i).addClass('tab0'+i);	
		}
	}
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
						<span>상해급수안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/injure_con_tit.gif" alt="부상 정도에 따라 보상 한도액이 달라집니다. 신체부위별 상해급수 안내 입니다." /></p>
					<div class="conSection">
						<div class="injureBox">
							<a href="#;" onclick="javascript:changeTab(1); return false;"class="tab01 on" id="tab01"><span class="hide">두부</span></a>
							<a href="#;" onclick="javascript:changeTab(2); return false;"class="tab02" id="tab02"><span class="hide">상지부&#183;팔</span></a>
							<a href="#;" onclick="javascript:changeTab(3); return false;"class="tab03" id="tab03"><span class="hide">척추</span></a>
							<a href="#;" onclick="javascript:changeTab(4); return false;"class="tab04" id="tab04"><span class="hide">골반&#183;하지부</span></a>
							<a href="#;" onclick="javascript:changeTab(5); return false;"class="tab05" id="tab05"><span class="hide">흉복부</span></a>
							<a href="#;" onclick="javascript:changeTab(6); return false;"class="tab06" id="tab06"><span class="hide">연부&#183;혈관</span></a>
						</div>
						<p class="viewBorn"><span class="btn_pack btn_type06 icon"><span class="view"></span><a href="#;" onclick="window.open('/deductProduct/dataCenter/insuranceKnowlege/injurGradeInfoPopup.do','name','resizable=yes width=625,height=680,scrollbars=no ');return false">인체 뼈구조 자세히 보기</a></span></p>
						<!-- injureTab s -->
						
						<div class="injureTabs">
							<!-- <p style="margin-left: 600px;font-size: 12px;margin-bottom: 4px;"><span>*2014년 2월 7일(사고분)부터입니다.</span></p> -->
							<p class="viewBorn" style="position:static;float:right;margin-bottom: 10px;"><span class="btn_pack btn_type06 icon">
								<a href="#;" onclick="window.open('/pyo/injurGrade.html','name','resizable=yes width=880,height=680,scrollbars=yes ');return false">후유장애의 구분과 책임보험금의 한도금액(제3조제1항제3호 관련)</a></span>
							</p>
							<div style="clear:both;"></div>
							<ul class="tabMenu">
								<li class="tab01" id="tab01" onclick="changeTab(1); return false;"><a href="#tab1"><span class="hide">두부</span></a></li>
								<li class="tab02" id="tab02" onclick="changeTab(2); return false;"><a href="#tab2"><span class="hide">상지부&#183;팔</span></a></li>
								<li class="tab03" id="tab03" onclick="changeTab(3); return false;"><a href="#tab3"><span class="hide">척추</span></a></li>
								<li class="tab04" id="tab04" onclick="changeTab(4); return false;"><a href="#tab4"><span class="hide">골반&#183;하지부</span></a></li>
								<li class="tab05" id="tab05" onclick="changeTab(5); return false;"><a href="#tab5"><span class="hide">흉복부</span></a></li>
								<li class="tab06" id="tab06" onclick="changeTab(6); return false;"><a href="#tab6"><span class="hide">연부&#183;혈관</span></a></li>
							</ul><!--// tabMenu e -->
							<div class="tabContainer">
								<!-- 두부 -->
								<div id="tab1" class="tabCont">
									<h3 class="hide">두부</h3>									
									<p class="txtPoint03 alR">&#40;단위&#58;만원&#41;</p>
									<table class="tbDetail_st01 tbInjure" summary="두부에 관련된 상해급수안내 상세정보 테이블 입니다.">
										<caption>머리에 관련된 상해급수안내 및 보상한도액에 대해서 나타낸 표</caption>
										<colgroup>
											<col style="width:64%;" />
											<col style="width:10%;" />
											<col style="width:13%;" />
											<col style="width:13%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">증상 및 병명</th>
												<th scope="col" rowspan="2">상해등급</th>
												<th scope="col" colspan="2" class="bB1">책임보상 한도액</th>
											</tr>
											<tr>
												<th scope="col" class="scd">2014&#46;02&#46;07<br/>이후사고</th>
												<th scope="col" class="scd">2016&#46;04&#46;01<br/>이후사고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="4" class="fstCate">두부</td>
											</tr>
											<tr>
												<td class="case">수술 여부와 상관없이 뇌손상으로 신경학적 증상이 고도인 상해 <br/>(신경학적 증상이 48시간 이상 지속되는 경우에 적용)</td>
												<td class="alC">1급</td>
												<td>2&#44;000</td>
												<td>3&#44;000</td>
											</tr>
											<tr>
												<td class="case">뇌손상으로 신경학적 증상이 중등도인 상해 <br/>(신경학적 증상이 48시간 이상 지속되는 경우로 수술을 시행한 경우에 적용)</td>
												<td class="alC">2급</td>
												<td>1&#44;000</td>
												<td>1&#44;500</td>
											</tr>
											<tr>
												<td class="case">뇌손상으로 신경학적 증상이 고도인 상해 <br/>(신경학적 증상이 48시간 미만 지속되는 경우로 수술을 시행한 경우에 적용)</td>
												<td rowspan="2" class="alC">3급</td>
												<td rowspan="2">1&#44;000</td>
												<td rowspan="2">1&#44;200</td>
											</tr>
											<tr>
												<td class="case">뇌손상으로 신경학적 증상이 중등도인 상해 <br/>(신경학적 증상이 48시간 이상 지속되는 경우로 수술을 시행하지 않은 경우에 적용) </td>
											</tr>
											<tr>
												<td class="case">뇌손상으로 신경학적 증상이 고도인 상해 <br/>(신경학적 증상이 48시간 미만 지속되는 경우로 수술을 시행하지 않은 경우에 적용)</td>
												<td class="alC">4급</td>
												<td>900</td>
												<td>1&#44;000</td>
											</tr>
											<tr>
												<td class="case">뇌손상으로 신경학적 증상이 중등도에 해당하는 상해 <br/>(신경학적 증상이 48시간 미만 지속되는 경우로 수술을 시행한 경우에 적용)</td>
												<td class="alC">5급</td>
												<td>900</td>
												<td>900</td>
											</tr>
											<tr>
												<td class="case">뇌손상으로 신경학증상이 경도인 상해(수술을 시행한 경우에 적용)</td>
												<td rowspan="2" class="alC">6급</td>
												<td rowspan="2">500</td>
												<td rowspan="2">700</td>
											</tr>
											<tr>
												<td class="case">뇌손상으로 신경학적 증상이 중등도에 해당하는 상해 <br/>(신경학적 증상이 48시간 미만 지속되는 경우로 수술을 시행하지 않은 경우에 적용한다)</td>
											</tr>
											<tr>
												<td class="case">뇌손상으로 신경학적 증상이 경도인 상해(수술을 시행하지 않은 경우에 적용)</td>
												<td class="alC">8급</td>
												<td>240</td>
												<td>300</td>
											</tr>
											<tr>
												<td class="case">뇌진탕</td>
												<td class="alC">8급</td>
												<td>240</td>
												<td>300</td>
											</tr>
											<tr>
												<td class="case">외상 후 급성 스트레스 장애</td>
												<td class="alC">12급</td>
												<td>80</td>
												<td>120</td>
											</tr>
											<tr>
												<td class="case">두피좌상, 열창</td>
												<td class="alC">14급</td>
												<td>50</td>
												<td>80</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">안면부</td>
											</tr>
											<tr>
												<td class="case">양안 안구 파열로 안구 적출술 또는 안구내용 제거술과 의안 삽입술을 시행한 상해</td>
												<td class="alC">1급</td>
												<td>2&#44;000</td>
												<td>3&#44;000</td>
											</tr>
											<tr>
												<td class="case">단안 안구 적출술 또는 안구 내용 제거술과 의안 삽입술을 시행한 상해</td>
												<td class="alC">3급</td>
												<td>1&#44;000</td>
												<td>1&#44;200</td>
											</tr>
											<tr>
												<td class="case">각막 이식술을 시행한 상해</td>
												<td rowspan="2" class="alC">4급</td>
												<td rowspan="2">900</td>
												<td rowspan="2">1&#44;000</td>
											</tr>
											<tr>
												<td class="case">후안부 안내 수술을 시행한 상해(유리체 출혈, 망막 박리 등으로 수술을 시행한 경우에 적용한다)</td>
											</tr>
											<tr>
												<td class="case">안와 골절에 의한 복시로 안와 골절 재건술과 사시 수술을 시행한 상해</td>
												<td class="alC">5급</td>
												<td>900</td>
												<td>900</td>
											</tr>
											<tr>
												<td class="case">전안부 안내 수술을 시행한 상해(외상성 백내장, 녹내장 등으로 수술을 시행한 경우에 적용한다)</td>
												<td class="alC">6급</td>
												<td>500</td>
												<td>700</td>
											</tr>
											<tr>
												<td class="case">다발성 안면 두개골 골절 또는 뇌신경 손상과 동반된 안면 두개골 골절</td>
												<td rowspan="3" class="alC">7급</td>
												<td rowspan="3">500</td>
												<td rowspan="3">500</td>
											</tr>
											<tr>
												<td class="case">복시를 동반한 마비 또는 제한 사시로 사시수술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">안와 골절로 재건술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">상악골, 하악골, 치조골 등의 안면 두개골 골절</td>
												<td rowspan="4" class="alC">8급</td>
												<td rowspan="4">240</td>
												<td rowspan="4">300</td>
											</tr>
											<tr>
												<td class="case">외상성 시신경병증</td>
											</tr>
											<tr>
												<td class="case">외상성 안검하수로 수술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">복합 고막 파열</td>
											</tr>
											<tr>
												<td class="case">안면부의 비골 골절로 수술을 시행한 상해</td>
												<td class="alC">9급</td>
												<td>240</td>
												<td>240</td>
											</tr>
											<tr>
												<td class="case">3cm 이상 안면부 열상</td>
												<td rowspan="3" class="alC">10급</td>
												<td rowspan="3">160</td>
												<td rowspan="3">200</td>
											</tr>
											<tr>
												<td class="case">안검과 누소관 열상으로 봉합술과 누소관 재건술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">각막, 공막 등의 열상으로 일차 봉합술만 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">안면부의 비골 골절로 수술을 시행하지 않는 상해</td>
												<td class="alC">11급</td>
												<td>160</td>
												<td>160</td>
											</tr>
											<tr>
												<td class="case">3cm 미만 안면부 열상</td>
												<td class="alC">12급</td>
												<td>80</td>
												<td>120</td>
											</tr>
											<tr>
												<td class="case">결막의 열상으로 일차 봉합술을 시행한 상해  </td>
												<td rowspan="2" class="alC">13급</td>
												<td rowspan="2">80</td>
												<td rowspan="2">80</td>
											</tr>
											<tr>
												<td class="case">단순 고막 파열</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">치아</td>
											</tr>
											<tr>
												<td class="case">23치 이상의 치과보철을 필요로 하는 상해 </td>
												<td class="alC">5급</td>
												<td>900</td>
												<td>900</td>
											</tr>
											<tr>
												<td class="case">19치 이상 22치 이하의 치과보철을 필요로 하는 상해</td>
												<td class="alC">6급</td>
												<td>500</td>
												<td>700</td>
											</tr>
											<tr>
												<td class="case">16치 이상 18치 이하의 치과보철을 필요로 하는 상해 </td>
												<td class="alC">7급</td>
												<td>500</td>
												<td>500</td>
											</tr>
											<tr>
												<td class="case">13치 이상 15치 이하의 치과보철을 필요로 하는 상해 </td>
												<td class="alC">8급</td>
												<td>240</td>
												<td>300</td>
											</tr>
											<tr>
												<td class="case">11치 이상 12치 이하의 치과보철을 필요로 하는 상해 </td>
												<td class="alC">9급</td>
												<td>240</td>
												<td>240</td>
											</tr>
											<tr>
												<td class="case">9치 이상 10치 이하의 치과보철을 필요로 하는 상해</td>
												<td class="alC">10급</td>
												<td>160</td>
												<td>200</td>
											</tr>
											<tr>
												<td class="case">6치 이상 8치 이하의 치과보철을 필요로 하는 상해 </td>
												<td class="alC">11급</td>
												<td>160</td>
												<td>160</td>
											</tr>
											<tr>
												<td class="case">4치 이상 5치 이하의 치과보철을 필요로 하는 상해</td>
												<td class="alC">12급</td>
												<td>80</td>
												<td>120</td>
											</tr>
											<tr>
												<td class="case">2치 이상 3치 이하의 치과보철을 필요로 하는 상해</td>
												<td class="alC">13급</td>
												<td>80</td>
												<td>80</td>
											</tr>
											<tr>
												<td class="case">1치 이하의 치과보철을 필요로 하는 상해</td>
												<td class="alC">14급</td>
												<td>50</td>
												<td>80</td>
											</tr>
										</tbody>
									</table>									
								</div><!--// 두부 e-->
								<!-- 상지부팔 -->
								<div id="tab2" class="tabCont">
									<h3 class="hide">상지부</h3>	
									<p class="txtPoint03 alR">&#40;단위&#58;만원&#41;</p>
									<table class="tbDetail_st01 tbInjure" summary="상지부에 관련된 상해급수안내 상세정보 테이블 입니다.">
										<caption>상지부에 관련된 상해급수안내 및 보상한도액에 대해서 나타낸 표</caption>
										<colgroup>
											<col style="width:64%;" />
											<col style="width:10%;" />
											<col style="width:13%;" />
											<col style="width:13%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">증상 및 병명</th>
												<th scope="col" rowspan="2">상해등급</th>
												<th scope="col" colspan="2" class="bB1">책임보상 한도액</th>
											</tr>
											<tr>
												<th scope="col" class="scd">2014&#46;02&#46;07<br/>이후사고</th>
												<th scope="col" class="scd">2016&#46;04&#46;01<br/>이후사고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="4" class="fstCate">절단</td>
											</tr>
											<tr>
												<td class="case">상완부 완전 절단 소실(주관절부 이단을 포함한다)</td>
												<td class="alC">1급</td>
												<td >2&#44;000</td>
												<td >3&#44;000</td>
											</tr>
											<tr>
												<td class="case">전완부 완전 절단 소실</td>
												<td class="alC">2급</td>
												<td >1&#44;000</td>
												<td >1&#44;500</td>
											</tr>
											<tr>
												<td class="case">수근부 완전 절단 소실</td>
												<td class="alC">3급</td>
												<td >1&#44;000</td>
												<td >1&#44;200</td>
											</tr>
											<tr>
												<td class="case">무지 또는 다발성 수지의 완전 절단 소실</td>
												<td class="alC">4급</td>
												<td >900</td>
												<td >1&#44;000</td>
											</tr>
											<tr>
												<td class="case">무지를 제외한 단일 수지의 완전 절단 소실</td>
												<td class="alC">5급</td>
												<td >900</td>
												<td >900</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">견갑부</td>
											</tr>
											<tr>
												<td class="case">견관절 골절 및 탈구</td>
												<td class="alC">3급</td>
												<td >1&#44;000</td>
												<td >1&#44;200</td>
											</tr>
											<tr>
												<td class="case">견관절 탈구(재발성 탈구를 초래할 수 있는 해부학적 병변 병발시 수술여부에 상관없이 6급 적용)</td>
												<td rowspan="3" class="alC">6급</td>
												<td rowspan="3">500</td>
												<td rowspan="3">700</td>
											</tr>
											<tr>
												<td class="case">견관절의 회전근개 파열(파열개수 차등없음)</td>
											</tr>
											<tr>
												<td class="case">외상성 상부관절와순 파열(외상성파열만 인정, 퇴행성파열여부 확인요함)</td>
											</tr>
											<tr>
												<td class="case">쇄골 골절</td>
												<td rowspan="3" class="alC">7급</td>
												<td rowspan="3">500</td>
												<td rowspan="3">500</td>
											</tr>
											<tr>
												<td class="case">견갑골 골절(견갑골극,체부,흉곽내 탈구,경부,과부,견봉돌기,오구돌기 포함)</td>
											</tr>
											<tr>
												<td class="case">견봉 쇄골인대 및 오구 쇄골인대 완전 파열</td>
											</tr>
											<tr>
												<td class="case">흉쇄관절 탈구</td>
												<td class="alC">9급</td>
												<td >240</td>
												<td >240</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">상박골</td>
											</tr>											
											<tr>
												<td class="case">상완신경총 완전손상 (근전도결과 확인필수, root 손상적용)</td>
												<td class="alC">1급</td>
												<td>2&#44;000</td>
												<td>3&#44;000</td>
											</tr>
											<tr>
												<td class="case">상완신경총 상부간부 또는 하부간부의 완전손상(상완신경총 상지부 혹은 하지부손상을 의미함-trunk 손상)</td>
												<td class="alC">2급</td>
												<td>1&#44;000</td>
												<td>1&#44;500</td>
											</tr>
											<tr>
												<td class="case">상완신경총 불완전 손상(2개 이상의 주요말초신경장애를 보이는 손상)</td>
												<td rowspan="4" class="alC">4급</td>
												<td rowspan="4">900</td>
												<td rowspan="4">1&#44;000</td>
											</tr>
											<tr>
												<td class="case">상완골 경부 골절</td>
											</tr>
											<tr>
												<td class="case">상완골 간부 분쇄성 골절</td>
											</tr>
											<tr>
												<td class="case">상완골 과상부 또는 원위부 관절내 골절(경과,과간,내과,소두골절에 적용)</td>
											</tr>
											<tr>
												<td class="case">상완골 간부 골절</td>
												<td class="alC">5급</td>
												<td>900</td>
												<td>900</td>
											</tr>
											<tr>
												<td class="case">상완골 대결절 견열 골절</td>
												<td rowspan="2" class="alC">6급</td>
												<td rowspan="2">500</td>
												<td rowspan="2">700</td>
											</tr>
											<tr>
												<td class="case">상완골 원위부 견열골절(외상과 골절, 내상과 골절에 해당)</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">주관절</td>
											</tr>											
											<tr>
												<td class="case">주관절부 골절 및 탈구</td>
												<td class="alC">3급</td>
												<td>1&#44;000</td>
												<td>1&#44;200</td>
											</tr>
											<tr>
												<td class="case">주관절 탈구</td>
												<td rowspan="2" class="alC">6급</td>
												<td rowspan="2">500</td>
												<td rowspan="2">700</td>
											</tr>
											<tr>
												<td class="case">주관절 내측 또는 외측 측부 인대 파열</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">전박골</td>
											</tr>		
											<tr>
												<td class="case">요골 원위부 골절과 척골 골두 탈구가 동반된 상해(갈레아찌 골절)</td>
												<td rowspan="2" class="alC">4급</td>
												<td rowspan="2">900</td>
												<td rowspan="2">1&#44;000</td>
											</tr>
											<tr>
												<td class="case">척골 근위부 골절과 요골 골두 탈구가 동반된 상해(몬테지아 골절)</td>
											</tr>
											<tr>
												<td class="case">요골 골두 또는 척골 구상돌기 골절</td>
												<td rowspan="4" class="alC">5급</td>
												<td rowspan="4">900</td>
												<td rowspan="4">900</td>
											</tr>
											<tr>
												<td class="case">요골과 척골의 간부 골절</td>
											</tr>
											<tr>
												<td class="case">요골 경상돌기 골절</td>
											</tr>
											<tr>
												<td class="case">요골 원위부 관절내 골절</td>
											</tr>
											<tr>
												<td class="case">요골간부 또는 원위부 관절외 골절</td>
												<td rowspan="4" class="alC">6급</td>
												<td rowspan="4">500</td>
												<td rowspan="4">700</td>
											</tr>
											<tr>
												<td class="case">요골 경부 골절</td>
											</tr>
											<tr>
												<td class="case">척골 주두부 골절</td>
											</tr>
											<tr>
												<td class="case">척골 간부 골절(근위부 골절은 제외)</td>
											</tr>
											<tr>
												<td class="case">척골 경상돌기 기저부 골절</td>
												<td class="alC">7급</td>
												<td>500</td>
												<td>500</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">완관절</td>
											</tr>
											<tr>
												<td class="case">요수근관절 골절 및 탈구(수근골간 관절 탈구, 원위 요척관절 탈구를 포함</td>
												<td class="alC">4급</td>
												<td>900</td>
												<td>1&#44;000</td>
											</tr>
											<tr>
												<td class="case">요수근관절 탈구수근골간관절 탈구, 원위 요척관절 탈구를 포함</td>
												<td rowspan="2" class="alC">7급</td>
												<td rowspan="2">500</td>
												<td rowspan="2">500</td>
											</tr>
											<tr>
												<td class="case">삼각섬유연골 복합체 손상</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">수근골</td>
											</tr>
											<tr>
												<td class="case">수근골 골절 및 탈구가 동반된 상해</td>
												<td class="alC">4급</td>
												<td>900</td>
												<td>1&#44;000</td>
											</tr>
											<tr>
												<td class="case">수근 주상골 골절</td>
												<td class="alC">5급</td>
												<td>900</td>
												<td>900</td>
											</tr>
											<tr>
												<td class="case">다발성 수근중수골 관절 탈구 또는 다발성 골절탈구</td>
												<td class="alC">6급</td>
												<td>500</td>
												<td>700</td>
											</tr>
											<tr>
												<td class="case">주상골 외 수근골 골절</td>
												<td rowspan="5" class="alC">7급</td>
												<td rowspan="5">500</td>
												<td rowspan="5">500</td>
											</tr>
											<tr>
												<td class="case">수근부 주상골?월상골간 인대 파열</td>
											</tr>
											<tr>
												<td class="case">수근중수골 관절의 탈구 또는 골절탈구</td>
											</tr>
											<tr>
												<td class="case">다발성 중수골 골절</td>
											</tr>
											<tr>
												<td class="case">중수수지관절의 골절 및 탈구</td>
											</tr>
											<tr>
												<td class="case">중수골 골절</td>
												<td class="alC">8급</td>
												<td>240</td>
												<td>300</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">수지골</td>
											</tr>
											<tr>
												<td class="case">중수수지관절의 골절 및 탈구</td>
												<td class="alC">7급</td>
												<td>500</td>
												<td>500</td>
											</tr>
											<tr>
												<td class="case">수지골의 근위지간 또는 원위지간 골절 탈구</td>
												<td rowspan="5" class="alC">8급</td>
												<td rowspan="5">240</td>
												<td rowspan="5">300</td>
											</tr>
											<tr>
												<td class="case">다발성수지골 골절</td>
											</tr>
											<tr>
												<td class="case">무지 중수지관절 측부인대 파열</td>
											</tr>
											<tr>
												<td class="case">수지골 골절 및 탈구</td>
											</tr>
											<tr>
												<td class="case">수지관절 골절 및 탈구</td>
											</tr>
											<tr>
												<td class="case">수지골 골절</td>
												<td rowspan="3" class="alC">9급</td>
												<td rowspan="3">240</td>
												<td rowspan="3">240</td>
											</tr>
											<tr>
												<td class="case">수지관절 탈구</td>
											</tr>
											<tr>
												<td class="case">수지골 골절 또는 수지관절 탈구</td>
											</tr>
											<tr>
												<td class="case">사지관절의 근 또는 건의 단순 염좌</td>
												<td class="alC">12급</td>
												<td>80</td>
												<td>120</td>
											</tr>
											<tr>
												<td class="case">수지 관절 염좌</td>
												<td rowspan="2" class="alC bB2">14급</td>
												<td rowspan="2" class="bB2">50</td>
												<td rowspan="2" class="bB2">80</td>
											</tr>
											<tr>
												<td class="case">사지의 단순 타박</td>
											</tr>
										</tbody>
									</table>	
								</div><!--// 상지부팔 e -->
								<!-- 척추 -->
								<div id="tab3" class="tabCont">
									<h3 class="hide">척추</h3>	
									<p class="txtPoint03 alR">&#40;단위&#58;만원&#41;</p>
									<table class="tbDetail_st01 tbInjure" summary="척추에 관련된 상해급수안내 상세정보 테이블 입니다.">
										<caption>척추에 관련된 상해급수안내 및 보상한도액에 대해서 나타낸 표</caption>
										<colgroup>
											<col style="width:64%;" />
											<col style="width:10%;" />
											<col style="width:13%;" />
											<col style="width:13%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">증상 및 병명</th>
												<th scope="col" rowspan="2">상해등급</th>
												<th scope="col" colspan="2" class="bB1">책임보상 한도액</th>
											</tr>
											<tr>
												<th scope="col" class="scd">2014&#46;02&#46;07<br/>이후사고</th>
												<th scope="col" class="scd">2016&#46;04&#46;01<br/>이후사고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="4" class="fstCate">척추</td>
											</tr>
											<tr>
												<td class="case">척주 손상으로 완전 사지마비 또는 완전 하반신마비를 동반한 상해</td>
												<td rowspan="3" class="alC">1급</td>
												<td rowspan="3">2&#44;000</td>
												<td rowspan="3">3&#44;000</td>
											</tr>
											<tr>
												<td class="case">척수 손상을 동반한 불안정성 방출성 척추 골절</td>
											</tr>
											<tr>
												<td class="case">척수 손상을 동반한 척추 신연손상 또는 전위성(회전성) 골절</td>
											</tr>
											<tr>
												<td class="case">척주 손상으로 불완전 사지마비를 동반한 상해</td>
												<td rowspan="2" class="alC">2급</td>
												<td rowspan="2">1&#44;000</td>
												<td rowspan="2">1&#44;500</td>
											</tr>
											<tr>
												<td class="case">신경 손상 없는 불안정성 방출성 척추 골절로 수술적 고정술을 시행한 상해  </br>또는 경추 골절(치돌기 골절을 포함한다) 또는 탈구로 할로베스트나 수술적 고정술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">척주 손상으로 불완전 하반신마비를 동반한 상해 </td>
												<td class="alC">3급</td>
												<td>1&#44;000</td>
												<td>1&#44;200</td>
											</tr>
											<tr>
												<td class="case">안정성 추체 골절</td>
												<td class="alC">5급</td>
												<td>900</td>
												<td>900</td>
											</tr>
											<tr>
												<td class="case">골다공증성 척추 압박골절</td>
												<td class="alC">7급</td>
												<td>500</td>
												<td>500</td>
											</tr>
											<tr>
												<td class="case">각종 돌기 골절(극돌기, 횡돌기) 또는 후궁 골절</td>
												<td class="alC">8급</td>
												<td>240</td>
												<td>300</td>
											</tr>
											<tr>
												<td class="case">추간판 탈출증</td>
												<td class="alC">9급</td>
												<td>240</td>
												<td>240</td>
											</tr>
											<tr>
												<td class="case">척추 염좌</td>
												<td class="alC">12급</td>
												<td>80</td>
												<td>120</td>
											</tr>
										</tbody>
									</table>									
								</div><!--// 척추 e -->
								<!-- 골반·하지부 -->
								<div id="tab4" class="tabCont">
									<h3 class="hide">골반&#183;하지부</h3>	
									<p class="txtPoint03 alR">&#40;단위&#58;만원&#41;</p>
									<table class="tbDetail_st01 tbInjure" summary="골반·하지부에 관련된 상해급수안내 상세정보 테이블 입니다.">
										<caption>골반&#183;하지부에 관련된 상해급수안내 및 보상한도액에 대해서 나타낸 표</caption>
										<colgroup>
											<col style="width:64%;" />
											<col style="width:10%;" />
											<col style="width:13%;" />
											<col style="width:13%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">증상 및 병명</th>
												<th scope="col" rowspan="2">상해등급</th>
												<th scope="col" colspan="2" class="bB1">책임보상 한도액</th>
											</tr>
											<tr>
												<th scope="col" class="scd">2014&#46;02&#46;07<br/>이후사고</th>
												<th scope="col" class="scd">2016&#46;04&#46;01<br/>이후사고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="4" class="fstCate">절단</td>
											</tr>
											<tr>
												<td class="case">대퇴부 완전 절단 소실</td>
												<td class="alC">1급</td>
												<td>2&#44;000</td>
												<td>3&#44;000</td>
											</tr>
											<tr>
												<td class="case">하퇴부 완전 절단 소실</td>
												<td class="alC">2급</td>
												<td>1&#44;000</td>
												<td>1&#44;500</td>
											</tr>
											<tr>
												<td class="case">족근부 완전 절단 소실</td>
												<td class="alC">3급</td>
												<td>1&#44;000</td>
												<td>1&#44;200</td>
											</tr>
											<tr>
												<td class="case">무족지 또는 다발성 족지의 완전 절단 소실</td>
												<td class="alC">4급</td>
												<td>900</td>
												<td>1&#44;000</td>
											</tr>
											<tr>
												<td class="case">무족지를 제외한 단일 족지의 완전 절단 소실</td>
												<td class="alC">5급</td>
												<td>900</td>
												<td>900</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">골반부</td>
											</tr>
											<tr>
												<td class="case">불안정성 골반골 골절</td>
												<td class="alC">1급</td>
												<td>2&#44;000</td>
												<td>3&#44;000</td>
											</tr>
											<tr>
												<td class="case">골반환이 안정적인 골반골 골절(천골 골절 및 미골 골절을 포함)</td>
												<td rowspan="2" class="alC">4급</td>
												<td rowspan="2">900</td>
												<td rowspan="2">1&#44;000</td>
											</tr>
											<tr>
												<td class="case">골반골 관절의 이개</td>
											</tr>
											<tr>
												<td class="case">그 밖에 명기되지 않은 견열골절 등 제불완전골절</td>
												<td class="alC">해당골절항</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">대퇴부(고관절 포함), 하퇴부</td>
											</tr>
											<tr>
												<td class="case">비구 골절 또는 비구 골절 탈구</td>
												<td class="alC">1급</td>
												<td>2&#44;000</td>
												<td>3&#44;000</td>
											</tr>
											<tr>
												<td class="case">고관절의 골절성 탈구(비구 골절을 동반하지 않은 경우에 적용)</td>
												<td rowspan="3" class="alC">2급</td>
												<td rowspan="3">1&#44;000</td>
												<td rowspan="3">1&#44;500</td>
											</tr>
											<tr>
												<td class="case">대퇴 골두 골절</td>
											</tr>
											<tr>
												<td class="case">대퇴골 경부 분쇄 골절, 전자하부 분쇄 골절, 과부 분쇄 골절, 경골 과부 분쇄 골절 또는 경골 원위 관절내 분쇄 골절</td>
											</tr>
											<tr>
												<td class="case">대퇴골 또는 경골 골절(대퇴골 골두 골절은 제외)</td>
												<td class="alC">3급</td>
												<td>1&#44;000</td>
												<td>1&#44;200</td>
											</tr>
											<tr>
												<td class="case">고관절 탈구</td>
												<td rowspan="3" class="alC">5급</td>
												<td rowspan="3">900</td>
												<td rowspan="3">900</td>
											</tr>
											<tr>
												<td class="case">대퇴골 또는 근위 경골의 견열골절? </td>
											</tr>
											<tr>
												<td class="case">아킬레스건, 슬개건, 대퇴 사두건 또는 대퇴 이두건 파열</td>
											</tr>
											<tr>
												<td class="case">비골 간부골절 또는 골두골절</td>
												<td class="alC">7급</td>
												<td>500</td>
												<td>500</td>
											</tr>
											<tr>
												<td class="case">그 밖에 명기되지 않은 견열골절 등 제불완전골절</td>
												<td class="alC">해당골절항목 적용</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td class="case">하지 3대 관절의 혈관절증</td>
												<td class="alC">10급</td>
												<td>160</td>
												<td>200</td>
											</tr>
											<tr>
												<td class="case">사지관절의 근 또는 건의 단순 염좌</td>
												<td class="alC">12급</td>
												<td>80</td>
												<td>120</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">슬관절부</td>
											</tr>
											<tr>
												<td class="case">슬관절의 골절 및 탈구</td>
												<td class="alC">2급</td>
												<td>1&#44;000</td>
												<td>1&#44;500</td>
											</tr>
											<tr>
												<td class="case">슬관절의 전방 및 후방 십자인대의 파열</td>
												<td class="alC">3급</td>
												<td>1&#44;000</td>
												<td>1&#44;200</td>
											</tr>
											<tr>
												<td class="case">슬관절 탈구</td>
												<td class="alC">4급</td>
												<td>900</td>
												<td>1&#44;000</td>
											</tr>
											<tr>
												<td class="case">슬관절의 전방 또는 후방 십자인대의 파열</td>
												<td rowspan="4" class="alC">5급</td>
												<td rowspan="4">900</td>
												<td rowspan="4">900</td>
											</tr>
											<tr>
												<td class="case">슬관절 십자인대 부분 파열</td>
											</tr>
											<tr>
												<td class="case">슬개골 골절</td>
											</tr>
											<tr>
												<td class="case">아킬레스건, 슬개건, 대퇴 사두건 또는 대퇴 이두건 파열</td>
											</tr>
											<tr>
												<td class="case">슬관절 내측 또는 외측 측부인대 파열</td>
												<td rowspan="3" class="alC">6급</td>
												<td rowspan="3">500</td>
												<td rowspan="3">700</td>
											</tr>
											<tr>
												<td class="case">슬관절 측부인대 부분 파열</td>
											</tr>
											<tr>
												<td class="case">반월상 연골 파열</td>
											</tr>
											<tr>
												<td class="case">하지 3대 관절의 혈관절증</td>
												<td class="alC">10급</td>
												<td>160</td>
												<td>200</td>
											</tr>
											<tr>
												<td class="case">슬관절 염좌</td>
												<td class="alC">12급</td>
												<td>80</td>
												<td>120</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">족부</td>
											</tr>
											<tr>
												<td class="case">족관절 골절 및 탈구</td>
												<td rowspan="2" class="alC">3급</td>
												<td rowspan="2">1&#44;000</td>
												<td rowspan="2">1&#44;200</td>
											</tr>
											<tr>
												<td class="case">족근관절의 손상으로 족근골의 완전탈구가 동반된 상해</td>
											</tr>
											<tr>
												<td class="case">거골 또는 종골 골절</td>
												<td class="alC">4급</td>
												<td>900</td>
												<td>1&#44;000</td>
											</tr>
											<tr>
												<td class="case">족관절의 양과 골절 또는 삼과 골절(내과, 외과, 후과를 말한다)</td>
												<td rowspan="6" class="alC">5급</td>
												<td rowspan="6">900</td>
												<td rowspan="6">900</td>
											</tr>
											<tr>
												<td class="case">족관절 탈구</td>
											</tr>
											<tr>
												<td class="case">그 밖의 족근골 골절(거골 및 종골은 제외한다)</td>
											</tr>
											<tr>
												<td class="case">중족족근관절 손상(리스프랑 관절을 말한다)</td>
											</tr>
											<tr>
												<td class="case">3개 이상의 중족골 골절</td>
											</tr>
											<tr>
												<td class="case">아킬레스건, 슬개건, 대퇴 사두건 또는 대퇴 이두건 파열</td>
											</tr>
											<tr>
												<td class="case">족관절 내측 또는 외측 측부인대의 파열 또는 골절을 동반하지 않은 원위 경비골 이개</td>
												<td rowspan="2" class="alC">6급</td>
												<td rowspan="2">500</td>
												<td rowspan="2">700</td>
											</tr>
											<tr>
												<td class="case">2개 이하의 중족골 골절</td>
											</tr>
											<tr>
												<td class="case">족관절 내과, 외과 또는 후과 골절</td>
												<td class="alC">7급</td>
												<td>500</td>
												<td>500</td>
											</tr>
											<tr>
												<td class="case">족지골 골절 및 탈구</td>
												<td rowspan="2" class="alC">8급</td>
												<td rowspan="2">240</td>
												<td rowspan="2">300</td>
											</tr>
											<tr>
												<td class="case">족지관절 골절 및 탈구</td>
											</tr>
											<tr>
												<td class="case">족지골 골절 또는 족지관절 탈구</td>
												<td class="alC">9급</td>
												<td>240</td>
												<td>240</td>
											</tr>
											<tr>
												<td class="case">하지 3대 관절의 혈관절증</td>
												<td class="alC">10급</td>
												<td>160</td>
												<td>200</td>
											</tr>
											<tr>
												<td class="case">족지관절 염좌</td>
												<td rowspan="2" class="alC">14급</td>
												<td rowspan="2">50</td>
												<td rowspan="2">80</td>
											</tr>
											<tr>
												<td class="case">사지의 단순타박</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">사지(팔, 다리) 근·건·신경</td>
											</tr>
											<tr>
												<td class="case">아킬레스건, 슬개건, 대퇴 사두건 또는 대퇴 이두건 파열로 수술을 시행한 상해 </td>
												<td rowspan="3" class="alC">5급</td>
												<td rowspan="3">900</td>
												<td rowspan="3">900</td>
											</tr>
											<tr>
												<td class="case">사지 근 또는 건 파열로 6개 이상의 근 또는 건 봉합술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">사지의 주요 말초 신경 손상으로 수술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">사지 근 또는 건 파열로 3 ∼ 5개의 근 또는 건 봉합술을 시행한 상해</td>
												<td class="alC">6급</td>
												<td>500</td>
												<td>700</td>
											</tr>
											<tr>
												<td class="case">사지의 근 또는 건 파열로 1 ∼ 2개의 근 또는 건 봉합술을 시행한 상해</td>
												<td rowspan="3" class="alC">8급</td>
												<td rowspan="3">240</td>
												<td rowspan="3">300</td>
											</tr>
											<tr>
												<td class="case">사지의 주요 말초 신경 손상으로 수술을 시행하지 않은 상해</td>
											</tr>
											<tr>
												<td class="case">사지의 감각 신경 손상으로 수술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">수족지 신전건 1개의 파열로 건 봉합술을 시행한 상해</td>
												<td class="alC">9급</td>
												<td>240</td>
												<td>240</td>
											</tr>
											<tr>
												<td class="case">사지의 열상으로 창상 봉합술을 시행한 상해(길이에 관계없이 적용한다)</td>
												<td rowspan="2" class="alC bB2">12급</td>
												<td rowspan="2" class="bB2">80</td>
												<td rowspan="2" class="bB2">120</td>
											</tr>
											<tr>
												<td class="case">사지의 주요 말초 신경 손상으로 수술을 시행하지 않은 상해</td>
											</tr>
										</tbody>
									</table>									
								</div><!--// 골반·하지부 e -->
								<!-- 흉복부 -->
								<div id="tab5" class="tabCont">
									<h3 class="hide">흉복부</h3>
									<p class="txtPoint03 alR">&#40;단위&#58;만원&#41;</p>
									<table class="tbDetail_st01 tbInjure" summary="흉복부에 관련된 상해급수안내 상세정보 테이블 입니다.">
										<caption>흉복부에 관련된 상해급수안내 및 보상한도액에 대해서 나타낸 표</caption>
										<colgroup>
											<col style="width:64%;" />
											<col style="width:10%;" />
											<col style="width:13%;" />
											<col style="width:13%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">증상 및 병명</th>
												<th scope="col" rowspan="2">상해등급</th>
												<th scope="col" colspan="2" class="bB1">책임보상 한도액</th>
											</tr>
											<tr>
												<th scope="col" class="scd">2014&#46;02&#46;07<br/>이후사고</th>
												<th scope="col" class="scd">2016&#46;04&#46;01<br/>이후사고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="4" class="fstCate">흉부</td>
											</tr>
											<tr>
												<td class="case">심장 파열로 수술을 시행한 상해</td>
												<td rowspan="2" class="alC">1급</td>
												<td rowspan="2">2&#44;000</td>
												<td rowspan="2">3&#44;000</td>
											</tr>
											<tr>
												<td class="case">흉부 대동맥 손상 또는 이에 준하는 대혈관 손상으로 수술 또는 스탠트그라프트 삽입술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">흉부 기관, 기관지 파열, 폐 손상 또는 식도 손상으로 절제술을 시행한 상해</td>
												<td class="alC">2급</td>
												<td>1&#44;000</td>
												<td>1&#44;500</td>
											</tr>
											<tr>
												<td class="case">흉부 대동맥 손상 또는 이에 준하는 대혈관 손상으로 수술을 시행하지 않은 상해</td>
												<td rowspan="2" class="alC">3급</td>
												<td rowspan="2">1&#44;000</td>
												<td rowspan="2">1&#44;200</td>
											</tr>
											<tr>
												<td class="case">절제술을 제외한 개흉 또는 흉강경 수술을 시행한 상해(진단적 목적으로 시행한 경우에는 4급에 해당한다)</td>
											</tr>
											<tr>
												<td class="case">흉부 또는 복합 손상으로 인공호흡기를 시행한 상해(기관절개술을 시행한 경우도 포함)</td>
												<td rowspan="2" class="alC">4급</td>
												<td rowspan="2">900</td>
												<td rowspan="2">1&#44;000</td>
											</tr>
											<tr>
												<td class="case">진단적 목적으로 복부 또는 흉부 수술을 시행한 상해(복강경 또는 흉강경 수술도 포함)</td>
											</tr>
											<tr>
												<td class="case">심장 타박</td>
												<td rowspan="3" class="alC">6급</td>
												<td rowspan="3">500</td>
												<td rowspan="3">700</td>
											</tr>
											<tr>
												<td class="case">폐좌상(일측 폐의 50퍼센트 이상 면적을 흉부 CT 등에서 확인한 경우에 한정)</td>
											</tr>
											<tr>
												<td class="case">혈흉 또는 기흉이 발생하여 폐쇄식 흉관 삽관수술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">혈흉 또는 기흉이 발생하여 폐쇄식 흉관 삽관수술을 시행하지 않은 상해 </td>
												<td rowspan="2" class="alC">8급</td>
												<td rowspan="2">240</td>
												<td rowspan="2">300</td>
											</tr>
											<tr>
												<td class="case">3개 이상의 다발성 늑골 골절</td>
											</tr>
											<tr>
												<td class="case">2개 이하의 단순 늑골골절</td>
												<td rowspan="2" class="alC">9급</td>
												<td rowspan="2">240</td>
												<td rowspan="2">240</td>
											</tr>
											<tr>
												<td class="case">흉골 골절</td>
											</tr>
											<tr>
												<td class="case">흉부 타박상으로 늑골 골절 없이 흉부의 동통을 동반한 상해</td>
												<td class="alC">13급</td>
												<td>80</td>
												<td>80</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">복부</td>
											</tr>
											<tr>
												<td class="case">내부 장기 손상으로 장기의 일부분이라도 적출 수술을 시행한 상해</td>
												<td rowspan="2" class="alC">2급</td>
												<td rowspan="2">1&#44;000</td>
												<td rowspan="2">1&#44;500</td>
											</tr>
											<tr>
												<td class="case">신장 파열로 수술한 상해</td>
											</tr>
											<tr>
												<td class="case">내부 장기 손상으로 장기 적출 없이 재건수술 또는 지혈수술 등을 시행한 상해(장간막 파열을 포함)</td>
												<td class="alC">3급</td>
												<td>1&#44;000</td>
												<td>1&#44;200</td>
											</tr>
											<tr>
												<td class="case">진단적 목적으로 복부 또는 흉부 수술을 시행한 상해(복강경 또는 흉강경 수술도 포함)</td>
												<td class="alC">4급</td>
												<td>900</td>
												<td>1&#44;000</td>
											</tr>
											<tr>
												<td class="case">복강내 출혈 또는 장기 파열 등으로 중재적 방사선학적 시술을 통하여 지혈술을 시행하거나 경피적 배액술 등을 시행하여 보존적으로 치료한 상해</td>
												<td class="alC">5급</td>
												<td>900</td>
												<td>900</td>
											</tr>
											<tr>
												<td class="case">방광, 요도, 고환, 음경, 신장, 간, 지라 등 손상으로 수술을 시행하지 않은 상해</td>
												<td class="alC">14급</td>
												<td>50</td>
												<td>80</td>
											</tr>
											<tr>
												<td colspan="4" class="fstCate">비뇨기계</td>
											</tr>
											<tr>
												<td class="case">요도 파열로 요도 성형술 또는 요도 내시경을 이용한 요도 절개술을 시행한 상해</td>
												<td class="alC">3급</td>
												<td>1&#44;000</td>
												<td>1&#44;200</td>
											</tr>
											<tr>
												<td class="case">요도 파열로 유치 카테타, 부지 삽입술을 시행한 상해</td>
												<td class="alC">6급</td>
												<td>500</td>
												<td>700</td>
											</tr>
											<tr>
												<td class="case">고환 손상으로 수술을 시행한 상해</td>
												<td rowspan="2" class="alC">9급</td>
												<td rowspan="2">240</td>
												<td rowspan="2">240</td>
											</tr>
											<tr>
												<td class="case">음경 손상으로 수술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">방광, 요도, 고환, 음경, 신장, 간, 지라 등 손상으로 수술을 시행하지 않은 상해</td>
												<td class="alC bB2">14급</td>
												<td class="bB2">50</td>
												<td class="bB2">80</td>
											</tr>
										</tbody>
									</table>								
								</div><!--// 흉복부 e -->
								<!-- 연부혈관 -->
								<div id="tab6" class="tabCont">
									<h3 class="hide">연부&#183;혈관</h3>
									<p class="txtPoint03 alR">&#40;단위&#58;만원&#41;</p>
									<table class="tbDetail_st01 tbInjure" summary="하체·다리에 관련된 상해급수안내 상세정보 테이블 입니다.">
										<caption>연부&#183;혈관에 관련된 상해급수안내 및 보상한도액에 대해서 나타낸 표</caption>
										<colgroup>
											<col style="width:64%;" />
											<col style="width:10%;" />
											<col style="width:13%;" />
											<col style="width:13%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">증상 및 병명</th>
												<th scope="col" rowspan="2">상해등급</th>
												<th scope="col" colspan="2" class="bB1">책임보상 한도액</th>
											</tr>
											<tr>
												<th scope="col" class="scd">2014&#46;02&#46;07<br/>이후사고</th>
												<th scope="col" class="scd">2016&#46;04&#46;01<br/>이후사고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="4" class="fstCate">연부조직 및 혈관손상</td>
											</tr>
											<tr>
												<td class="case">골의 분절 소실로 유리생골 이식술을 시행한 상해(근육, 근막 또는 피부 등 연부 조직을 포함한 경우에 적용한다)</td>
												<td rowspan="2" class="alC">1급</td>
												<td rowspan="2">2&#44;000</td>
												<td rowspan="2">3&#44;000</td>
											</tr>
											<tr>
												<td class="case">화상·좌창·괴사창 등 연부 조직의 심한 손상이 몸 표면의 9퍼센트 이상인 상해</td>
											</tr>
											<tr>
												<td class="case">사지 연부 조직에 손상이 심하여 유리 피판술을 시행한 상해</td>
												<td class="alC">2급</td>
												<td >1&#44;000</td>
												<td >1&#44;500</td>
											</tr>
											<tr>
												<td class="case">사지의 연부 조직에 손상이 심하여 유경 피판술 또는 원거리 피판술을 시행한 상해</td>
												<td rowspan="2" class="alC">4급</td>
												<td rowspan="2">900</td>
												<td rowspan="2">1&#44;000</td>
											</tr>
											<tr>
												<td class="case">화상· 좌창· 괴사창 등으로 연부 조직의 손상이 몸 표면의 약 4.5퍼센트 이상인 상해</td>
											</tr>
											<tr>
												<td class="case">다발성 사지의 주요 혈관 손상으로 봉합술 또는 이식술을 시행한 상해</td>
												<td class="alC">5급</td>
												<td >900</td>
												<td >900</td>
											</tr>
											<tr>
												<td class="case">사지의 다발성 주요 혈관손상으로 봉합술 혹은 이식술을 시행한 상해</td>
												<td rowspan="2" class="alC">8급</td>
												<td rowspan="2">240</td>
												<td rowspan="2">300</td>
											</tr>
											<tr>
												<td class="case">사지의 연부 조직 손상으로 피부 이식술이나 국소 피판술을 시행한 상해</td>
											</tr>
											<tr>
												<td class="case">사지의 주요 혈관손상으로 봉합술 혹은 이식술을 시행한 상해</td>
												<td class="alC">9급</td>
												<td >240</td>
												<td >240</td>
											</tr>
											<tr>
												<td class="case">다연부조직 또는 피부 결손으로 수술을 시행하지 않은 상해</td>
												<td class="alC">10급</td>
												<td >160</td>
												<td >200</td>
											</tr>
											<tr>
												<td class="case">사지의 열상으로 창상 봉합술을 시행한 상해 (길이에 관계없이 적용한다)</td>
												<td class="alC bB2">12급</td>
												<td class="bB2">80</td>
												<td class="bB2">120</td>
											</tr>
										</tbody>
									</table>										
								</div><!--// 연부·혈관 e -->
							</div><!--// tabContainer e -->
						</div><!--// injureTab e -->
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>