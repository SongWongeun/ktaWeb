<%@page import="com.clipsoft.clipreport.oof.OOFFile"%>
<%@page import="com.clipsoft.clipreport.oof.OOFDocument"%>
<%@page import="java.io.File"%>
<%@page import="com.clipsoft.clipreport.server.service.ReportUtil"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String crfData ="<gubun><rpt1><rexdataset><rexrow> <agent_no><![CDATA[2002030133]]></agent_no> <yyyymmdd><![CDATA[2016년 11월 21일]]></yyyymmdd> <agent_nm><![CDATA[(주)오션로직스]]></agent_nm> <addr1><![CDATA[부산광역시 동구 범일로 3]]></addr1> <addr2><![CDATA[(범일동)]]></addr2> <zip><![CDATA[601-805]]></zip> <acnt_cmt1><![CDATA[부산지부]]></acnt_cmt1> <acnt_no1><![CDATA[027-01-014166-5     ]]></acnt_no1> <bank_nm1><![CDATA[부산(수정동(지))              ]]></bank_nm1> <acnt_cmt2><![CDATA[ ]]></acnt_cmt2> <acnt_no2><![CDATA[ ]]></acnt_no2> <bank_nm2><![CDATA[ ]]></bank_nm2> <acnt_cmt3><![CDATA[ ]]></acnt_cmt3> <acnt_no3><![CDATA[ ]]></acnt_no3> <bank_nm3><![CDATA[ ]]></bank_nm3> <acnt_cmt4><![CDATA[ ]]></acnt_cmt4> <acnt_no4><![CDATA[ ]]></acnt_no4> <bank_nm4><![CDATA[ ]]></bank_nm4> <acnt_cmt5><![CDATA[ ]]></acnt_cmt5> <acnt_no5><![CDATA[ ]]></acnt_no5> <bank_nm5><![CDATA[ ]]></bank_nm5> <acnt_cmt6><![CDATA[ ]]></acnt_cmt6> <acnt_no6><![CDATA[ ]]></acnt_no6> <bank_nm6><![CDATA[ ]]></bank_nm6> <acnt_cmt7><![CDATA[ ]]></acnt_cmt7> <acnt_no7><![CDATA[ ]]></acnt_no7> <bank_nm7><![CDATA[ ]]></bank_nm7> <acnt_cmt8><![CDATA[ ]]></acnt_cmt8> <acnt_no8><![CDATA[ ]]></acnt_no8> <bank_nm8><![CDATA[ ]]></bank_nm8> <damdang_nm><![CDATA[최신형]]></damdang_nm> <chuljang_nm><![CDATA[부산지부]]></chuljang_nm> <damdang_tel><![CDATA[051-464-3901]]></damdang_tel> <damdang_fax><![CDATA[051-468-0648]]></damdang_fax> <send_date><![CDATA[2016년 11월 21일]]></send_date> </rexrow></rexdataset></rpt1><rpt5><rexdataset><rexrow>  <row> <no><![CDATA[1]]></no> <car_no><![CDATA[부산99사2409]]></car_no> <car_kind><![CDATA[1종]]></car_kind> <gyeyak_dae1_symd><![CDATA[    .  .  ]]></gyeyak_dae1_symd> <gyeyak_dae1_eymd><![CDATA[    .  .  ]]></gyeyak_dae1_eymd> <napip_dae1_cnt><![CDATA[ ]]></napip_dae1_cnt> <napip_yakjung_dae1_ymd><![CDATA[    .  .  ]]></napip_yakjung_dae1_ymd> <bunnap_dae1_amt><![CDATA[ ]]></bunnap_dae1_amt> <napip_limit_dae1_ymd><![CDATA[    .  .  ]]></napip_limit_dae1_ymd> <gyeyak_ilban_symd><![CDATA[2016.09.18]]></gyeyak_ilban_symd> <gyeyak_ilban_eymd><![CDATA[2017.09.18]]></gyeyak_ilban_eymd> <napip_ilban_cnt><![CDATA[2]]></napip_ilban_cnt> <napip_yakjung_ilban_ymd><![CDATA[2016.11.18]]></napip_yakjung_ilban_ymd> <bunnap_dae2_amt><![CDATA[74,180]]></bunnap_dae2_amt> <bunnap_daemul_amt><![CDATA[249,880]]></bunnap_daemul_amt> <bunnap_cha_amt><![CDATA[ ]]></bunnap_cha_amt> <napip_limit_ilban_ymd><![CDATA[2016.12.02]]></napip_limit_ilban_ymd> <gyeyak_jaehae_symd><![CDATA[    .  .  ]]></gyeyak_jaehae_symd> <gyeyak_jaehae_eymd><![CDATA[    .  .  ]]></gyeyak_jaehae_eymd> <napip_jaehae_cnt><![CDATA[ ]]></napip_jaehae_cnt> <napip_yakjung_jaehae_ymd><![CDATA[    .  .  ]]></napip_yakjung_jaehae_ymd> <bunnap_jaehae_amt><![CDATA[ ]]></bunnap_jaehae_amt> <napip_limit_jaehae_ymd><![CDATA[    .  .  ]]></napip_limit_jaehae_ymd> <gyeyak_jukjaemul_symd><![CDATA[    .  .  ]]></gyeyak_jukjaemul_symd> <gyeyak_jukjaemul_eymd><![CDATA[    .  .  ]]></gyeyak_jukjaemul_eymd> <napip_jukjaemul_cnt><![CDATA[ ]]></napip_jukjaemul_cnt> <napip_yakjung_jukjaemul_ymd><![CDATA[    .  .  ]]></napip_yakjung_jukjaemul_ymd> <bunnap_jukjaemul_amt><![CDATA[ ]]></bunnap_jukjaemul_amt> <napip_limit_jukjaemul_ymd><![CDATA[    .  .  ]]></napip_limit_jukjaemul_ymd> <sum_amt><![CDATA[324,060]]></sum_amt> </row> <row> <no><![CDATA[2]]></no> <car_no><![CDATA[부산99사2710]]></car_no> <car_kind><![CDATA[1종]]></car_kind> <gyeyak_dae1_symd><![CDATA[    .  .  ]]></gyeyak_dae1_symd> <gyeyak_dae1_eymd><![CDATA[    .  .  ]]></gyeyak_dae1_eymd> <napip_dae1_cnt><![CDATA[ ]]></napip_dae1_cnt> <napip_yakjung_dae1_ymd><![CDATA[    .  .  ]]></napip_yakjung_dae1_ymd> <bunnap_dae1_amt><![CDATA[ ]]></bunnap_dae1_amt> <napip_limit_dae1_ymd><![CDATA[    .  .  ]]></napip_limit_dae1_ymd> <gyeyak_ilban_symd><![CDATA[2016.01.18]]></gyeyak_ilban_symd> <gyeyak_ilban_eymd><![CDATA[2017.01.18]]></gyeyak_ilban_eymd> <napip_ilban_cnt><![CDATA[6]]></napip_ilban_cnt> <napip_yakjung_ilban_ymd><![CDATA[2016.11.18]]></napip_yakjung_ilban_ymd> <bunnap_dae2_amt><![CDATA[45,340]]></bunnap_dae2_amt> <bunnap_daemul_amt><![CDATA[151,640]]></bunnap_daemul_amt> <bunnap_cha_amt><![CDATA[ ]]></bunnap_cha_amt> <napip_limit_ilban_ymd><![CDATA[2016.12.02]]></napip_limit_ilban_ymd> <gyeyak_jaehae_symd><![CDATA[    .  .  ]]></gyeyak_jaehae_symd> <gyeyak_jaehae_eymd><![CDATA[    .  .  ]]></gyeyak_jaehae_eymd> <napip_jaehae_cnt><![CDATA[ ]]></napip_jaehae_cnt> <napip_yakjung_jaehae_ymd><![CDATA[    .  .  ]]></napip_yakjung_jaehae_ymd> <bunnap_jaehae_amt><![CDATA[ ]]></bunnap_jaehae_amt> <napip_limit_jaehae_ymd><![CDATA[    .  .  ]]></napip_limit_jaehae_ymd> <gyeyak_jukjaemul_symd><![CDATA[    .  .  ]]></gyeyak_jukjaemul_symd> <gyeyak_jukjaemul_eymd><![CDATA[    .  .  ]]></gyeyak_jukjaemul_eymd> <napip_jukjaemul_cnt><![CDATA[ ]]></napip_jukjaemul_cnt> <napip_yakjung_jukjaemul_ymd><![CDATA[    .  .  ]]></napip_yakjung_jukjaemul_ymd> <bunnap_jukjaemul_amt><![CDATA[ ]]></bunnap_jukjaemul_amt> <napip_limit_jukjaemul_ymd><![CDATA[    .  .  ]]></napip_limit_jukjaemul_ymd> <sum_amt><![CDATA[196,980]]></sum_amt> </row> <agent_nm><![CDATA[(주)오션로직스]]></agent_nm> <dae1TotalAmt><![CDATA[ ]]></dae1TotalAmt> <dae2TotalAmt><![CDATA[119,520]]></dae2TotalAmt> <daemulTotalAmt><![CDATA[401,520]]></daemulTotalAmt> <chaTotalAmt><![CDATA[ ]]></chaTotalAmt> <jaehaeTotalAmt><![CDATA[ ]]></jaehaeTotalAmt> <jukjaemulTotalAmt><![CDATA[ ]]></jukjaemulTotalAmt> <ilbanTotalAmt><![CDATA[521,040]]></ilbanTotalAmt> <totalAmt><![CDATA[521,040]]></totalAmt> <cancelGijunYMD><![CDATA[2016년 11월 16일 - 2016년 11월 20일]]></cancelGijunYMD> </rexrow></rexdataset></rpt5> </gubun>"; 

OOFDocument oof = OOFDocument.newOOF();
OOFFile file = oof.addFile("crf.root", "%root%/crf/truck/tongham1.crf");

OOFConnectionMemo c = oof.addConnectionMemo("*",crfData);
c.addContentParamXML("*", "euc-kr", "{%dataset.xml.root%");


%><%@include file="Property.jsp"%><%
//세션을 활용하여 리포트키들을 관리하지 않는 옵션
//request.getSession().setAttribute("ClipReport-SessionList-Allow", false);
String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);
//oof 문서가 xml 일 경우 (oof.toString())
//String resultKey =  ReportUtil.createReport(request, oof.toString(), "false", "false", "localhost", propertyPath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="./css/clipreport.css">
<link rel="stylesheet" type="text/css" href="./css/UserConfig.css">
<link rel="stylesheet" type="text/css" href="./css/font.css">
<script type='text/javascript' src='./js/jquery-1.11.1.js'></script>
<script type='text/javascript' src='./js/clipreport.js'></script>
<script type='text/javascript' src='./js/UserConfig.js'></script>
<script type='text/javascript'>
var urlPath = document.location.protocol + "//" + document.location.host;
	
function html2xml(divPath){	
    var reportkey = "<%=resultKey%>";
	var report = createImportJSPReport(urlPath + "/ClipReport4/Clip.jsp", reportkey, document.getElementById(divPath));
    //실행
    //report.setSlidePage(true);
    report.view();
}
</script>
</head>
<body onload="html2xml('targetDiv1')">
<div id='targetDiv1' style='position:absolute;top:5px;left:5px;right:5px;bottom:5px;'></div>
</body>
</html>
