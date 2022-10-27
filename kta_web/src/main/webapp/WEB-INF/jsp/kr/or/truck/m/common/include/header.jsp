<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javaScript" language="javascript" defer="defer">
	function mobileSearch(){	var searchKeyword = $("#searchKeyword").val();
		if(searchKeyword.trim() == ""){
			alert("검색어를 입력해주십시오.");
			return false;
		}
		searchKeyword = encodeURIComponent($("#searchKeyword").val());
		var query = "/m/search.do?searchKeywordT="+searchKeyword;
		window.location.href= query;
	}
	</script>
	<header id="subheader">
		<h1><a href="/m/main.do"><img src="/images/m_truck/com/sub_logo.png" alt="KTA전국화물자동차운송사업자공제조합" /></a></h1>
		<h2 class="btn_seach" ><img src="/images/m_truck/com/btn_search.png" alt="검색" /></h2>
		<div id="searchConts">
			<p class="searchForm">
				<input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색 키워드를 입력해주세요.">
				<a class="btn" href="#;" onclick="mobileSearch();"><i class="icon-search"></i></a>
			</p>
		</div>
		<a href="#;" onclick="rightMenuOpen();" class="btn_navi"><img src="/images/m_truck/com/btn_navi.png" alt="메뉴" /></a>
	</header>
	