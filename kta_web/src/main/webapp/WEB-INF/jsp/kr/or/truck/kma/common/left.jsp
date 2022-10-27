<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="currentUri" value="${fn:replace(requestScope['javax.servlet.forward.request_uri'],'//','/')}" />
<c:set var="currentUri2" value="${pageContext.request.requestURL }"/>
	<div class="sidebar-background">
		<div class="primary-sidebar-background"></div>
	</div>
	<div class="primary-sidebar">
	
		<ul class="nav navbar-collapse collapse navbar-collapse-primary">

				<!-- 고객광장 관리 -->
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kma/admin/")}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " href="/kma/admin/list.do">
					<i class="icon-group icon-2x"></i>
					<span>계정관리
					
					</span>
					</a>
					<!-- 
				       	<ul id="customerMgr" class="collapse <c:if test='${fn:startsWith(currentUri, "/kwa/customerMgr/")}'>in</c:if>">
							<li class="<c:if test='${fn:startsWith(currentUri, "/kwa/customerMgr/qna/")}'>active</c:if>">
								<a href="/kwa/customerMgr/qna/list.do">
								<i class="icon-comments-alt"></i>고객문의 관리 
								</a>
							</li>    
						</ul>
					 -->
				</li>
				<!-- //고객광장 관리 -->

				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kma/request/")}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " href="/kma/request/list.do">
					<i class="icon-comments icon-2x"></i>
					<span>승인관리
					
					</span>
					</a>
				</li>

				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kma/log/")}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " href="/kma/log/list.do">
					<i class="icon-eye-open icon-2x"></i>
					<span>로그관리
					
					</span>
					</a>
				</li>
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kma/bbs/")&&param._bbsManagerId=="NOT20120217001"}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed" data-toggle="collapse" href="#bbsMgr">
					<i class="icon-columns icon-2x"></i>
					<span>게시판관리</span>
					<i class="icon-caret-down"></i>
					</a>
					<ul id="bbsMgr" class="collapse <c:if test='${fn:startsWith(currentUri, "/kma/bbs/list.do")}'>in</c:if>">
						<li class="<c:if test='${_param._bbs.BBS_MANAGER_ID eq "NOT20120217001"}'>active</c:if>">
							<a href="/kma/bbs/list.do?_bbsManagerId=NOT20120217001">
							<i class="icon-user"></i>
								공지관리
							</a>
						</li>
						<li class="<c:if test='${_param._bbs.BBS_MANAGER_ID eq "PDF20140208001"}'>active</c:if>">
							<a href="/kma/bbs/list.do?_bbsManagerId=PDF20140208001">
							<i class="icon-user"></i>
								pdf관리
							</a>
						</li>
					</ul>
				</li>
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kma/bbs/")&&param._bbsManagerId=="APP20120217001"}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " href="/kma/bbs/list.do?_bbsManagerId=APP20120217001">
					<i class="icon-save icon-2x"></i>
					<span>버전관리
					</span>
					</a>
				</li>
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kma/mobileState/")}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed " data-toggle="collapse" href="#mobileState">
					<i class="icon-eye-open icon-2x"></i>
					<span>모바일통계
					<i class="icon-caret-down"></i>
					</span>
					</a>
				       	<ul id="mobileState" class="collapse <c:if test='${fn:startsWith(currentUri, "/kma/mobileState/")}'>in</c:if>">
							<li class="<c:if test='${fn:startsWith(currentUri, "/kma/mobileState/notLoginlist")}'>active</c:if>">
								<a href="/kma/mobileState/notLoginlist.do">
								<i class="icon-comments-alt"></i>기기미사용자 
								</a>
							</li>    
							<li class="<c:if test='${fn:startsWith(currentUri, "/kma/mobileState/todayLoginlist")}'>active</c:if>">
								<a href="/kma/mobileState/todayLoginlist.do">
								<i class="icon-comment-alt"></i>당일로그인현황
								</a>
							</li> 
							<li class="<c:if test='${fn:startsWith(currentUri, "/kma/mobileState/daysUseList")}'>active</c:if>">
								<a href="/kma/mobileState/daysUseList.do">
								<i class="icon-comments-alt"></i>기간별메뉴사용현황
								</a>
							</li>   
							<li class="<c:if test='${fn:startsWith(currentUri, "/kma/mobileState/daysLoginList")}'>active</c:if>">
								<a href="/kma/mobileState/daysLoginList.do">
								<i class="icon-comments-alt"></i>기간별로그인현황
								</a>
							</li>    
						</ul>
				</li>
				
				
				<li class="dark-nav <c:if test='${fn:startsWith(currentUri, "/kma/pay/")}'>active</c:if>">
					<span class="glow"></span>
					<a class="accordion-toggle collapsed" data-toggle="collapse" href="#payMgr">
					<i class="icon-money icon-2x"></i>
					<span>요금관리</span>
					<i class="icon-caret-down"></i>
					</a>
					<ul id="payMgr" class="collapse <c:if test='${fn:startsWith(currentUri, "/kma/pay/")}'>in</c:if>">
						<li class="<c:if test='${fn:startsWith(currentUri, "/kma/pay/inquiry/")}'>active</c:if>">
							<a href="/kma/pay/inquiry/list.do">
							<i class="icon-user"></i>
								요금조회
							</a>
						</li>
						<li class="<c:if test='${fn:startsWith(currentUri, "/kma/pay/mgr/")}'>active</c:if>">
							<a href="/kma/pay/mgr/list.do">
							<i class="icon-user"></i>
								요금관리
							</a>
						</li>
					</ul>
				</li>
 		</ul>
 		
		<!-- <div class="sparkline-box side">
			<hr class="divider">
			<div class="sparkline-row">
				<h4 class="dark-green"><span>VISITS</span> 28,873명</h4>
				<div class="sparkline big" data-color="darkGreen">436,2143,2424,2115,3227,2329,1244,1526,1120,2238,1112,2220</div>
			</div>
		</div> -->
	  
		<!-- <div class="text-center" style="margin-top: 60px">
		<div class="easy-pie-chart-percent" style="display: inline-block" data-percent="89"><span>89%</span></div>
		<div style="padding-top: 20px"><b>Server Usage</b></div> </div> -->

	</div>
