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

<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}'
	if(param == 'regist.success'){
	 param = '등록이';
	}else if(param == 'update.success'){
		param='수정이';
	}else if(param == 'delete.success'){
		param ='삭제가';
	}
	alert('글'+param+' 완료되었습니다.');
});
</script>
</c:if>
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
 						<h2><img src="/images/truck/cust/fraud_tit.gif" alt="보험사기제보" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/customer/customerIndex.do">고객문의</a>
						<span>보험사기신고센터</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cust/fraud_con_tit.gif" alt="화물공제조합 보험사기신고 센터 입니다." /></p>
					<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea manBg">
								<p class="lossTxt1">보험사기 신고대상</p>
								<p class="lossTxt2"> ◦ 고의사고, 위장사고</br>◦ 허위 공제계약</br>◦ 병원 및 정비업체의 허위, 부당 청구</br>◦ 기타 보험사기</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
					<div class="conSection">
						<div class="fraudArea">
						<h3>&nbsp;</h3>
							<ol>
								<li>본인인증</li>
								<li>신고등록</li>
								<li class="lineH">담당자<br />신고내역확인</li>
								<li class="last ">회신답변전달</li>
							</ol>
						</div>
						<ul class="goPage mB0">
							<li class="pL16"><a href="/customer/fraud/viewRegistBoard.do"><img src="/images/truck/cust/fraud_question.gif" alt="신고하기" /></a></li>
							<li class="pL68"><a href="/customer/fraud/oaoFraudList.do"><img src="/images/truck/cust/fraud_result.gif" alt="신고결과확인" /></a></li>
						</ul>
					</div>
				</div><!--// conaArea e -->
				
				<p class="txtPoint01" style="margin-top:35px;"> <b>■ 보험사기 신고 시 처리절차 </b></p>
				<div class="roundBox02" style="margin-top:5px;">
					<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
					<!-- 내용 -->
					<div class="lossSide4">
						<ul class="lossListst01" style="padding:18px 22px 20px 22px;">
							<li>처리절차 : 신고접수 → 제보자 면담 → 사실관계 조사 → 수사기관 의뢰 → 검찰송치(기소의견) → 포상금지급(제보자통보)</li>
							<li>포상금 지급대상 : 신고이후 보험사기 적발 시(검찰송치 기준)</li>
							<li>포상금 지급제외 대상 : 익명제보 또는 이미 조사 중 이거나 중복 제보한 경우</li>
							   
						</ul>
					</div>							
					<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
				</div>
				<p class="txtPoint01" style="margin-top:35px;"> <b>■ 기타 접수방법</b></p>
				<div class="roundBox02" style="margin-top:5px;">
					<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
					<!-- 내용 -->
					<div class="lossSide4">
						<ul class="lossListst01" style="padding:18px 22px 20px 22px;">
							<li>전화 민원 접수 : 보험사기 신고센터(02-3483-3807)로 연락하여 접수</li>
							<li>우편/팩스 접수 : 보험사기 신고 양식을 출력하여 팩스 또는 우편으로 접수(성명, 주소, 연락처, 계약정보 기재 필수)</li>
							<li>주소 : (06551) 서울특별시 서초구 동작대로 230 화련회관 9층 보험사기신고센터  팩스 : 02-3483-3897 </li>
							   
						</ul>
					</div>							
					<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
				</div>
				</br>
				<table class="tbDetail_st01 mB0 tbTerm" summary="보험사기 신고작성 서류에 대해서 나타낸 테이블 입니다.">
					<caption>보험사기 신고작성 서류에 대해서 나타낸 표</caption>
					<colgroup>
						<col style="width:40%;" />
						<col style="width:*;" />
						<col style="width:15%;" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" ><span>제보확인서</span></th>
							<td class="bB2"></td>
							<td class="alC bB2"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/cmm/fms/FileDown.do?atchFileId=FILE_000000000007859&fileSn=0">다운로드</a></span></td>
						</tr>
						<tr>
							<th scope="row" ><span>개인(신용)정보 수집·이용 및 제공 동의서</span></th>
							<td class="bB2"></td>
							<td class="alC bB2"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/cmm/fms/FileDown.do?atchFileId=FILE_000000000007860&fileSn=0">다운로드</a></span></td>
						</tr>
					</tbody>
				</table><!--// 보험사기 신고작성 서류에 대해서 나타낸 표 e --></br></br>
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