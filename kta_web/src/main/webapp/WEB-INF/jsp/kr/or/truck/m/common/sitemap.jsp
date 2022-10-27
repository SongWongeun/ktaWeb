<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="rightMenu">
	<div class="menuAll">
		<a href="#;" onclick="rightMenuClose(); return false;" class="close">전체메뉴<span class="conts_hidden">닫기</span></a>
		<ul>
			<!-- <li><a href="/m/netCounter/index.do" class="menu01">인터넷창구</a>
				<ul>
					<li><a href="/m/netCounter/index.do">마이페이지</a></li>
				<c:choose>
						<c:when test="${loginVO.agentCd == '1' }">
							<li><a href="/m/netCounter/contract/carStatus/list.do">계약조회</a></li>
							<li><a href="/m/netCounter/compensation/accident/list.do">보상정보조회</a></li>
						</c:when>
						<c:when test="${loginVO.agentCd == '2' }">
							<li><a href="/m/netCounter/contract/carStatus/list.do">계약관리</a></li>
							<li><a href="/m/netCounter/compensation/accident/list.do">보상정보조회</a></li>
						</c:when>
						<c:when test="${loginVO.agentCd == '3' }">
							<li><a href="/m/netCounter/pay/list.do">지급내역조회</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/m/netCounter/contract/carStatus/list.do">계약조회</a></li>
							<li><a href="/m/netCounter/compensation/accident/list.do">보상정보조회</a></li>
							<li><a href="/m/netCounter/pay/list.do">지급내역조회</a></li>						
						</c:otherwise>
				</c:choose>
					<li><a href="/m/netCounter/userInfo/view.do">회원정보관리</a></li>
				</ul>
			</li> -->
			<li><a href="/m/joinInfo/index.do" class="menu02">가입안내</a>
				<ul>
					<li><a href="/m/joinInfo/productInfo/main.do">상품안내</a></li>
					<li><a href="/m/joinInfo/deductTerms/car/view.do">공제약관</a></li>
					<li><a href="/m/joinInfo/contractGuide/car/view.do">계약시 유의사항</a></li>
					<li><a href="/m/deductProduct/privateHwamul/mHwamulInfo.do">개인화물 가입상담</a></li>
				</ul>
			</li>
			<li><a href="/m/compensationInfo/index.do" class="menu03">보상안내</a>
				<ul>
					<li><a href="/m/compensationInfo/amountCharge/view.do">공제금청구안내</a></li>
					<li><a href="/m/compensationInfo/accidentProcess/manObject/view.do">사고처리절차</a></li>
				</ul>
			</li>
			<li><a href="/m/customer/index.do" class="menu04">고객광장</a>
				<ul>
					<li><a href="/m/customer/inquiry/main/view.do">고객문의</a></li>
					<li><a href="/m/customer/praise/list.do">칭찬합시다</a></li>
					<li><a href="/m/customer/cleanCenter/view.do">클린센터</a></li>
				</ul>
			</li>
			<li><a href="/m/infoLounge/index.do" class="menu05">정보마당</a>
				<ul>
					<li><a href="/m/infoLounge/deductNews/list.do">공제소식</a></li>
					<!-- <li><a href="/m/infoLounge/scholarship/info/view.do">장학사업</a></li> -->
					<li><a href="/m/infoLounge/recommandCompany/list.do">우수협력업체</a></li>
				</ul>
			</li>
			<li><a href="/m/cyberPr/index.do" class="menu06">사이버홍보관</a>
				<ul>
					<li><a href="/m/cyberPr/driverDay/list.do">운전자의 날</a></li>
					<li><a href="/m/cyberPr/thirty/list.do">화물공제 30년사</a></li>
					<li><a href="/m/cyberPr/accidentPrevention/list.do">사고예방활동</a></li>
					<!-- <li><a href="/m/cyberPr/truckEcho/list.do">트럭메아리</a></li> -->
					<li><a href="/m/cyberPr/prMovie/list.do">홍보영상</a></li>
				</ul>
			</li>
			<li><a href="/m/associationIntroduce/index.do" class="menu07">조합소개</a>
				<ul>
					<li><a href="/m/associationIntroduce/greeting/view.do">인사말</a></li>
					<li><a href="/m/associationIntroduce/vision/view.do">설립목적</a></li>
					<li><a href="/m/associationIntroduce/office/view.do">지부안내</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

<script type="text/javascript">
/* loading 페이지*/
$(window).load(function(){
	$('#loading_page').height( $('body').height() );
});
</script>
<div id="loading_page" style="width: 100%; position: fixed;top:0px;display:none;height: 100%;z-index: 1000;">
	<table style="width: 100%;height: 100%;z-index: 1001;position: fixed;"><tbody><tr><td style="vertical-align: middle;">
		<img src="/images/ajax-loader.gif" id="loaderImg" style="left: 49%; position: absolute; "/>
	</td></tr></tbody></table>
	<div style="width: 100%;height: 100%;background-color: white;position: fixed; opacity: 0.5;filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=40);filter: alpha(opacity=50);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";" >
	</div>
</div>