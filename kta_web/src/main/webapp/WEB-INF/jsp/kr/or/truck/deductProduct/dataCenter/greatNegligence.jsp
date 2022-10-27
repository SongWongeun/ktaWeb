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
						<h2><img src="/images/truck/dedu/datacenter_tit.gif" alt="보상관련정보" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/deductProductIndex.do" >보상관련정보</a>
						<span>12대 중과실</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/datacenter_con_tit.gif" alt="12대 중과실이란? 교통사고처리특례법상 종합보험 가입여부와 관계없이 운전자가 형사 처벌되는 사고로서 다음과 같습니다." /></p>				
					<div class="conSection">
						<!-- 11대 중과실 -->
						<h3 class="hide">12대 중과실</h3>						
						<!-- 1 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg01">
								<p class="greatTxt1">1&#46; 신호위반</p>
								<p class="greatTxt2">교통정리를 위한 경찰관&#40;전투경찰&#44; 의무경찰&#44; 모범운전자&#44; 헌병 등 포함&#41;의 신호나 지시를 위반하고 운전한 경우와 신호기의 신호를 따르지 않고 위반하다가 사고가 발생한 경우를 말합니다&#46; 비보호 좌회전 표시가 있는 곳에서 본인의 진행신호가 직진신호이던 적색신호이든 좌회전 하다가 다른 차량의 진로를 방해하여 사고가 발생하면 신호 위반입니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 2 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg02">
								<p class="greatTxt1">2&#46; 중앙선침범</p>
								<p class="greatTxt2">도로의 중앙선을 완전히 넘어 반대차선으로 들어가는 경우뿐 아니라 차체의 일부가 중앙선을 일부 물고 넘어가도 중앙선 침범이 됩니다&#46; 그러나 다른 자동차에 추돌 당하여 중앙선을 침범하거나 눈길 또는 빙판에 미끄러져 중앙선을 침범한 경우 등과 같이 불가항력적이거나 만부득이 한 경우에는 중앙선침범사고로 보지 않습니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 3 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg03">
								<p class="greatTxt1">3&#46; 제한속도보다 20Km 이상 과속</p>
								<p class="greatTxt2">제한속도를 시속20Km 이상 초과하여 운전하다가 사고가 발생한 경우를 말합니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 4 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg07">
								<p class="greatTxt1">4&#46; 앞지르기 방법위반</p>
								<p class="greatTxt2">왼쪽에 위치한 차가 앞차와 나란히 진행하고 있거나&#44; 앞차가 다른 차를 앞지르고 있을 때&#44; 또는 교차로&#44; 도로의 경사진 곳&#44; 터널 안 등에서 앞지르기를 하다 발생한 사고를 말합니다&#46; &#40;도로교통법 제21조 제1항 &#183; 제22조 &#183; 제23조 또는 제60조 제2항&#41;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 5 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg08">
								<p class="greatTxt1">5&#46; 철길건널목 통과방법위반</p>
								<p class="greatTxt2">철길 건널목을 통과하고자 할 때에는 모든 차는 그 건널목 앞에서 일시 정지하고 안전함을 확인한 다음 통과하여야 합니다&#46;<br/>&#40;도로교통법 제 24조&#41;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 6 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg04">
								<p class="greatTxt1">6&#46; 횡단보도사고</p>
								<p class="greatTxt2">신호등이 있는 횡단보도에서의 사고는 신호위반으로&#44; 신호등이 없는 횡단보도에서의 사고는 보행자 보호의무위반으로 처리됩니다&#46; 그러나 자전거&#44; 오토바이를 타고 건너다 사고를 당한 피해자는 횡단보도 보행인으로 보호를 받지 못합니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 7 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg05">
								<p class="greatTxt1">7&#46; 무면허운전</p>
								<p class="greatTxt2">면허를 받지 않은 자가 운전하는 경우나&#44; 면허의 취소 또는 정지기간중의 운전&#44; 해당면허로 운전할 수 없는 차를 운전한 경우를 말합니다&#46; 그리고 무면허운전으로 사고가 발생하면 형사책임은 물론&#44; 종합보험에 가입해도 면책처리 되어 보험금을 받을 수 없게 됩니다&#46; &#40;대인배상 I은 지급가능&#41; 한편 벌점초과 등으로 면허증을 경찰서에 반납하였으나 취소 또는 정지처분을 받기 전에 사고를 야기한 경우에는 무면허 운전으로 보지 않습니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 8 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg06">
								<p class="greatTxt1">8&#46; 음주운전</p>
								<p class="greatTxt2">인체의 혈액 1ml에 대하여 0&#46;5mg 이상 또는 1L에 대하여 0&#46;25mg 이상 성분을 체내에 보유하고 운전한 경우와 혈중알콜농도 0&#46;05% 상태에서 운전한 경우 &#40;도로교통법 제44조 제1항 &#44; 동법 45조&#41;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 9 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg09">
								<p class="greatTxt1">9&#46; 보도를 침범</p>
								<p class="greatTxt2">보도가 설치된 도로의 보도를 침범하거나 보도횡단방법에 위반하여 교통사고가 발생한 경우를 말합니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 10 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg10">
								<p class="greatTxt1">10&#46; 승객추락방지의무위반</p>
								<p class="greatTxt2">승객의 추락방지의무를 위반하여&#40;문을 연 상태에서 차를 세우거나&#44; 출발한 경우를 말합니다&#41; 운전한 경우를 말합니다&#46;<br/>&#40;도로교통법 제 39조 제 2항&#41;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 11 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg11">
								<p class="greatTxt1">11&#46; 어린이보호구역 안전운전 의무위반</p>
								<p class="greatTxt2">어린이 보호구역에서 같은 조 제1항에 따른 조치를 준수하고 어린이의 안전에 유의하면서 운전하여야 할 의무를 위반하여 어린이의 신체를 상해에 이르게 한 경우를 말합니다&#46; &#40;도로교통법 제 12조 제 3항&#41;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!-- 12 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="greatArea bg12">
								<p class="greatTxt1">12&#46; 화물고정조치 위반</p>
								<p class="greatTxt2">자동차의 화물이 떨어지지 않도록 필요한 조치를 하지 않고 운전한 경우를 말합니다&#46; &#40;도로교통법 제 39조 제 4항&#41;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
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