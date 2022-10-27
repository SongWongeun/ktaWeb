<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 삭제 function */
function deleteBoard(no){
	if(confirm("삭제하겠습니까?")){
	document.boardForm.articleNo.value = no;
	document.boardForm.action = "<c:url value='/customer/inquiry/deleteArticle.do'/>";
	document.boardForm.submit();
	}else return;
}
/* 글 수정 화면 function */
function updateBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/customer/inquiry/viewUpdateBoard.do'/>";
   	document.boardForm.submit();		
}
/* 글 목록 화면 function */
function listOaoBoard() {
   	document.boardForm.action = "<c:url value='/deductProduct/privateHwamul/hwamulList.do'/>";
   	document.boardForm.submit();
}
</script>
<script type="text/javascript" src="/namo/js/namo_scripteditor.js"></script>

<style>
	.notice{
			font-size:20px;
			padding:10px;
	}
</style>
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
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/cust/guide_sub_tit.gif" alt="상담신청 결과 상세보기" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>
						<a href="/deductProduct/hwamulInfo.do" >개인화물 가입안내</a>
						<a href="/deductProduct/privateHwamul/hwamulList.do" >상담신청 결과확인</a>
						<span>상세보기</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
					<legend>상담신청결과 상세보기</legend>
					<input name="articleNo" type="hidden" />
					<form:input path="searchKeyword" type="hidden"/>
					<form:input path="searchCondition" type="hidden"/>
					<p class="confirTit"><img src="/images/truck/cust/guideresult_con_tit.gif" alt="고객님의 개인화물가입 신청 상담에 대한 문의 결과 입니다 " /></p>
					<div class="conSection">
						<!-- table view s -->
						<div class="bbsView1">
							<!-- 테이블 타이틀 s -->
							<div class="tbtitBox">
								<dl>
									<dt><span>상담제목</span></dt>
									<dd> ${resultDetail.car_no} 개인화물 가입상담 </dd>
								</dl>
							</div><!--// 테이블 타이틀 e -->
							<!-- 테이블 s -->
							<table class="tbView_st02" summary="문의내용,답변내용 확인 게시판입니다.">
								<caption>문의결과확인상세보기 게시판입니다.</caption>
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>									
									<tr>
										<th scope="row">성명</th>
										<td>
											${resultDetail.writerName}
										</td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td>
											${resultDetail.phone}
										</td>
									</tr>
									<tr>
										<th scope="row">E&#45;mail</span></th>
										<td>
											${resultDetail.email}
										</td>
									</tr>
									</tbody>
							</table>
							<p class="notice">[ 차량정보 ]</p>
									
							<table class="tbView_st02" summary="문의내용,답변내용 확인 게시판입니다.">
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>
									<tr> 
										<th scope="row">차량번호 / 적재정량</th>
										<td>					
											${resultDetail.car_no}	
											
											/ ${resultDetail.carry_capacity}kg
																	
										</td>
									</tr>								
									<tr>
										<th scope="row">협회가입유무</th>
										<td>											
											<c:if test="${resultDetail.assocication_join eq '0'}">
												미가입
											</c:if>
											<c:if test="${resultDetail.assocication_join eq '1'}">
												개별화물협회
											</c:if>
											<c:if test="${resultDetail.assocication_join eq '2'}">
												용달화물협회
											</c:if>
										</td>
									</tr>
									<tr>
										<th scope="row">계약만기(예정)일</th>
										<td> 
											${resultDetail.expire_date}
										</td>
									</tr>								
									<tr>
										<th scope="row">현 할인할증등급</th>
										<td>
											${resultDetail.extra_charge}
										</td>
									</tr>								
									<tr>
										<th scope="row">필수고지사항</th>
										<td>
											<c:if test="${resultDetail.essential_notice1 eq 'Y'}">
												- 수반차를 견인하는데 사용하는 특수연결장치(트랙터, 풀카고 등)를 한 차량<br>
											</c:if>
											<c:if test="${resultDetail.essential_notice2 eq 'Y'}">
												- 위험물(석유,고압가스,폭발인화성위험물질 등)을 적재하는 차량<br>
											</c:if>
											<c:if test="${resultDetail.essential_notice3 eq 'Y'}">
												- 기중기, 붐, 집게등이 장착(사다리차, 크레인, 렉카 등)된 차량<br>
											</c:if>
											<c:if test="${resultDetail.essential_notice4 eq 'Y'}">
												- 방송, 녹음, 레트켄, 토오키 등 정밀기계가 장착된 차량<br>
											</c:if>
											<c:if test="${resultDetail.essential_notice5 eq 'Y'}">
												- 6인승 밴형화물자동차 또는 승차정원이 3인을 초과하는 차량<br>
											</c:if>
											<c:if test="${resultDetail.essential_notice6 eq 'Y'}">
												- 구조변경 이력이 있는 차량<br>
											</c:if>
											<c:if test="${resultDetail.essential_notice7 eq 'Y'}">
												- 해당없음<br>
											</c:if>
										</td>
									</tr>						
								</tbody>							
							</table>
							<p class="notice">[ 가입상품 ]</p>
							<table class="tbView_st02" summary="문의내용,답변내용 확인 게시판입니다.">
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>								
								<tr>
									<th scope="row">대인Ⅰ</th>
									<td>
										<c:if test="${resultDetail.person1_coverage eq 'Y'}">
											가입
										</c:if>
										<c:if test="${resultDetail.person1_coverage eq 'N'}">
											미가입
										</c:if>	
									</td>
								</tr>
								<tr>
									<th scope="row">대인Ⅱ</th>
									<td>
									<c:if test="${resultDetail.person2_coverage eq 'Y'}">
										가입
									</c:if>
									<c:if test="${resultDetail.person2_coverage eq 'N'}">
										미가입
									</c:if>	
									</td>
								</tr>
								<tr>
									<th scope="row">대물</th>
									<td>
										<c:if test="${resultDetail.object_coverage eq '1500'}">
											${resultDetail.object_coverage}만원
										</c:if>
										<c:if test="${resultDetail.object_coverage eq '3000'}">
											${resultDetail.object_coverage}만원
										</c:if>
										<c:if test="${resultDetail.object_coverage eq '5000'}">
											${resultDetail.object_coverage}만원
										</c:if>
										<c:if test="${resultDetail.object_coverage eq '7000'}">
											${resultDetail.object_coverage}만원
										</c:if>
										<c:if test="${resultDetail.object_coverage eq '10000'}">
											1억원
										</c:if>
										<c:if test="${resultDetail.object_coverage eq '20000'}">
											2억원
										</c:if>
										<c:if test="${resultDetail.object_coverage eq '30000'}">
											3억원
										</c:if>
										<c:if test="${resultDetail.object_coverage eq '40000'}">
											4억원
										</c:if>
										<c:if test="${resultDetail.object_coverage eq '50000'}">
											5억원
										</c:if>
									</td>
								</tr>								
								<tr>
									<th scope="row">자기신체사고<br>(사망후유장애)</th>
									<td>
										<c:if test="${resultDetail.selfbody_coverage eq '1500'}">
											${resultDetail.selfbody_coverage}만원
										</c:if>
										<c:if test="${resultDetail.selfbody_coverage eq '3000'}">
											${resultDetail.selfbody_coverage}만원
										</c:if>
										<c:if test="${resultDetail.selfbody_coverage eq '5000'}">
											${resultDetail.selfbody_coverage}만원
										</c:if>
										<c:if test="${resultDetail.selfbody_coverage eq '10000'}">
											1억원
										</c:if>
										<c:if test="${resultDetail.selfbody_coverage eq '0'}">
											미가입
										</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row">자기차량손해</th>
									<td>
										<c:if test="${resultDetail.selfcar_coverage eq 'Y'}">
											가입
										</c:if>
										<c:if test="${resultDetail.selfcar_coverage eq 'N'}">
											미가입
										</c:if>	
									</td>
								</tr>
								<tr>
									<th scope="row">긴급출동</th>
									<td>
									<c:if test="${resultDetail.emergency_call eq 'Y'}">
										가입
									</c:if>
									<c:if test="${resultDetail.emergency_call eq 'N'}">
										미가입
									</c:if>	
									</td>
								</tr>
								<tr>
									<th scope="row">법률비용지원</th>
									<td>
									<c:if test="${resultDetail.law_expense eq 'Y'}">
										가입
									</c:if>
									<c:if test="${resultDetail.law_expense eq 'N'}">
										미가입
									</c:if>	
									</td>
								</tr>
								<tr>
									<th scope="row">적재물</th>
									<td>
									<c:if test="${resultDetail.luggage_coverage eq 'Y'}">
										가입
									</c:if>
									<c:if test="${resultDetail.luggage_coverage eq 'N'}">
										미가입
									</c:if>	
									</td>
								</tr>	
							<!-- 기존의 문의 아이콘 -->
							<%-- <tr>
								<th scope="row"><p class="type01"><img src="/images/truck/board/bbs_q.gif" alt="문의내용아이콘" /></p><p class="type02">문의내용</p></th>
								<td>${resultDetail.contentHtml}</td>
							</tr> --%>					
								</tbody>
							</table>	
							<table class="tbView_st02" summary="문의내용,답변내용 확인 게시판입니다.">
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>		
									<!-- 답변내용 -->
									<c:if test="${resultDetail.replyAt eq 'Y'}">
									<tr>
										<th scope="row"><p class="type01"><img src="/images/truck/board/bbs_a.gif" alt="답변내용아이콘" /></p><p class="type02">답변내용</p></th>
										<td>${resultDetail.replyContentHtml}</td>
									</tr>
									</c:if>
									<c:if test="${resultDetail.replyAt eq 'N'}">
									<tr>
										<th scope="row"><p class="type01"><img src="/images/truck/board/bbs_a.gif" alt="답변내용아이콘" /></p><p class="type02">답변내용</p></th>
										<td>아직 답변이 등록되지 않았습니다.</td>
									</tr>
									</c:if>
								</tbody>
							</table><!--// 테이블 e -->
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="listOaoBoard(); return false;">목록</a></span>
							</div>
						</div>
						<!--// table view e -->
					</div>
					</fieldset>
					</form:form>
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

<%-- <form:form commandName="inquiryBoardVO" name="detailForm" method="post">
<input type="hidden" name="articleNo"/>
<div id="content_pop">
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li>글내용 조회</li>
		</ul>
	</div>	
	<div>	
	번호 : ${resultBoardArticle.articleNo}<br>
	작성자 이름 : ${resultBoardArticle.writerName}<br>			
	제목 : ${resultBoardArticle.title}<br>
	내용 : ${resultBoardArticle.contentHtml}<br>
	내용(text) : ${resultBoardArticle.contentText}<br>
	조회수 : ${resultBoardArticle.rdCount}<br>
	작성시간 :${resultBoardArticle.createTime}<br>
	작성자아이디:${resultBoardArticle.writerId}<br>
	작성자이름:${resultBoardArticle.writerName}<br>
	수정자아이디:${resultBoardArticle.modifyId}<br>
	수정자이름:${resultBoardArticle.modifyName}<br>
	수정시간:${resultBoardArticle.modifyTime}<br>
	
	문의분야 : ${resultBoardArticle.category}<br>
	연락처 : ${resultBoardArticle.phone}<br>
	이메일 : ${resultBoardArticle.email}<br>
	
	첨부파일 :
	<c:if test="${!empty resultBoardArticle.atchFileId}">
	<tr>
		<c:if test="${not empty resultBoardArticle.atchFileId}">
			<c:import url="/com/atch/selectFileInfs.do" charEncoding="utf-8">
				<c:param name="param_atchFileId" value="${resultBoardArticle.atchFileId}" />
			</c:import>
 		</c:if> 	
	</tr>
</c:if>
<br>
파일아이디:${resultBoardArticle.atchFileId}<br>
파일이름:${resultBoardArticle.atchFileName}<br>
페이지 인덱스:${searchVO.pageIndex}<br>
사용여부 : ${resultBoardArticle.useAt}<br><br>
  </div>
  <div>
	<a href="/customer/inquiry/oaoInquiryIndex.do">고객문의 메인</a><br>
	<a href="/customer/inquiry/oaoInquiryList.do">목록보기</a><br>
	<a href="javascript:updateBoard('<c:out value="${resultBoardArticle.articleNo}"/>')">수정하기</a><br>
	<a href="javascript:deleteBoard('<c:out value='${resultBoardArticle.articleNo}'/>')">글 삭제</a>
</div>
</div>
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form> --%>

