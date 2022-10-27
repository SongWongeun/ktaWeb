/**
 * modal
 * */

$(function(){
	$('#searchCrNm').on('click', function(e){
	$('#carNoC').val($('#carNoC').val().replaceAll(" ",""));
		
		var param = {
				carNo : $('#carNoC').val(),
				di : "",
		};
		
		//var Jparam = JSON.stringify(param);
		
		$.ajax({
			  type: "POST",
			  url: "/customer/checkCarNo.do",  
			  data: param,
			  success: function(data){
				  
				  let jData = JSON.parse(data);
				  console.log(jData);
				  if(jData.flag == "N"){
						 document.insertForm.carDtct.value = "N";
						 $('#warn').css('color', 'red');
						 $('#warn').text("화물공제조합에 계약 유지중인 차량이 아닙니다. 차량번호를 확인해 주세요.");
						 
					  }	else{
						
						  $.ajax({
							  type: "POST",
							  url: "/customer/duplicateCheck.do",  
							  data: param,
							  success: function(data){
								  let jData = JSON.parse(data);
								  console.log(jData);
								  if(jData.msg == 0){
									  document.insertForm.carDtct.value = "Y";
									  $('#warn').css('color', 'green');
									  $('#warn').text("차량 번호 조회에 성공하였습니다");
								  }else{
									  document.insertForm.carDtct.value = "N";
									  $('#warn').css('color', 'red');
									  $('#warn').text("이미 이벤트에 신청된 차량 번호입니다.");
								  }
							  },  			   
							});
						  
						 
						  
						  //$('#carNoC').attr("readonly", true);
					  }	
				  
			  },  
			  //contentType: 'application/json;charset=utf-8'  
			});  		
	});
	
	$('#chk00').on('click', function(e){
		let flag = $("input:checkbox[id='chk00']").is(":checked");
		$("input:checkbox[id='chk01']").prop("checked", flag);
		$("input:checkbox[id='chk02']").prop("checked", flag);
	});
	
	$('#chk01, #chk02').on('click', function(e){
		let flag1 = $("input:checkbox[id='chk01']").is(":checked");
		let flag2 = $("input:checkbox[id='chk02']").is(":checked");
		
		if(flag1 && flag2){
			$("input:checkbox[id='chk00']").prop("checked", true);
		}else{
			$("input:checkbox[id='chk00']").prop("checked", false)
		}
		
	});
	
	$('#submitBtn').on('click', function(e){
		
		
		let flag1 = $("input:checkbox[id='chk01']").is(":checked");
		let flag2 = $("input:checkbox[id='chk02']").is(":checked");
		
		let chkSmsYN = $("input:checkbox[id='chkYN']").is(":checked");
		var smsYN = chkSmsYN == true ? "Y" : "N";		
		
		if(!(flag1 && flag2)){
			alert("개인정보 활용 전체 동의를 해주세요.");
			return;
		}
		
		if(!document.insertForm.carNo.value || document.insertForm.carDtct.value == "N"){
			alert("차량번호를 입력 또는 조회 후 참여가 가능합니다.");
			return;
		}
		
		if(!document.insertForm.phone.value){
			alert("실명인증을 완료해 주세요.");
			return;
		}
		
		if(!document.insertForm.name.value){
			alert("실명인증을 완료해 주세요.");
			return;
		}
		
		var param = {
			carNo : $('#carNoC').val(),
			phone : document.insertForm.phone.value,
			name : document.insertForm.name.value,
			di : document.insertForm.di.value,
			smsYN : smsYN
		};
		
		
		//중복 체크
		$.ajax({
			  type: "POST",
			  url: "/customer/duplicateCheck.do",  
			  data: param,
			  success: function(data){
				  let jData = JSON.parse(data);
				  console.log(jData);
				  if(jData.msg == 0){
					  //등록 절차
						$.ajax({
							  type: "POST",
							  url: "/customer/insertCardNo.do",  
							  data: param,
							  success: function(data){
								  let jData = JSON.parse(data);
								  console.log(jData);
								  if(jData.resultCode == 0){
									  alert("이벤트에 참여 하였습니다");
									  location.reload();
								  }else if(jData.resultCode == 99){
									  alert("이미 등록된 번호입니다.");
									  location.reload();
								  }else{
									  alert("이미 처리된 차량 번호입니다.");
									  location.reload();
								  }
							  },							    
							});
				  }else{
					  alert("이미 본인신청 처리된 건입니다.");
					  location.reload();
				  }
			  },  			   
			})
		
		
		

		
		
		
	});
	
});

function fnModalOpen(t){
	if(t == 1){
		$(".m_agree1").show();
	}else{
		$(".m_agree2").show();
	}
	$("body").css("overflow-y","hidden");
}

function fnModalClose(){
	$(".modal").hide();
	$("body").css("overflow-y","auto");
}

