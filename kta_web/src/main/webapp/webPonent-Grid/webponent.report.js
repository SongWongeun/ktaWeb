/**
 * webponent.export package driver
 *
 * @author  오상원, 정태승
 */


/** option
 *    - url          이 옵션을 입력할 경우 입력한 url 페이지를 rendering 해 출력
 *    - param        {Object} GET 방식으로 보내지 않을 경우 이 attribute를 통해 parameter 전달
 *    - drawArea     PDF rendering 할 영역에 대한 DOM Object | Markup String | GRID 객체
 *    - fileName     다운받을 파일 이름
 *    - action       파일 생성 후 처리에 관한 정보 ex) download, etc..
 *    - ajax         ajax 로 처리할 지 여부
 *    - callback     ajax 처리 시 콜백함수 등록 가능
 *    - mode         "debug"모드 선택 여부
 *    - sheetName    Excel 출력에 사용되는 sheetName.
 *                   sheetNames 쉬트이름 단일쉬트일경우 문자열로
 *                   다중 쉬트일경우 문자열을 담은 배열을 받는다
 *    - pdfHeader
 *    - pdfFooter    PDF 헤더, 푸터 [{
 *                      type : "text" || "image" (default : text)
 *                      content : 텍스트 || 이미지 경로(HTTP URL 혹은 서버 내의 절대경로)
 *                      color : color code (default : #000000)
 *                      align : "left" || "right" || "center" (default : left)
 *                      page : 적용될 페이지 번호 (1부터 시작, default : 전체 페이지)
 *                             형태 : 1 || 1, 2, 3 || 1 - 2
 *                   }]
 *    - exportHost   export module이 설치된 서버의 hostname 혹은 ip주소. 없을 시 local에 설치된 걸로 간주함.
 *    - stylesheet   PDF출력시 추가할 css파일 경로. 배열 형태로 입력.
 *
 *
 *
 *    - use(Deprecated) PDF출력에 시 java 클래스 분기에 사용되는 파라미터 (default : html)
 *    - template(Deprecated) PDF 생성에 사용될 template XML attribute name
 **/


(function () {
    if (window.webponent === undefined) {
        window.webponent = {};
    }

    webponent.report = {};
    var self = webponent.report;

    window.webponent.report.event = $({});
    var event = window.webponent.report.event;
    /**
     * 각 export별 호출 URL
     * @type {Object}
     */
    var exportUrls = {
        'excel' : '/WEB-APP/export/excel',
        'csv' : '/WEB-APP/export/csv',
        'pdf' : '/WEB-APP/export/pdf',
        'image' : '/WEB-APP/export/image'
    };

    function getCookie(name) {
        var nameOfCookie = name + "=";
        var x = 0, endOfCookie;
        while (x <= document.cookie.length) {
            var y = (x + nameOfCookie.length);
            if (document.cookie.substring(x, y) === nameOfCookie) {
                if ((endOfCookie = document.cookie.indexOf(";", y)) === -1) {
                    endOfCookie = document.cookie.length;
                }

                return encodeURI(document.cookie.substring(y, endOfCookie));
            }
            x = document.cookie.indexOf(" ", x) + 1;
            if (x === 0) {
                break;
            }
        }
        return "";
    }

    function expireCookie(cookieName) {
        var cookieDate = new Date();
        cookieDate.setTime(cookieDate.getTime() - 1);
        document.cookie = cookieName + "=; expires=" + cookieDate.toGMTString();
    }


    /**
     * Form Markup 에 input data attribute 설정
     *
     * @param  {Object}  data    attribute 요소들을 가지고 있는 object
     * @return {Element} form    Form jQuery Element
     */
    function getForm (data, form) {
        form = $(form);
        form.attr("method", "post");

        for (var key in data) {
            var value = data[key];

            if (value) {
                var input = $('<input type="hidden"/>');
                input.attr('name', key);
                input.val(value);

                form.append(input);
            }
        }

        return form;
    }


    /**
     * form make & submit
     * @param  {Element}         form            Markup 상의 hidden form element object
     * @param  {Object}          inputObject     form생성 시 input 요소들을 담고 있는 object
     * @param  {String}          exportType      export하는 파일 종류
     * @param  {String | Object} option
     */
    function makeFormAndSubmit (form, inputObject, exportType, option) {
        var action = option.action ? option.action : "download";


        if (action === undefined || action === "download") {
            // download logic (default)
            action = 'download';

        } else {
            // send to repository or etc logic
            if (typeof action === "object") {
                for (var key in action) {
                    inputObject[key] = action[key];
                }
            } else if (typeof action === "string") {
                inputObject.action = action;
            }
        }

        var mode = option.mode ? option.mode : "normal";
        inputObject.mode = mode;

        form = getForm(inputObject, form);

        var exportHost = option.exportHost ? option.exportHost : '';
        var exportUrl = exportHost + exportUrls[exportType];

        var ajax = option.ajax ? true : false;

        if (!ajax) {
            if (action === 'download') {
                var cookieName = 'webponent-report-downloader';
                expireCookie(cookieName);

                var interval = setInterval(function() {
                    var cookie = getCookie(cookieName);
                    if (cookie !== '') {
                        expireCookie(cookieName);
                        clearInterval(interval);

                        if (option.callback) {
                            option.callback();
                        }
                    }
                }, 50);
            }

            form.attr('action', exportUrl);
            form.trigger('submit');
            form.empty();

        } else {
            $.ajax({
                type : 'POST',
                url : exportUrl,
                data : form.serialize(),
                beforeSend : function () {
                    event.trigger('ajaxBegin');

                },
                success : function (resp) {
                    if (option.ajax.success) {
                        option.ajax.success(resp);
                    }

                },
                complete : function () {
                    event.trigger('ajaxComplete');
                    form.empty();
                }
            });
        }
    }


    /**
     * Parameter를 압축하여 return
     * @param {String} param    압축할 parameter
     * @return {String}         압축된 parameter
     */
    function getCompressedParam (param) {
        var compressedPrefix = "$LZString_ ";
        if (window.LZString) {
            return compressedPrefix + window.LZString.compressToEncodedURIComponent(param);

        } else {
            return param;
        }
    }


    /**
     * 엑셀 내보내기
     * @param  {Grid | Array<Grid> | Object | Array<Object>} dataObjs
     *                                       객체또는 객체를 담은 배열
     *                                       (그리드 객체를 바로 넘겨도 동작)
     *
     *                                       형태 :
     *                                       {
     *                                          header: [{
     *                                              bind:  BLD OUTPUT FIELD'S NAME,
     *                                              label: BLD OUTPUT FIELD'S_LABEL,
     *                                              visibility: 추후 구현예정
     *                                          }],
     *                                          body: OUTPUT DATA ARRAY
     *                                       }
     *
     * @param  {Element} form               Markup 상의 hidden form element object
     * @param  {Object}  option
     */
    self.excel = function (dataObjs, form, options) {

        var objArray = [];

        if (dataObjs instanceof Object && dataObjs instanceof Array) {

            objArray = dataObjs;

        } else if (dataObjs instanceof Object) {

            objArray.push(dataObjs);
        }

        var inputObject = {};

        //_.each(objArray, function (data, index) {
        for (var index in objArray) {
            var header, body;
            var data = objArray[index];

            if (objArray[0].header) {
                header = JSON.stringify(data.header);
                body = JSON.stringify(data.body);

            } else {    // 그리드 객체가 바로 Parameter로 넘어온 경우
                var makeBodyMergeInfoObject = function () {
                    var mergingObj = {};
                    var rows = $(data.rows);
                    var firstRow = $(rows[0]);

                    // level 정보
                    firstRow.each(function (i) {
                        $(firstRow[i]).find('td').each(function (j) {
                            var name = this.dataset.name;
                            if (!mergingObj[name]) {
                                mergingObj[name] = {};
                            }

                            mergingObj[name].level = Number(i);
                        });
                    });

                    // colspan, rowspan정보
                    rows.each(function (i) {
                        $(this).find('td').each(function () {
                            var name = this.dataset.name;

                            if (this.hasAttribute('rowspan')) {
                                if (!mergingObj[name][i]) {
                                    mergingObj[name][i] = {};
                                }

                                mergingObj[name][i].rowspan = Number(this.getAttribute('rowspan'));
                            }

                            if (this.hasAttribute('colspan')) {
                                if (!mergingObj[name][i]) {
                                    mergingObj[name][i] = {};
                                }

                                mergingObj[name][i].colspan = Number(this.getAttribute('colspan'));
                            }
                        });
                    });

                    return mergingObj;
                };


                var columnInfoFilter = ["bind", "visibility", "label", "colspan", "rowspan", "level"];

                header = JSON.stringify(data.settings.columns, columnInfoFilter);
                body = JSON.stringify(data.data);

                var mergingObj = makeBodyMergeInfoObject();

                if (typeof mergingObj === 'object') {
                    var bodyMergeInfo = JSON.stringify(mergingObj);
                    inputObject['bodyMergeInfo' + index] = getCompressedParam(bodyMergeInfo);
                }
            }

            inputObject['header' + index] = getCompressedParam(header);
            inputObject['body' + index] = getCompressedParam(body);

            var sheetNames = options.sheetName;
            if (sheetNames instanceof Array) {
                inputObject['sheetName' + index] = sheetNames[index];

            } else {
                inputObject.sheetName0 = sheetNames;
            }
        }

        inputObject.count = objArray.length;
        inputObject.fileName = options.fileName;

        makeFormAndSubmit(form, inputObject, "excel", options);
    };


    /**
     * PDF 내보내기
     * @param  {Element}         form            Markup 상의 hidden form element object
     * @param  {Object}          option
     */
    var agentNm_v = "";
    var fileName_v = "";
    self.pdf = function (form, option) {
    	
        if (!option) {
            console.log("option object 요소 입력 필");
            return;
        }

        var inputObject = {};

        var template = option.template;
        if (!template) {
            template = "default";
        }
        inputObject.template = template;
        
        var kindCd = option.kindCd;
        agentNm_v = option.agentName;
        fileName_v = option.fileName; 
        if (option.url) {
            inputObject.url = option.url;
            inputObject.use = "url";

        } else if (option.drawArea) {
            var drawArea = option.drawArea;

            if (typeof drawArea === "object") {
                // 그리드 객체가 넘어오면 releaseScroll 후 rendering
                if (drawArea.appendRow !== undefined) {
                    drawArea.releaseScroll();

                    var gridMarkup = drawArea.markup.area.outerHTML;
//                    var $gridClone = $(gridMarkup).clone();
//                    $($gridClone).find('.CI-GRID-PAGING').remove();
//                    gridMarkup = $($gridClone)[0].outerHTML;
                    var data = drawArea.data;
//                    var pagingOpt = drawArea.settings.paging;
                    var gridTemplate = drawArea.settings.template.original.clone();
                    var div = $("<div>");
                    $(drawArea.markup.area).after(div);

                    drawArea.destroy();
                    
//                    var gridOption = {};
//                    if(pagingOpt.countPerPage !== null){
//                        gridOption.paging = pagingOpt;
//                    }
//                    drawArea = webponent.grid.init(div, gridTemplate, gridOption);
                    if(kindCd=='1'){
                    	 drawArea = webponent.grid.init(div, gridTemplate,{
                    		 rowRendered: function(row, data, index) {
					                $(row).on('click', function(e) {
									var className =	$(".selectRow").prop("class");

									if(undefined!=className){
										
										if(className.split(" ")[0]=='CI-GRID-ODD'){
											$(".selectRow").css('background-color',bColor2);

										}else{
											$(".selectRow").css('background-color',bColor1);

										}
					                	
					                	$(".CI-GRID-EVEN").removeClass("selectRow");
					                	$(".CI-GRID-ODD").removeClass("selectRow");
									}
					                	$(this).css('background-color',"rgb(203,207,251)");
					                	$(this).addClass("selectRow");
					                    e.preventDefault();
					                    e.stopPropagation();
					               						                    
					                  $.ajax({
					                	  url:"/netCounter/inquiryService/contractInquiry/summaryInfo.do"
					                	  ,dataType:"html"
					                	  ,async:true
					                	  ,contentType: "application/json; charset=UTF-8"
					                	  ,data:{
					                		  gyeyak_no:data.GYEYAK_NO
					                	  }
					                	  ,error:function(eLog){
					                		  alert(eLog);
					                	  }
					                	  ,success:function(data){
					                		
					                		  data = decodeURIComponent(data);
					                		  data = data.replace(/[+]/gi,"");
					                		
					                		  $("#tbody_summary").html("");
					                		  s="";
											  cash1 = 0;
											  cash2 = 0;
											  cash3 = 0;
											  cash4 = 0;
											  cash5 = 0;
											  cash6 = 0;
					                		  
					                		  $(JSON.parse(data)).each(function(){
					          					
					          					var DAMBO_KIND_CD = this.DAMBO_KIND_CD;
					          					var GYEYAK_STATE_CD = this.GYEYAK_STATE_CD;
					          					var BUNNAP_CNT = this.BUNNAP_CNT;
					          					//var YUHYO_SYMD1 = this.YUHYO_SYMD1;
					          					var BUNNAP_AMT1 = this.BUNNAP_AMT1;
					          					var YOUNGSU_YMD1 = this.YOUNGSU_YMD1;
					          					//var YUHYO_SYMD2 = this.YUHYO_SYMD2;
					          					var BUNNAP_AMT2 = this.BUNNAP_AMT2;
					          					var YOUNGSU_YMD2 = this.YOUNGSU_YMD2;
					          					//var YUHYO_SYMD3 = this.YUHYO_SYMD3;
					          					var BUNNAP_AMT3 = this.BUNNAP_AMT3;
					          					var YOUNGSU_YMD3 = this.YOUNGSU_YMD3;
					          					//var YUHYO_SYMD4 = this.YUHYO_SYMD4;
					          					var BUNNAP_AMT4 = this.BUNNAP_AMT4;
					          					var YOUNGSU_YMD4 = this.YOUNGSU_YMD4;
					          					//var YUHYO_SYMD5 = this.YUHYO_SYMD5;
					          					var BUNNAP_AMT5 = this.BUNNAP_AMT5;
					          					var YOUNGSU_YMD5 = this.YOUNGSU_YMD5;
					          					//var YUHYO_SYMD6 = this.YUHYO_SYMD6;
					          					var BUNNAP_AMT6 = this.BUNNAP_AMT6;
					          					var YOUNGSU_YMD6 = this.YOUNGSU_YMD6;
					          		
		                                           addSummaryInfo(
		                                                   DAMBO_KIND_CD
		                                                   ,GYEYAK_STATE_CD
		                                                   ,BUNNAP_CNT
		                                                   ,BUNNAP_AMT1
		                                                   ,YOUNGSU_YMD1
		                                                   ,BUNNAP_AMT2
		                                                   ,YOUNGSU_YMD2
		                                                   ,BUNNAP_AMT3
		                                                   ,YOUNGSU_YMD3
		                                                   ,BUNNAP_AMT4
		                                                   ,YOUNGSU_YMD4
		                                                   ,BUNNAP_AMT5
		                                                   ,YOUNGSU_YMD5
		                                                   ,BUNNAP_AMT6
		                                                   ,YOUNGSU_YMD6
		                                                   
		                                             );
					          				});
					                		  
					                		  $("#tbody_summary").html(s);
					                		  $("#cash1").text(commas(cash1));
					                		  $("#cash2").text(commas(cash2));
					                		  $("#cash3").text(commas(cash3));
					                		  $("#cash4").text(commas(cash4));
					                		  $("#cash5").text(commas(cash5));
					                		  $("#cash6").text(commas(cash6));
					                		  
					                		  $("#div_summary").show();
					                		  
					                	  }
					                  });
					                  
					                  
					                  
					                  
					                });
					                
					                //상세보기 시작
					                var aTag = $('<span class="btn_pack btn_type24 type2"><a href="#">');

					                aTag.on('click', function (e) {

					                  e.preventDefault();
					                  e.stopPropagation();

					                  var GYEYAK_NO = (data.GYEYAK_NO).trim();
					                   var CAR_GAIP_NO = (data.CAR_GAIP_NO).trim();
					                   var AGENT_NO = (data.AGENT_NO).trim();
					                   var SAUPJANG_SEQ = (data.SAUPJANG_SEQ).trim();
					               
					                    location.href = '/netCounter/inquiryService/contractInquiry/totalContractInquiry.do?car_gaip_no='+CAR_GAIP_NO+'&gyeyak_no='+GYEYAK_NO+'&agent_no='+AGENT_NO+'&saupjang_seq='+SAUPJANG_SEQ;
					                });


					                var IsuColumn = $(row).find('[data-name="YOYAK"]');

					                IsuColumn.wrapInner(aTag);
					                //상세보기 끝
					                
					                //보상조회 시작 
					                var aTagBosang = $('<a href="#" bosang="bosang" style="color:blue;">');
					                aTagBosang.on('click', function (e) {

						                  e.preventDefault();
						                  e.stopPropagation();
						                  var CAR_NO = (data.CAR_NO).trim();
						                  var BOSANG_CNT = data.BOSANG_CNT;
						                  if(BOSANG_CNT!='0건'){
						                	 	goBosang(CAR_NO);
						                  }  
						             });
					                
					                var CarNoColumn = $(row).find('[data-name="BOSANG_CNT"]');

					                CarNoColumn.wrapInner(aTagBosang);
					                //보상조회 끝
					                
					                
					                //담보 이미지아이콘 처리 시작
					                var damboImgTag =  '';
					                var damboColumn  =  $(row).find('[data-name="DAMBO"]');
					                var DAMBO = data.DAMBO;
					                var damboArray = DAMBO.split(' ');
					                $(damboArray).each(function(index,value){
					                	value = value.trim();
					                	
					                	if('대인I'==value){
					                		damboImgTag += '<img src="/images/truck/com/ico_wad01.gif" alt="대인 I">';
					                	}else if('대인II'==value){
					                		damboImgTag += '<img src="/images/truck/com/ico_wad02.gif" alt="대인 II">';
					                	}else if('대물'==value){
					                		damboImgTag += '<img src="/images/truck/com/ico_wad03.gif" alt="대물">';
					                	}else if('특약'==value){
					                		damboImgTag += '<img src="/images/truck/com/ico_wad04.gif" alt="특약">';
					                	}else if('차량'==value){
					                		damboImgTag += '<img src="/images/truck/com/ico_wad05.gif" alt="차량">';
					                	}

					                });
					                damboColumn.empty();
					                damboColumn.append(damboImgTag);
					                //담보 이미지아이콘 처리 끝
					                
					                //분담금 콤마
					                 var bundamColumn  =  $(row).find('[data-name="BUNDAM_AMT"]');
					                 var BUNDAM_AMT = commas(data.BUNDAM_AMT);
					                 bundamColumn.empty();
					                 bundamColumn.append(BUNDAM_AMT);
					                //분담금 콤마 끝
					                
					                //수납총액 콤마
					                 var TOT_NAPIP_AMTColumn  =  $(row).find('[data-name="TOT_NAPIP_AMT"]');
					                 var TOT_NAPIP_AMT = commas(data.TOT_NAPIP_AMT);
					                 TOT_NAPIP_AMTColumn.empty();
					                 TOT_NAPIP_AMTColumn.append(TOT_NAPIP_AMT);
					                //수납총액 콤마 끝
					                
					                //차회분담금 콤마
					                 var BUNNAP_AMTColumn  =  $(row).find('[data-name="BUNNAP_AMT"]');
					                 var BUNNAP_AMT = commas(data.BUNNAP_AMT);
					                 BUNNAP_AMTColumn.empty();
					                 BUNNAP_AMTColumn.append(BUNNAP_AMT);
					                //차회분담금콤마 끝
					                
					                //계약기간 개행처리
					                 var GYEYAK_YMDTag = '';
					                var GYEYAK_YMDColumn  =  $(row).find('[data-name="GYEYAK_YMD"]');
					                var GYEYAK_YMD = data.GYEYAK_YMD;
					                var GYEYAK_YMDArray = GYEYAK_YMD.split('~');
					                if(GYEYAK_YMDArray.length==2){
					                	GYEYAK_YMDTag += GYEYAK_YMDArray[0]+'~'+GYEYAK_YMDArray[1];
					                }
					                GYEYAK_YMDColumn.empty();
					                GYEYAK_YMDColumn.append(GYEYAK_YMDTag);
					                //계약기간 개행처리 끝
					                
					                //계약상태 색깔
					                 var GYEYAK_STATE_CDColumn  =  $(row).find('[data-name="GYEYAK_STATE_CD"]');
					                 var GYEYAK_STATE_CD = data.GYEYAK_STATE_CD;
					                 if(GYEYAK_STATE_CD=="미도래"){
					                	 GYEYAK_STATE_CD='<span class="txtC02" style="font-weight: bolder;">미도래</span>';
									 }else if(GYEYAK_STATE_CD=="최고기간"){
										 GYEYAK_STATE_CD='<span class="txtC04" style="font-weight: bolder;">최고기간</span>';
									 }
					                 GYEYAK_STATE_CDColumn.empty();
					                 GYEYAK_STATE_CDColumn.append(GYEYAK_STATE_CD);
					                //계약상태 색깔 끝
					                 
						        },
                         	paging: { // 그리드 재생산시 페이징 다시 설정 -- 2017.01.03 [H]
     					         countPerPage : 10,
                                  paginationCount : 10,
                                  freezeScrollerY : 'hide'
     					       }
                         });
                    }else if(kindCd=='2'){
                    	 drawArea = webponent.grid.init(div, gridTemplate,{
                    		 rowRendered: function(row, data, index) {
					                $(row).on('click', function(e) {
					                	var className =	$(".selectRow").prop("class");

										if(undefined!=className){
											
											if(className.split(" ")[0]=='CI-GRID-ODD'){
												$(".selectRow").css('background-color',bColor2);

											}else{
												$(".selectRow").css('background-color',bColor1);

											}
						                	
						                	$(".CI-GRID-EVEN").removeClass("selectRow");
						                	$(".CI-GRID-ODD").removeClass("selectRow");
										}
						                	$(this).css('background-color',"rgb(203,207,251)");
						                	$(this).addClass("selectRow");	
					                    e.preventDefault();
					                    e.stopPropagation();   

					                    $.ajax({
						                	  url:"/netCounter/inquiryService/contractInquiry/accInquirySummaryInfo.do"
						                	  ,dataType:"html"
						                	  ,async:true
						                	  ,contentType: "application/json; charset=UTF-8"
						                	  ,data:{
						                		  gyeyak_no:data.GYEYAK_NO
						                	  }
						                	  ,error:function(eLog){
						                		  alert(eLog);
						                	  }
						                	  ,success:function(data){
						                		
						                		  data = decodeURIComponent(data);
						                		  data = data.replace(/[+]/gi,"");

						                		  $("#tbody_summary").html("");
						                		  s="";
												  cash1 = 0;
												  cash2 = 0;
												  cash3 = 0;
												  cash4 = 0;
												  cash5 = 0;
												  cash6 = 0;
						                		  
						                		  $(JSON.parse(data)).each(function(){
						          					
						          					var GYEYAK_NO = this.GYEYAK_NO;
						          					var GYEYAK_STATE_CD = this.GYEYAK_STATE_CD;
						          					var BUNNAP_CNT = this.BUNNAP_CNT;
						          					//var YUHYO_SYMD1 = this.YUHYO_SYMD1;
						          					var BUNNAP_AMT1 = this.BUNNAP_AMT1;
						          					var YOUNGSU_YMD1 = this.YOUNGSU_YMD1;
						          					//var YUHYO_SYMD2 = this.YUHYO_SYMD2;
						          					var BUNNAP_AMT2 = this.BUNNAP_AMT2;
						          					var YOUNGSU_YMD2 = this.YOUNGSU_YMD2;
						          					//var YUHYO_SYMD3 = this.YUHYO_SYMD3;
						          					var BUNNAP_AMT3 = this.BUNNAP_AMT3;
						          					var YOUNGSU_YMD3 = this.YOUNGSU_YMD3;
						          					//var YUHYO_SYMD4 = this.YUHYO_SYMD4;
						          					var BUNNAP_AMT4 = this.BUNNAP_AMT4;
						          					var YOUNGSU_YMD4 = this.YOUNGSU_YMD4;
						          					//var YUHYO_SYMD5 = this.YUHYO_SYMD5;
						          					var BUNNAP_AMT5 = this.BUNNAP_AMT5;
						          					var YOUNGSU_YMD5 = this.YOUNGSU_YMD5;
						          					//var YUHYO_SYMD6 = this.YUHYO_SYMD6;
						          					var BUNNAP_AMT6 = this.BUNNAP_AMT6;
						          					var YOUNGSU_YMD6 = this.YOUNGSU_YMD6;
						          		
			                                           addSummaryInfo(
			                                        		   GYEYAK_NO
			                                                   ,GYEYAK_STATE_CD
			                                                   ,BUNNAP_CNT
			                                                   ,BUNNAP_AMT1
			                                                   ,YOUNGSU_YMD1
			                                                   ,BUNNAP_AMT2
			                                                   ,YOUNGSU_YMD2
			                                                   ,BUNNAP_AMT3
			                                                   ,YOUNGSU_YMD3
			                                                   ,BUNNAP_AMT4
			                                                   ,YOUNGSU_YMD4
			                                                   ,BUNNAP_AMT5
			                                                   ,YOUNGSU_YMD5
			                                                   ,BUNNAP_AMT6
			                                                   ,YOUNGSU_YMD6
			                                                   
			                                             );
						          				});
						                		  
						                		  $("#tbody_summary").html(s);
						                		  $("#cash1").text(commas(cash1));
						                		  $("#cash2").text(commas(cash2));
						                		  $("#cash3").text(commas(cash3));
						                		  $("#cash4").text(commas(cash4));
						                		  $("#cash5").text(commas(cash5));
						                		  $("#cash6").text(commas(cash6));
						                		  
						                		  $("#div_summary").show();
						                		  
						                	  }
						                  });  
					                    
					                    
					                });
					             
					              //상세보기 시작
					                var aTag = $('<span class="btn_pack btn_type24 type2"><a href="#">');

					                aTag.on('click', function (e) {

					                  e.preventDefault();
					                  e.stopPropagation();

					                   var GYEYAK_NO = (data.GYEYAK_NO).trim();
					                   var CAR_GAIP_NO = (data.CAR_GAIP_NO).trim();
					                   var AGENT_NO = (data.AGENT_NO).trim();
					                   var SAUPJANG_SEQ = (data.SAUPJANG_SEQ).trim();
					               		
					                   location.href ='/netCounter/inquiryService/contractInquiry/accDeductInquiry.do?car_gaip_no='+CAR_GAIP_NO+'&gyeyak_no='+GYEYAK_NO+'&agent_no='+AGENT_NO+'&saupjang_seq='+SAUPJANG_SEQ;
					                });


					                var IsuColumn = $(row).find('[data-name="YOYAK"]');

					                IsuColumn.wrapInner(aTag);
					              //상세보기 끝
					                
					                
					              //보상조회 시작 
					                var aTagBosang = $('<a href="#" bosang="bosang" style="color:blue;">');
					                
					                aTagBosang.on('click', function (e) {

						                  e.preventDefault();
						                  e.stopPropagation();
						                  var CAR_NO = (data.CAR_NO).trim();
						                  var BOSANG_CNT = data.BOSANG_CNT;
						                  if(BOSANG_CNT!='0건'){
						                	 	goBosang(CAR_NO);
						                  }  
						             });
					                
					                var CarNoColumn = $(row).find('[data-name="BOSANG_CNT"]');

					                CarNoColumn.wrapInner(aTagBosang);
					                //보상조회 끝
					                
					                
					                
					                //분담금 콤마
					                 var bundamColumn  =  $(row).find('[data-name="BUNDAM_AMT"]');
					                 var BUNDAM_AMT = commas(data.BUNDAM_AMT);
					                 bundamColumn.empty();
					                 bundamColumn.append(BUNDAM_AMT);
					                //분담금 콤마 끝
					                
					                //수납총액 콤마
					                 var TOT_NAPIP_AMTColumn  =  $(row).find('[data-name="TOT_NAPIP_AMT"]');
					                 var TOT_NAPIP_AMT = commas(data.TOT_NAPIP_AMT);
					                 TOT_NAPIP_AMTColumn.empty();
					                 TOT_NAPIP_AMTColumn.append(TOT_NAPIP_AMT);
					                //수납총액 콤마 끝
					                
					                //차회분담금 콤마
					                 var BUNNAP_AMTColumn  =  $(row).find('[data-name="BUNNAP_AMT"]');
					                 var BUNNAP_AMT = commas(data.BUNNAP_AMT);
					                 BUNNAP_AMTColumn.empty();
					                 BUNNAP_AMTColumn.append(BUNNAP_AMT);
					                //차회분담금콤마 끝
					                
					                 //계약기간 개행처리
					                 var GYEYAK_YMDTag = '';
					                var GYEYAK_YMDColumn  =  $(row).find('[data-name="GYEYAK_YMD"]');
					                var GYEYAK_YMD = data.GYEYAK_YMD;
					                var GYEYAK_YMDArray = GYEYAK_YMD.split('~');
					                if(GYEYAK_YMDArray.length==2){
					                	GYEYAK_YMDTag += GYEYAK_YMDArray[0]+'~'+GYEYAK_YMDArray[1];
					                }
					                GYEYAK_YMDColumn.empty();
					                GYEYAK_YMDColumn.append(GYEYAK_YMDTag);
					                //계약기간 개행처리 끝
					                
					                //계약상태 색깔
					                 var GYEYAK_STATE_CDColumn  =  $(row).find('[data-name="GYEYAK_STATE_CD"]');
					                 var GYEYAK_STATE_CD = data.GYEYAK_STATE_CD;
					                 if(GYEYAK_STATE_CD=="미도래"){
					                	 GYEYAK_STATE_CD='<span class="txtC02" style="font-weight: bolder;">미도래</span>';
									 }else if(GYEYAK_STATE_CD=="최고기간"){
										 GYEYAK_STATE_CD='<span class="txtC04" style="font-weight: bolder;">최고기간</span>';
									 }
					                 GYEYAK_STATE_CDColumn.empty();
					                 GYEYAK_STATE_CDColumn.append(GYEYAK_STATE_CD);
					                //계약상태 색깔 끝
						        },
						        
						        paging: {
						        	countPerPage : 10,
	                                paginationCount : 10,
	                                freezeScrollerY : 'hide'
						        },
                          		
                          });
                    }else if(kindCd=='3'){
                    	drawArea = webponent.grid.init(div, gridTemplate,{
                    	rowRendered: function(row, data, index) {
			                $(row).on('click', function(e) {
			                    e.preventDefault();
			                    e.stopPropagation();   					                    
			                    
			                });
			             
			              //상세보기 시작
			                var aTag = $('<span class="btn_pack btn_type24 type2"><a href="#">');

			                aTag.on('click', function (e) {

			                  e.preventDefault();
			                  e.stopPropagation();

			                   var GYEYAK_NO = (data.GYEYAK_NO).trim();
			                   var CAR_GAIP_NO = (data.CAR_GAIP_NO).trim();
			                   var AGENT_NO = (data.AGENT_NO).trim();
			                   var SAUPJANG_SEQ = (data.SAUPJANG_SEQ).trim();

			                   location.href ='/netCounter/inquiryService/contractInquiry/carryDeductInquiry.do?car_gaip_no='+CAR_GAIP_NO+'&gyeyak_no='+GYEYAK_NO+'&agent_no='+AGENT_NO+'&saupjang_seq='+SAUPJANG_SEQ;
			                });


			                var IsuColumn = $(row).find('[data-name="YOYAK"]');

			                IsuColumn.wrapInner(aTag);
			              //상세보기 끝
			                
			                
			              //보상조회 시작 
			                var aTagBosang = $('<a href="#" bosang="bosang" style="color:blue;">');
			                
			                aTagBosang.on('click', function (e) {

				                  e.preventDefault();
				                  e.stopPropagation();
				                  var CAR_NO = (data.CAR_NO).trim();
				                  var BOSANG_CNT = data.BOSANG_CNT;
				                  if(BOSANG_CNT!='0건'){
				                	 	goBosang(CAR_NO);
				                  }  
				             });
			                
			                var CarNoColumn = $(row).find('[data-name="BOSANG_CNT"]');

			                CarNoColumn.wrapInner(aTagBosang);
			                //보상조회 끝
			                
			                
			                
			                //분담금 콤마
			                 var bundamColumn  =  $(row).find('[data-name="BUNDAM_AMT"]');
			                 var BUNDAM_AMT = commas(data.BUNDAM_AMT);
			                 bundamColumn.empty();
			                 bundamColumn.append(BUNDAM_AMT);
			                //분담금 콤마 끝
			                
			                //수납총액 콤마
			                 var TOT_NAPIP_AMTColumn  =  $(row).find('[data-name="TOT_NAPIP_AMT"]');
			                 var TOT_NAPIP_AMT = commas(data.TOT_NAPIP_AMT);
			                 TOT_NAPIP_AMTColumn.empty();
			                 TOT_NAPIP_AMTColumn.append(TOT_NAPIP_AMT);
			                //수납총액 콤마 끝
			                
			                //차회분담금 콤마
			                 var BUNNAP_AMTColumn  =  $(row).find('[data-name="BUNNAP_AMT"]');
			                 var BUNNAP_AMT = commas(data.BUNNAP_AMT);
			                 BUNNAP_AMTColumn.empty();
			                 BUNNAP_AMTColumn.append(BUNNAP_AMT);
			                //차회분담금콤마 끝
			                 
			                 //계약기간 개행처리
			                 var GYEYAK_YMDTag = '';
			                var GYEYAK_YMDColumn  =  $(row).find('[data-name="GYEYAK_YMD"]');
			                var GYEYAK_YMD = data.GYEYAK_YMD;
			                var GYEYAK_YMDArray = GYEYAK_YMD.split('~');
			                if(GYEYAK_YMDArray.length==2){
			                	GYEYAK_YMDTag += GYEYAK_YMDArray[0]+'~'+GYEYAK_YMDArray[1];
			                }
			                GYEYAK_YMDColumn.empty();
			                GYEYAK_YMDColumn.append(GYEYAK_YMDTag);
			                //계약기간 개행처리 끝
			                
			                //계약상태 색깔
			                 var GYEYAK_STATE_CDColumn  =  $(row).find('[data-name="GYEYAK_STATE_CD"]');
			                 var GYEYAK_STATE_CD = data.GYEYAK_STATE_CD;
			                 if(GYEYAK_STATE_CD=="미도래"){
			                	 GYEYAK_STATE_CD='<span class="txtC02" style="font-weight: bolder;">미도래</span>';
							 }else if(GYEYAK_STATE_CD=="최고기간"){
								 GYEYAK_STATE_CD='<span class="txtC04" style="font-weight: bolder;">최고기간</span>';
							 }
			                 GYEYAK_STATE_CDColumn.empty();
			                 GYEYAK_STATE_CDColumn.append(GYEYAK_STATE_CD);
			                //계약상태 색깔 끝 
			                 
				        },
				        
				        paging: {
				        	countPerPage : 10,
                            paginationCount : 10,
                            freezeScrollerY : 'hide'
				        },
				        
				         });
                    }else if(kindCd=='4'){
                    	drawArea = webponent.grid.init(div, gridTemplate,{
                    		rowRendered: function(row, data, index) {
				                $(row).on('click', function(e) {
				                    e.preventDefault();
				                    e.stopPropagation();   					                    
				                    
				                });
				             
				               //상세보기 시작
				                var aTag = $('<span class="btn_pack btn_type24 type2"><a href="#">');

				                aTag.on('click', function (e) {

				                  e.preventDefault();
				                  e.stopPropagation();

				                   var GYEYAK_NO = (data.GYEYAK_NO).trim();
				                   //var CAR_GAIP_NO = (data.CAR_GAIP_NO).trim();
				                   var AGENT_NO = (data.AGENT_NO).trim();
				                   var SAUPJANG_SEQ = (data.SAUPJANG_SEQ).trim();

				                   location.href ='/netCounter/inquiryService/contractInquiry/carryJsDeductInquiry.do?=&gyeyak_no='+GYEYAK_NO+'&agent_no='+AGENT_NO+'&saupjang_seq='+SAUPJANG_SEQ;
				                });


				                var IsuColumn = $(row).find('[data-name="YOYAK"]');

				                IsuColumn.wrapInner(aTag);
				              //상세보기 끝 
				                
				                
				              //보상조회 시작 
				                var aTagBosang = $('<a href="#" bosang="bosang">');
				                
				                aTagBosang.on('click', function (e) {

					                  e.preventDefault();
					                  e.stopPropagation();
					                  var CAR_NO = '주선적재물';
					                  var BOSANG_CNT = data.BOSANG_CNT;
					                  if(BOSANG_CNT!='0건'){
					                	 	goBosang(CAR_NO);
					                  }  
					             });
				                
				                var CarNoColumn = $(row).find('[data-name="BOSANG_CNT"]');

				                CarNoColumn.wrapInner(aTagBosang);
				                //보상조회 끝
				                
				                
				                
				                //분담금 콤마
				                 var bundamColumn  =  $(row).find('[data-name="BUNDAM_AMT"]');
				                 var BUNDAM_AMT = commas(data.BUNDAM_AMT)+"원";
				                 bundamColumn.empty();
				                 bundamColumn.append(BUNDAM_AMT);
				                //분담금 콤마 끝
				                
				                //수납총액 콤마
				                 var TOT_NAPIP_AMTColumn  =  $(row).find('[data-name="TOT_NAPIP_AMT"]');
				                 var TOT_NAPIP_AMT = commas(data.TOT_NAPIP_AMT)+"원";
				                 TOT_NAPIP_AMTColumn.empty();
				                 TOT_NAPIP_AMTColumn.append(TOT_NAPIP_AMT);
				                //수납총액 콤마 끝
				                
				                //차회분담금 콤마
				                 var BUNNAP_AMTColumn  =  $(row).find('[data-name="BUNNAP_AMT"]');
				                 var BUNNAP_AMT = commas(data.BUNNAP_AMT)+"원";
				                 BUNNAP_AMTColumn.empty();
				                 BUNNAP_AMTColumn.append(BUNNAP_AMT);
				                //차회분담금콤마 끝
				                 
					        },
    				        
    				        paging: {
    				        	countPerPage : 10,
                                paginationCount : 10,
                                freezeScrollerY : 'hide'
    				        },
    				        
    				         });
                    } else{
                    
                    drawArea = webponent.grid.init(div, gridTemplate,{
                    	rowRendered: function(row, data, index) {
                    		var acdntTag = $('<a href="#">');
				        	acdntTag.on('click', function(e) {
			                    e.preventDefault();
			                    e.stopPropagation();
			                    var acdnt = data.acdnt_no;
			                    var acdnt_no = acdnt.replace("-","");
			                    location.href = "/netCounter/inquiryService/accountInquiry/compenDetail.do?acdnt_no="+acdnt_no;
			                });
				        	
				        	var carNoTag = $('<a href="#">');
				        	carNoTag.on('click', function(e) {
			                    e.preventDefault();
			                    e.stopPropagation();
			                    var car_gaip_no = data.car_gaip_no;
			                    var gyeyak_no = data.gyeyak_no;
			                    location.href = "/netCounter/inquiryService/contractInquiry/totalContractInquiry.do?car_gaip_no="+car_gaip_no+"&gyeyak_no="+gyeyak_no;
			                });
				        },
                    	paging: { // 그리드 재생산시 페이징 다시 설정 -- 2017.01.03 [H]
					         countPerPage : 10,
                             paginationCount : 10,
                             freezeScrollerY : 'hide'
					       }
                    });
                    
                    }
                    
                    drawArea.appendRow(data);
                    
                    drawArea.makePageList();  // 그리드 재생산시 페이징 다시 설정 -- 2017.01.03 [H]

                    $.extend(true, option.drawArea, drawArea);

                    var markup = $('<html></html>');
                    var head = $('<head></head>');
                    head.append('<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">');
                    
                    var stylesheets = option.stylesheet;
                    if (stylesheets) {
                        for (var i = 0, icnt = stylesheets.length; i < icnt; i++) {
                            var link = $('<link rel="stylesheet">');
                            link.attr('href', stylesheets[i]);
                            head.append(link);
                        }
                    }

                    markup.append(head);


                    var body = $('<body></body>');
                    body.append('<div><span style="font-size:18px; font-weight:bold;">'+agentNm_v+'</span>님의<span style="font-size:18px; font-weight:bold;">'+fileName_v+'</span>현황 입니다.</div>');  // -- 2017.01.03 [H] 요기다 자사 폼 적용 시키면 될듯한데,,, 아닌가?!
                    body.append(gridMarkup);
                    markup.append(body);
                   
                    markup = markup[0].outerHTML;
                    inputObject.HTML = getCompressedParam(markup);

                } else {
                    inputObject.HTML = getCompressedParam(drawArea.outerHTML);
                }

            } else if (typeof drawArea === "string") {
                inputObject.HTML = getCompressedParam(drawArea);
            }
        }

        if (option.param) {
            inputObject.param = getCompressedParam(JSON.stringify(option.param));
        }

        if (option.pdfHeader) {
            inputObject.pdfHeader = getCompressedParam(JSON.stringify(option.pdfHeader));
        }

        if (option.pdfFooter) {
            inputObject.pdfFooter = getCompressedParam(JSON.stringify(option.pdfFooter));
        }

        inputObject.fileName = option.fileName;

        makeFormAndSubmit(form, inputObject, "pdf", option);
    };


    /**
     * Image 내보내기
     * @param {Element}         form        Markup 상의 hidden form element object
     * @param {Object}          option      이미지 추출 옵션값이 지정된 Object
     */
    /*self.image = function (drawArea, form, fileName, type, template, action) {*/
    self.image = function (form, option) {
        if (!option) {
            return;

        } else {
            var template = option.template;
            if (!template) {
                template = "default";
            }

            var inputObject = {};
            var drawArea = option.drawArea;
            if (drawArea) {
                // use phantom
                if (typeof drawArea === "object") {
                    inputObject.HTML = getCompressedParam(drawArea.outerHTML);

                } else if (typeof drawArea === "string") {
                    inputObject.HTML = getCompressedParam(drawArea);
                }

            } else {
                // use batik
                inputObject.SVGSTRING = option.SVGSTRING;
            }

            inputObject.fileName = option.fileName;
            inputObject.template = template;
            inputObject.type = option.type;

            makeFormAndSubmit(form, inputObject, "image", option);
        }
    };


    /**
     * CSV 내보내기
     * @param  {Object | Grid} obj          객체 or 그리드 객체
     *
     *                                       형태 :
     *                                       {
     *                                          header: [{
     *                                              bind:  BLD OUTPUT FIELD'S NAME,
     *                                              label: BLD OUTPUT FIELD'S_LABEL,
     *                                              visibility: 추후 구현예정
     *                                          }],
     *                                          body: OUTPUT DATA
     *                                       }
     * @param  {Element} form               Markup 상의 hidden form element object
     * @param  {String}  options
     */
    self.csv = function (obj, form, options) {
        var columnInfoFilter = ["bind", "visibility", "label"];
        var inputObject = {};
        var header, body;

        if (obj.header) {
            header = JSON.stringify(obj.header);
            body = JSON.stringify(obj.body);

        } else {
            // 그리드 객체가 바로 Parameter로 넘어온 경우
            header = JSON.stringify(obj.settings.columns, columnInfoFilter);
            body = JSON.stringify(obj.data);
        }

        inputObject.header = getCompressedParam(header);
        inputObject.body = getCompressedParam(body);
        inputObject.fileName = options.fileName;

        makeFormAndSubmit(form, inputObject, "csv", options);
    };
})();