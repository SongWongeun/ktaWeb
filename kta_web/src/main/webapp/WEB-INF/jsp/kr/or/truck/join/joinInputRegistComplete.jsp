<%@page import="Kisinfo.Check.IPINClient"%>
<%@page import="NiceID.Check.CPClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
$(window).load(function(){
	alert('회원가입이 완료되었습니다.');
	location.href='/login.do';
});
</script>
<style type="text/css">
.formError{display: block;margin: 10px 0px;color: #F00;font-weight: bolder;/* background-color: #FF7; */padding: 5px;}
</style>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<%-- <!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e --> --%>
		<!-- header s -->
		<div id="headerWrap" style="height:133px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA | 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<!-- 20161130 삭제
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림" ><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
						//20161130 삭제 -->
						<!-- <li><a href="#;"><img src="/images/truck/main/util01.gif" alt="직원마당" /></a></li> -->
						<c:choose>
							<c:when test="${not empty loginVO }">
								<li><a href="/netCounter/memberPage/myPage/myInfo.do"><img src="/images/truck/main/util04.gif" alt="마이페이지" /></a></li>
							<li><a href="/logout.do"><img src="/images/truck/main/logout.gif" alt="로그아웃" /></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/join/terms/view.do"><img src="/images/truck/main/util02.gif" alt="회원가입" /></a></li>
								<li><a href="/login.do"><img src="/images/truck/main/util03.gif" alt="로그인" /></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<div class="gnbSubGo">
						<a href="/main/guide.do"><img src="/images/truck/main/guide.gif" alt="이용안내가이드" /></a>
						<!-- <a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a> -->
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<span class="ut_search"><label for="search">검색어</label><input type="text" name="search" title="검색어 입력" /></span>
						<a class="btn_ut_search" href="/main/totalSearch.do"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
					</div>
				</div>
				<!-- gnb s --><!-- subDep01까지만 노출 depth03부터는 display:none과 display:block로 컨트롤  -->
				<div class="gnb" id="Gnb">
					<ul class="gnbList">
						<li class="gnb1Dep01 "><a class="menu1" href="/netCounter/memberPage/myPage/myInfo.do"><span class="hide">인터넷창구</span></a>
						</li><!--// gnb1Dep01 인터넷창구 e -->
						<li class="gnb1Dep02 "><a class="menu2" href="/infoLounge/infoLoungeIndex.do"><span class="hide">정보마당</span></a>
						</li><!--// gnb1Dep02 정보마당 e -->
						<li class="gnb1Dep03 "><a class="menu3" href="/deductProduct/deductProductIndex.do"><span class="hide">공제상품</span></a>
						</li><!--// gnb1Dep03 공제상품 e -->
						<li class="gnb1Dep04 "><a class="menu4" href="/customer/customerIndex.do"><span class="hide">고객광장</span></a>
						</li><!--// gnb1Dep04 고객광장 e -->
						<li class="gnb1Dep05"><a class="menu5" href="/assocIntroduce/assocIntroduceIndex.do"><span class="hide">조합소개</span></a>
						</li><!--// gnb1Dep05 조합소개 e -->
						<li class="gnb1Dep06 "><a class="menu6" href="/cyberPr/cyberPrIndex.do"><span class="hide">사이버홍보관</span></a>
						</li><!--// gnb1Dep06 사이버홍보관 e -->
					</ul>
					<!-- 컨트롤버튼 -->
					<!-- <a href="#;" title="메뉴열기버튼" class="btn_memuopen" ><span class="hide">메뉴열기</span></a>
					<a href="#;" title="메뉴를 고정시킵니다." class="btn_pause pause_on" ><span>고정</span></a> --><!-- 고정버튼 눌렀을 경우 class명 pause_on 추가 -->
					<a href="#;" title="메뉴를 닫습니다." class="btn_close" ><span>닫기</span></a>
				</div><!-- // gnb e -->
			</div>
		</div>
		<hr />
		<!--// header e -->
		
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/join_tit02.gif" alt="회원정보입력" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>회원가입</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/member_con_tit.gif" alt="아래 내용을 확인 하신 후, 정확히 입력해 주시기 바랍니다" /></p>
					<!-- 20161130 추가 -->
					<div class="joinStep">
						<img src="/images/truck/net/img_join_step04.gif" alt="약관동의, 실명인증, 사업자 정보확인, 회원정보 확인 중 회원정보 확인 단계" />	<!-- 20161206 수정 -->
					</div>
					<!-- //20161130 추가 -->
					<div class="conSection">
						<form:form id="f" name="f" commandName="joinVO" action="/join/input/actRegist.do">
						<fieldset>
						<legend>회원가입</legend>
							<form:hidden path="jumin1" />
							<form:hidden path="jumin2" />
							<form:hidden path="sName" />
								<!-- 회원정보입력 s -->
								<div class="tbWork1">
									<!-- 20161130 추가 -->
									<table class="tbWork_st03 mB10" summary="회원정보입력 테이블 입니다.">
									<!-- //20161130 추가 -->
										<caption>회원정보입력에 대해서 나타낸 표</caption>
										<colgroup>
											<col width="30%" />
											<col width="70%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">회원구분</th>
												<td>
													<form:radiobutton path="agent_cd" value="1" /><label for="">조합원</label>
													<form:radiobutton path="agent_cd" value="2" /><label for="">차량관리자</label>
													<form:radiobutton path="agent_cd" value="3" /><label for="">거래처</label>
													<span class="desc02">회원구분 정확히 체크 요망</span>
													<form:errors cssClass="formError" path="agent_cd" />
												</td>
											</tr>
										</tbody>
									</table>
									<div class="tbWork1">
										<table class="tbWork_st03" summary="회원정보입력 테이블 입니다.">
											<caption>회원정보입력에 대해서 나타낸 표</caption>
											<colgroup>
												<col width="30%" />
												<col width="70%" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">대표자명</th>
													<td>
														<label class="hide" for="name">대표자명</label>
														<form:input path="name" class="txt" style="width:250px"  />
														<form:errors cssClass="formError" path="name" />
													</td>
												</tr>
												<%--<tr>
													<th scope="row">주민등록번호</th>
													<td><label class="hide" for="">주민등록번호</label><input name="" class="txt" id="" type="text" style="width:250px" value=""/></td>
												</tr>
												<tr>
													<th scope="row">ID</th>
													<td><label class="hide" for="">ID</label><input name="" class="txt" id="" type="text" style="width:250px" value=""/></td>
												</tr>
												<tr>
													<th scope="row">비밀번호</th>
													<td>
														<label class="hide" for="p_password">비밀번호</label>
														<input name="p_password" class="txt" id="p_password" type="password" style="width:250px" value=""/>
														<span class="desc02">6&#126;8자 영문자&#47;숫자 혼용가능</span>
													</td>
												</tr>
												<tr>
													<th scope="row">비밀번호 확인</th>
													<td>
														<label class="hide" for="p_confirmPassword">비밀번호 확인</label>
														<input name="p_confirmPassword" class="txt" id="p_confirmPassword" type="password" style="width:250px" value=""/>
														<span class="desc02">비밀번호를 확인 하기 위해 입력하신 비밀번호를 다시 입력하세요</span>
													</td>
												</tr>--%>
												<tr>
													<th scope="row">사업자등록번호</th>
													<td>
														<label class="hide" for="saupnum">사업자등록번호</label>
														<form:input path="saupnum" class="txt" style="width:250px"  />
														<form:errors cssClass="formError" path="saupnum" />
														<form:errors cssClass="formError" path="jumin1" />
													</td>
												</tr>
												<tr>
													<th scope="row">회사명</th>
													<td>
														<label class="hide" for="comname">회사명</label>
														<form:input path="comname" class="txt" style="width:250px"  />
														<form:errors cssClass="formError" path="comname" />
													</td>
												</tr>
												<tr>
													<th scope="row">주소</th>
													<td>
														<!-- 20161130 삭제
														<p class="mB3">
															<label class="hide" for="post1">우편번호앞자리</label>
															<form:input path="post1" class="txt" style="width:100px;"  readonly="readonly" />
															<span>&#45;</span>
															<label class="hide" for="post2">우편번호뒷자리</label>
															<form:input path="post2" class="txt" style="width:100px;" readonly="readonly" />
															<a id="zipPopup" href="#;" class="btn_pack btn_type15"><span>우편번호</span></a>
														</p>
														<p class="mB3">
															<label class="hide" for="comjuso">주소</label>
															<form:input path="comjuso" class="txt" style="width:500px;"  />
														</p>
														<p>
															<label class="hide" for="new_juso">상세주소</label>
															<form:input path="new_juso" class="txt" style="width:500px;"  />
															<form:errors cssClass="formError" path="post1" />
														</p>
														//20161130 삭제 -->
														<!-- 20161130 수정 -->
														000-000<br />
														충청북도 청주시 서원구 사창동 286-22
														<!-- //20161130 수정 -->
													</td>
												</tr>
												<tr>
													<th scope="row">전화번호</th>
													<td>
														<form:select path="phone1" title="지역번호 선택" style="width:95px">
															<form:option value="0">선택</form:option>
															<c:forEach items="${telList }" var="t"><form:option value="${t.CODE }">${t.CODE }</form:option></c:forEach>
														</form:select>
														<span>&#45;</span>
														<label class="hide" for="phone2">전화번호 중간자리</label>
														<form:input path="phone2" maxlength="4" size="4" class="txt" style="width:95px;" title="전화번호 중간자리"  />
														<span>&#45;</span>
														<label class="hide" for="phone3">전화번호 끝자리</label>
														<form:input path="phone3" maxlength="4" size="4" class="txt" style="width:95px;" title="전화번호 중간자리"  />
														<form:errors cssClass="formError" path="phone1" />
													</td>
												</tr>
												<tr>
													<th scope="row">핸드폰</th>
													<td>
															<form:select path="cell1" title="핸드폰 통신사 선택" style="width:65px">
																<form:option value="0">선택</form:option>
																<c:forEach items="${cellList }" var="t"><form:option value="${t.CODE }">${t.CODE }</form:option></c:forEach>
															</form:select>
															<span>&#45;</span>
															<label class="hide" for="cell2">핸드폰 중간자리</label>
															<form:input path="cell2" maxlength="4" size="4" class="txt" style="width:95px;" title="전화번호 중간자리"  />
															<span>&#45;</span>
															<label class="hide" for="cell3">핸드폰 끝자리</label>
															<form:input path="cell3" maxlength="4" size="4" class="txt" style="width:95px;" title="전화번호 중간자리"  />
															<form:checkbox path="sms_yn" value="Y"  class="check"/><form:errors cssClass="formError" path="sms_yn" />
															<label for="sms_yn">문자메세지 수신여부</label>
															<form:errors cssClass="formError" path="cell1" />
													</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td>
														<label class="hide" for="mail">이메일 주소</label>
														<form:input path="mail" class="txt" style="width:250px;"  title="이메일 아이디"  />
														<form:checkbox path="mail_yn" value="Y" class="check" />
														<label for="mail_yn">E-mail 수신여부</label>
														<form:errors cssClass="formError" path="mail" />
													</td>
												</tr>
												<tr>
													<th scope="row">계약지부</th>
													<td>
														<label class="hide" for="gyeyak_jibu">계약지부</label>
														<form:select path="gyeyak_jibu" class="txt" style="width:100px" title="지부선택" >
															<form:option value="">지부선택</form:option>
															<c:forEach items="${jibuList }" var="jibu"><form:option value="${jibu.CODE_NO }">${jibu.CODE_NAME }</form:option></c:forEach>
														</form:select>
														<form:errors cssClass="formError" path="gyeyak_jibu" />
													</td>
												</tr>
											</tbody>
										</table>
										<!-- 20161130 추가 -->
										<span class="desC">정보수정은 가입지부 계약담당자를 통해 할 수 있습니다.</span>
										<!-- //20161130 추가 -->
										<!-- 버튼 -->
										<div class="btnboxR clfix">
											<span class="btn_pack btn_type01 icon"><span class="check"></span><a id="formSubmit" href="#;">확인</a></span>
											<span class="btn_pack btn_type10 icon"><span class="check"></span><a id="formCancel" href="#;">취소</a></span>
										</div>
									</div>
								<!--// 회원정보입력 e -->
								</div>
						</fieldset>
						</form:form>
					</div><!--// conaArea e -->
				</div><!--// contents e -->
			</div>
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>

