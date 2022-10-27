<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	$(".borderSt01").click();
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			searchForm();
			return false;
		}
	});
});
function searchForm(){
	var keyword = document.searchForm.searchKeywordTotal.value;
	if(keyword == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}else{
	document.searchForm.searchKeywordT.value = keyword;
	document.searchForm.action = "<c:url value='/main/totalSearch.do'/>";
	document.searchForm.submit();
	}
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
</script>
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
						<h2><img src="/images/truck/dedu/term_tit.gif" alt="공제약관" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/carDeductInfo.do" >공제약관</a>
						<span>적재물공제약관</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/carDed_con_tit.gif" alt="화물공제조합 적재물공제약관입니다. 약관제목을 선택하시면, 다운로드 가능합니다." /></p>				
					<div class="conSection">
						<!-- 적재물공제약관 -->
						<h3 class="deduh3Tit termBg">적재물공제약관</h3>
						<div class="list01">
							<h4 class="deduH4 borderSt01 "><span>계약자께서 아셔야 할 사항</span></h4>
							<div class="deduDiv borderSt01">
								<p class="txtPoint01">약관은 꼭 한번 이상 읽어보십시오&#46;</p>
								<ul class="txtListst04">
									<li>이 약관은 계약자 여러분께서 체결한 적재물배상책임공제 계약의 권리 의무와 중요 내용에 관한 규정이므로 꼭 읽어보시기 바랍니다&#46;</li>
								</ul>
								<p class="txtPoint01">청약서는 본인이 정확히 작성하여 주십시요&#46;</p>
								<ul class="txtListst04">
									<li>청약서상의 등록번호&#44; 차종&#44; 보상한도액&#44; 자기부담금&#44; 년간 매출액 등 기재사항을 정확히 작성하고 반드시 확인하신 후 계약자가 직접 서명&#44; 날인하여 주십시요&#46;</li>
								</ul>
								<p class="txtPoint01">청약서 기재사항의 변동사항은 알려 주십시요&#46;</p>
								<ul class="txtListst04">
									<li>청약서상에 질문한 사항에 대하여 변동이 있는 경우 사실대로 상세히 알려 주십시요&#46; 만약 계약 후 알릴의무 사항에 대하여 알리지 아니하였거나 알리신 내용이 사실과 다른 경우에는 계약이 해지되고 공제금 등이 지급되지 않는 경우가 있습니다&#46;</li>
								</ul>
								<p class="txtPoint01">사고발생 시 다음 사항을 즉시 알려주십시요&#46;</p>
								<ul class="txtListst04">
									<li>사고발생의 때&#44; 곳&#44; 피해자의 주소와 성명&#44; 사고상황 및 이들의 증인이 있을 경우 그 주소와 성명&#46;</li>
									<li>제3자로부터 손해배상 청구를 받았을 경우 또는 손해배상책임에 관한 소송을 제기 받았을 경우에는 조합에 곧 알려 주십시요&#46;</li>
								</ul>
							</div><!--// 계약자께서 아셔야 할 사항 -->
							<h4 class="deduH4 borderSt02 "><span>적재물 공제약관 개정연혁</span></h4>
							<div class="deduDiv borderSt02">
								<p class="txtPoint01">적재물배상책임공제 약관 개정 연혁</p>
								<table class="tbDetail_st01" summary="적재물 공제약관 개정연혁정보 테이블 입니다">
									<caption>적재물 공제약관 개정연혁에 대해서 나타낸 표</caption>
									<colgroup>
										<col style="width:18%;" />
										<col style="width:20%;" />
										<col style="width:47%;" />
										<col style="width:15%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">승인일자</th>
											<th scope="col">승인번호</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>제정</td>
											<td>2004&#46; 12&#46; 30</td>
											<td>물류산업과 &#45; 2480호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제 1차 개정</td>
											<td>2005&#46; 03&#46; 23</td>
											<td>물류산업과 &#45; 683호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제 2차 개정</td>
											<td>2005&#46; 12&#46; 07</td>
											<td>물류산업팀 &#45; 702호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제 3차 개정</td>
											<td>2009&#46; 03&#46; 25</td>
											<td>자동차손해보장팀 &#45; 675호</td>
											<td>&nbsp;</td>ㅇ
										</tr>
										<tr>
											<td>제 4차 개정</td>
											<td>2011&#46; 06&#46; 03</td>
											<td>자동차생활과 &#45; 2360호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제 5차 개정</td>
											<td>2012&#46; 04&#46; 10</td>
											<td>자동차운영과 &#45; 1106호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제 6차 개정</td>
											<td>2017&#46; 01&#46; 05</td>
											<td>자동차운영보험과 &#45; 95호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제 7차 개정</td>
											<td>2017&#46; 09&#46; 14</td>
											<td>자동차운영보험과 &#45; 5044호</td>
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</div><!--// 적재물 공제약관 개정연혁 -->
						</div>
						<p class="tbRbtn"><img src="/images/truck/btn/btn_dreader.gif" alt="Get ADOBE READER 공제약관을 보시려면 Acrobat Reader를 설치하셔야 합니다." /></p>
						<table class="tbDetail_st01 mB0 tbTerm" summary="적재물공제약관 상세정보 테이블 입니다.">
							<caption>적재물공제약관에 대해서 나타낸 표</caption>
							<colgroup>
								<col style="width:40%;" />
								<col style="width:*;" />
								<col style="width:15%;" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>적재물공제약관</span></th>
									<td class="bB2"></td>
									<td class="alC bB2"><span class="btn_pack btn_type07 icon"><span class="acrob"></span><a href="/cmm/fms/FileDown.do?atchFileId=FILE_000000000007815&fileSn=0">다운로드</a></span></td>
								</tr>
							</tbody>
						</table><!--// 적재물공제약관표 e -->
					</div><!--// conSection e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<!--// container e -->
		<hr />
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->

</body>
</html>