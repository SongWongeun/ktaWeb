<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty loginVO }">
	<script>
		var hour = 0;
		var minute = 30;
		var second = 0;
		var timeCount = 10;
	
		$(document).ready(function(){
			if(minute != 0 || second != 0) {
				time = setInterval("countTime();", 1000);
			}
			
			$('div#popupLayer a#closePopup').on('click',function(){
				$('div#popupLayer').hide();
			});
			
			$("#logoutTimeReset").click(function(){
				minute = 30;
				second = 1;
			});
		});	
 
			var h = hour;
			var m = minute;
			var s = second;
			var namunTime = "";

			if(s==0) {
				m--;
				s = 60;
			
				if(m<0) {
					h--;
					m = 59;
				}
			}
			s--;

			namunTime = "0"+s;
			namunTime = (namunTime.length == 2) ? namunTime : namunTime.substr(1,2);
			$("#timeLimitLogout strong").html(m+" : "+namunTime);

			hour = h;
			minute = m;
			second = s;
			
		 if(h==0 && m==0 && s==0){
				clearInterval(time);
				autoLogout();
			} 
		}
		
		function autoLogout(){
					$.ajax({
						url: '/logout.do',
						dataType: "html",
						error: function( e) {
						},
						success : function( e ){
							$('div#popupLayer').show();
						}
					});
				}
	</script>
</c:if>
