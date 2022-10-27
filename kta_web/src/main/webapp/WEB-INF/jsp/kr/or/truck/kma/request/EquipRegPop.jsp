<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String macId = request.getParameter("macId");
if(macId==null) macId = "";
pageContext.setAttribute("macId", macId);
%>
<div data-role="dialog">
	<div data-role="content" data-theme="c">
		<h1>
			KTA 자산 기기 등록
		</h1>
		<table>
			<colgroup>
				<col width="100%">
			</colgroup>
			<tbody>
				<tr>
					<th>
						사용 할 기기를 등록 할수 있습니다.
					</th>
				</tr>
			</tbody>
		</table>
		<br/>
		<table class="tbl-st01" id="pop_grid_title">
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
		<a href="#;" data-role="button" data-rel="back" class="ui-btn-right" data-theme="c">닫기</a>
		<a href="javascript:FnEquipReg();" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="plus">등록</a>
		<script type="text/javascript">FnEquipDetail("${macId}");</script>
	</div>
</div>
