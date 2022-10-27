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
<script type="text/javascript">
function printpage(){
	window.print();
}
</script>
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
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/asso/manage_tit.gif" alt="재무상태표" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">공제조합 소개</a>
						<span>재무상태표</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/manage_con_tit.gif" alt="화물공제조합은 우수한 재무구조를 갖추고 있는 건실한 회사 입니다" /></p>
					<div class="conSection">
						<div class="manageTop">
							<h3><img src="/images/truck/asso/manage_sub_tit.gif" alt="대차대조표" /></h3>
							<a title="새창열림" class="print" href="#;" onclick="printpage(); return false;"><span class="hide" onclick="">현재 화면을 프린트로 인쇄하기</span></a>
							<a href="/assocIntroduce/introduce/manageInfoListExcelDownload.do" class="save" title="엑셀로저장하기"><span class="hide">엑셀로 저장하기</span></a>
						</div>
						<div class="tbDetail1">
							<p class="tbInfo">&#40;단위 &#58; 백만원&#41;</p>
							<table class="tbDetail_st01" summary="구분,연도별, 구분항목별 금액을 확인할 수 있는 표입니다.">
								<caption>재무상태표</caption>
								<colgroup>
									<col style="width:15%;" />
									<col style="width:45%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" colspan="2">구분</th>
										<th scope="col">${curYearInfo.BBS_YEAR}년도</th>
										<th scope="col">${preYearInfo.BBS_YEAR}년도</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="11">자산</td>
										<td class="alL">&#8544;&#46; 유동자산</td>
										<td class="tbbg alR bold">${curYearInfo.YUDONG_JASAN}</td>
										<td class="tbbg alR bold">${preYearInfo.YUDONG_JASAN}</td>
									</tr>
									<tr>
										<td class="alL">&#40;1&#41; 당좌자산</td>
										<td class="alR">${curYearInfo.DANGJUA_JASAN}</td>
										<td class="alR">${preYearInfo.DANGJUA_JASAN}</td>
									</tr>
									<tr>
										<td class="alL pL25">1&#46; 현금 및 현금성자산</td>
										<td class="alR">${curYearInfo.HYUNGUM_JASAN}</td>
										<td class="alR">${preYearInfo.HYUNGUM_JASAN}</td>
									</tr>
									<tr>
										<td class="alL pL25">2&#46; 단기금융상품</td>
										<td class="alR">${curYearInfo.DANGI_GUMYUNG}</td>
										<td class="alR">${preYearInfo.DANGI_GUMYUNG}</td>
									</tr>
									<tr>
										<td class="alL pL25">3&#46; 기타유동자산</td>
										<td class="alR">${curYearInfo.ETC_YUDONG_JASAN}</td>
										<td class="alR">${preYearInfo.ETC_YUDONG_JASAN}</td>
									</tr>
									<tr>
										<td class="alL">&#8545;&#46; 비유동자산</td>
										<td class="alR">${curYearInfo.NOT_YUDNG_JASANG}</td>
										<td class="alR">${preYearInfo.NOT_YUDNG_JASANG}</td>
									</tr>
									<tr>
										<td class="alL">&#40;1&#41; 투자자산</td>
										<td class="alR">${curYearInfo.TOOJA_JASAN}</td>
										<td class="alR">${preYearInfo.TOOJA_JASAN}</td>
									</tr>
									<tr>
										<td class="alL pL25">1&#46; 장기금융상품</td>
										<td class="alR">${curYearInfo.JANGI_GUMYUNG}</td>
										<td class="alR">${preYearInfo.JANGI_GUMYUNG}</td>
									</tr>
									<tr>
										<td class="alL pL25">2&#46; 기타투자자산</td>
										<td class="alR">${curYearInfo.ETC_TOOJA_JASAN}</td>
										<td class="alR">${preYearInfo.ETC_TOOJA_JASAN}</td>
									</tr>
									<tr>
										<td class="alL">&#40;2&#41; 유형자산</td>
										<td class="alR">${curYearInfo.YOOHYUNG_JASAN}</td>
										<td class="alR">${preYearInfo.YOOHYUNG_JASAN}</td>
									</tr>
									<tr>
										<td class="tbbg">자산계</td>
										<td class="tbbg alR bold">${curYearInfo.JASAN_AMT}</td>
										<td class="tbbg alR bold">${preYearInfo.JASAN_AMT}</td>
									</tr>
									<tr>
										<td rowspan="10" class="bB2">부채와 자본</td>
										<td class="alL">&#8544;&#46; 유동부채</td>
										<td class="alR">${curYearInfo.YUDONG_BOOCHAE}</td>
										<td class="alR">${preYearInfo.YUDONG_BOOCHAE}</td>
									</tr>
									<tr>
										<td class="alL">&#8545;&#46; 비유동부채</td>
										<td class="alR">${curYearInfo.NOT_YUDNG_BOOCHAE}</td>
										<td class="alR">${preYearInfo.NOT_YUDNG_BOOCHAE}</td>
									</tr>
									<tr>
										<td class="alL">&#8546;&#46; 책임준비금</td>
										<td class="alR">${curYearInfo.CHAECKIM_JUNBI}</td>
										<td class="alR">${preYearInfo.CHAECKIM_JUNBI}</td>
									</tr>
									<tr>
										<td class="alL">&#8547;&#46; 비상위험준비금</td>
										<td class="alR">${curYearInfo.BISANG_AMT}</td>
										<td class="alR">${preYearInfo.BISANG_AMT}</td>
									</tr>
									<tr>
										<td class="alL">&#8548;&#46; 기타준비금</td>
										<td class="alR">${curYearInfo.ETC_JUNBI}</td>
										<td class="alR">${preYearInfo.ETC_JUNBI}</td>
									</tr>
									<tr>
										<td class="tbbg">부채계</td>
										<td class="tbbg alR bold">${curYearInfo.BOOCHAE_AMT}</td>
										<td class="tbbg alR bold">${preYearInfo.BOOCHAE_AMT}</td>
									</tr>
									<tr>
										<td class="alL">&#8544;&#46; 자본금</td>
										<td class="alR">${curYearInfo.JABONE_AMT}</td>
										<td class="alR">${preYearInfo.JABONE_AMT}</td>
									</tr>
									<tr>
										<td class="alL">&#8545;&#46; 이익잉여금</td>
										<td class="alR">${curYearInfo.EICK_AMT}</td>
										<td class="alR">${preYearInfo.EICK_AMT}</td>
									</tr>
									<tr>
										<td class="tbbg">자본계</td>
										<td class="tbbg alR">${curYearInfo.JABONE_TOT_AMT}</td>
										<td class="tbbg alR">${preYearInfo.JABONE_TOT_AMT}</td>
									</tr>
									<tr>
										<td class="tbbg bold">부채와 자본 계</td>
										<td class="tbbg alR bold">${curYearInfo.TOTAL_AMT}</td>
										<td class="tbbg alR bold">${preYearInfo.TOTAL_AMT}</td>
									</tr>
								</tbody>
							</table>
						</div>
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