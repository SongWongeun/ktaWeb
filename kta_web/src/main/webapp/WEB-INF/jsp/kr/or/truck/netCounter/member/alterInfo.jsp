<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
function searchZip(){
	var addr = "/netCounter/memberPage/myPage/searchZip.do";
	window.open(addr,'우편번호검색','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=600,height=600 top=10 left=10');
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
 						<h2><img src="/images/truck/net/member_tit.gif" alt="회원정보관리" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<span>회원정보관리</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/member_con_tit.gif" alt="아래 내용을 확인 하신 후, 정확히 입력해 주시기 바랍니다" /></p>
					<div class="conSection">
						<p class="mebInfo"><span class="user">현대로직스 조합원 님</span>의 회원정보입니다&#46;</p>
						<!-- 회원정보변경 s -->
						<div class="tbWork1">
							<table class="tbWork_st03" summary="회원정보변경 테이블 입니다.">
								<caption>회원정보변경에 대해서 나타낸 표</caption>
								<colgroup>
									<col width="30%" />
									<col width="70%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">상호</th>
										<td>한상종합물류</td>
									</tr>
									<tr>
										<th scope="row">대표자</th>
										<td>윤재길</td>
									</tr>
									<tr>
										<th scope="row">법인번호</th>
										<td>135011&#45;097557</td>
									</tr>
									<tr>
										<th scope="row">사업자등록번호</th>
										<td>134&#45;81&#45;50025</td>
									</tr>
									<tr>
										<th scope="row">가입지부</th>
										<td>서울지부</td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td>
											<p class="mB3">
												<label class="hide" for="zip1">우편번호앞자리</label><input type="text" id="" title="우편번호앞자리" name="zip1" style="width:100px" class="txt" />
												<span>&#45;</span>
												<label class="hide" for="zip2">우편번호뒷자리</label><input type="text" id="" title="우편번호뒷자리" name="zip2" style="width:100px" class="txt" />
												<a href="#;" onclick="searchZip();" class="btn_pack btn_type15"><span>우편번호</span></a>
											</p>
											<p>
												<label class="hide" for="addr1">주소</label><input type="text" id="" title="주소" name="addr1" style="width:250px" class="txt" />
												<label class="hide" for="addr2">상세주소</label><input type="text" id="" title="상세주소" name="addr2" style="width:300px" class="txt" />
											</p>
										</td>
									</tr>
									<tr>
										<th scope="row">전화번호</th>
										<td>
											<select id="teleNum1" name="teleNum1" title="지역번호 선택" style="width:95px">
												<option value="02">02</option>
												<option value="031">031</option>
											</select>
											<span>&#45;</span>
											<label class="hide" for="teleNum2">전화번호 중간자리</label><input type="text" id="" title="전화번호 중간자리" name="teleNum2" style="width:95px" class="txt" />
											<span>&#45;</span>
											<label class="hide" for="teleNum3">전화번호 끝자리</label><input type="text" id="" title="전화번호 중간자리" name="teleNum3" style="width:95px" class="txt" />
										</td>
									</tr>
									<tr>
										<th scope="row">팩스번호</th>
										<td>
											<select id="faxNum1" name="faxNum1" title="팩스번호 선택" style="width:95px">
												<option value="02">02</option>
												<option value="031">031</option>
											</select>
											<span>&#45;</span>
											<label class="hide" for="faxNum2">전화번호 중간자리</label><input type="text" id="" title="팩스번호 중간자리" name="faxNum2" style="width:95px" class="txt" />
											<span>&#45;</span>
											<label class="hide" for="faxNum3">전화번호 끝자리</label><input type="text" id="" title="팩스번호 중간자리" name="faxNum3" style="width:95px" class="txt" />
										</td>
									</tr>
									<tr>
										<th scope="row">이메일</th>
										<td>
											<label class="hide" for="userEmail1">이메일 주소</label><input type="text" id="userEmail1" name="userEmail1" title="이메일 아이디" style="width:110px" class="txt"  />
											<span>&#64;</span>
											<select id="userEmail2" name="userEmail2" title="이메일서비스계정 선택" style="width:150px">
												<option value="">직접 입력</option>
												<option value="gmail.com">gmail.com</option>
											</select>
											<input name="agreeEmail" id="agreeEmail" type="checkbox" checked="" value=""  class="check"/><label for="agreeEmail">통합안내 이메일수정</label>
										</td>
									</tr>
									<tr>
										<th scope="row">핸드폰</th>
										<td>
											<div class="flL">
												<select id="mobNum1" name="mobNum1" title="핸드폰 통신사 선택" style="width:95px">
													<option value="010">010</option>
													<option value="011">011</option>
												</select>
												<span>&#45;</span>
												<label class="hide" for="mobNum2">핸드폰 중간자리</label><input type="text" id="" title="핸드폰 중간자리" name="mobNum2" style="width:95px" class="txt" />
												<span>&#45;</span>
												<label class="hide" for="mobNum3">핸드폰 끝자리</label><input type="text" id="" title="핸드폰 중간자리" name="mobNum3" style="width:95px" class="txt" />
											</div>
											<div class="desc01">
												<dl>
													<dt>문자수신동의여부</dt>
													<dd>
														<input name="agreeSMS" id="agreeSMS" type="radio" checked="" value=""  class="" /><label for="agreeSMS">받습니다</label>
														<input name="voteSMS" id="voteSMS" type="radio" checked="" value=""  class="" /><label for="voteSMS">받지 않습니다</label>
													</dd>
												</dl>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<table class="tbWork_st03" summary="회원정보변경 테이블 입니다.">
								<caption>회원정보변경에 대해서 나타낸 표</caption>
								<colgroup>
									<col width="30%" />
									<col width="70%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">아이디</th>
										<td>test</td>
									</tr>
									<tr>
										<th scope="row">비밀번호</th>
										<td>
											<label class="hide" for="userPw1">비밀번호</label><input name="userPw1" class="txt" id="userPw1" type="password" style="width:150px"/>
											<span class="desc02">6&#126;8자 영문자&#47;숫자 혼용가능</span>
										</td>
									</tr>
									<tr>
										<th scope="row">비밀번호 확인</th>
										<td>
											<label class="hide" for="userPw2">비밀번호 확인</label><input name="userPw2" class="txt" id="userPw2" type="password" style="width:150px"/>
											<span class="desc02">비밀번호를 확인 하기 위해 입력하신 비밀번호를 다시 입력하세요</span>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;">확인</a></span>
								<span class="btn_pack btn_type10 icon"><span class="check"></span><a href="#;">취소</a></span>
							</div>
						</div><!--// 회원정보변경 e -->
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



