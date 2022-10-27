<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="currentUri" value="${fn:replace(requestScope['javax.servlet.forward.request_uri'],'//','/')}" />
	<div class="sidebar-background">
		<div class="primary-sidebar-background"></div>
	</div>
	<div class="primary-sidebar">
	
		<ul class="nav navbar-collapse collapse navbar-collapse-primary">

			<% 
			//비관리자도 1:1고객은 볼수있어서 전체다 볼수있음. 
			//<c:if test="${menuAuthCode=='m'||(menuAuthCode=='d'&&fn:contains(authMenuList,'1040200'))||(menuAuthCode=='d'&&fn:contains(authMenuList,'1040300'))||(menuAuthCode=='d'&&fn:contains(authMenuList,'1040400'))||(menuAuthCode=='d'&&fn:contains(authMenuList,'1050304'))}">
			 %>
				<!-- 고객광장 관리 -->
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kwa/customerMgr/")}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " data-toggle="collapse" href="#customerMgr" onclick="">
					<i class="icon-comments icon-2x"></i>
					<span>고객광장 관리
					<i class="icon-caret-down"></i>
					</span>
					</a>
				       	<ul id="customerMgr" class="collapse <c:if test='${fn:startsWith(currentUri, "/kwa/customerMgr/")}'>in</c:if>">
							<% 
							//비관리자도 1:1고객은 볼수있어서 전체다 볼수있음. 
							//<c:if test="${menuAuthCode=='m'||(menuAuthCode=='d'&&fn:contains(authMenuList,'1040300'))}">
							%>
								<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/customerMgr/qna/")}'>active</c:if>">
									<a href="/kwa/customerMgr/qna/list.do">
									<i class="icon-comments-alt"></i>고객문의 관리 
									</a>
								</li>    
							<% 
							//비관리자도 1:1고객은 볼수있어서 전체다 볼수있음. 
							//</c:if>
							%>
							<c:if test="${menuAuthCode=='m'||(menuAuthCode=='d'&&fn:contains(authMenuList,'1040200'))}">
								<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/customerMgr/faq/")}'>active</c:if>">
									<a href="/kwa/customerMgr/faq/list.do">
									<i class="icon-comment-alt"></i>자주하는 질문 관리
									</a>
								</li> 
							</c:if>
							<c:if test="${menuAuthCode=='m'||(menuAuthCode=='d'&&fn:contains(authMenuList,'1050304'))}">
								<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/customerMgr/cleanCenter/")}'>active</c:if>">
									<a href="/kwa/customerMgr/cleanCenter/list.do">
									<i class="icon-comments-alt"></i>클린센터 관리
									</a>
								</li>   
							</c:if> 
							<c:if test="${menuAuthCode=='m'||(menuAuthCode=='d'&&fn:contains(authMenuList,'1040400'))}">
								<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/customerMgr/praise/")}'>active</c:if>">
									<a href="/kwa/customerMgr/praise/list.do">
									<i class="icon-comments-alt"></i>칭찬합시다 관리
									</a>
								</li>    
							</c:if>
						</ul>
				</li>
				<!-- //고객광장 관리 -->
			<% 
			//비관리자도 1:1고객은 볼수있어서 전체다 볼수있음. 
			//</c:if>
			%>
			
			<c:if test="${menuAuthCode=='m'||(menuAuthCode=='d'&&fn:contains(authMenuList,'1030101'))}">
				<!-- 개인화물 공제가입 관리 페이지 추가-->
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kwa/hwamulMgr/")}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " data-toggle="collapse" href="#privateHwamulMgr" onclick="">
					<i class="icon-comments icon-2x"></i>
					<span>상담신청 관리
					<i class="icon-caret-down"></i>
					</span>
					</a>
				       	<ul id="privateHwamulMgr" class="collapse <c:if test='${fn:startsWith(currentUri, "/kwa/hwamulMgr/")}'>in</c:if>">
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/hwamulMgr/")}'>active</c:if>">
									<a href="/kwa/hwamulMgr/list.do">
									<i class="icon-comments-alt"></i>개인화물 공제가입
									</a>
							</li> 
						</ul>
				</li>
				<!-- 개인화물 공제가입 관리 페이지 추가-->
			</c:if>

		
			<c:if test="${menuAuthCode=='m'}">
				<!-- 회원관리 -->
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kwa/memberMgr/")}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " data-toggle="collapse" href="#memberMgr">
					<i class="icon-group icon-2x"></i>
					<span>회원관리</span>
					<i class="icon-caret-down"></i>
					</a>
						<ul id="memberMgr" class="collapse <c:if test='${fn:startsWith(currentUri, "/kwa/memberMgr/")}'>in</c:if>">
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/memberMgr/web/")}'>active</c:if>">
								<a href="/kwa/memberMgr/web/list.do">
								<i class="icon-user"></i>
									웹 회원관리
								</a>
							</li>
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/memberMgr/staff/")}'>active</c:if>">
								<a href="/kwa/memberMgr/staff/list.do">
								<i class="icon-user"></i>
									직원 관리
								</a>
							</li>
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/memberMgr/admin/")}'>active</c:if>">
								<a href="/kwa/memberMgr/admin/list.do">
								<i class="icon-user"></i>
									어드민 관리
								</a>
							</li>
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/memberMgr/dormancy/")}'>active</c:if>">
								<a href="/kwa/memberMgr/dormancy/list.do">
								<i class="icon-user"></i>
									휴면계정관리
								</a>
							</li>
						</ul>
				</li>
				<!-- //회원관리 -->
			</c:if>
			
			<c:if test="${menuAuthCode=='m'}">
				<!-- 메뉴관리 -->
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kwa/menuMgr/")}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " data-toggle="collapse" href="#menuMgr">
					<i class="icon-sitemap icon-2x"></i>
					<span>메뉴 관리
					<i class="icon-caret-down"></i>
					</span>
					</a>
				       	<ul id="menuMgr" class="collapse  <c:if test='${fn:startsWith(currentUri, "/kwa/menuMgr/")}'>in</c:if>">
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/menuMgr/menulist")}'>active</c:if>">
								<a href="/kwa/menuMgr/menulist.do">
								<i class="icon-list-ul"></i>메뉴 목록
								</a>
							</li> 
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/menuMgr/fileList")}'>active</c:if>">
								<a href="/kwa/menuMgr/fileList.do">
								<i class="icon-save"></i>파일 관리
								</a>
							</li>
						</ul>
				</li>
				<!-- //메뉴관리 -->
			</c:if>
			
			<c:if test="${menuAuthCode=='m'||(menuAuthCode=='d'&&contentMenuCnt>0)}">
				<!-- 컨텐츠 관리 -->
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kwa/contentMgr/")}'>active</c:if>">
					<span class="glow"></span>
					<a href="/kwa/contentMgr/boardList.do">
					<i class="icon-film icon-2x"></i>
					<span>컨텐츠 관리
					</span>
					</a>
				</li>
				<!-- //컨텐츠 관리 -->
			</c:if>
			
					
			<c:if test="${menuAuthCode=='m'}">
				<!-- 디자인 관리 -->
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kwa/design/")}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " data-toggle="collapse" href="#designMgr">
					<i class="icon-dashboard icon-2x"></i>
					<span>디자인 관리
					<i class="icon-caret-down"></i>
					</span>
					</a>
				       	<ul id="designMgr" class="collapse <c:if test='${fn:startsWith(currentUri, "/kwa/design/")}'>in</c:if>">
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/design/banner")}'>active</c:if>">
								<a href="/kwa/design/banner.do">
								<i class="icon-lightbulb"></i>배너 관리
								</a>
							</li> 
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/design/thema")}'>active</c:if>">
								<a href="/kwa/design/thema.do">
								<i class="icon-columns"></i>모바일 테마 관리
								</a>
							</li>    
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/design/noticeIcon")}'>active</c:if>">
								<a href="/kwa/design/noticeIcon.do">
								<i class="icon-columns"></i>모바일 공지사항 관리
								</a>
							</li>    
						</ul>
				</li>
				<!-- //디자인 관리 -->
			</c:if>

			
			<c:if test="${menuAuthCode=='m'}">
				<!-- 통계 관리 -->
				<li class="dark-nav ">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " data-toggle="collapse" href="#statsMgr">
						<i class="icon-bar-chart icon-2x"></i>
						<span>통계 관리
						<i class="icon-caret-down"></i>
						</span>
					</a>
			       	<ul id="statsMgr" class="collapse  <c:if test='${fn:startsWith(currentUri, "/kwa/statsMgr/")}'>in</c:if>">
						<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/statsMgr/total")}'>active</c:if>">
							<a href="/kwa/statsMgr/total/all.do">
							<i class="icon-caret-right"></i>전체통계
							</a>
						</li> 
						<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/statsMgr/web")}'>active</c:if>">
							<a href="/kwa/statsMgr/web/year.do">
							<i class="icon-caret-right"></i>웹 사용통계
							</a>
						</li> 
						<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/statsMgr/customer")}'>active</c:if>">
							<a href="/kwa/statsMgr/customer/year.do">
							<i class="icon-caret-right"></i>고객문의 통계
							</a>
						</li>    
						<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/statsMgr/prcc")}'>active</c:if>">
							<a href="/kwa/statsMgr/prcc/year.do">
							<i class="icon-caret-right"></i>칭찬합시다,클린센터 통계
							</a>
						</li> 
						<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/statsMgr/certificate")}'>active</c:if>">
							<a href="/kwa/statsMgr/certificate/year.do">
							<i class="icon-caret-right"></i>증명서 발급 통계
							</a>
						</li>  
						<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/statsMgr/memUser")}'>active</c:if>">
							<a href="/kwa/statsMgr/memUser/year.do">
							<i class="icon-caret-right"></i>회원 가입/탈퇴 통계
							</a>
						</li>
						<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/statsMgr/visit")}'>active</c:if>">
							<a href="/kwa/statsMgr/visit/year.do">
							<i class="icon-caret-right"></i>방문자수 통계
							</a>
						</li> 
					</ul>
				</li>
				<!-- //통계 관리 -->
			</c:if>
			
			<c:if test="${menuAuthCode=='m'}">
				<!-- 로그 관리 -->
				<li class="dark-nav ">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " data-toggle="collapse" href="#logMgr">
					<i class="icon-eye-open icon-2x"></i>
					<span>로그 관리
					<i class="icon-caret-down"></i>
					</span>
					</a>
				       	<ul id="logMgr" class="collapse  <c:if test='${fn:startsWith(currentUri, "/kwa/logMgr/")}'>in</c:if>">
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/logMgr/menu")}'>active</c:if>">
								<a href="/kwa/logMgr/menu/list.do">
								<i class="icon-caret-right"></i>메뉴접속 로그
								</a>
							</li> 
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/logMgr/operator")}'>active</c:if>">
								<a href="/kwa/logMgr/operator/list.do">
								<i class="icon-caret-right"></i>담당자 접속로그
								</a>
							</li>    
							<!-- <li class="">
								<a href="#;">
								<i class="icon-caret-right"></i>SMS 발송 로그
								</a>
							</li>      -->
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/logMgr/email/")}'>active</c:if>">
								<a href="/kwa/logMgr/email/list.do">
								<i class="icon-caret-right"></i>이메일 발송 로그
								</a>
							</li> 
						</ul>
				</li>
				<!-- //로그 관리 -->
			</c:if>
			

			<!-- 20161208 추가 -->
			<c:if test="${menuAuthCode=='m'}">
			<!-- 약관 관리 -->
			<li class="dark-nav ">
				<span class="glow"></span>
				<a class="accordion-toggle collapsed " data-toggle="collapse" href="#agreeMgr">
				<i class="icon-file-alt icon-2x"></i>
				<span>약관 관리
				<i class="icon-caret-down"></i>
				</span>
				</a>
					<ul id="agreeMgr" class="collapse <c:if test='${fn:startsWith(currentUri, "/kwa/agreement/")}'>in</c:if>">
						<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/agreement/person/")}'>active</c:if>">
							<a href="/kwa/agreement/info.do?ph_code=p"> <!-- 2016.12.13 [H] 수정 -->
							<i class="icon-caret-right"></i>개인정보보호정책 관리
							</a>
						</li> 
						<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/agreement/email/")}'>active</c:if>">
							<a href="/kwa/agreement/info.do?ph_code=e"> <!-- 2016.12.13 [H] 수정 -->
							<i class="icon-caret-right"></i>이메일주소무단수집거부 관리
							</a>
						</li>    
						<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/agreement/use/")}'>active</c:if>">
							<a href="/kwa/agreement/info.do?ph_code=u"> <!-- 2016.12.13 [H] 수정 -->
							<i class="icon-caret-right"></i>이용약관 관리
							</a>
						</li> 
					</ul>
			</li>
			<!-- //약관 관리 -->
			</c:if>
			<!-- //20161208 추가 -->
 		</ul>
 		
 		<div class="hidden-sm hidden-xs">
		    <div class="sparkline-box side">
			    <hr class="divider" >

				<div class="sparkline-row">
					<h4 class="red"><span>전체 방문자수</span><fmt:formatNumber value="${rMapA.ALL}" groupingUsed="true"/></h4>
					<!-- <div class="sparkline big" data-color="red">
						16,11,10,14,8,23,19,3,13,29,13,10
					</div> -->
				</div>
				<hr class="divider" >
				
				<div class="sparkline-row">
					<h4 class="blue"><span>금일 방문자수</span><fmt:formatNumber value="${rMapT.TODAY}" groupingUsed="true"/></h4>
					<!-- <div class="sparkline big" data-color="blue">
						16,11,10,14,8,23,19,3,13,29,13,10
					</div> -->
				</div>
				<hr class="divider" >
				
			</div>
		</div>

	</div>
