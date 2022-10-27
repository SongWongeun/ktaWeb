if (navigator.userAgent.toLowerCase().indexOf("msie") > -1) {
	document.write("<OBJECT ID='MAWS_CUSTRP' width='5' height='5' CLASSID='CLSID:4102E098-7021-4AEF-925B-A66DCA08CD19' CODEBASE='/exploded/RexServer30/plugin/markany/cab/MAOnFPS_CUSTRP.cab#version=4,0,9,2'></OBJECT>");
} else {
	navigator.plugins.refresh(false);
	if(!navigator.mimeTypes["application/markany_fps_rp_plugin/version=1,0,0,1"]) {
		window.location = "/exploded/RexServer30/plugin/markany/download/Install_Page.html";
	} else {
		
	}
}
