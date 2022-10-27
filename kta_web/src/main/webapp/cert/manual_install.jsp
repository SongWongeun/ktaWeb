<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>인증서관리프로그램 설치</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
setInterval('c();',1000);
function c(){
	if (CC_Object_id.object != null) {
		location="/login.do" ;
	}
}
</script>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">


<p align="center">&nbsp;
<div align="center">
  <table border cellspacing="0" width="406" height="386">
    <tr>
        <td width="964">
      
        	
          <table width="551" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    
                  <td width="10%"><img src="CCimages/cs_01.jpg" width="50" height="136" border="0"></td>
                    
                  <td width="79%"><img src="CCimages/cs_02.jpg" width="443" height="136" border="0"></td>
                    
                  <td width="11%"><img src="CCimages/cs_03.jpg" width="58" height="136" border="0"></td>
                  </tr>
                  <tr>
                    
                  <td width="10%"><img src="CCimages/cs_04.jpg" width="50" height="11" border="0"></td>
                    
                  <td width="79%"><img src="CCimages/load.gif" width="443" height="11" border="0" align="middle"></td>
                    
                  <td width="11%"><img src="CCimages/cs_05.jpg" width="58" height="11" border="0"></td>
                  </tr>
                  <tr>
                    
                  <td width="10%"><img src="CCimages/cs_06.jpg" width="50" height="19" border="0"></td>
                    
                  <td width="79%"><img src="CCimages/cs_07.jpg" width="443" height="19" border="0"></td>
                    
                  <td width="11%"><img src="CCimages/cs_08.jpg" width="58" height="19" border="0"></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  
                <tr>
                    
                  <td align="center">
                      
                    <br>
                    <table width="80%" border="0" cellspacing="0" cellpadding="0">
                        
                      <tr>
                        <td width="7%" align="center"><img src="CCimages/cs_dot01.gif" width="11" height="11" border="0"></td>
                        <td width="93%" height="20"><font size="2" color="#333333">인증서 관리프로그램이 설치되지 않았습니다. </font></td>
                      </tr>
                                                   
                      <tr>
                        <td width="7%" align="center"><img src="CCimages/cs_dot01.gif" width="11" height="11" border="0"></td>
                        <td width="93%" height="20"><font color="#333333" size="2">인증서 발급/관리를 위해서는 반드시 프로그램 설치가 필요합니다.</font></td>
                      </tr>
                        
		      <tr>
                        <td width="7%" align="center"><img src="CCimages/cs_dot01.gif" width="11" height="11" border="0"></td>
                        <td width="93%" height="20"><font color="#FF6633" size="2">"수동프로그램설치 다운로드"를 클릭하셔서 실행시키십시오.</font></td>
                      </tr>
                        
                      <tr>
                        <td width="7%" align="center">&nbsp;</td>
                        <td width="93%" height="20" align="center"><br>
                            <a href="install.exe"><img src="CCimages/cs_download.gif" width="196" height="21" border="0"></a> </td>
                      </tr>

                      <tr>
                      <td height="50"></td>
                      <td>&nbsp;</td>
                      </tr>
                      
                    </table>
                    <br>
                      <br>
                    <br>
                    
                  </td>
                </tr>
                
              </table>
              </td>
            </tr>
            <tr>
              
            <td>&nbsp;</td>
            </tr>
          </table>
          
   
      </td>
    </tr>
</table></div>
	<object id="CC_Object_id"
      classid="CLSID:A099920B-630C-426B-91EC-737685CEEE17"
	  codebase="/cert/AxCrossCert.cab#Version=2,6,4,0"
      width= Document.body.clientWidth
      height= Document.body.clientHeight>
	</object>
</body>
</html>
