<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="common.NameCheck"%>
<jsp:useBean id="NC" class="common.NameCheck" scope="request"/>
<%
//안심체크V1

String SITECODE = "R304"; //나신평에서 발급받은 아이디로 수정해주세요
String SITEPW = "77305237"; 	  //나신평에서 발급받은 패스워드로 수정해주세요

//nc.jsp 에서 셋팅한 세션값을 확인한다. 
HttpSession s = request.getSession(true);
if(!s.getValue("NmChkSec").equals("98u9iuhuyg87"))
{
	// 인증이 안되는 경우 필요하신 사항으로 처리해주세요.
}

//s.invalidate();

//nc.jsp 에서 파라미터로 값을 전달받는다.
String sJumin1 = request.getParameter("jumin1");	
String sJumin2 = request.getParameter("jumin2");
String sJumin = sJumin1 + sJumin2;
//String sName = request.getParameter("name");
//한글 인코딩 관련하여 넘겨주시는 이름이 깨질경우 아래를 참고해서 euc-kr 로 이름을 넘겨주세요
//String sName = new String(request.getParameter("name").getBytes("8859_1"), "KSC5601");
String sName = request.getParameter("name");
//주민번호와 이름 사이트아이디 패스워드의 값을 나신평에 넘겨주고 Rtn 에 리턴값을 받는다.

System.out.println("sJumin : " + sJumin);

if((!sJumin.equals("")) && (!sName.equals("")))
{
	String Rtn = "";
	NC.setChkName(sName);				// 
	Rtn = NC.setJumin(sJumin+SITEPW);
	
	//정상처리인 경우
	if(Rtn.equals("0")) 
	{
		NC.setSiteCode(SITECODE);
		NC.setTimeOut(30000);
		Rtn = NC.getRtn().trim(); 
	}				
	
				
				//Rtn 변수값에 따라 아래 참고하셔서 처리해주세요.(결과값의 자세한 사항은 리턴코드.txt 파일을 참고해 주세요~)
								//Rtn :	1 이면 --> 실명인증 성공 : XXX.jsp 로 페이지 이동. 
								//			2 이면 --> 실명인증 실패 : 주민과 이름이 일치하지 않음. 사용자가 직접 www.namecheck.co.kr 로 접속하여 등록 or 1600-1522 콜센터로 접수요청.
								//									아래와 같이 나신평에서 제공한 자바스크립트 이용하셔도 됩니다.		
								//									정상적으로 등록된 사용자임에도 오류가 나오면 한글깨짐을 확인해 주세요. 
								//									한글은 euc-kr로 넘겨주셔야 합니다.
								//			3 이면 --> 나신평 해당자료 없음 : 사용자가 직접 www.namecheck.co.kr 로 접속하여 등록 or 1600-1522 콜센터로 접수요청.
								//									아래와 같이 나신평에서 제공한 자바스크립트 이용하셔도 됩니다.
								//			5 이면 --> 체크썸오류(주민번호생성규칙에 어긋난 경우: 임의로 생성한 값입니다.)e
								//			50이면 --> 크레딧뱅크의 명의도용차단 서비스 가입자임 : 직접 명의도용차단 해제 후 실명인증 재시도.
								//								아래와 같이 나신평에서 제공한 자바스크립트 이용하셔도 됩니다.
								//			그밖에 --> 30번대, 60번대 : 통신오류 ip: 203.234.219.72 port: 81~85(5개) 방화벽 관련 오픈등록해준다. 
								//								(결과값의 자세한 사항은 리턴코드.txt 파일을 참고해 주세요~) 
	    out.println(Rtn);
				
        if (Rtn.equals("1")){
        out.println(Rtn);
%>
			<script language='javascript'>     
      	alert("인증성공!! ^^");          
      </script>

			<!--페이지 처리를 하실때에는 아래와같이 처리하셔도 됩니다. 이동할 페이지로 수정해서 사용하시면 됩니다. 
			<html>
				<head>
				</head>
				<body onLoad="document.form1.submit()">
					<form name="form1" method="post" action=XXX.jsp>
						<input type="hidden" name="jumin1" value="<%=sJumin1%>">
						<input type="hidden" name="jumin2" value="<%=sJumin2%>">
						<input type="hidden" name="name" value="<%=sName%>">
					</form>
				</body>
			</html>
			
			-->			
<%
		}else if (Rtn.equals("2")){
		//리턴값 2인 사용자의 경우, www.namecheck.co.kr 의 실명등록확인 또는 02-1600-1522 콜센터로 문의주시기 바랍니다.		
%>
            <script language="javascript">
               //var URL ="http://www.creditbank.co.kr/its/its.cb?m=namecheckMismatch";
               var URL ="http://111";
               var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width= 640, height= 480, top=0,left=20"; 
               window.open(URL,"",status); 
               //history.go(-1); 
            </script> 

<%
		}else if (Rtn.equals("3")){
		//리턴값 3인 사용자의 경우, www.namecheck.co.kr 의 실명등록확인 또는 02-1600-1522 콜센터로 문의주시기 바랍니다.   			
%>
            <script language="javascript">
               //var URL ="http://www.creditbank.co.kr/its/its.cb?m=namecheckMismatch";
               var URL ="http://222";
               var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width= 640, height= 480, top=0,left=20"; 
               window.open(URL,"",status); 
               history.go(-1); 
            </script> 
<%
		}else if (Rtn.equals("50")){
		//리턴값 50 명의도용차단 서비스 가입자의 경우, www.creditbank.co.kr 에서 명의도용차단해제 후 재시도 해주시면 됩니다. 
		// 또는 02-1600-1533 콜센터로문의주세요.  	
			
%>	
            <script language="javascript">
               //var URL ="http://www.creditbank.co.kr/its/itsProtect.cb?m=namecheckProtected";
               var URL ="http://333";
               var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width= 640, height= 480, top=0,left=20"; 
               window.open(URL,"",status); 
               history.go(-1); 
            </script> 

<%
		}else{
		//인증에 실패한 경우는 리턴코드.txt 를 참고하여 리턴값을 확인해 주세요~	
%>
			<script language='javascript'>
				alert("인증에 실패 하였습니다.리턴코드:[<%=Rtn%>]");
				history.go(-1);
			</script>			
<%
		}
}else{
	out.println("성명이나 주민번호를 확인하세요.");
}
%>
            <%=new String(request.getParameter("name").getBytes("8859_1"), "KSC5601") %>
            <%=new String(request.getParameter("name").getBytes("8859_1"), "UTF-8") %>
            <%=new String(request.getParameter("name").getBytes("KSC5601"), "UTF-8") %>
            <%=new String(request.getParameter("name").getBytes("UTF-8"), "KSC5601") %>