<%@page contentType="text/html;charset=utf-8" %>
<%@include file = "./include/session_check.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Namo CrossEditor : Admin</title>
	<script type="text/javascript"> var ce_jr = "ce_pG"; </script>
	<script type="text/javascript" src="../manage_common.js"></script>
	<script type="text/javascript" language="javascript" src="../../js/namo_cengine.js"></script>
	<script type="text/javascript" language="javascript" src="../manager.js"></script>
	<link href="../css/common.css" rel="stylesheet" type="text/css">
</head>

<body>

<%@include file = "../include/top.html"%>

<div id="ce_Pb" class="ce_dn">	
	<table class="ce_iD">
	  <tr>
		<td class="ce_dn">
		
			<table id="Info">
				<tr>
					<td style="padding:0 0 0 10px;height:30px;text-align:left">
					<font style="font-size:14pt;color:#3e77c1;font-weight:bold;text-decoration:none;"><span id="ce_oY"></span></font></td>
					<td id="InfoText"><span id="ce_lr"></span></td>
				</tr>
				<tr>
					<td colspan="2"><img id="ce_mR" src="../images/title_line.jpg" alt="" /></td>
				</tr>
			</table>
		
		</td>
	  </tr>
	  <tr>
		<td class="ce_dn">
			
				<form method="post" id="ce_RO" action="account_proc.jsp" onsubmit="return ce_y(this);">
				<table class="ce_fs" >
				  <tr>
					<td>

						<table class="ce_bO">
						  <tr><td class="ce_cY" colspan="3"></td></tr>
						</table>
						 
						<table class="ce_bO" >
						  <tr>
							<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_ol"></span></b></td>
							<td class="ce_bu"></td>
							<td class="ce_bw">
								<input type="hidden" name="u_id" id="u_id" value="<%=session.getAttribute("memId")%>" />
								<input type="password" name="passwd" id="passwd" value="" class="ce_gH" />
							</td>
						  </tr>
						  <tr>
							<td class="ce_bz" colspan="3"></td>
						  </tr>
						  <tr>
							<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_ti"></span></b></td>
							<td class="ce_bu"></td>
							<td class="ce_bw">
								<input type="password" name="newPasswd" id="newPasswd" value="" class="ce_gH" />
							</td>
						  </tr>
						  <tr>
							<td class="ce_bz" colspan="3"></td>
						  </tr>
						  <tr>
							<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_tr"></span></b></td>
							<td class="ce_bu"></td>
							<td class="ce_bw">
								<input type="password" name="newPasswdCheck" id="newPasswdCheck" value="" class="ce_gH" />
							</td>
						  </tr>
						</table>
					
						<table class="ce_bO">
						  <tr><td class="ce_cY" colspan="3"></td></tr>
						</table>
								
					</td>
				  </tr>
				  <tr id="ce_tg">
					<td id="ce_tf">
						<ul style="margin:0 auto;width:170px;">
							<li class="ce_em">
								<input type="submit" id="ce_qw" value="" class="ce_eg ce_dc" style="width:66px;height:26px;" />
							</li>
							<li class="ce_em"><input type="button" id="ce_lm" value="" class="ce_eg ce_dc" style="width:66px;height:26px;"></li>
						</ul>
					</td>
				  </tr>
				</table>
				</form>
		
		</td>
	  </tr>
	</table>

</div>

<%@include file = "../include/bottom.html"%>

</body>
<script>
var webPageKind = '<%=session.getAttribute("webPageKind")%>'
topInit();
ce_x();
</script>

</html>

	
	

