<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle borderBn">
					<div class="title">
 						<h2><img src="/images/truck/net/contrac_tit.gif" alt="계약관리" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<a href="/netCounter/inquiryService/contractInquiry/accCarListInquiry.do" >계약관리</a>
						<span>계약정보조회</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/contrac_con_tit02.gif" alt="고객님께서 가입하신 공제계약의 상세내용을 확인하실 수 있습니다" /></p>
					<!-- 계약관리 탭메뉴 -->
					<div class="tabGruop">
						<ul class="tab">
							<li><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><span>자동차공제조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/accInquiry.do"><span>재해공제조회</span></a></li>
							<li class="on"><a href="/netCounter/inquiryService/contractInquiry/carryInquiry.do"><span>적재물공제조회</span></a></li>
						</ul>
					</div>
					<div class="conSection clfix">
						<h3 class="hide">계약정보조회</h3>
						<div class="netTitbox">
							<h4 class="netTit">${loginVO.agentNm} 고객님께서 가입하신 <span class="txtColor02">공제계약</span>의 <span class="txtColor03">상세내용</span>을 확인하실 수 있습니다&#46;</h4>
						</div>
						<!-- 계약정보조회서브탭메뉴 s -->
						<div class="subtabGruop">
							<p class="tabTit"><span class="icoCar">조합원</span> ${resultList[0].agent_nm} 님</p>
							<ul class="subTab"><!-- 탭 선택 시 class="on" 추가 -->
								<li class="on" ><a href="#;"><span>적재물계약&#40;주선&#41;</span></a></li>
							</ul>
						</div>
						<!-- 적재물계약 주선 s -->
						<h4 class="hide">적재물계약&#40;주선&#41;</h4>
						<h5 class="netsubTit" ><span class="greenBul">조합원 정보</span></h5>
						<div class="tbWork1">
							<table class="tbWork_st04" summary="조합원 정보 상세정보 테이블 입니다.">
								<caption>조합원 정보에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:30%;" />
									<col style="width:20%;" />
									<col style="width:30%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="borLeft">상호</th>
										<td>${resultList[0].agent_nm}</td>
										<th scope="row">전화번호</th>
										<td>${resultList[0].tel_local_no}-${fn:replace(resultList[0].tel_no,' ','-')}</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">대표자</th>
										<td>${resultList[0].daepyoja_nm}</td>
										<th scope="row">팩스번호</th>
										<td>${resultList[0].fax_local_no}-${fn:replace(resultList[0].fax_no,' ','-')}</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">주소</th>
										<td colspan="3">${resultList[0].addr1} ${resultList[0].addr2}</td>
									</tr>
								</tbody>
							</table>
						</div><!--// 조합원정보 e -->
						<h5 class="netsubTit" ><span class="greenBul">계약사항</span></h5>
						<div class="tbWork1">
							<table class="tbWork_st04" summary="계약조건 상세정보 테이블 입니다. 매출액.보상한도,자기부담금,특양사항">
								<caption>계약사항에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:30%;" />
									<col style="width:20%;" />
									<col style="width:30%;" />
								</colgroup>
								<tbody>									
									<tr>
										<th scope="row" class="borLeft">매출액</th>
										<td>${resultList[0].jukjaemul_maechul_amt}</td>
										<th scope="row">보상한도</th>
										<td>
											<c:if test="${not empty resultList[0].jukjaemul_bosang_hando}">
												1사고당 ${resultList[0].jukjaemul_bosang_hando}
											</c:if>
											&nbsp;
										</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">자기부담금</th>
										<td colspan="3">${resultList[0].myunchaek_amt}</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">특약사항</th>
										<td colspan="3">
											<c:forEach items="${jsTukyakList }" var="tukyak" >
												${tukyak.tukyak_gubun_nm } , ${tukyak.tukyak_symd } , ${tukyak.tukyak_eymd }
											</c:forEach>
										</td>
									</tr>
								</tbody>
							</table>
						</div><!--// 계약사항 e -->
						<h5 class="netsubTit" ><span class="greenBul">공제계약기간</span></h5>
						<div class="tbWork1">
							<table class="tbWork_st01" summary="공제계약기간 상세정보 테이블 입니다.">
								<caption>공제계약기간에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:40%;" />
									<col style="width:30%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">계약상태</th>
										<th scope="col">계약기간</th>
										<th scope="col">납입구분</th> 
									</tr>
								</thead>
								<tbody>
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>		  			    
											<td >${result.gyeyak_state_nm}</td>
											<td >${result.gaip_ymd}</td>
											<td >${result.napip_gb}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div><!--//공제계약기간 e -->
						<h5 class="netsubTit" ><span class="greenBul">분담금 납입정보</span></h5>
						<div class="tbWork1">
							<p class="etcTxt">&#40;기준일자 &#58; <fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월dd일" />&#41;</p>
							<table class="tbWork_st01" summary="분담금 납입정보 상세정보 테이블 입니다. 담보,계약상태,회차,분담금,영수일자,합계">
								<caption>분담금 납입정보에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:8%;" />
									<col style="width:8%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" /> 
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" colspan="2" rowspan="2">담보</th>
										<!-- <th scope="col" rowspan="2">계약상태</th> -->
										<th scope="col" colspan="2" class="brB1">1회</th>
										<th scope="col" colspan="2" class="brB1">2회</th>
										<th scope="col" colspan="2" class="brB1">3회</th>
										<th scope="col" colspan="2" class="brB1">4회</th>
										<th scope="col" colspan="2" class="brB1">5회</th>
										<th scope="col" colspan="2" class="brB1">6회</th>
									</tr>
									<tr>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="bunnap_sum_1" value="0"/>
									<c:set var="bunnap_sum_2" value="0"/>
									<c:set var="bunnap_sum_3" value="0"/>
									<c:set var="bunnap_sum_4" value="0"/>
									<c:set var="bunnap_sum_5" value="0"/>
									<c:set var="bunnap_sum_6" value="0"/>
									<c:forEach var="detail" items="${detailList}" varStatus="status">
										<c:if test="${not empty detail.BUNNAP_AMT1}">
											<c:set var="bunnap_sum_1" value="${bunnap_sum_1+detail.BUNNAP_AMT1 }"/>
										</c:if>
										<c:if test="${not empty detail.BUNNAP_AMT2}">
											<c:set var="bunnap_sum_2" value="${bunnap_sum_2+detail.BUNNAP_AMT2 }"/>
										</c:if>
										<c:if test="${not empty detail.BUNNAP_AMT3}">
											<c:set var="bunnap_sum_3" value="${bunnap_sum_3+detail.BUNNAP_AMT3 }"/>
										</c:if>
										<c:if test="${not empty detail.BUNNAP_AMT4}">
											<c:set var="bunnap_sum_4" value="${bunnap_sum_4+detail.BUNNAP_AMT4 }"/>
										</c:if>
										<c:if test="${not empty detail.BUNNAP_AMT5}">
											<c:set var="bunnap_sum_5" value="${bunnap_sum_5+detail.BUNNAP_AMT5 }"/>
										</c:if>
										<c:if test="${not empty detail.BUNNAP_AMT6}">
											<c:set var="bunnap_sum_6" value="${bunnap_sum_6+detail.BUNNAP_AMT6 }"/>
										</c:if>
										<%-- 날짜 --%>
										<c:if test="${not empty detail.YOUNGSU_YMD1}">
											<fmt:parseDate value="${detail.YOUNGSU_YMD1}" var="dateFmt1" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.YOUNGSU_YMD2}">
											<fmt:parseDate value="${detail.YOUNGSU_YMD2}" var="dateFmt2" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.YOUNGSU_YMD3}">
											<fmt:parseDate value="${detail.YOUNGSU_YMD3}" var="dateFmt3" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.YOUNGSU_YMD4}">
											<fmt:parseDate value="${detail.YOUNGSU_YMD4}" var="dateFmt4" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.YOUNGSU_YMD5}">
											<fmt:parseDate value="${detail.YOUNGSU_YMD5}" var="dateFmt5" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.YOUNGSU_YMD6}">
											<fmt:parseDate value="${detail.YOUNGSU_YMD6}" var="dateFmt6" pattern="yyyymmdd"/>
										</c:if>
										
										<tr>		 		
											<td colspan="2">${detail.GUBUN_NM}</td>		    	
											<%-- <td>${detail.gyeyak_state_nm}</td> --%>
											<td class="alR"><fmt:formatNumber value="${detail.BUNNAP_AMT1 }" type="number" /></td>
											<td><fmt:formatDate value="${dateFmt1}" pattern="yy.mm.dd"/></td>
											<td class="alR"><fmt:formatNumber value="${detail.BUNNAP_AMT2 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt2}" pattern="yy.mm.dd"/></td>
											<td class="alR"><fmt:formatNumber value="${detail.BUNNAP_AMT3 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt3}" pattern="yy.mm.dd"/></td>
											<td class="alR"><fmt:formatNumber value="${detail.BUNNAP_AMT4 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt4}" pattern="yy.mm.dd"/></td>
											<td class="alR"><fmt:formatNumber value="${detail.BUNNAP_AMT5 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt5}" pattern="yy.mm.dd"/></td>
											<td class="alR"><fmt:formatNumber value="${detail.BUNNAP_AMT6 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt6}" pattern="yy.mm.dd"/></td>		    	
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2" scope="col">합계</td>
										<!-- <td scope="col"></td> -->
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_1 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_2 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_3 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_4 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_5 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" class="alR"><fmt:formatNumber value="${bunnap_sum_6 }" type="number" /></td>
										<td scope="col"></td>
									</tr>
								</tfoot>
							</table>
						</div><!--// 분담금 납입정보 e -->
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>