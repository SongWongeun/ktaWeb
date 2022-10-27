/**
 * 그리드 기본 UI확장
 * 
 * @author 오상원, 신이섭, 평다진
 */
webponent.grid.UIplugin = (function () {

	var self = {};

	function makeFilteringUI (grid, option) {

		var gridArea = $(grid.markup.area);

		var filteringOpener = null;

		if (option.filteringButton) {

			filteringOpener = option.filteringButton;

		} else {

			filteringOpener = $('<button type="button" class="ci-grid-filtering-opener">');

			filteringOpener.outerWidth(grid.settings.scrollBarWidth + 2);
			filteringOpener.outerHeight($(grid.markup.main.header.wrapper).height());

			gridArea.append(filteringOpener);
		} 

		var filteringInputMap = {};

		var filteringPanelWrapper = $('<div class="ci-grid-filtering-panel-wrapper">');

		var filteringPanel = $('<div class="ci-grid-filtering-panel">');

		var filteringPanelInner = $('<div class="ci-grid-filtering-panel-inner">');

		var scrollIndicator = $('<div class="ci-grid-filtering-panel-scroll-indi">');

		scrollIndicator.css({
			
			'width' : grid.settings.scrollBarWidth,
			'height' : grid.settings.scrollBarWidth
		});

		filteringPanelWrapper.hide();

		filteringPanel.append(filteringPanelInner);

		filteringPanelWrapper.append(filteringPanel);

		filteringPanelWrapper.append(scrollIndicator);

		gridArea.append(filteringPanelWrapper);

		var gridWidth = gridArea.width();

		filteringPanelWrapper.outerWidth(gridWidth);
		filteringPanelWrapper.css('top', grid.markup.main.header.wrapper.clientHeight + 1);

		filteringPanel.outerWidth(gridWidth - grid.settings.scrollBarWidth - 4);

		filteringPanelWrapper.on('mousedown', function () {
			filteringPanelWrapper.css('cursor', '-webkit-grabbing');
		});

		filteringPanelWrapper.on('mouseup', function () {
			filteringPanelWrapper.css('cursor', '-webkit-grab');
		});

		filteringPanelWrapper.draggable({
			axis : 'y',
			containment : gridArea
		});

		filteringPanelWrapper.on('mouseenter', function () {
			filteringPanelWrapper.stop(true, true);
			filteringPanelWrapper.addClass('ci-grid-filtering-panel-wrapper-focused', 300, 'easeOutQuint');
		});

		filteringPanelWrapper.on('mouseleave', function () {

			if (filteringPanelWrapper.find(':focus').length === 0) {

				filteringPanelWrapper.stop(true, true);
				filteringPanelWrapper.removeClass('ci-grid-filtering-panel-wrapper-focused', 300, 'easeOutQuint');
			}
		});

		var columns = grid.settings.columns;

		function filterColumn (columnName, key) {

			grid.filterColumn(columnName, key);
		}

		var filterColumnLazy = _.debounce(filterColumn, 300);

		var notMultiHeader = true;

		var gridHeader = grid.markup.main.header.thead;

		if ($(gridHeader).find('tr').length > 1) {

			notMultiHeader = false;
		}

		if (notMultiHeader) {

			_.each(columns, function (column, index, list) {

				var input = $('<input type="text" class="ci-grid-filtering-input">');

				filteringInputMap[column.name] = input;

				input.outerWidth(column.width - 20);

				input.css('text-align', column.align);

				input.on('keyup', function () {

					filterColumnLazy(column.name, $.trim(input.val()));
				});

				filteringPanelInner.append(input);

				if (column.visibility != 'visible') {
					input.hide();
				}
				
			});	
		} else {

			_.each(columns, function (column, index, list) {

				if (column.parentColumn !== null) {

					var input = $('<input type="text" class="ci-grid-filtering-input">');

					filteringInputMap[column.name] = input;

					input.outerWidth(column.width - 20);

					input.css('text-align', column.align);

					input.on('keyup', function () {

						filterColumnLazy(column.name, $.trim(input.val()));
					});

					filteringPanelInner.append(input);

					if (column.visibility != 'visible') {
						input.hide();
					}
				}
				
			});			
		}

		var columns = grid.settings.columns;

		var fixedColumnCount = _.filter(columns, function (column) {

			return column.fixed;
		}).length;

		grid.on('scroll', function (e, grid, top, left) {

			if (fixedColumnCount > 0) {

				_.each(columns, function (column, index, list) {
					
					if (column.visibility == 'visible') {

						var input = filteringInputMap[column.name];

						if (input) {

							filteringInputMap[column.name].show();
						}
						
					} else {

						var input = filteringInputMap[column.name];

						if (input) {

							filteringInputMap[column.name].hide();
						}
						
					}
				});
			} else {

				filteringPanel.scrollLeft(left);
			}

			
		});

		grid.on('columnResized', function (e, grid, column) {

			var filteringInput = filteringInputMap[column.name];

			if (column.visibility == 'visible') {

				filteringInput.show();
			} else {

				filteringInput.hide();
			}

			filteringInput.outerWidth(column.width - 20);
		});

		function renderFilteringInputWidth () {

			_.each(columns, function (column, index, list) {
				
				if (notMultiHeader) {

					if (column.visibility == 'visible') {

						var filteringInput = filteringInputMap[column.name];

						var columnWidth = column.width;

						if (column.width === null) {

							columnWidth = $(column.header).outerWidth();
						}
						filteringInput.outerWidth(columnWidth - 20);

					}
				} else {
					if (column.visibility == 'visible' && column.parentColumn) {

						var filteringInput = filteringInputMap[column.name];

						var columnWidth = column.width;

						if (column.width === null) {

							columnWidth = $(column.header).outerWidth();
						}
						filteringInput.outerWidth(columnWidth - 20);

					}
				}
				
			});
		}

		function calulateFilteringUIWidth () {

			var gridWidth = gridArea.width();
			filteringPanelWrapper.outerWidth(gridWidth);
			filteringPanel.outerWidth(gridWidth - grid.settings.scrollBarWidth - 4);
			renderFilteringInputWidth();
		}

		var lazyRendering = _.debounce(calulateFilteringUIWidth, 50);

		$(window).resize(function () {

			lazyRendering();
		});

		filteringOpener.on('click', function () {

			if (filteringOpener.hasClass('filtering-opened')) {

				
				filteringPanelWrapper.hide();
			} else {
				
				calulateFilteringUIWidth();
				filteringPanelWrapper.show();
				filteringPanelWrapper.addClass('ci-grid-filtering-panel-wrapper-focused');
						
			}

			filteringOpener.toggleClass('filtering-opened');
		});
	}

	function makeSettingUI (grid, option) {

		var gridArea = $(grid.markup.area);

		grid.extention.columnSetting = {};

		var settingOpener = null;

		if (option.settingButton) {

			settingOpener = option.settingButton;
		} else {

			settingOpener = $('<button type="button" class="ci-grid-setting-opener">');
			$(grid.markup.area).prepend(settingOpener);
		}

		var dialogContents = $('<div>');

		var dialogManual = $('<div class="ci-grid-setting-manual-panel">');

		var manual = $('<ul class="ci-grid-setting-manual">');

		manual.append('<li>체크박스를 이용해서 컬럼의 보임/숨김을 선택 할 수 있습니다.</li>');
		manual.append('<li>컬럼을 드래그해서 컬럼의 표시 순서를 변경 할 수 있습니다.</li>');
		manual.append('<li>고정아이콘을 클릭하면 해당 컬럼까지를 스크롤이 안되게 고정 시킬 수 있습니다.</li>');

		dialogManual.append(manual);

		dialogContents.append(dialogManual);

		var columnContainer = $('<ul class="ci-grid-setting-column-container">');

		columnContainer.disableSelection();
		
		var columns = grid.settings.columns;

		function makeColumnList (grid) {

			columnContainer.find('.ci-grid-setting-column').remove();

			var columnContainerWidth = columnContainer.outerWidth(true);

			var divideCount = 4;

			if (columnContainerWidth < 550) {
				divideCount = 2;
			}

			if (columnContainerWidth < 350) {
				divideCount = 1;
			}

			var columnWidth = (columnContainerWidth - 21) / divideCount;

			var columnLiArray = [];
			var visibilityMarkArray = [];
			var fixedMarkArray = [];

			_.each(columns, function (column, index, list) {
				
				var columnLi = $('<li class="ci-grid-setting-column">');

				columnLi.data('name', column.name);

				columnLi.outerWidth(columnWidth, true);

				var visibilityMark = $('<button type="button" class="ci-grid-setting-column-visibility-mark">');

				visibilityMark.data('name', column.name);
				if (column.visibility == 'hidden') {

					visibilityMark.addClass('ci-grid-setting-column-visibility-mark-hidden');
					visibilityMark.attr('title', '컬럼이 숨겨져 있습니다.');
					visibilityMark.data('flag', false);
				} else {

					visibilityMark.removeClass('ci-grid-setting-column-visibility-mark-hidden');
					visibilityMark.attr('title', '컬럼이 보여집니다.');
					visibilityMark.data('flag', true);
				}
				visibilityMarkArray.push(visibilityMark);
				columnLi.append(visibilityMark);

				var columnName = $('<span class="ci-grid-setting-column-name"></span>');
				var columnTitle  = $(column.header).find('.CI-GRID-HEADER-TITLE').text();
				columnName.text(columnTitle);
				columnName.attr('title', columnTitle);
				columnName.width(columnWidth - 60);
				columnLi.append(columnName);

				var fixedMark = $('<button type="button" class="ci-grid-setting-column-fixed-mark">');
				fixedMark.data('name', column.name);
				fixedMark.attr('title', '여기까지 고정하기');
				if (column.fixed) {

					columnLi.addClass('ci-grid-setting-column-fixed');
					fixedMark.addClass('ci-grid-setting-column-fixed-mark-fixed');
					fixedMark.data('flag', true);
				} else {

					columnLi.removeClass('ci-grid-setting-column-fixed');
					fixedMark.remove('ci-grid-setting-column-fixed-mark-fixed');
					fixedMark.data('flag', false);
				}

				fixedMarkArray.push(fixedMark);
				columnLi.append(fixedMark);

				columnLiArray.push(columnLi);
				columnContainer.append(columnLi);
			});

			grid.extention.columnSetting.columnLiArray = columnLiArray;
			grid.extention.columnSetting.visibilityMarkArray = visibilityMarkArray;
			grid.extention.columnSetting.fixedMarkArray = fixedMarkArray;

			makeSortable();

			bindVisibilityMarkEvent();
			bindFixedMarkArrayEvent();

		}

		function bindVisibilityMarkEvent () {

			var visibilityMarkArray = grid.extention.columnSetting.visibilityMarkArray;
			var fixedMarkArray = grid.extention.columnSetting.fixedMarkArray;

			_.each(visibilityMarkArray, function (visibilityMark, index, list) {
				
				visibilityMark.on('click', function () {

					if (fixedMarkArray[index].data('flag')) {
						return;
					}

					if (visibilityMark.data('flag')) {
						visibilityMark.addClass('ci-grid-setting-column-visibility-mark-hidden');
						visibilityMark.data('flag', false);
					} else {
						visibilityMark.removeClass('ci-grid-setting-column-visibility-mark-hidden');
						visibilityMark.data('flag', true);
					}
				});
			});
		}

		function unbindVisibilityMarkEvent () {

			var visibilityMarkArray = grid.extention.columnSetting.visibilityMarkArray;
			
			_.each(visibilityMarkArray, function (visibilityMark, index, list) {

				visibilityMark.off('click');
			});
		}


		function bindFixedMarkArrayEvent () {

			var columnLiArray = grid.extention.columnSetting.columnLiArray;
			var visibilityMarkArray = grid.extention.columnSetting.visibilityMarkArray;
			var fixedMarkArray = grid.extention.columnSetting.fixedMarkArray;

			_.each(fixedMarkArray, function (fixedMark, index, list) {
				
				fixedMark.on('click', function () {

					columnContainer.sortable('destroy');

					var fixedColumnCount = _.filter(fixedMarkArray, function (fixedMark) {

						return fixedMark.data('flag') === true;
					}).length;

					_.each(fixedMarkArray, function (fixedMark, index, list) {
						
						columnLiArray[index].removeClass('ci-grid-setting-column-fixed');
						fixedMark.removeClass('ci-grid-setting-column-fixed-mark-fixed');
						fixedMark.data('flag', false);
					});

					for (var i = 0; i <= index; i ++) {
						
						columnLiArray[i].addClass('ci-grid-setting-column-fixed');
						fixedMarkArray[i].addClass('ci-grid-setting-column-fixed-mark-fixed');
						fixedMarkArray[i].data('flag', true);

						visibilityMarkArray[i].removeClass('ci-grid-setting-column-visibility-mark-hidden');
						visibilityMarkArray[i].data('flag', true);
					}

					if (index === 0 && fixedColumnCount === 1) {

						columnLiArray[0].removeClass('ci-grid-setting-column-fixed');
						fixedMark.removeClass('ci-grid-setting-column-fixed-mark-fixed');
						fixedMark.data('flag', false);
					}

					makeSortable();
				});
			});
		}

		function unbindFixedMarkArrayEvent () {

			var fixedMarkArray = grid.extention.columnSetting.fixedMarkArray;

			_.each(fixedMarkArray, function (fixedMark, index, list) {
				
				fixedMark.off('click');
			});
		}

		function makeSortable () {

			columnContainer.sortable({

				items : '.ci-grid-setting-column:not(.ci-grid-setting-column-fixed)',

				update : function () {

					unbindVisibilityMarkEvent();
					unbindFixedMarkArrayEvent();

					var lis = columnContainer.find('.ci-grid-setting-column');
					var columnLiArray = grid.extention.columnSetting.columnLiArray;
					var visibilityMarkArray = grid.extention.columnSetting.visibilityMarkArray;
					var fixedMarkArray = grid.extention.columnSetting.fixedMarkArray;
					
					lis.each(function (idx) {

						var li = $(this);
						var name = li.data('name');

						var orignalLi = _.find(columnLiArray, function (columnLi) {

							return columnLi.data('name') === name;
						});

						orignalLi.data('index', idx);

					});

					var zipped = [];

					for (var i = 0, end = columnLiArray.length; i < end; i++) {

						zipped.push({
							columnLi : columnLiArray[i],
							visibilityMark: visibilityMarkArray[i],
							fixedMark: fixedMarkArray[i]
						});
					}

					var sortedZip = _.sortBy(zipped, function (zip) {

						return zip.columnLi.data('index');
					});

					for (var i = 0, end = sortedZip.length; i < end; i++) {

						columnLiArray[i] = sortedZip[i].columnLi;
						visibilityMarkArray[i] = sortedZip[i].visibilityMark;
						fixedMarkArray[i] = sortedZip[i].fixedMark;
					}

					grid.extention.columnSetting.columnLiArray = columnLiArray;
					grid.extention.columnSetting.visibilityMarkArray = visibilityMarkArray;
					grid.extention.columnSetting.fixedMarkArray = fixedMarkArray;

					bindVisibilityMarkEvent();
					bindFixedMarkArrayEvent();

				}
			});
		}

		function renderGridColumn (grid) {

			var columnLiArray = grid.extention.columnSetting.columnLiArray;
			var visibilityMarkArray = grid.extention.columnSetting.visibilityMarkArray;
			var fixedMarkArray = grid.extention.columnSetting.fixedMarkArray;

			var columnNameArray = [];

			_.each(columnLiArray, function (columnLi, index, list) {
				
				columnNameArray.push(columnLi.data('name'));
			});

			grid.setColumnOrder(columnNameArray);

			_.each(visibilityMarkArray, function (visibilityMark, index, list) {
				
				var visibility = visibilityMark.data('flag');
				var name = visibilityMark.data('name');

				if (visibility) {

					//grid.getColumnInfo(name).visibility = 'visible';
					grid.setColumnVisibility(name, true);
				} else {

					//grid.getColumnInfo(name).visibility = 'hidden';
					grid.setColumnVisibility(name, false);
				}
				
			});

			//grid.resize();

			var fixedColumnCount = _.filter(fixedMarkArray, function (fixedMark) {

				return fixedMark.data('flag') === true;
			}).length - 1;


			if (fixedColumnCount > -1) {

				grid.setFixedColumn(fixedColumnCount);
			} else {

				grid.destroyFixedColumn();
			}
		}

		dialogContents.append(columnContainer);

		var gridSettingDialog = dialogContents.dialog({

			open : function (event, ui) {
				
				var gridWidth = grid.markup.area.clientWidth;

				var alpha = 0.8;

				if (gridWidth < 500) {

					alpha = 0.95;

				}

				if (gridWidth > 700) {

					alpha = 0.65;
				}

				$(this).dialog('option', 'width', gridArea.width() * 0.8);
				makeColumnList(grid);

				$(this).dialog({
					position : {
						at : 'center',
						of : gridArea,
						my : 'center'
					}
				});
			},

			close : function (event, ui) {

				settingOpener.data('opened', false);
			},

			title : '컬럼 설정',

			dialogClass: "ci-grid-setting-dialog",

			appendTo : gridArea,

			position : {
				my : 'center',
				at : 'center',
				of : gridArea
			},

			resizable : false,

			draggable : false,

			width : gridArea.width() * 0.8,

			buttons: [ 
				{
					text: "되돌리기",
					click: function() { 
						makeColumnList(grid);
					} 
				},
				{ 
					text: "취소",
					click: function() { 
						$( this ).dialog( "close" ); 
					} 
				},
				{ 
					text: "확인",
					'class':'ci-dialog-button-save',
					click: function() { 
						$( this ).dialog( "close" );

						renderGridColumn(grid);
					} 
				}

			]
		});

		gridSettingDialog.dialog('close');

		settingOpener.data('opened', false);

		settingOpener.on('click', function () {

			if (settingOpener.data('opened')) {

				gridSettingDialog.dialog('close');
				settingOpener.data('opened', false);
			} else {
				gridSettingDialog.dialog('open');
				settingOpener.data('opened', true);
			}
		});
	}

	function extendPagingUI (grid, option, uiExtention) {

		var pagingOption = option.paging;

		grid.setPageLayout(pagingOption);

		if (pagingOption.type == 'server') {

			var pagingUI = webponent.pagingUI.init($(grid.markup.area), pagingOption);

			uiExtention.pagingUI = pagingUI;

			pagingUI.on('refreshPagingUI', function (e, option) {

				grid.setPageLayout(option);
			});

		} else if (pagingOption.type == 'client') {

			grid.makePageList();
		}

	}

	function makeGroupingUI (grid) {

		var wrapper = $(grid.markup.area);
		var columns = grid.settings.columns;

		var groupingInfo = grid.settings.grouping.groups;

		var columnUls = [];

		_.each(groupingInfo, function (group, groupIndex, groupList) {

			var ul = $('<ul class="ci-grid-grouping-ul">');
			
			_.each(group, function (member, memberIndex, memberList) {
				
				var memberColumn = grid.getColumnInfo(member);
				
				var memberColumnHeader = $(memberColumn.header);

				memberColumnHeader.off('click');

				var headerTitle = $(memberColumn.header)
						.find('.CI-GRID-HEADER-TITLE').text();

				var li = $('<li class="ci-grid-grouping-ul-li">');
				var a = $('<a href="#" class="ci-grid-grouping-ul-column"/>').text(headerTitle);

				li.attr('data-name', memberColumn.name);
				a.data('name', memberColumn.name);

				a.on('click', function (e) {

					e.preventDefault();

					var currentVisibleColumn = _.find(columns, function (column) {

						return column.grouping.groupNumber === memberColumn.grouping.groupNumber
								&& column.visibility == 'visible';
					});

					grid.setColumnVisibility(currentVisibleColumn.name, false);
					grid.setColumnVisibility($(this).data('name'), true);

					ul.hide();
				});

				memberColumnHeader.on('click.extendedGroupingUI', function () {

					if (ul.is(':visible')) {

						ul.hide();
					} else {

						ul.show();

						ul.find('.ci-grid-grouping-ul-li').show();

						ul.position({
							my : 'left top',
							at : 'left-1 bottom',
							of : memberColumnHeader,
							collision : 'none'
						});

						ul.css('min-width', memberColumn.width + 1 + 'px');

						var currentLi = ul.find('[data-name="' + memberColumn.name + '"]');
						currentLi.hide();
					}

				});

				li.append(a);

				ul.append(li);

			});

			wrapper.append(ul);
			columnUls.push(ul);
		});

		_.each(columnUls, function (columnUl, index, list) {
			
			columnUl.find('.ci-grid-grouping-ul-li')
					.height(grid.settings.trHeight);


		});

		grid.on('scroll columnResized', function () {

			_.each(columnUls, function (columnUl, index, list) {
				
				columnUl.hide();
			});
		});

		/*column.header.addEventListener('touchstart', function(e) {

			var groupNumber = column.grouping.groupNumber;

			var groupMembers = _.filter(columns, function (column) {

				return column.grouping.groupNumber == groupNumber;
			});

			_.each(groupMembers, function (groupMember, index, list) {
				
				var headerTitle = $(groupMember.header)
						.find('.' + GRID_CLASS.FUNCTIONAL.HEADER.TITLE)
						.text();

				
			});
		});*/
	}

	function makeUpdateUI (grid) {

		function updateCell (tr, td, prevText) {

			var input = td.find('.CI-GRID-EDITING-INPUT');
			var value = $.trim(input.val());
			var rowKey = tr[0].rowKey;

			var valueObj = {};

			var cellKey = td.attr('data-name');

			valueObj[cellKey] = value;

			if (prevText === value) {
				
				grid.settings.option.updateCallback = false;
			}

			grid.updateNode(rowKey, valueObj);
			grid.updateData(rowKey, valueObj);

			grid.settings.option.updateCallback = true;

			td.removeClass('CI-GRID-EDITING-CELL');
			input.remove();


		}

		$(grid.markup.main.body.tbody).on('click', 'td', function () {

			var td = $(this);
			var tr = td.closest('tr');

			if (!td.hasClass('CI-GRID-EDITING-CELL')) {
				
				var editingInput = $('<input class="CI-GRID-EDITING-INPUT" type="text">');

				editingInput.css({
					'padding' : td.css('padding'),
					'font-size' : td.css('font-size'),
					'color' : td.css('color'),
					'text-align' : td.css('text-align')
				});

				td.addClass('CI-GRID-EDITING-CELL');

				var prevText = $.trim(td.html());

				editingInput.val(prevText);
				td.append(editingInput);

				editingInput.focus();

				editingInput.blur(function (e) {

					updateCell(tr, td, prevText);
				});

				editingInput.on('keydown', function (e) {

					e.stopPropagation();
					
					var key = e.keyCode;

					if (key === 13) {

						updateCell(tr, td, prevText);
					}
				});
			}
			
			
		});

	}

	function makeTreeUI (grid, treeSetting) {

		var depthKey = treeSetting.depthKey;
		var depthInfo = {};

		grid.event.on('rowAppended', function() {

		    var gridData = grid.data;
		    var rowModels = grid.settings.rows;

		    var hiddenRowIndexs = [];

		    var prevDepth = -1;
		    var currentParentTree = [];

		    _.each(gridData, function (data, index) {
		        
		        var currDepth = data[depthKey] * 1;

		        if (currDepth !== 0) {

		            hiddenRowIndexs.push(index);
		        }

		        depthInfo[index] = [];

		        if (currDepth > prevDepth) {

		            currentParentTree[currDepth] = index;
		            
		        } else if (currDepth < prevDepth) {

		            currentParentTree[currDepth] = index;
		        }

		        if (currDepth > 0) {

		            depthInfo[currentParentTree[currDepth - 1]].push(index);
		        }
		        
		        //console.log(index, currentParentTree, 'curr:', currDepth, 'prev:', prevDepth);
		        
		        prevDepth = currDepth;
		    });

		    // console.log(depthInfo);

		    grid.setRowVisibility(hiddenRowIndexs, false);

		    var rows = grid.rows;

		    _.each(depthInfo, function (children, rowIndex) {
		        
		        var depth = gridData[rowIndex][depthKey];

		        var row = $(rows[rowIndex]);

		        var firstCell = row.find('td').eq(0);

		        if (children.length > 0) {

		            var treeIcon = $('<i tabindex="0" class="ci-grid-tree-indi"/>');
		            firstCell.prepend(treeIcon);

		            treeIcon.data('opened', false);

		            for (var i = 0; i < depth; i++) {
		                
		                firstCell.prepend('<i class="ci-grid-depth-indi"/>');
		            }

		            treeIcon.on('click', function () {

		                if (!treeIcon.data('opened')) {

		                    treeIcon.addClass('ci-grid-tree-indi-opened');

		                    grid.setRowVisibility(children, true);
		                    treeIcon.data('opened', true);
		                } else {

		                    closeAllChildren(rowIndex, children);
		                }
		                
		            });
		        }
		    });
		});

		function closeAllChildren (rowIndex, children) {

		    if (children.lenth == 0) {

		        return;
		    }

		    var treeIcon = $(grid.rows[rowIndex]).find('.ci-grid-tree-indi');

		    treeIcon.removeClass('ci-grid-tree-indi-opened');
		    treeIcon.data('opened', false);

		    grid.setRowVisibility(children, false);

		    _.each(children, function (childIndex) {
		        
		        closeAllChildren(childIndex, depthInfo[childIndex]);
		    });
		}
	}
	/**
	 * 그리드 모바일 최적화 십일자형 트리그리드 UI
	 *  webponent.grid.UIplugin.init(grid, {
		    elevenTree : {
		        widths: ['10%', '45%', '45%']
		    }
		});
	 * @param  {grid} grid   	그리드 객체	
	 * @param  {json} option 	그리그 초기화 옵션
	 * @return {[type]}        [description]
	 */	
	function makeElevenTreeUI(grid, option) {
		var doc = document;
		/**
		 * 타이틀 SPAN TAG 생성
		 * @param  {string} 		text 타이틀 텍스트 (column.label)
		 * @return {jquery node}    jQuery node
		 */
		function makeTitleSpan(text) {

			var span = doc.createElement('span');
				span.className = 'CI-GRID-ELEVEN-TREE-TITLE';
				span.innerHTML = text + ' : ';

			return $(span);
		}
		/**
		 * 태그로 변환 
		 * @param  {node} 			node 자바스크립트 노드
		 * @param  {string} 		tag  변환할 태그명
		 * @return {jquery node}    jQuery node
		 */
		function replaceTag(node, tag) {

			var cell = node;
			var attr = cell.attributes;
			var newElement = document.createElement(tag);
			for (var a = attr.length - 1; a >= 0; a--) {
			    var attrib = attr[a];
			    newElement.setAttribute(attrib.name, attrib.value);
			};
			newElement.innerHTML = cell.innerHTML;

			return $(newElement);
		}

		grid.event.on('rowAppended', function() {

			var gridData = grid.data;

			var columns = grid.settings.columns;

			var rows = grid.rows;

			var viewCount = 0;

			var defaultCellCount = 0;

			var widths = 'auto';

			if(_.has(option, 'widths')) {

				var pixels = _.filter(option.widths, function(value) { return value.split('p').length > 1;});

				if(pixels.length === option.widths.length) {
					
					_.each(option.widths, function(width, index, list) {
						if(index === option.widths.length - 1) {
							var w = Number(option.widths[index].split('px')[0]);
							option.widths[index] = w - grid.settings.scrollBarWidth;
						}
					});
					widths = option.widths;
				} else {
					widths = option.widths;
				}
			}

			var headerTemplate = $(grid.markup.main.header.thead);
			var bodyHeaderTemplate = $(grid.markup.main.body.thead);

			var headerCells = headerTemplate.find('th');
			var bodyHeaderCells = bodyHeaderTemplate.find('th');

			var headerTd = $('<th>'), 
				bodyHeaderTd = headerTd.clone();

			_.each(columns, function( column, columnIndex, columnList) {

				if(columnIndex == 0) {

					$(headerTemplate.find('tr')).prepend(headerTd.attr('name', 'CI_GRID_ELEVEN_HEAD_CELL'));
					$(bodyHeaderTemplate.find('tr')).prepend(bodyHeaderTd.addClass('CI-GRID-BODY-TABLE-THEAD-CELL').attr('name', 'CI_GRID_ELEVEN_BODY_CELL'));

				}

				if(column.elevenTree) {

					defaultCellCount += 1;
				} else {

					$(headerCells[columnIndex]).remove();
					$(bodyHeaderCells[columnIndex]).remove();
				}
			});

			var tempWrapper = $('<div>');
			_.each(rows, function(row, index, list) {

				var cells = $(row).find('th:visible, td:visible');

				var contents = $('<div>');
					contents.addClass('CI-GRID-ELEVEN-TD-CONTENT');

				_.each(columns, function( column, columnIndex, columnList) {
					
					if(columnIndex == 0) {

						var treeIconHtml = '<td><i tabindex="0" class="ci-grid-tree-indi"/></td>';
							treeIconHtml = $(treeIconHtml);
						
						$(row).prepend(treeIconHtml);

					}
					if(!column.elevenTree) {

						var newElement = replaceTag($(cells[columnIndex])[0], 'div');

						var titleSpan = makeTitleSpan(column.label);

						newElement.prepend(titleSpan);

						contents.append(newElement);
						
						$(cells[columnIndex]).remove();
					}
				});

				var tr = $('<tr>');
					tr.attr({
						'tabindex': 0,
						'class': $(row).attr('class')
					}).addClass('CI-GRID-ELEVEN-TR');

				var td = $('<td>');
					td.attr('colspan', defaultCellCount + 1)
				  		.append(contents)
				  		.addClass('CI-GRID-ELEVEN-TD');

				tr.append(td).hide();

				$(row).after(tr);

			});
	
			var headerIndex = 0;
			
			$(grid.markup.wrapper).find('[name=CI_GRID_ELEVEN_HEAD_CELL]').css({
				'width' 	: widths === 'auto' ? 'auto' : widths[headerIndex],
				'min-width' : widths === 'auto' ? 'auto' : widths[headerIndex],
				'max-width' : widths === 'auto' ? 'none' : widths[headerIndex]
			});
			$(grid.markup.wrapper).find('[name=CI_GRID_ELEVEN_BODY_CELL]').css({
				'width' 	: widths === 'auto' ? 'auto' : widths[headerIndex],
				'min-width' : widths === 'auto' ? 'auto' : widths[headerIndex],
				'max-width' : widths === 'auto' ? 'none' : widths[headerIndex]
			});

			_.each(columns, function ( column, columnIndex, columnList) {

				if(column.elevenTree) {

					$(column.header).css({
						'width' 	: widths === 'auto' ? 'auto' : widths[headerIndex + 1],
						'min-width' : widths === 'auto' ? 'auto' : widths[headerIndex + 1],
						'max-width' : widths === 'auto' ? 'none' : widths[headerIndex + 1]
					});

					$(column.copiedHeader).css({
						'width' 	: widths === 'auto' ? 'auto' : widths[headerIndex + 1],
						'min-width' : widths === 'auto' ? 'auto' : widths[headerIndex + 1],
						'max-width' : widths === 'auto' ? 'none' : widths[headerIndex + 1]
					});

					headerIndex ++;

				}
				var micelinous = $(column.micelinous);
				micelinous.hide();
			});

			_.each(grid.markup.functional.resizers, function (resizer, index, list) {
				
				$(resizer).hide();
			});

			$(grid.markup.wrapper).find('.ci-grid-tree-indi').on('click', function (e) {

				e.preventDefault();

				var selector = $(this);

			    if (!selector.data('opened')) {

			        selector.addClass('ci-grid-tree-indi-opened');

			        selector.closest('tr').next().show();

			        selector.data('opened', true);
			    } else {

			        selector.removeClass('ci-grid-tree-indi-opened');

			        selector.data('opened', false);

			        selector.closest('tr').next().hide();
			    }
			    
			    var bodyTableBody = $(grid.markup.main.body.tbody);
			    
			    var freezeScrollerInner = $(grid.markup.functional.freezeScrollerInner);

			    var bodyTableHeight = bodyTableBody.height();

			    freezeScrollerInner.height(bodyTableHeight);

			    $(grid.markup.functional.freezeScroller).getNiceScroll().resize();;

			    if(grid.settings.mobile){
			    	// 모바일인 경우에만 스크롤 사이즈 재산정
			    	grid.resetMobileScrollY();
			    }

			});

		});
	}

	self.init = function (grid, option) {

		var uiExtention = {};

		grid.extention = {};

		if (!option) {

			option = {};
		}

		if (option.filteringUI === true) {

			makeFilteringUI(grid, option);
		}
		
		if (option.settingUI === true) {

			makeSettingUI(grid, option);
		}

		if (option.paging) {

			extendPagingUI(grid, option, uiExtention);
		}

		if (option.groupingUI === true) {

			makeGroupingUI(grid);
		}

		if (option.report === true) {

			makeReportUI(grid);
		}

		if (option.editable === true) {

			makeUpdateUI(grid);
		}

		if (option.tree) {

			makeTreeUI(grid, option.tree);
		}

		if (option.ajaxTree) {

			makeAjaxTreeUI(grid, option.ajaxTree);
		}

		if (option.elevenTree) {

			makeElevenTreeUI(grid, option.elevenTree);
		}

		return uiExtention;
	};

	return self;
})();