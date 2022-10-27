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

<link href="/bootStrap/stylesheets/application.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<script src="/js/truck/kma_common.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">
//<![CDATA[
$(function() {
});
function FnSetPage(_page){
	$("#_page").val(_page);
	FnList();
}
function FnList(){
	$("form#kta_form").attr("action", "<c:url value='/kma/request/list.do'/>");
	$("form#kta_form").attr("method", "POST");
	$("form#kta_form").attr("target", "_self");
	$("form#kta_form").submit();
}
function FnSearList(){
	$("#_page").val("1");
	FnList();
}
function FnIPActivity(seq, userId, action, macaddr, seqNo){
	var msg = "";
	if(action=="P"){
		msg = "허용 하시겠습니까?";
	}else if(action=="B"){
		msg = "차단 하시겠습니까?";
	}else if(action=="D"){
		msg = "삭제 하시겠습니까?";
	}

	if( !confirm(msg) ){
		return;
	}
	
	var obj = document.getElementsByName("_user_ip");
	for(var i=0; i<obj.length; i++){
		if(i==(seq-1)){
			$.ajax({
				async : true
	          , type: 'POST'
	          , url: "<c:url value='/kma/request/multi.do'/>"
	          , dataType : 'json'
	          , data : {
	        	         "_userId"     : userId
                       , "_permission" : action
                       , "_equipPhyAdd": macaddr
                       , "_seqNo"      : seqNo
				}
	          , success : function (data) {
				if(data.result == "S"){		
					alert("완료되었습니다.");			
					FnBtnCtl(seq, userId, action);
				}else{
					alert("실패하였습니다.");
				}
			  }, error: function(response, error) {
				  FnAjaxError(response);
			  }
			});
		}
	}
}

function FnBtnCtl(seq, userId, action){
	var obj = document.getElementsByName("_user_ip");
	var msg = "";
	for(var i=0; i<obj.length; i++){
		if(i==(seq-1)){
			
			if(action=="P"){
				msg = "(P)허용";
			}else if(action=="B"){
				msg = "(B)차단";
			}else if(action=="D"){
				obj[i].value = "";
				msg = "";
			}
			$("#adm_yn_area_"+seq).html(msg);
			break;
		}
	}
	
	var str = new StringBuffer();
	if(action == "P"){
		str.append("<a href='javascript:FnIPActivity('"+seq+"','"+userId+"','B');' class='btn btn-primary btn-sm' data-role='button' data-inline='true' data-theme='b' data-mini='true' data-icon='check'>차단</a> ");
	}else if(action == "B"){
		str.append("<a href='javascript:FnIPActivity('"+seq+"','"+userId+"','P');' class='btn btn-primary btn-sm' data-role='button' data-inline='true' data-theme='b' data-mini='true' data-icon='check'>허용</a>");
	}
	$("#btn_area_"+seq).html(str.toString()).trigger('create');
}
function FnNextPrev(section){
	var _page       = Number("${_param._page}");
	var _totalCount = Number("${_param._totalCount}");
	var _pageSize   = Number("${_param._pageSize}");
	var _ttPage     = parseInt( (_totalCount-1) / _pageSize+1 );

	if(section=="N"){
		if(_ttPage == _page){
			alert("마지막 페이지 입니다.");
			return;
		}
		_page = _page + 1;
	}else if(section=="P"){
		if(_page==0 || _page==1){
			alert("첫 페이지 입니다.");
			return;
		}
		_page = _page - 1;
	}
	
	$("#_page").val(_page);
	FnList();
}

function searchPaging(pageIndex){
	var _page       = Number(pageIndex);
	var _totalCount = Number("${_param._totalCount}");
	var _pageSize   = Number("${_param._pageSize}");
	var _ttPage     = parseInt( (_totalCount-1) / _pageSize+1 );

	$("#_page").val(_page);
	FnList();
}
/**
 * 팝업 페이지 호출
 */
function FnEquipRegForm(macId){
	if(macId=="INIT") macId = "";
	$.mobile.changePage("<c:url value='/kma/popup/EquipRegPop.jsp?macId="+macId+"'/>", {
	});
}
function FnEquipDetail(macId){
	if(macId.length>0){
		$.ajax({
			async : true
	      , type: 'POST'
	      , url: "<c:url value='/kma/request/equipDetail.do'/>"
	      , dataType : 'json'
	      , data : {
	    	    "EQUIP_PHY_ADDR" : macId
	          }
	      , success : function (data) {
	    	  if(data._result=="LOGIN"){
	    		  FnAjaxLoginMovie("<c:url value='/' />");
	    		  
	    	  }else if(data._result=="S"){
					//EQUIP_PHY_ADDR, EQUIP_NM, EQUIP_ETC
					$("#EQUIP_PHY_ADDR").val(data.select.EQUIP_PHY_ADDR);
					$("#EQUIP_NM").val(data.select.EQUIP_NM);
					$("#EQUIP_ETC").val(data.select.EQUIP_ETC);
					$("#EQUIP_MODELNM").val(data.select.EQUIP_MODELNM);
					$("#EQUIP_SEQNO").val(data.select.EQUIP_SEQNO);
					$("#EQUIP_USIMNO").val(data.select.EQUIP_USIMNO);
					$("#EQUIP_OPENNO").val(data.select.EQUIP_OPENNO);
					$("#EQUIP_AGENCYNM").val(data.select.EQUIP_AGENCYNM);
	    	  }else{
	    		  alert(data._message);
	    	  }
	    	  
		  }, error: function(response, error) {
			  FnAjaxError( response );
		  }
		});
	}
}
function FnEquipReg(){
	
	if(!confirm("저장 하시겠습니까?")){
		return;
	}

	// ### 객체 타입 초기화
	FnDeleteObject1("kta_form","EQU");

	if( !isValid1("kta_form","EQU") ) {
		FnMakeObject("kta_form","EQU");
		return;
	}
	
	var EQUIP_PHY_ADDR = $("#EQUIP_PHY_ADDR").val();
	var EQUIP_NM       = $("#EQUIP_NM").val();
	var EQUIP_ETC      = $("#EQUIP_ETC").val();
	var EQUIP_MODELNM  = $("#EQUIP_MODELNM").val();
	var EQUIP_SEQNO    = $("#EQUIP_SEQNO").val();
	var EQUIP_USIMNO   = $("#EQUIP_USIMNO").val();
	var EQUIP_OPENNO   = $("#EQUIP_OPENNO").val();
	var EQUIP_AGENCYNM = $("#EQUIP_AGENCYNM").val();		
	var EQUIP_DEVICE_ID = $("#EQUIP_DEVICE_ID").val();		
	

	$.ajax({
		async : true
      , type: 'POST'
      , url: "<c:url value='/kma/request/equipSave.do'/>"
      , dataType : 'json'
      , data : {
    	    "EQUIP_PHY_ADDR" : EQUIP_PHY_ADDR   
    	  , "EQUIP_NM"       : EQUIP_NM
    	  , "EQUIP_ETC"      : EQUIP_ETC
    	  , "EQUIP_MODELNM"  : EQUIP_MODELNM
    	  , "EQUIP_SEQNO"    : EQUIP_SEQNO
    	  , "EQUIP_USIMNO"   : EQUIP_USIMNO
    	  , "EQUIP_OPENNO"   : EQUIP_OPENNO
    	  , "EQUIP_AGENCYNM" : EQUIP_AGENCYNM    	  
    	  , "EQUIP_DEVICE_ID" : EQUIP_DEVICE_ID    	  
          }
      , success : function (data) {
    	  if(data._result=="LOGIN"){
    		  FnAjaxLoginMovie("<c:url value='/' />");
    		  
    	  }else if(data._result=="S"){
    		  alert("저장되었습니다.");
			  FnList();
    	  }else{
    		  alert(data._message);
    	  }
    	  
	  }, error: function(response, error) {
		  FnAjaxError( response );
	  }
	});
}

function FnEquipDel(macAddr){
	
	if(!confirm("삭제 하시겠습니까?")){
		return;
	}


	$.ajax({
		async : true
      , type: 'POST'
      , url: "<c:url value='/kma/request/equipDelete.do'/>"
      , dataType : 'json'
      , data : {
    	    "EQUIP_PHY_ADDR" : macAddr   
          }
      , success : function (data) {
    	  if(data._result=="LOGIN"){
    		  FnAjaxLoginMovie("<c:url value='/' />");
    		  
    	  }else if(data._result=="S"){
    		  alert("삭제 되었습니다..");
			  FnList();
    	  }else{
    		  alert(data._message);
    	  }
    	  
	  }, error: function(response, error) {
		  FnAjaxError( response );
	  }
	});
}

function FnEquipInit(macAddr,seqNo){
	
	if(!confirm("해당기기를 초기화 하시겠습니까?")){
		return;
	}


	$.ajax({
		async : true
      , type: 'POST'
      , url: "<c:url value='/kma/request/equipInit.do'/>"
      , dataType : 'json'
      , data : {
    	      "EQUIP_PHY_ADDR" : macAddr
    	    , "SEQ_NO" : seqNo
          }
      , success : function (data) {
    	  if(data._result=="LOGIN"){
    		  FnAjaxLoginMovie("<c:url value='/' />");
    		  
    	  }else if(data._result=="S"){
    		  alert("초기화 되었습니다..");
			  FnList();
    	  }else{
    		  alert(data._message);
    	  }
    	  
	  }, error: function(response, error) {
		  FnAjaxError( response );
	  }
	});
}
/*
*관리자 검색
*/
function searchAdminList(){
	var keyword = $("#popSearchKeyword").val();
	var condition = $("#popSearchCondition").val();
	var params ={'keyword':keyword,'condition':condition};
	$.ajax({
		url:'/kma/request/qna/searchStaffList.do', type:'POST',
		data : params, dataType:'html', timeout: 2000, async:false,
		error: function(html){
			alert("error!"+html);
		},
		success: function(html){
			$("#searchingList").html(html).css('dispaly','block');
		}
	});
}
/*
*관리자 페이징
*/
function searchAdminListPaging(pageNo){
	var keyword = $("#popSearchKeyword").val();
	var condition = $("#popSearchCondition").val();
	var paging = pageNo;
	var params ={'keyword':keyword,'condition':condition,'paging':paging};
	$.ajax({
		url:'/kma/request/qna/searchStaffList.do', type:'POST',
		data : params, dataType:'html', timeout: 2000, async:false,
		error: function(html){
			alert("error!"+html);
		},
		success: function(html){
			$("#searchingList").html(html).css('dispaly','block');
		}
	});
}
/*
*기기검색 검색
*/
function searchDeviceList(){
	var keyword = $("#popSearchKeyword2").val();
	var params ={'keyword':keyword};
	$.ajax({
		url:'/kma/request/qna/searchDeviceMemberList.do', type:'POST',
		data : params, dataType:'html', timeout: 2000, async:false,
		error: function(html){
			alert("error!"+html);
		},
		success: function(html){
			$("#searchingDeviceList").html(html).css('dispaly','block');
		}
	});
}
/*
*기기검색 페이징
*/
function searchDeviceListPaging(pageNo){
	var keyword = $("#popSearchKeyword2").val();
	var paging = pageNo;
	var params ={'keyword':keyword,'paging':paging};
	$.ajax({
		url:'/kma/request/qna/searchDeviceMemberList.do', type:'POST',
		data : params, dataType:'html', timeout: 2000, async:false,
		error: function(html){
			alert("error!"+html);
		},
		success: function(html){
			$("#searchingDeviceList").html(html).css('dispaly','block');
		}
	});
}
function adminSearchEnterKey(){
	 if(event.keyCode==13){
		 searchAdminList();
	}
}
//////////사용자 변경을 위한 전역 변수//////////
var macAddres = '';
var seqNo = '';
var userId = '';
var userName = '';
////////////////////////////////////////////
function changeUser(sawunNum, name){
	if(confirm('기기의 사용자를 '+name+' 사용자로 변경 하시겠습니까?')){

		$.ajax({
			async : true
	      , type: 'POST'
	      , url: "<c:url value='/kma/request/changeUser.do'/>"
	      , dataType : 'json'
	      , data : {
	    	    "USER_ID" : sawunNum,
	    	    "EQUIP_PHY_ADDR" : macAddres,
	    	    "SEQ_NO" : seqNo
	          }
	      , success : function (data) {
	    	  console.log(data);
	    	  if(data._result=="LOGIN"){
	    		  FnAjaxLoginMovie("<c:url value='/kwa/main.do' />");
	    		  
	    	  }else if(data._result=="DF"){
	    		  alert("이미 사용중인 기기가 있습니다.");
	    	  }else if(data._result=="S"){
	    		  alert("변경이 성공적으로 완료 되었습니다.");
	    		  FnList();
	    	  }else{
	    		  alert(data._message);
	    	  }
	    	  
		  }, error: function(response, error) {
			  FnAjaxError( response );
		  }
		});
	}
}
function userChangeModal(macAddr, seqNum){
	macAddres = macAddr;
	seqNo = seqNum;
	$('#userChangeForm').modal();
}
function deviceChangeModal(macAddr, seqNum, user_id,user_name){
	macAddres = macAddr;
	seqNo = seqNum;
	userId = user_id;
	userName = user_name;
	$('#deviceChangeForm').modal();
}
function changeDevice(macAddres2, userId2, userName2, seqNo2){
	if(userId2==null||userId2==""){
		alert("사용자 정보가 없습니다.");
		return false;
	}
	if(confirm(userName+' 사용자의 기기를 '+userName2+' 사용자의 기기와 교환 하시겠습니까?')){
		
		$.ajax({
			async : true
	      , type: 'POST'
	      , url: "<c:url value='/kma/request/changeDevice.do'/>"
	      , dataType : 'json'
	      , data : {
	    	    "USER_ID" : userId,
	    	    "EQUIP_PHY_ADDR" : macAddres,
	    	    "SEQ_NO" : seqNo,
	    	    "USER_ID2" : userId2,
	    	    "EQUIP_PHY_ADDR2" : macAddres2,
	    	    "SEQ_NO2" : seqNo2
	          }
	      , success : function (data) {
	    	  console.log(data);
	    	  if(data._result=="LOGIN"){
	    		  FnAjaxLoginMovie("<c:url value='/kwa/main.do' />");
	    		  
	    	  }else if(data._result=="DF"){
	    		  alert("이미 사용중인 기기가 있습니다.");
	    	  }else if(data._result=="S"){
	    		  alert("변경이 성공적으로 완료 되었습니다.");
	    		  FnList();
	    	  }else{
	    		  alert(data._message);
	    	  }
	    	  
		  }, error: function(response, error) {
			  FnAjaxError( response );
		  }
		});
	}
}
//]]>
</script>

</head>
<body>
<!-- header s -->
	<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
	<c:import url="/kma/common/left.do"></c:import>
<!--// left e -->


<div class="main-content">
	<form id="kta_form" name="kta_form">
		<input type="hidden" id="_page"     name="_page"     value="${_param._page}" isInit="true"/>
		<input type="hidden" id="_pageSize" name="_pageSize" value="${_param._pageSize}" isInit="true"/>
	<fieldset>
		<div class="container">
			<div class="row">
				<div class="area-top clearfix">
	        		<div class="pull-left header">
						<h3 class="title" >
							승인관리
						</h3>
					</div>
				</div>
			</div>
		</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12" >
				<div class="box">
					<div class="box-header">
						<span class="title">검색</span>
					</div>
					<div class="box-content padded">
						사용자 명(아이디 or Mac Addr)
					<input style="font-size: 12px; width: 50%" type="text" onkeypress="FnEnter(event, 'FnSearList');" name="_searField" id="_searField" value="${_param._searField}" />
					<a href="javascript:FnSearList()" class="btn btn-primary btn-sm" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="search">조회</a>	
					<a href="javascript:FnEquipRegForm('INIT');" class="btn btn-primary btn-sm" data-toggle='modal' data-target='#modalForm'>등록</a>	
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12" >
				<div class="box">
					<div class="box-content">
							<table class="table table-normal">

			<colgroup>
				<col width="15%">
				<col width="10%">
				<col width="13%">
				<col width="10%">
				<col width="8%">
				<col width="8%">
				<col width="36%">
			</colgroup>
			<thead>
				<tr class="no-top">
					<th>맥어드레스</th>
					<th>기기명</th>
					<th>디바이스ID</th>
					<th>요청상태</th>
					<th>아이디</th>
					<th>사용자명</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty _param._list}">
						<c:forEach var="data" items="${_param._list}">
									<tr class="odd">
										<td class="first text-center">
											<input type="text" name="_user_ip" id="_user_ip" maxlength="15" value="${data.EQUIP_PHY_ADDR}" style="width:90%;text-align:center; background-color:#ccc" data-mini="true" readonly="readonly" />
											<input type='hidden' id="SEQ_NO" name='SEQ_NO' value='${data.SEQ_NO}' />
										</td>
										<td class='text-left'>
											${data.EQUIP_NM}
										</td>
										<td class='text-left'>
											${data.DEVICE_ID}
										</td>
										<td class='text-center'>
											<c:if test="${!empty data.USER_ID }">
												<c:if test="${data.PERMISSION_GBN_CD eq 'R' }">
													<font color="red"><span id="adm_yn_area_${data.ROW_SEQ}">(${data.PERMISSION_GBN_CD}) ${data.PERMISSION_GBN_NM}</span></font>
												</c:if>
												<c:if test="${data.PERMISSION_GBN_CD ne 'R' }">
													<span id="adm_yn_area_${data.ROW_SEQ}">(${data.PERMISSION_GBN_CD}) ${data.PERMISSION_GBN_NM}</span>
												</c:if>
											</c:if>
										</td>
										<td class='text-center'>
											${data.USER_ID}
										</td>
										<td class='text-center'>
											${data.NAME}
										</td>
										<td class='text-center'>
											<c:if test="${!empty data.USER_ID }">
												<a href="#;" onclick="userChangeModal('${data.EQUIP_PHY_ADDR}','${data.SEQ_NO}');return false;" class="btn btn-primary btn-sm" >사용자변경</a>
												<a href="#;" onclick="deviceChangeModal('${data.EQUIP_PHY_ADDR}','${data.SEQ_NO}','${data.USER_ID}','${data.NAME}');return false;" class="btn btn-primary btn-sm" >기기맞교환</a>
												<span id="btn_area_${data.ROW_SEQ}">
													<c:choose>
														<c:when test="${data.PERMISSION_GBN_CD eq 'P'}">
															<a href="javascript:FnIPActivity('${data.ROW_SEQ}','${data.USER_ID }','B', '${data.EQUIP_PHY_ADDR}', '${data.SEQ_NO}');" class="btn btn-primary btn-sm" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="check">차단</a>
														</c:when>
														<c:otherwise>
															<a href="javascript:FnIPActivity('${data.ROW_SEQ}','${data.USER_ID }','P', '${data.EQUIP_PHY_ADDR}', '${data.SEQ_NO}');" class="btn btn-primary btn-sm" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="check">허용</a>
														</c:otherwise>
													</c:choose>
												</span>
												<a href="javascript:FnEquipInit('${data.EQUIP_PHY_ADDR}','${data.SEQ_NO}');" class="btn btn-primary btn-sm" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="check">초기화</a>
											</c:if>

											<!--a href="javascript:FnEquipRegForm('${data.EQUIP_PHY_ADDR}');" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="delete">기기수정</a-->
											<a href="javascript:FnEquipDel('${data.EQUIP_PHY_ADDR}');" class="btn btn-primary btn-sm" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="delete">기기삭제</a>
										</td>
									</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7" align="center">
								데이터가 존재하지 않습니다.
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
	<div class="pag">
		<div class="ui-grid-a"  >
		<!-- 
			<div class="ui-block-a" style="text-align:right;">
				<div style="padding-top: 5px">&nbsp;&nbsp;&nbsp;총 ${_param._totalCount} 건 [${_param._page}/${_param._totalPage}]</div>
			</div>
		-->
			<div class="ui-block-b" style="text-align:right;">
				<div data-role="controlgroup" data-type="horizontal" >
					<div class="text-center">
						<ul class="pagination pagination-sm">
							<ui:pagination paginationInfo = "${paginationInfo}" type="bootStrap" jsFunction="searchPaging" />
						</ul>
						<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo}" />
					</div>
				</div>	
			</div>
		</div>	
	</div>
	</div>

	</div>
	</div>
	</fieldset>
	</form>
</div>
<div id="modalForm" class="modal fade modal-fullscreen" role="dialog" style="font-size: 12px;">
	<div class="modal-dialog" id="dateInputModelArea1">
		<div class="modal-content" id="dateInputContent1" style="height: auto;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">KTA 자산 기기 등록</h4>
				사용 할 기기를 등록 할수 있습니다.
			</div>
			<div class="modal-body">
				<div class="box-content">
					<table class="table table-hover" id="pop_grid_title" style="width: 100%">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<thead>
							<tr class="no-top">
								<th class="first"></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class='first'>
									맥어드레스
								</th>
								<td>
									<input type="text" data-mini="true" style="width:90%;" name="EQUIP_PHY_ADDR" id="EQUIP_PHY_ADDR" value="" datatype='string' datalength='20' dataname='맥어드레스' validYn='EQU' isReq='Y' >
								</td>
							</tr>
							<tr>
								<th class='first'>
									기기명
								</th>
								<td>
									<input type="text" data-mini="true" style="width:90%;" name="EQUIP_NM" id="EQUIP_NM" value="" datatype='string' datalength='30' dataname='기기명' validYn='EQU' isReq='Y' >
								</td>
							</tr>
							<tr>
								<th class='first'>
									디바이스ID
								</th>
								<td>
									<input type="text" data-mini="true" style="width:90%;" name="EQUIP_DEVICE_ID" id="EQUIP_DEVICE_ID" value="" datatype='string' datalength='30' dataname='디바이스아이디' validYn='DEVICE_ID' isReq='Y' >
								</td>
							</tr>
							<tr>
								<th class='first'>
									모델명
								</th>
								<td>
									<input type="text" data-mini="true" style="width:90%;" name="EQUIP_MODELNM" id="EQUIP_MODELNM" value="" datatype='string' datalength='256' dataname='모델명' validYn='EQU' isReq='N' >
								</td>
							</tr>
							<tr>
								<th class='first'>
									일련번호
								</th>
								<td>
									<input type="text" data-mini="true" style="width:90%;" name="EQUIP_SEQNO" id="EQUIP_SEQNO" value="" datatype='string' datalength='256' dataname='일련번호' validYn='EQU' isReq='N' >
								</td>
							</tr>
							<tr>
								<th class='first'>
									유심번호
								</th>
								<td>
									<input type="text" data-mini="true" style="width:90%;" name="EQUIP_USIMNO" id="EQUIP_USIMNO" value="" datatype='string' datalength='256' dataname='유심번호' validYn='EQU' isReq='N' >
								</td>
							</tr>
							<tr>
								<th class='first'>
									개통번호
								</th>
								<td>
									<input type="text" data-mini="true" style="width:90%;" name="EQUIP_OPENNO" id="EQUIP_OPENNO" value="" datatype='string' datalength='256' dataname='개통번호' validYn='EQU' isReq='N' >
								</td>
							</tr>
							<tr>
								<th class='first'>
									통신사
								</th>
								<td>
									<input type="text" data-mini="true" style="width:90%;" name="EQUIP_AGENCYNM" id="EQUIP_AGENCYNM" value="" datatype='string' datalength='256' dataname='통신사' validYn='EQU' isReq='N' >
								</td>
							</tr>
							<tr>
								<th class='first'>
									비고
								</th>
								<td>
									<input type="text" data-mini="true" style="width:90%;" name="EQUIP_ETC" id="EQUIP_ETC" value="" datatype='string' datalength='256' dataname='비고' validYn='EQU' isReq='N' >
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#;" type="button" data-dismiss="modal" class="btn btn-default">닫기</a>
				<a href="javascript:FnEquipReg();" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="plus" class="btn btn-default">등록</a>
				<script type="text/javascript">FnEquipDetail("${macId}");</script>
			</div>
		</div>
	</div>
</div>
<div id="userChangeForm" class="modal fade modal-fullscreen" role="dialog" style="font-size: 12px;">
	<div class="modal-dialog" id="dateInputModelArea1">
		<div class="modal-content" id="dateInputContent1" style="height: auto;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">사용자변경</h4>
			</div>
			<div class="modal-body">
				<div class="box-content">
					<input type="text" name="popSearchKeyword"  id="popSearchKeyword" class="search" placeholder="Search" onkeypress="adminSearchEnterKey();" />
					<select name="popSearchCondition"  id="popSearchCondition" class="btn btn-default btn-sm">
					<li class=""><span class="title"><option value="2" label="이름" selected="selected"/></span></li>
					<li class=""><span class="title"><option value="1" label="사원번호"/></span></li>
					</select>
					<a id="searchBtn" class="btn btn-blue"  href="#;" onclick="searchAdminList();"> 검색</a>
				</div>
				<div id="searchingList">
				</div>
			</div>
			<div class="modal-footer">
				<a href="#;" type="button" data-dismiss="modal" class="btn btn-default">닫기</a>
				<script type="text/javascript">FnEquipDetail("${macId}");</script>
			</div>
		</div>
	</div>
</div>
<div id="deviceChangeForm" class="modal fade modal-fullscreen" role="dialog" style="font-size: 12px;">
	<div class="modal-dialog" id="dateInputModelArea1">
		<div class="modal-content" id="dateInputContent1" style="height: auto;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">기기맞교환</h4>
				맞교환할 기기를 선택해주세요.
			</div>
			<div class="modal-body">
				<div class="box-content">
					사용자 명(아이디 or Mac Addr) <input type="text" name="popSearchKeyword2"  id="popSearchKeyword2" class="search" placeholder="Search" onkeypress="adminSearchEnterKey();" />
					<a id="searchBtn" class="btn btn-blue"  href="#;" onclick="searchDeviceList();"> 검색</a>
				</div>
				<div id="searchingDeviceList">
				</div>
			</div>
			<div class="modal-footer">
				<a href="#;" type="button" data-dismiss="modal" class="btn btn-default">닫기</a>
				<script type="text/javascript">FnEquipDetail("${macId}");</script>
			</div>
		</div>
	</div>
</div>
</body>
</html>