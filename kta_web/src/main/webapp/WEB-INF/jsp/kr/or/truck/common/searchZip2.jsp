<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
function searchAddr(){
	document.searchForm.action = "/common/searchZip2.do";
    document.searchForm.submit();
}

function searchAddr(){
	var jiyeok_name = $("#jiyeok_name").val();
	var params ={'jiyeok_name':jiyeok_name};
	$.ajax({
		url:'/common/searchZip2jrs.do', type:'POST',
		data : params, dataType:'html', timeout: 2000, async:false,
		error: function(html){
			alert("error!"+html);
		},
		success: function(html){
			$("#searchDiv1").html(html);
		}
	});
}

function searchAddr2(){
	var road_si = $("#road_si").val();
	var road_gungu = $("#road_gungu").val();
	var road_doro = $("#road_doro").val();
	var road_building_num = $("#road_building_num").val();
	var road_building_nm = $("#road_building_nm").val();
	var params ={'road_si':road_si,'road_gungu':road_gungu,'road_doro':road_doro,'road_building_num':road_building_num,'road_building_nm':road_building_nm};
	$.ajax({
		url:'/common/searchZip2drs.do', type:'POST',
		data : params, dataType:'html', timeout: 2000, async:false,
		error: function(html){
			alert("error!"+html);
		},
		success: function(html){
			$("#searchDiv2").html(html);
		}
	});
}


function submitAddr(){
	document.searchForm.action = "/common/searchZip2result.do";
    document.searchForm.submit();
}
function submitAddr2(){
	document.searchForm.action = "/common/searchZip2result2.do";
    document.searchForm.submit();
}
function inputZipCode(code,sn,sido,sigungu,eupmungdong,li,building_nm){
	var zipCode1 = code.substr(0,3);
	var zipCode2 = code.substr(3,5);
	document.searchForm.j_zip.value = zipCode1+"-"+zipCode2;
	document.searchForm.j_sn.value = sn;	
	document.searchForm.j_juso.value = sido+" "+sigungu+" "+eupmungdong+" "+li+" "+building_nm;
	document.searchForm.j_sido.value = sido;
	document.searchForm.j_sigungu.value = sigungu;
	document.searchForm.j_eupmungdong.value = eupmungdong;
	document.searchForm.j_li.value = li;
	document.searchForm.j_building_nm.value = building_nm;
	document.searchForm.j_sangse.value = building_nm;
	
}
function inputZipCode2(code,sn,sido,sigungu,doromung,building_m_num,building_s_num){
	var zipCode1 = code.substr(0,3);
	var zipCode2 = code.substr(3,5);
	document.searchForm.d_zip.value = zipCode1+"-"+zipCode2;
	document.searchForm.d_sn.value = sn;
	var juso = sido+" "+sigungu+" "+doromung;
	if(building_m_num !="0"){
		juso = juso + " " +building_m_num;
	}
	if(building_s_num !="0"){
		juso = juso + "-" +building_s_num;
	}
	document.searchForm.d_juso.value = juso;
	document.searchForm.d_sido.value = sido;
	document.searchForm.d_sigungu.value = sigungu;
	document.searchForm.d_doromung.value = doromung;
	document.searchForm.d_building_m_num.value = building_m_num;
	document.searchForm.d_building_s_num.value = building_s_num;
	
}

$(document).ready(function(){
	$('form#searchForm input[name="jiyeok_name"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			event.preventDefault();
			searchAddr();
		}
	});
	$('#dong_s').on('click',function(e){
		$('#dong').show();
		$('#road').hide();
		$('#doroToSubmit').show();
		$('#jibunToSubmit').hide();
		$('#d_zip').val("");
		$('#d_sn').val("");
		$('#d_juso').val("");
		$('#d_sido').val("");
		$('#d_sigungu').val("");
		$('#d_doromung').val("");
		$('#d_building_m_num').val("");
		$('#d_building_s_num').val("");
	});
	$('#road_s').on('click',function(e){
		$('#road').show();
		$('#dong').hide();
		$('#jibunToSubmit').show();
		$('#doroToSubmit').hide();
		$('#jiyeok_name').val("");
		$('#j_zip').val("");
		$('#j_sn').val("");
		$('#j_juso').val("");
		$('#j_sido').val("");
		$('#j_sigungu').val("");
		$('#j_eupmungdong').val("");
		$('#j_li').val("");
	});
});

<%-- 검색박스 엔터키 설정--%>

/* loading 표시 */
window.onbeforeunload = function (e) {
		$('div#loading_page').show();
};
</script>
<style type="text/css">
table.tbZip tbody tr:hover{background-color:#FFF7E8;cursor: pointer;}
</style>
</head>
<body>
	<div class="popUp">
		<h2 class="zipName">우편번호검색</h2>
		<form:form commandName="zipVO" id="searchForm" name="searchForm" method="post" action="">
		<fieldset>
		<legend>우편번호 검색</legend>
			<div class="zipWrap">
				<!-- 검색도움말 -->
				<div class="zipHelp">
					<h3>검색도움말</h3>
					<p>찾으실 지역의 동/읍/면 이름을 공백 없이 입력해주세요.</p>
					<p>예) 여의도동, 오천읍, 수지면</p>
				</div>
				<div>
					<span id="dong_s" style="cursor: pointer;">
						<p>지번주소로 찾기</p>
					</span>
					<span id="road_s" style="cursor: pointer;">
						<p>도로명주소로 찾기</p>
					</span>
				</div>
				<div id="dong">
					<div class="roundBox">
						<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
						<!-- 내용 -->
						<div class="searchZip">
							<span class="zipIcon"><img src="/images/truck/com/zip_icon.gif" alt="우편번호검색" /></span>
							<form:select path="searchCondition">
								<form:option value="dong">지번</form:option>
							</form:select>
							<label class="hide" for="jiyeok_name">지번주소입력</label>
							<form:input path="jiyeok_name" id="jiyeok_name" class="txt" title="검색어를 입력해주세요" style="width:270px" />
							<a class="btn_search" href="#;" onclick="searchAddr(); return false;"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="search" /></a>
						</div>
						<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
					</div><!--// roundBox e -->
					
					<div class="zipHelp">
						<p>해당하는 주소를 선택해주세요.</p>
					</div>
					<div id="searchDiv1" style="max-height: 200px; overflow: auto; overflow-x: hidden;">
						<table class="tbZip" summary="우편번호검색">
							<caption>우편번호 검색</caption>
							<colgroup>
								<col width="30%"/>
								<col width="70%"/>
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="first">우편번호</th>
									<th scope="col">주소</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2" style="text-align: center;">
										지역명을 올바르게 입력한 수 검색해 주세요!
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 
						<table class="tbZip" summary="우편번호검색">
							<caption>우편번호 검색</caption>
							<colgroup>
								<col width="30%"/>
								<col width="70%"/>
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="first">우편번호</th>
									<th scope="col">주소</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${resultList != null }">
									<c:forEach var="result" items="${resultList}" varStatus="status">
										 <tr onclick="inputZipCode('${result.ZIP}','${result.SN}','${result.SIDO_NM}','${result.SIGUNGU_NM}','${result.EUPMUNDONG_NM}','${result.LI_NM}')">
										 	<td><c:out value="${fn:substring(result.ZIP,0,3)}"/>-<c:out value="${fn:substring(result.ZIP,3,6)}"/></td>
										 	<td><c:out value="${result.JUSO}"/></td>
										 </tr>
									</c:forEach>
								</c:if>
								<c:if test="${resultList == null }">
									<tr>
										<td colspan="2" style="text-align: center;">
											지역명을 올바르게 입력한 수 검색해 주세요!
										</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						 -->
					</div>
					<div id="detailDiv" style="margin-top: 25px;width: 100%;">
						<div>
							현재주소&nbsp;&nbsp;&nbsp;
							<input type="text" name="j_zip" id="j_zip" style="width: 15%;"/>
							<input type="text" name="j_sn" id="j_sn" style="display: none;"/>
							<input type="text" name="j_juso" id="j_juso" style="width: 65%;"/>
							<input type="hidden" name="j_sido" id="j_sido" />
							<input type="hidden" name="j_sigungu" id="j_sigungu" />
							<input type="hidden" name="j_eupmungdong" id="j_eupmungdong" />
							<input type="hidden" name="j_li" id="j_li" />
							<input type="hidden" name="j_building_nm" id="j_building_nm" />
						</div>
						<div style="margin-top: 20px;">
							상세주소&nbsp;&nbsp;&nbsp;
							<input type="text" name="j_sangse" id="j_sangse" style="width: 83%;"/>
						</div>
					</div>
				</div>
				<div id="road" style="display: none;">
					<div class="roundBox">
						<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
						<!-- 내용 -->
						<div class="searchZip">
							<table class="table table-hover condensed" style="margin: 0 auto;">
								<colgroup>
									<col style="width:10%;"/>
									<col style="width:75%;"/>
									<col style="width:15%;"/>
								</colgroup>
								<tr>
									<td rowspan="2">
										<span class="zipIcon"><img src="/images/truck/com/zip_icon.gif" alt="우편번호검색" /></span>
									</td>
									<td style="text-align: left;">
										<form:select path="searchCondition">
											<form:option value="road">도로명</form:option>
										</form:select>
										시/도
										<form:select path="road_si">
											<option value="" selected="selected">선택</option>
											<option value="서울특별시">서울특별시</option>
											<option value="부산광역시">부산광역시</option>
											<option value="대구광역시">대구광역시</option>
											<option value="인천광역시">인천광역시</option>
											<option value="광주광역시">광주광역시</option>
											<option value="대전광역시">대전광역시</option>
											<option value="울산광역시">울산광역시</option>
											<option value="세종특별자치시">세종특별자치시</option>
											<option value="경기도">경기도</option>
											<option value="강원도">강원도</option>
											<option value="충청북도">충청북도</option>
											<option value="충청남도">충청남도</option>
											<option value="전라북도">전라북도</option>
											<option value="전라남도">전라남도</option>
											<option value="경상북도">경상북도</option>
											<option value="경상남도">경상남도</option>
											<option value="제주특별자치도">제주특별자치도</option>
										</form:select>
										시/군/구
										<label class="hide" for="road_gungu">시/도 입력</label>
										<form:input path="road_gungu" class="txt" title="검색어를 입력해주세요" style="width:78px" />
									</td>
									<td rowspan="2">
										<a class="btn_search" href="#;" onclick="searchAddr2(); return false;"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="search" /></a>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;">
										도로명
										<label class="hide" for="road_doro">도로명 입력</label>
										<form:input path="road_doro" class="txt" title="검색어를 입력해주세요" style="width:68px" />
										건물번호
										<label class="hide" for="road_building_num">건물번호 입력</label>
										<form:input path="road_building_num" class="txt" title="검색어를 입력해주세요" style="width:39px" />
										건물명
										<label class="hide" for="road_building_nm">건물명 입력</label>
										<form:input path="road_building_nm" class="txt" title="검색어를 입력해주세요" style="width:58px" />
									</td>
								</tr>
							</table>
						</div>
						<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
					</div><!--// roundBox e -->
					
					<div class="zipHelp">
						<p>해당하는 주소를 선택해주세요.</p>
					</div>
					<div id="searchDiv2" style="max-height: 200px; overflow: auto; overflow-x: hidden;">
						<table class="tbZip" summary="우편번호검색">
							<caption>우편번호 검색</caption>
							<colgroup>
								<col width="30%"/>
								<col width="70%"/>
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="first">우편번호</th>
									<th scope="col">주소</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2" style="text-align: center;">
										도로명을 입력한 후 검색해 주세요!
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="detailDiv" style="margin-top: 25px;width: 100%;">
						<div>
							현재주소&nbsp;&nbsp;&nbsp;
							<input type="text" name="d_zip" id="d_zip" style="width: 15%;"/>
							<input type="text" name="d_sn" id="d_sn" style="display: none;"/>
							<input type="text" name="d_juso" id="d_juso" style="width: 65%;"/>
							<input type="hidden" name="d_sido" id="d_sido" />
							<input type="hidden" name="d_sigungu" id="d_sigungu" />
							<input type="hidden" name="d_doromung" id="d_doromung" />
							<input type="hidden" name="d_building_m_num" id="d_building_m_num" />
							<input type="hidden" name="d_building_s_num" id="d_building_s_num" />
						</div>
						<div style="margin-top: 20px;">
							상세주소&nbsp;&nbsp;&nbsp;
							<input type="text" name="d_sangse" id="d_sangse" style="width: 83%;"/>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		</form:form>
		<div class="btnboxC clfix">
			<span class="btn_pack btn_type17"><a href="#;">초기화</a></span>
			<span id="doroToSubmit" class="btn_pack btn_type16"><a href="#;" onclick="submitAddr();">도로명주소로 바꾸기</a></span>
			<span id="jibunToSubmit" class="btn_pack btn_type16" style="display: none;"><a href="#;" onclick="submitAddr2();">지번주소로 바꾸기</a></span>
		</div>
	</div>
	<div id="loading_page" style="width: 100%; position: fixed;top:0px; display: none;height: 100%;z-index: 1000;">
		<table style="width: 100%;height: 100%;z-index: 1001;position: fixed;"><tbody><tr><td>
			<img src="/images/ajax-loader.gif" id="loaderImg" style="left: 49%; position: absolute; " alt="loading"/>
		</td></tr></tbody></table>
		<div style="width: 100%;height: 100%;background-color: white;position: fixed; opacity: 0.5;filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=40);filter: alpha(opacity=50);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";" >
		</div>
	</div>
</body>
</html>
