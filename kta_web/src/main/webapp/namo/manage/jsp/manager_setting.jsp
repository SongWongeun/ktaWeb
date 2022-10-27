<%@page contentType="text/html;charset=utf-8" %>
<%@include file = "manager_util.jsp"%>
<%@include file = "./include/session_check.jsp"%>
<%
	String fileRealFolder = "";
	String ContextPath = request.getContextPath();
	String urlPath = rootFolderPath(request.getRequestURI());
	urlPath = urlPath.substring(0, urlPath.indexOf("manage/jsp"));

	ServletContext context = getServletConfig().getServletContext();
	fileRealFolder = context.getRealPath(urlPath);

	//2013.08.26 [2.0.5.23] mwhong tomcat8.0 에서 getRealPath가 null을 리턴하여 수정
	if(fileRealFolder == null && urlPath != null && ContextPath != null){
		fileRealFolder = context.getRealPath(urlPath.substring(ContextPath.length()));
	}

	if (!ContextPath.equals("") && !ContextPath.equals("/")){
		File tempFileRealDIR = new File(fileRealFolder);
		if(!tempFileRealDIR.exists()){
			if (urlPath.indexOf(ContextPath) != -1){
				String rename_image_temp = urlPath.substring(ContextPath.length());
				fileRealFolder = context.getRealPath(rename_image_temp);
			}
		}
	}

	if (fileRealFolder.lastIndexOf(File.separator) != fileRealFolder.length() - 1){
		fileRealFolder = fileRealFolder + File.separator;
	}

	String url = xmlUrl(fileRealFolder);
	Element root = configXMlLoad(url);
	Hashtable settingValue = childValueList(root);

	String encodingStyleValue = "";
	String EncodingValue = "";

	if (settingValue.get("UploadFileNameType") != null){
		String FileNameType = (String)settingValue.get("UploadFileNameType");
	
		if (FileNameType != ""){
			if(FileNameType.indexOf(",")!= -1){
				String FileNameTypeArr[] = FileNameType.split(",");
				encodingStyleValue = FileNameTypeArr[0];
				if(FileNameTypeArr.length > 1) EncodingValue = FileNameTypeArr[1];
			}
			else{
				encodingStyleValue = FileNameType;
			}
		}
	}

	String userAddMenuList = "";
	
	if(settingValue.get("AddMenuCheck").equals("true")){
		if(settingValue.get("AddMenu") != ""){
			List addMenuListValue = (List)settingValue.get("AddMenu");
			for(int i=0; i<addMenuListValue.size(); i++){
				if(userAddMenuList.equals("")) userAddMenuList = (String)addMenuListValue.get(i);
				else userAddMenuList += "||" + (String)addMenuListValue.get(i);
			}
		}
	}
	
	if (settingValue.get("AccessibilityOption") == null  || settingValue.get("AccessibilityOption") == "" ) settingValue.put("AccessibilityOption", "0");
	if (settingValue.get("UploadFileSubDir") == null || settingValue.get("UploadFileSubDir") == "") settingValue.put("UploadFileSubDir", "true");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>Namo CrossEditor : Admin</title>
	<script type="text/javascript"> var ce_jr = "ce_qk"; </script>
	<script type="text/javascript" src="../manage_common.js"></script>
	<script type="text/javascript" language="javascript" src="../../js/namo_cengine.js"></script>
	<script type="text/javascript" language="javascript" src="../manager.js"></script>
	<link type="text/css" rel="stylesheet" href="../../css/namose_general.css" />
	<link type="text/css" rel="stylesheet" href="../css/common.css" />
</head>

<body>

<%@include file = "../include/top.html"%>

<form method="post" id="adminSetForm" name="adminSetForm" action="manager_proc.jsp" onsubmit="return ce_t();">
<div id="ce_Nt">
	<table class="ce_iD">
		<tr>
			<td class="ce_dn">

				<table id="Info">
					<tr>
						<td style="padding:0 0 0 10px;height:30px;text-align:left">
						<font style="font-size:14pt;color:#3e77c1;font-weight:bold;text-decoration:none;"><span id="ce_pj"></span></font></td>
						<td id="InfoText"><span id="ce_lr"></span></td>
					</tr>
					<tr>
						<td colspan="2"><img id="ce_mR" src="../images/title_line.jpg" alt="" /></td>
					</tr>
				</table>

				<table class="ce_fs">
					<tr>
						<td class="ce_NJ">				
							<ul>
								<li class="ce_gg ce_tl"><input type="button" id="setting_base" value="" style="width:110px;height:28px;" class="ce_la ce_dc" /></li>
								<li class="ce_gg"><input type="button" id="setting_view" value="" style="width:110px;height:28px;" class="ce_la ce_dc" /></li>
								<li class="ce_gg"><input type="button" id="setting_ab" value="" style="width:110px;height:28px;" class="ce_la ce_dc" /></li>
							</ul>
						
						</td>
					</tr>
					<tr>
						<td class="ce_ls ce_fq"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="ce_sh"></span></font></td>
					</tr>
				</table>

			</td>
		</tr>
		
		<tr>
			<td class="ce_dn">
				<div id="ce_zX">
					<table class="ce_kW">
						<tr>
							<td>
								<table class="ce_bO"><tr><td class="ce_cY" colspan="3"></td></tr>
								</table>
							 
								<table class="ce_bO">
								
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_qg"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='WebServerOS' id='WebServerOS' class="inputSelectStyle">
												<option value=''></option>
												<option value='WINDOW' <% if(settingValue.get("WebServerOS").equals("WINDOW")) out.println("selected=\"selected\"");%>>WINDOW</option>
												<option value='LINUX' <% if(settingValue.get("WebServerOS").equals("LINUX"))out.println("selected=\"selected\"");%>>LINUX</option>
												<option value='UNIX' <% if(settingValue.get("WebServerOS").equals("UNIX")) out.println("selected=\"selected\"");%>>UNIX</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<td class = "ce_bz" colspan="3"></td>
									</tr>

									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_qB"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='WebServerInfo' id='WebServerInfo' class="inputSelectStyle">
												<option value=''></option>
												<option value='IIS' <% if(settingValue.get("WebServerInfo").equals("IIS")) out.println("selected=\"selected\"");%>>IIS</option>
												<option value='Apache' <% if(settingValue.get("WebServerInfo").equals("Apache"))out.println("selected=\"selected\"");%>>Apache</option>
												<option value='Tomcat' <% if(settingValue.get("WebServerInfo").equals("Tomcat")) out.println("selected=\"selected\"");%>>Tomcat</option>
												<option value='Resin' <% if(settingValue.get("WebServerInfo").equals("Resin")) out.println("selected=\"selected\"");%>>Resin</option>
												<option value='Jeus' <% if(settingValue.get("WebServerInfo").equals("Jeus")) out.println("selected=\"selected\"");%>>Jeus</option>
												<option value='WebLogic' <% if(settingValue.get("WebServerInfo").equals("WebLogic")) out.println("selected=\"selected\"");%>>WebLogic</option>
												<option value='WebSphere' <% if(settingValue.get("WebServerInfo").equals("WebSphere")) out.println("selected=\"selected\"");%>>WebSphere</option>
												<option value='iPlanet' <% if(settingValue.get("WebServerInfo").equals("iPlanet")) out.println("selected=\"selected\"");%>>iPlanet</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<td class = "ce_bz" colspan="3"></td>
									</tr>
									
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_qZ"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='WebLanguage' id='WebLanguage' class="inputSelectStyle">
												<option value=''></option>
												<option value='ASP' <% if(settingValue.get("WebLanguage").equals("ASP")) out.println("selected=\"selected\"");%>>ASP</option>
												<option value='JSP' <% if(settingValue.get("WebLanguage").equals("JSP")) out.println("selected=\"selected\"");%>>JSP</option>
												<option value='PHP' <% if(settingValue.get("WebLanguage").equals("PHP")) out.println("selected=\"selected\"");%>>PHP</option>
												<option value='ASP.NET' <% if(settingValue.get("WebLanguage").equals("ASP.NET")) out.println("selected=\"selected\"");%>>ASP.NET</option>
												<option value='SERVLET' <% if(settingValue.get("WebLanguage").equals("SERVLET")) out.println("selected=\"selected\"");%>>SERVLET</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<td class = "ce_bz" colspan="3"></td>
									</tr>
									
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_oR"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<input type="text" id="ImageSavePath" class="ce_ez" name="ImageSavePath" value="<%=settingValue.get("ImageSavePath")%>" /> ex) http:// www.mysite.com/image
										</td>
									</tr>
									
									<tr>
										<td class = "ce_bz" colspan="3"></td>
									</tr>

									<% if (settingValue.get("UploadFileNameType") != null){ %>
									
									<div id="ce_Ae">
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_qJ"></span></b></td>
										<td class="ce_bu"></td>
										<td >
											<table class="ce_bO">
												<tr>
													<td class="ce_bw"> &nbsp;&nbsp;
														<input type="radio" name="encodingStyle" id="ce_rI" value="real" /><span id="ce_qE"></span>
														<input type="hidden" id="UploadFileNameType" name="UploadFileNameType" value="" />
													</td>
												</tr>
												<tr>
													<td class = "ce_bz" colspan="3"></td>
												</tr>
												<tr>
													<td class="ce_bw"> &nbsp;&nbsp;
													<input type="radio" name="encodingStyle" id="ce_vg" value="trans" /><span id="ce_qR"></span>
													</td>
												</tr>
												<tr>
													<td class = "ce_bz" colspan="3"></td>
												</tr>
												<tr>
													<td class="ce_bw"> &nbsp;&nbsp;
														<input type="radio" name="encodingStyle" id="ce_vj" value="random" /><span id="ce_tu"></span>
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td class = "ce_bz" colspan="3"></td>
									</tr>
									</div>

									<% } %>

									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_tb"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw"> &nbsp;
											<input type="hidden" id="UploadFileSubDir" name ="UploadFileSubDir" value="<%=settingValue.get("UploadFileSubDir")%>" />
											<input type="radio" id="ce_nU" name="ce_vh" value="true" /><label for="ce_nU"><span id="ce_sR"></span></label>&nbsp;&nbsp;
											<input type="radio" id="ce_nV" name="ce_vh" value="false" /><label for="ce_nV"><span id="ce_te"></span></label>
										</td>
									</tr>

									<tr>
										<td class = "ce_bz" colspan="3"></td>
									</tr>

									
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_oJ"></span></b></td>
										<td class="ce_bu"></td>
										<td >
											<table class="ce_bO">
												<tr>
													<td >&nbsp;&nbsp;<span id="ce_qd"></span></td>
													<td class="ce_bu"></td>
													<td class="ce_bw"><input type="text" id="Width" name="Width" class="ce_gH" maxlength="10" value="<%=settingValue.get("Width")%>" />
													px</td>
												</tr>
												<tr>
													<td class = "ce_bz" colspan="3"></td>
												</tr>
												<tr>
													<td >&nbsp;&nbsp;<span id="ce_ph"></span></td>
													<td class="ce_bu"></td>
													<td class="ce_bw"><input type="text" id="Height" name="Height" class="ce_gH" maxlength="10" value="<%=settingValue.get("Height")%>" /> px
													</td>
												</tr>	
											</table>
										</td>
									</tr>
								</table>

								<table class="ce_bO"><tr><td class="ce_cY" colspan="3"></td></tr>
								</table>
											
							</td>
						</tr>
						<tr>
							<td class="ce_ls ce_fq"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="ce_rT"></span></font></td>
						</tr>

						<tr>
							<td>
						
								<table class="ce_bO"><tr><td class="ce_cY" colspan="3"></td></tr>
								</table>

								<table class="ce_bO">
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_sV"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='SetFocus' id='SetFocus' class="inputSelectStyle">
												<option value='true' <% if(settingValue.get("SetFocus").equals("true")) out.println("selected=\"selected\"");%>>true</option>
												<option value='false' <% if(settingValue.get("SetFocus").equals("false")) out.println("selected=\"selected\"");%>>false</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_tj"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='LineHeight' id='LineHeight' class="inputSelectStyle">
												<option value=''></option>
												<option value='100%' <% if(settingValue.get("LineHeight").equals("100%")) out.println("selected=\"selected\"");%>>100%</option>
												<option value='120%' <% if(settingValue.get("LineHeight").equals("120%")) out.println("selected=\"selected\"");%>>120%</option>
												<option value='140%' <% if(settingValue.get("LineHeight").equals("140%")) out.println("selected=\"selected\"");%>>140%</option>
												<option value='160%' <% if(settingValue.get("LineHeight").equals("160%")) out.println("selected=\"selected\"");%>>160%</option>
												<option value='180%' <% if(settingValue.get("LineHeight").equals("180%")) out.println("selected=\"selected\"");%>>180%</option>	
												<option value='200%' <% if(settingValue.get("LineHeight").equals("200%")) out.println("selected=\"selected\"");%>>200%</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_sY"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='UnloadWarning' id='UnloadWarning' class="inputSelectStyle">
												<option value='false' <% if(settingValue.get("UnloadWarning").equals("false")) out.println("selected=\"selected\"");%>>false</option>
												<option value='true' <% if(settingValue.get("UnloadWarning").equals("true")) out.println("selected=\"selected\"");%>>true</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_sW"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='SetDebug' id='SetDebug' class="inputSelectStyle">
												<option value='false' <% if(settingValue.get("SetDebug").equals("false")) out.println("selected=\"selected\"");%>>false</option>
												<option value='true' <% if(settingValue.get("SetDebug").equals("true")) out.println("selected=\"selected\"");%>>true</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_sd"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='HTMLTabByTableLock' id='HTMLTabByTableLock' class="inputSelectStyle">
												<option value='false' <% if(settingValue.get("HTMLTabByTableLock").equals("false")) out.println("selected=\"selected\"");%>>false</option>
												<option value='true' <% if(settingValue.get("HTMLTabByTableLock").equals("true")) out.println("selected=\"selected\"");%>>true</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_sf"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='HTMLTabContents' id='HTMLTabContents' class="inputSelectStyle">
												<option value='html' <% if(settingValue.get("HTMLTabContents").equals("html")) out.println("selected=\"selected\"");%>>html</option>
												<option value='body' <% if(settingValue.get("HTMLTabContents").equals("body")) out.println("selected=\"selected\"");%>>body</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_sI"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='AllowContentScript' id='AllowContentScript' class="inputSelectStyle">
												<option value='true' <% if(settingValue.get("AllowContentScript").equals("true")) out.println("selected=\"selected\"");%>>true</option>
												<option value='false' <% if(settingValue.get("AllowContentScript").equals("false")) out.println("selected=\"selected\"");%>>false</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_sE"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='AllowContentIframe' id='AllowContentIframe' class="inputSelectStyle">
												<option value='true' <% if(settingValue.get("AllowContentIframe").equals("true")) out.println("selected=\"selected\"");%>>true</option>
												<option value='false' <% if(settingValue.get("AllowContentIframe").equals("false")) out.println("selected=\"selected\"");%>>false</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_rZ"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='CharSet' id='CharSet' class="inputSelectStyle">
												<option value=''></option>
												<option value='auto' <% if(settingValue.get("CharSet").equals("auto")) out.println("selected=\"selected\"");%>></option>
												<option value='utf-8' <% if(settingValue.get("CharSet").equals("utf-8")) out.println("selected=\"selected\"");%>>utf-8</option>
												<option value='euc-kr' <% if(settingValue.get("CharSet").equals("euc-kr")) out.println("selected=\"selected\"");%>>euc-kr</option>
												<option value='ks_c_5601-1987' <% if(settingValue.get("CharSet").equals("ks_c_5601-1987")) out.println("selected=\"selected\"");%>>ks_c_5601-1987</option>
												<option value='ms949' <% if(settingValue.get("CharSet").equals("ms949")) out.println("selected=\"selected\"");%>>ms949</option>
												<option value='iso-8859-1' <% if(settingValue.get("CharSet").equals("iso-8859-1")) out.println("selected=\"selected\"");%>>iso-8859-1</option>
												<option value='iso-8859-2' <% if(settingValue.get("CharSet").equals("iso-8859-2")) out.println("selected=\"selected\"");%>>iso-8859-2</option>
												<option value='euc-jp' <% if(settingValue.get("CharSet").equals("euc-jp")) out.println("selected=\"selected\"");%>>euc-jp</option>
												<option value='shift_jis' <% if(settingValue.get("CharSet").equals("shift_jis")) out.println("selected=\"selected\"");%>>shift_jis</option>
												<option value='gb2312' <% if(settingValue.get("CharSet").equals("gb2312")) out.println("selected=\"selected\"");%>>gb2312</option>
												<option value='gbk' <% if(settingValue.get("CharSet").equals("gbk")) out.println("selected=\"selected\"");%>>gbk</option>
												<option value='big5' <% if(settingValue.get("CharSet").equals("big5")) out.println("selected=\"selected\"");%>>big5</option>
												<option value='big5-hkscs' <% if(settingValue.get("CharSet").equals("big5-hkscs")) out.println("selected=\"selected\"");%>>big5-hkscs</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_pf"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<input type="text" id="DocBaseURL" name="DocBaseURL" class="ce_ez" value="<%=settingValue.get("DocBaseURL")%>" /> ex) http://www.mysite.com/doc.html 
										</td>
									</tr>
								</table>

								<table class="ce_bO"><tr><td class="ce_cY" colspan="3"></td></tr>
								</table>
						
							</td>
						</tr>
					</table>
				</div>	
				
			</td>
		</tr>
		<tr>
			<td class="ce_dn">
				<div id="ce_Bj">
					<table class="ce_kW">
						<tr>
							<td>
								<table class="ce_bO"><tr><td class="ce_cY" colspan="3"></td></tr>
								</table>
								 
								<table class="ce_bO">
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_sN"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<% out.println(skinDirectory(fileRealFolder, (String)settingValue.get("Skin"))); %>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_pm"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<input type="text" id="Css" name="Css" class="ce_ez" value="<%=settingValue.get("Css")%>" />  ex) http://www.mysite.com/common.css 
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_uJ"></span></b>
											<input type="hidden" id="UserSkinColor" name="UserSkinColor" value="<%=settingValue.get("UserSkinColor")%>" />
										</td>
											
										<td class="ce_bu"></td>
										<td >
											<table class="ce_bO">
												<tr>
													<td class="ce_il">&nbsp;&nbsp;<span id="ce_ts"></span></td>
													<td class="ce_bu"></td>
													<td class="ce_bw">
														<input type="text" id="outlinecolor" name="outlinecolor" class="ce_io" value="" />  ex) #000000 or black 
													</td>
												</tr>
												<tr>
													<td class="ce_bz" colspan="3"></td>
												</tr>
												<tr>
													<td class="ce_il">&nbsp;&nbsp;<span id="ce_tp"></span></td>
													<td class="ce_bu"></td>
													<td class="ce_bw">
														<input type="text" id="innerlineColor" name="innerlineColor" class="ce_io" value="" />
													</td>
												</tr>
												<tr>
													<td class="ce_bz" colspan="3"></td>
												</tr>
												<tr>
													<td class="ce_il">&nbsp;&nbsp;<span id="ce_sk"></span></td>
													<td class="ce_bu"></td>
													<td class="ce_bw">
														<input type="text" id="ce_hs" name="ce_hs" class="ce_io" value="" />
													</td>
												</tr>
												<tr>
													<td class="ce_bz" colspan="3"></td>
												</tr>
												<tr>
													<td class="ce_il">&nbsp;&nbsp;<span id="ce_sJ"></span></td>
													<td class="ce_bu"></td>
													<td class="ce_bw">
														<input type="text" id="toolbarBackgroundColor" name="toolbarBackgroundColor" class="ce_io" value="" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_sb"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<input type="hidden" id="CreateTab" name ="CreateTab" value="<%=settingValue.get("CreateTab")%>" />
											<input type="checkbox" id="ce_nm" name="ce_iF" value="0" /><label for="ce_nm"><span id="wysiwyg"></span></label>&nbsp;&nbsp;
											<input type="checkbox" id="ce_ni" name="ce_iF" value="1" /><label for="ce_ni"><span id="html"></span></label>&nbsp;&nbsp;
											<input type="checkbox" id="ce_nz" name="ce_iF" value="2" /><label for="ce_nz"><span id="preview"></span></label>
										</td>
									</tr>
								</table>
									
								<table class="ce_bO"><tr><td class="ce_cY" colspan="3"></td></tr>
								</table>
							</td>
						</tr>

						<tr>
							<td class="ce_ls ce_fq"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="ce_sL"></span></font></td>
						</tr>
						<tr>
							<td>
								<table class="ce_bO"><tr><td class="ce_cY" colspan="3"></td></tr>
								</table>
									
								<table class="ce_bO">
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_un"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<select name='UserToolbar' id='UserToolbar' class="inputSelectStyle">
												<option value='false' <% if(settingValue.get("UserToolbar").equals("false")) out.println("selected=\"selected\"");%>>false</option>
												<option value='true' <% if(settingValue.get("UserToolbar").equals("true")) out.println("selected=\"selected\"");%>>true</option>
											</select>
											<input type="hidden" id="CreateToolbar" name="CreateToolbar" value="<%=settingValue.get("CreateToolbar")%>" >
											<input type="hidden" id="Name" name="Name" value="<%=settingValue.get("Name")%>">
											<input type="hidden" id="Logo" name="Logo" value="<%=settingValue.get("Logo")%>">
											<input type="hidden" id="Help" name="Help" value="<%=settingValue.get("Help")%>">
											<input type="hidden" id="Info" name="Info" value="<%=settingValue.get("Info")%>">
											<input type="hidden" id="UserAddMenu" name="UserAddMenu" value="<%=userAddMenuList%>" />
											<input type="hidden" id="AddMenuCheck" name="AddMenuCheck" value="<%=settingValue.get("AddMenuCheck")%>" />
											<input type="hidden" id="Tab" name="Tab" value="" />
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
										
								</table>	
							</td>		
						</tr>			
					</table>

					<div id="ce_rN">
						<table class="ce_fs">
							<tr>
								<td>
									<table class="ce_bO">
										<tr>
											<td class="ce_bz" colspan="5"></td>
										</tr>
										<tr>
											<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_th"></span></b></td>
											<td class="ce_bu"></td>
											<td>
												<table class="ce_bO">
													<tr>
														<td class="ce_iN" >&nbsp;&nbsp;<span id="ce_sg"></span></td>
														<td class="ce_bu"></td>
														<td class="ce_bw">
															<input type="text" id="AdminPageUserMenuIdInput" name="AdminPageUserMenuIdInput" class="ce_ez" value="" /> 
														</td>
													</tr>
													<tr>
														<td class="ce_bz" colspan="3"></td>
													</tr>
													<tr>
														<td class="ce_iN">&nbsp;&nbsp;<span id="ce_sx"></span></td>
														<td class="ce_bu"></td>
														<td class="ce_bw">
															<input type="radio" name="AdminPageUserMenuPlayKindRadio" id="ce_rg" value="function" /><label for="ce_rg"><span id="ce_tm"></span></label>&nbsp;&nbsp;<input type="radio" name="AdminPageUserMenuPlayKindRadio" id="ce_qH" value="plugin" /><label for="ce_qH"><span id="ce_st"></span></label>
														</td>
													</tr>
													<tr>
														<td class="ce_bz" colspan="3"></td>
													</tr>
													<tr>
														<td class="ce_iN">&nbsp;&nbsp;<span id="ce_tk"></span></td>
														<td class="ce_bu"></td>
														<td class="ce_bw" height="50px">
															<input type="text" id="AdminPageUserMenuButtonImgPathInput" name="AdminPageUserMenuButtonImgPathInput" class="ce_ez" value="" />
															<br/>ex) http://www.mysite.com/image/MenuIcon.jpg
														</td>
													</tr>
													<tr>
														<td class="ce_bz" colspan="3"></td>
													</tr>
													<tr>
														<td class="ce_iN">&nbsp;&nbsp;<span id="ce_uL"></span></td>
														<td class="ce_bu"></td>
														<td class="ce_bw">	
															<input type="text" id="AdminPageUserMenuTitleInput" name="AdminPageUserMenuTitleInput" class="ce_ez" value="" />
														</td>
													</tr>
												</table>
											</td>
											<td class="ce_bu"></td>
											<td style="text-align:center;vertical-align:middle;"><input type="button" id="ce_oE" value="" class="" style="width:60px;height:60px;"/>
											</td>
										</tr>
										<tr>
											<td class="ce_bz" colspan="5"></td>
										</tr>
										<tr>
											<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_uK"></span></b></td>
											<td class="ce_bu"></td>
											<td class="ce_bw" colspan="2">
												<div id="ce_JD">&nbsp;</div>
											</td>
										</tr>
										<tr>
											<td class="ce_bz" colspan="5"></td>
										</tr>
									</table>	
								</td>		
							</tr>
						</table>
					</div>
		
					<div id = "ce_bO">
						
						<table class="ce_fs">	
							<tr>
								<td id="ce_uf" class="ce_fq">
									
									<table>
										<tr>
											<td id="ce_On">
												<span id="ce_sz"></span>: <br>
												<div id="ce_Bb" >
													<span id="ce_kU"></span> <br> 
													<span id="ce_qL"></span><br>
													<span id="ce_qT"></span><br>
												</div>
											</td>
											<td id="ce_Kj">
											<span id="ce_tt"></span>:<br>
												<div id="ce_wX" ></div>
											</td> 
											<td valign="bottom">
												<ul style="margin:0 auto;width:340px;">
													<li class="ce_em">
														<input type="button" id="spacebar" value="" class="ce_eg ce_dc" style="width:80px;height:26px;" />
													</li>
													<li class="ce_em"><input type="button" id="space" value="" class="ce_eg ce_dc" style="width:68px;height:26px;"></li>
													<li class="ce_em"><input type="button" id="enter" value="" class="ce_eg ce_dc" style="width:66px;height:26px;"></li>
												</ul>
											</td>
										</tr>
									</table>
									
								</td>
							</tr>
							<tr>
								<td>
									<table class="ce_bO">
										<tr><td class="ce_cY" colspan="3"></td></tr>
									</table>
								</td>
							</tr>
						</table>	
				
						<table id="ce_UO" class="ce_fs">
							
							<tr>
								<td id="ce_uf" class="ce_fq">
									<span id="preview"></span>:<br>
									<div id="ce_IW"></div>
									<br />
									<span id="ce_sa"></span>
								</td>
							</tr>
						</table>
									
					</div>
				</div>	

			</td>
		</tr>
		<tr>
			<td class="ce_dn">
				<div id="ce_zV">
					<table class="ce_kW">
						<tr>
							<td>
								<table class="ce_bO"><tr><td class="ce_cY" colspan="3"></td></tr>
								</table>
								 
								<table class="ce_bO">
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_rX"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<input type="text" id="DocTitle" name="DocTitle" class="ce_ez" value="<%=settingValue.get("DocTitle")%>" />
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
									<tr>
										<td class="ce_bF">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="ce_su"></span></b></td>
										<td class="ce_bu"></td>
										<td class="ce_bw">
											<input type="hidden" id="AccessibilityOption" name ="AccessibilityOption" value="<%=settingValue.get("AccessibilityOption")%>" />
											<input type="radio" id="ce_pN" name="ce_mF" value="0" /><label for="ce_pN"><span id="ce_so"></span></label>&nbsp;&nbsp;
											<input type="radio" id="ce_pS" name="ce_mF" value="1" /><label for="ce_pS"><span id="ce_sq"></span></label>&nbsp;&nbsp;
											<input type="radio" id="ce_pT" name="ce_mF" value="2" /><label for="ce_pT"><span id="ce_sp"></span></label>
										</td>
									</tr>
									<tr>
										<td class="ce_bz" colspan="3"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
</table>

<table class="ce_iD">
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
	
</div>
</form>
<%@include file = "../include/bottom.html"%>
<script>
	var webPageKind = '<%=session.getAttribute("webPageKind")%>';
	var encodingStyleChecked = '<%=encodingStyleValue%>';
	topInit();
	managerInit('<% if(request.getParameter("Tab") != null) out.print(request.getParameter("Tab"));%>');
</script>

</body> 
</html>