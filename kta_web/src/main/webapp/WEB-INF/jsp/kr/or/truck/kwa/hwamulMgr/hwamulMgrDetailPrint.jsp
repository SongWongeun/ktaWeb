<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
<!-- Always force latest IE rendering engine or request Chrome Frame -->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800">
<!-- Use title if it's in the page YAML frontmatter -->
<title>KTA Admin page</title>

<link href="/bootStrap/stylesheets/application_print.css" media="all" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<style type="text/css">
div.box-content div.col-md-3{ line-height:25px;}
div.main-content {margin:0;}
</style>
<script type="text/javascript">
function printPdf() {
	var z = $("#asdf");
	var s ="";
	
	z.children("p").each(function(){
			s += "<div>"+$(this).text()+"</div><div> </div>";
	});
	z.html(s);

    var k = $(".row").html();

	var f = document.popForm;
	f.htmlData.value = k;
	f.submit();
}
</script>
</head>
<body>
	<form name="popForm" method="post"
		action="/kwa/hwamulMgr/detailPdf.do">
		<input type="hidden" name="htmlData" />
	</form>

	<div class="main-content">
		<form name="boardForm" id="boardForm" method="post">
			<input type="hidden" id="articleNo" name="articleNo" value="${resultDetail.articleNo}"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
			<input type="hidden" id="searchCondition" name="searchCondition" value="${searchVO.searchCondition}"/>
			<input type="hidden" id="searchCondition2" name="searchCondition2" value="${searchVO.searchCondition2}"/>
			<input type="hidden" id="searchCondition2" name="searchCondition3" value="${searchVO.searchCondition3}"/>
			<input type="hidden" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}"/>
			<input type="hidden" id="email" name="email" value="${resultDetail.email}"/>
			<input type="hidden" id="phone" name="phone" value="${resultDetail.phone}"/>
			<input type="hidden" id="emailSj" name="emailSj" value="KTA 홈페이지 문의하신 글에 답변이 완료되었습니다."/>
			<input type="hidden" id="emailCn" name="emailCn" value="<html><head></head><body><h2>KTA 홈페이지 문의하신 글에 답변이 완료되었습니다.</h2><p>등록일 : ${resultDetail.createTime}</p><p>글제목 : ${resultDetail.title}</p><p>1:1문의내역[ <a href='http://www.truck.or.kr/customer/inquiry/oaoInquiryIndex.do' target='_blank'>http://www.truck.or.kr/customer/inquiry/oaoInquiryIndex.do</a> ]에 접속하여 확인바랍니다.</p></body></html>"/>
			<input type="hidden" id="repEmailSj" name="repEmailSj" value="KTA 홈페이지 1:1문의의 답변글을 입력해 주시기 바랍니다." />
			<input type="hidden" id="repEmailCn" name="repEmailCn" value="<html><head></head><body><h2>KTA 홈페이지 1:1문의의 답변글을 입력해 주시기 바랍니다.</h2><p>등록일 : ${resultDetail.createTime}</p><p>글제목 : ${resultDetail.title}</p><p>1:1문의[ <a href='http://www.truck.or.kr/kwa/main.do' target='_blank'>http://www.truck.or.kr/kwa/main.do</a> ]에 접속하여 확인바랍니다.</p></body></html>"/>
			<input type="hidden" id="replyAt" name="replyAt" value="${resultDetail.replyAt}"/>
			<input type="hidden" id="replyContentHtml" name="replyContentHtml"/>
			<input type="hidden" id="replyContentText" name="replyContentText"/>
			<input type="hidden" id="forwardUpdt" name="forwardUpdt" value="<c:if test='${empty resultDetail.forwardId}'>N</c:if><c:if test='${!empty resultDetail.forwardId}'>Y</c:if>"/>
			<div class="container">
				<div class="row">
					<div class="col-md-12 padded" >
							<div class="box">
									<div class="box-header">
										<span class="title">고객문의 내용</span>
									</div>
									<div class="box-content">
										<table class="table">
											<tr>
												<th scope="col" style='width: 15%;'></th>
												<th scope="col" style='width: 35%;'></th>
												<th scope="col" style='width: 15%;'></th>
												<th scope="col" style='width: 35%;'></th>
										  	</tr>
											<tbody>
												<tr>
													<td style="background: #F3F4F8;">작성자</td>
													<td style="text-align:left;">
														<c:choose>
															<c:when test="${!empty resultDetail.writerName}">
																${resultDetail.writerName}
															</c:when>
															<c:when test="${empty resultDetail.writerName}">
																${resultDetail.writerId}
															</c:when>
														</c:choose>
													</td>
													<td style="background: #F3F4F8;">전화번호</td>
													<td style="text-align:left;">
														${resultDetail.phone}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">이메일</td>
													<td style="text-align:left;">
														${resultDetail.email}
													</td>
													<td style="background: #F3F4F8;">작성일자</td>
													<td style="text-align:left;">
														${resultDetail.createTime}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">[차량정보]</td>
													<td colspan="3" style="text-align:left; background: #F3F4F8;"></td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">차량번호</td>
													<td colspan="3" style="text-align:left;">
														${resultDetail.car_no}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">적재정량</td>
													<td colspan="3" style="text-align:left;">
														<c:if test="${not empty resultDetail.carry_capacity}">
														${resultDetail.carry_capacity}kg
														</c:if>
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">협회가입유무</td>
													<td colspan="3" style="text-align:left;">
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
													<td style="background: #F3F4F8;">계약만기일</td>
													<td colspan="3" style="text-align:left;">
														${resultDetail.expire_date}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">현 할인할증등급</td>
													<td colspan="3" style="text-align:left;">
														${resultDetail.extra_charge}
														
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">필수고지사항</td>
													<td colspan="3" style="text-align:left;">
														
														<c:if test="${resultDetail.essential_notice1 eq 'Y'}">
															<div>- 수반차를 견인하는데 사용하는 특수연결장치(트랙터, 풀카고 등)를 한 차량</div>
														</c:if>
														<c:if test="${resultDetail.essential_notice2 eq 'Y'}">
															<div>- 위험물(석유,고압가스,폭발인화성위험물질 등)을 적재하는 차량</div>
														</c:if>
														<c:if test="${resultDetail.essential_notice3 eq 'Y'}">
															<div>- 기중기, 붐, 집게등이 장착(사다리차, 크레인, 렉카 등)된 차량</div>
														</c:if>
														<c:if test="${resultDetail.essential_notice4 eq 'Y'}">
															<div>- 방송, 녹음, 레트켄, 토오키 등 정밀기계가 장착된 차량</div>
														</c:if>
														<c:if test="${resultDetail.essential_notice5 eq 'Y'}">
															<div>- 6인승 밴형화물자동차 또는 승차정원이 3인을 초과하는 차량</div>
														</c:if>
														<c:if test="${resultDetail.essential_notice6 eq 'Y'}">
															<div>- 구조변경 이력이 있는 차량</div>
														</c:if>
														<c:if test="${resultDetail.essential_notice7 eq 'Y'}">
															<div>- 해당없음</div>
														</c:if>
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">[가입상품]</td>
													<td colspan="3" style="text-align:left; background: #F3F4F8;"></td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">대인1</td>
													<td colspan="3" style="text-align:left;">
													<c:if test="${resultDetail.person1_coverage eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.person1_coverage eq 'N'}">
														미가입
													</c:if>
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">대인2</td>
													<td colspan="3" style="text-align:left;">
													<c:if test="${resultDetail.person2_coverage eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.person2_coverage eq 'N'}">
														미가입
													</c:if>	
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">대물</td>
													<td colspan="3" style="text-align:left;">
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
													<td style="background: #F3F4F8;">자기신체사고</td>
													<td colspan="3" style="text-align:left;">
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
													<td style="background: #F3F4F8;">자기차량손해</td>
													<td colspan="3" style="text-align:left;">
													<c:if test="${resultDetail.selfcar_coverage eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.selfcar_coverage eq 'N'}">
														미가입
													</c:if>	
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">긴급출동</td>
													<td colspan="3" style="text-align:left;">	
													<c:if test="${resultDetail.emergency_call eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.emergency_call eq 'N'}">
														미가입
													</c:if>	
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">법률비용지원</td>
													<td colspan="3" style="text-align:left;">	
													<c:if test="${resultDetail.law_expense eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.law_expense eq 'N'}">
														미가입
													</c:if>		
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">적재물</td>
													<td colspan="3" style="text-align:left;">
													<c:if test="${resultDetail.luggage_coverage eq 'Y'}">
														가입
													</c:if>
													<c:if test="${resultDetail.luggage_coverage eq 'N'}">
														미가입
													</c:if>	
													</td>
												</tr>
											</tbody>
										</table>
									</div>
							</div>
					</div>
				
					<div class="col-md-12 padded" >
							<div class="box">
									<div class="box-header">
										<span class="title">고객문의 답변</span>
									</div>
									<div class="box-content">
										<table class="table ">
												<tr>
											<th scope="col" style='width: 15%;'></th>
											<th scope="col" style='width: 35%;'></th>
											<th scope="col" style='width: 15%;'></th>
											<th scope="col" style='width: 35%;'></th>
										  	</tr>
											<tbody>
												<tr>
													<td style="background: #F3F4F8;">고객답변</td>
													<td colspan="3" style="text-align:left;height:300px;vertical-align: top;" id="asdf">
														${resultDetail.replyContentHtml}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">답변일자</td>
													<td  style="text-align:left;">
														<c:choose>
															<c:when test="${resultDetail.replyAt!='Y'}">
																<div id="changViBtn" name="changViBtn" class="btn btn-red"  style="width: 59px;">미답변</div>
															</c:when>
															<c:otherwise>
																${resultDetail.replyTime}
															</c:otherwise>
														</c:choose>
													</td>
													<td style="background: #F3F4F8;">담당자 배정일자</td>
													<td  style="text-align:left;">
														${resultDetail.forwardTime}
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">처리시간</td>
													<td  style="text-align:left;">
														<c:if test="${not empty resultDetail.procTime }">
															${resultDetail.procTime} (담당자배정일자 - 답변완료일자)
														</c:if>
													</td>
													<td style="background: #F3F4F8;">총 처리시간</td>
													<td  style="text-align:left;">
														<c:if test="${not empty resultDetail.totalProcTime }">
															${resultDetail.totalProcTime} (문의등록일자 - 답변완료일자)
														</c:if>
														
													</td>
												</tr>
												<tr>
													<td style="background: #F3F4F8;">담당자 설정</td>
													<td colspan="3" style="text-align:left;">
														<c:if test="${not empty resultDetail.forwardId}">
																${forwardVO.HANGEUL_NM} ( ${forwardVO.SAWON_NO} )
														</c:if>
														<c:if test="${empty resultDetail.forwardId}">
															등록된 담당자가 없습니다.
														</c:if>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div style="height:40px; margin:20px;" >
			<input type="button" onclick="window.print();" value="인쇄하기"/> <input type="button" onclick="printPdf();" value="pdf출력"/>
		</div>
		
	</body>
</html>