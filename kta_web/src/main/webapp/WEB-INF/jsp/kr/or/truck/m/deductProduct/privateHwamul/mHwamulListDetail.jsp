<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 목록 화면 function */
function hwamulList() {
   	document.boardForm.action = "<c:url value='/m/deductProduct/privateHwamul/hwamulList.do'/>";
   	document.boardForm.submit();
}
</script>
<style>
	.notice{
		padding : 12px;
	}
	@media screen and (min-width: 720px){
	.tbSt02 td, .tbSt02 th {
	    font-size: 1.5em;
	    line-height: 40px;
		}
	}
	</style>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path02">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth01"><a href="/m/joinInfo/index.do">가입안내</a></li>
			<li class="depth02"><a href="/m/deductProduct/privateHwamul/mHwamulInfo.do">개인화물 공제가입 상담신청</a></li>
			<li><a href="/m/deductProduct/privateHwamul/hwamulList.do">답변확인</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
	<form:form commandName="searchVO" name="boardForm" method="post">
	<form:input path="searchKeyword" type="hidden"/>
	<form:input path="searchCondition" type="hidden"/>
	<form:hidden path="pageIndex" />
	<article class="lineTitle"><h2 class="txtTit03">${resultDetail.car_no} 개인화물 가입상담</h2></article>
		
		<article class="basicCont05">
			<table class="tbSt02">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">성명</th>
						<td>${resultDetail.writerName}</td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td>${resultDetail.phone}</td>
					</tr>
					<tr>
						<th scope="row">E-mail</th>
						<td>${resultDetail.email}</td>
					</tr>
				</tbody>
			</table>
			<p class="notice">[ 차량정보 ]</p>		
			<table class="tbSt02">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tbody>		
					<tr>
						<th scope="row">차량번호</th>		
						<td>${resultDetail.car_no}</td>
					</tr>
					<tr>
						<th scope="row">적재정량</th>
						<td>${resultDetail.carry_capacity}kg</td>
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
						<td>${resultDetail.expire_date}</td>
					</tr>
					<tr>
						<th scope="row">현 할인할증 등급</span></th>
						<td>${resultDetail.extra_charge}</td>
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
			<table class="tbSt02">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>	
			<tbody>	
					<tr>
						<th scope="row">대인Ⅰ</th>
						<td>
							<c:if test="${resultDetail.person1_coverage eq 'Y'}">가입</c:if>
							<c:if test="${resultDetail.person1_coverage eq 'N'}">미가입</c:if>	
						</td>
					</tr>
					<tr>
						<th scope="row">대인Ⅱ</th>
						<td>
							<c:if test="${resultDetail.person2_coverage eq 'Y'}">가입</c:if>
							<c:if test="${resultDetail.person2_coverage eq 'N'}">미가입</c:if>	
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
							<c:if test="${resultDetail.selfcar_coverage eq 'Y'}">가입</c:if>
							<c:if test="${resultDetail.selfcar_coverage eq 'N'}">미가입</c:if>	
						</td>
					</tr>
					<tr>
						<th scope="row">긴급출동</th>
						<td>
							<c:if test="${resultDetail.emergency_call eq 'Y'}">가입</c:if>
							<c:if test="${resultDetail.emergency_call eq 'N'}">미가입</c:if>	
						</td>
					</tr>
					<tr>
						<th scope="row">법률비용지원</th>
						<td>
							<c:if test="${resultDetail.law_expense eq 'Y'}">가입</c:if>
							<c:if test="${resultDetail.law_expense eq 'N'}">미가입</c:if>	
						</td>
					</tr>
					<tr>
						<th scope="row">적재물</th>
						<td>
							<c:if test="${resultDetail.luggage_coverage eq 'Y'}">가입</c:if>
							<c:if test="${resultDetail.luggage_coverage eq 'N'}">미가입</c:if>	
						</td>
					</tr>
					
				</tbody>
			</table>
			<c:if test="${resultDetail.replyAt eq 'Y'}">
			<div class="answerBox">
				<div class="answerTit">
					<h3>답변</h3>
					<span class="date">등록일  <c:out value="${resultDetail.replyTime}"/></span>
				</div><!--// 답변타이틀 -->
				<div class="answer">
					<c:out value="${resultDetail.replyContentHtml}" escapeXml="false"/>
				</div>
			</div>
			</c:if>
			<c:if test="${resultDetail.replyAt eq 'N'}">
			<div class="answerBox">
				<div class="answerTit">
					<h3>미등록</h3>
					<span class="date"></span>
				</div><!--// 답변타이틀 -->
				<div class="answer">
					<p>아직 답변이 등록되지 않았습니다.</p>
				</div>
			</div>
			</c:if>
			<div class="btn_r_area">
				<a href="#;" onclick="hwamulList(); return false;" class="btn btn-gray">이전</a>
			</div>
		</article>
		</form:form>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>