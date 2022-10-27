<%@page contentType="text/html;charset=utf-8" %>
<%@include file = "./include/session_check.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Namo CrossEditor : Admin</title>
	<script type="text/javascript"> var ce_zn = "True"; var ce_jr = "ce_oa"; </script>
	<script type="text/javascript" src="../manage_common.js"></script>
	<script type="text/javascript" src="../../js/namo_scripteditor.js"></script>
	<script type="text/javascript" src="../manager.js"></script>
	<link href="../css/common.css" rel="stylesheet" type="text/css" />
</head>


<body>

<%@include file = "../include/top.html"%>

<div id="preview" class="ce_dn">
	<table class="ce_iD">
	  <tr>
		<td class="ce_dn">
		
			<table id="Info">
				<tr>
					<td style="padding:0 0 0 10px;height:30px;text-align:left">
					<font style="font-size:14pt;color:#3e77c1;font-weight:bold;text-decoration:none;"><span id="ce_Ew">&nbsp;</span></font></td>
					<td id="InfoText">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2"><img id="ce_mR" src="../images/title_line.jpg" alt="" /></td>
				</tr>
			</table>
		
		</td>
	  </tr>
	  <tr>
		<td class="ce_dn">
			
			<table class="ce_fs">
			 <tr>
				<td class="ce_fq">
					<script>
						var CrossEditor = new NamoSE('namoeditor1');
						CrossEditor.params.ManageMode = true;
						CrossEditor.params.UserLang = "auto";
						CrossEditor.params.Width = "100%";
						if (ce_fB != "") CrossEditor.params.UserDomain = ce_fB;
						CrossEditor.editorStart();
					</script>
				</td>
			  </tr>
			  <tr>
				<td id="ce_KG" style="height:20px"></td>
			  </tr>
			</table>
			
		</td>
	  </tr>
	</table>
</div>

<%@include file = "../include/bottom.html"%>
<script>
	var webPageKind = '<%=session.getAttribute("webPageKind")%>'
	topInit();
</script>

</body>
</html>
