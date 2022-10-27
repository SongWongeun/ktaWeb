if(navigator.userAgent.indexOf("Firefox") >= 0 || navigator.userAgent.indexOf("Safari") >= 0 || navigator.userAgent.indexOf("Chrome") >= 0 || navigator.userAgent.indexOf("Opera") >= 0){
	navigator.plugins.refresh(false);
	//alert("Not IE");
	if(navigator.mimeTypes["application/markany_fps_rexpert_truck_plugin/version=1,0,0,1"]){
		document.writeln("plugin installed");
	}else{
		window.location = "http://"+location.host+"/RexServer30/plugin/markany/download/Install_Page.html";
	}
}else{
	//document.writeln("<OBJECT ID='MAWS_SuHyupRex' width='0' height='0' CLASSID='CLSID:585655DD-7B38-4353-84DB-C9A5C1D310A3' CODEBASE='../bin/MAOnFPS_SuHyupRex.cab#version=4,0,9,1'></OBJECT>");
	document.writeln("<OBJECT ID='MAWS_TRUCK' width='0' height='0' CLASSID='CLSID:4102E098-7021-4AEF-925B-A66DCA08CD19' CODEBASE='http://"+location.host+"/RexServer30/plugin/markany/cab/MAOnFPS_TRUCK.cab#version=4,0,9,2'></OBJECT>");
	//alert(typeof(MAWS_TRUCK));
	//alert(MAWS_TRUCK.object);
	if((typeof(MAWS_TRUCK) == "object") && (MAWS_TRUCK.object != null)){
		document.writeln("ActiveX installed");
	}else{
		document.writeln("Install... :(");
	}
}
