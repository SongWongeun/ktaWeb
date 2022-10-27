<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation" >
	<div class="navbar-header" > 
		<a class="navbar-brand" href="#;"><span class="title">&nbsp;&nbsp;KTA MOBILE ADMIN</span></a>
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-primary">
		  <span class="sr-only">Toggle Side Navigation</span>
		  <i class="icon-th-list"></i>
		</button>
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-top">
		  <span class="sr-only">Toggle Top Navigation</span>
		  <i class="icon-align-justify"></i>
		</button>
	</div>
	
	<div class="collapse navbar-collapse navbar-collapse-top">
		<div class="navbar-right">
		
			<ul class="nav navbar-nav navbar-left">
				<li class="cdrop active"><a href="/kwa/customerMgr/qna/list.do">KTA Web Admin</a></li>
				<li class="cdrop"><a href="/kma/admin/list.do">KTA Mobile Admin</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-left">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle dropdown-avatar" data-toggle="dropdown">
						<span>
							<img class="menu-avatar" src="/kwa/common/sawonPicture.do?sawon_no=${adminLoginVO.user_id }" /> <span> ${adminLoginVO.name } <i class="icon-caret-down"></i></span>
							<%--<span class="badge badge-dark-red">ad</span> --%>
						</span>
					</a>
					<ul class="dropdown-menu">
		                <li class="with-image">
							<div >
								<img style="width:80%;" src="/kwa/common/sawonPicture.do?sawon_no=${adminLoginVO.user_id }" />
							</div>
							<span>${adminLoginVO.name }</span>
		                </li>
		                <li class="divider"></li>
		                <li><a href="/kwa/logout.do"><i class="icon-off"></i> <span>Logout</span></a></li>
					</ul>
				</li>
			</ul>
			
		</div>
	</div>  
</nav>