<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.clipsoft.clipreport.server.service.admin.serviceconfig.util.ParameterConverter" %>
<%
	String create = ParameterConverter.valueParameter(request.getParameter("Create"));
	String dbName = ParameterConverter.valueParameter((String) request.getAttribute("dbName"));
	String version = ParameterConverter.valueParameter((String) request.getAttribute("version"));
	String driver = ParameterConverter.valueParameter((String) request.getAttribute("driver"));
	String url = ParameterConverter.valueParameter((String) request.getAttribute("url"));
	String user = ParameterConverter.valueParameter((String) request.getAttribute("user"));
	String password = ParameterConverter.valueParameter((String) request.getAttribute("password"));
	String encoding = ParameterConverter.valueParameter((String) request.getAttribute("encoding"));
%>
<script type="text/javascript">
	function addDataConnection(form) {
		if (!form.dbName.value) {
			alert("디비이름을 입력하세요.");
			form.dbName.focus();
			return;
		}
		
		if (!form.url.value) {
			alert("URL을 입력하세요.");
			form.url.focus();
			return;
		}
		
		if (!form.user.value) {
			alert("유저이름을 입력하세요.");
			form.user.focus();
			return;
		}
		
		/* if (!form.password.value) {
			alert("패스워드를 입력하세요.");
			form.password.focus();
			return;
		} */
		
		var dataConnectionTypeList = document.getElementById("dataConnectionTypeList");
		form.dataConnectionType.value = dataConnectionTypeList.value;
		if (form.dataConnectionType.value == "SQL_Server") {
			if (!form.version.value) {
				alert("버전정보가 필요합니다 해당 DBMS 버전을 입력하세요.");
				form.version.focus();
				return;
			}
		}
		
		if (form.dataConnectionType.value == 'UserCustom') {
			if (!form.driver.value) {
				alert('해당 Driver 명을 입력해주세요.')
				form.driver.focus();
				return;
			}
		}
		
		form.submit();
	}
</script>
<div class="container">
	<div class="page-header">
		<h3>엔진 JDBC 커넥션추가 페이지</h3>
	</div>
	<div style="width:1200px; margin:0px auto;">
		<form style="padding-left:50px; padding-top:50px;" class="form-horizontal" action="index.jsp" method="post">
			
			<p>암호화를 하실경우에는 URL, User, Password가 암호화되어 저장됩니다.</p>
			</br>
			
			<input type="hidden" name="ClipID" value="L52">
			<input type="hidden" name="dataConnectionType">
			<div class="control-group">
			    <label class="control-label">ConnectionType</label>
			    <div class="controls">
			      <select id="dataConnectionTypeList">
			      	<option>Oracle</option>
			      	<option>SQL_Server</option>
			      	<option>MySQL</option>
			      	<option>Tibero</option>
			      	<option>DB2</option>
			      	<option>Sybase</option>
			      	<option>UserCustom</option>
			      </select>
			    </div>
			</div>
			
			<div class="control-group">
				<!-- <p><strong>Database Name : </strong>OOF에서 Connection Type이 Data일때 사용할 디비이름을 뜻합니다.</p> -->
			    <label class="control-label">Database Name</label>
			    <div class="controls">
			      <input type="text" class="input-xxlarge" id="dbName" name="dbName" placeholder="Database Name" value="<%=dbName%>">
			    </div>
			</div>
			
			<div class="control-group">
			    <label class="control-label">Driver</label>
			    <div class="controls">
			      <input type="text" class="input-xxlarge" id="driver" name="driver" placeholder="Driver" value="<%=driver%>">
			    </div>
			</div>
			
			<div class="control-group">
			    <label class="control-label">DBMS Version</label>
			    <div class="controls">
			      <input type="text" class="input-xxlarge" id="version" name="version" placeholder="DBMS Version" value="<%=version%>">
			    </div>
			</div>
			
			<div class="control-group">
			    <label class="control-label">URL</label>
			    <div class="controls">
			      <input type="text" class="input-xxlarge" id="url" name="url" placeholder="URL" value="<%=url%>">
			    </div>
			</div>
			
			<div class="control-group">
			    <label class="control-label">User</label>
			    <div class="controls">
			      <input type="text" class="input-xxlarge" id="user" name="user" placeholder="User" value="<%=user%>">
			    </div>
			</div>
			
			<div class="control-group">
			    <label class="control-label">Password</label>
			    <div class="controls">
			      <input type="password" class="input-xxlarge" id="password" name="password" maxlength="15" placeholder="Password" value="<%=password%>">
			    </div>
			</div>
			
			<div class="control-group">
			    <label class="control-label">Encoding</label>
			    <div class="controls">
			      <input type="text" class="input-xxlarge" id="encoding" name="encoding" placeholder="Encoding" value="<%=encoding%>">
			    </div>
			</div>
			
			<div class="control-group">
				<div class="controls">    
					<label class="checkbox inline"> <input type="checkbox" name="encrypt"> 암호화 </label>
				</div>
			</div>	
				  
			<div class="control-group">
			    <div class="controls">
			      	<button type="button" class="btn btn-primary" onclick="addDataConnection(this.form)">확인</button>
			      	<a class="btn" type="button" href="index.jsp?ClipID=L103">취소</a>
			    </div>
			</div>
			  
		</form>
	</div>
</div>

<script type="text/javascript">
	<% if (create != null && create.equals("false")) { %>
		alert("같은 이름의 커넥션을 추가하실수 없습니다.");
	<% } %>
</script>
