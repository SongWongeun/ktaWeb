/*
* Slides, A Slideshow Plugin for jQuery
* Intructions: http://slidesjs.com
* By: Nathan Searles, http://nathansearles.com
* Version: 1.0.9
* Updated: January 4th, 2011
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

(function ($) {
	$.fn.slides = function (option) {

		// override defaults with specified option
		option = $.extend({}, $.fn.slides.option, option);

		return this.each(function () {

			// wrap slides in control container, make sure slides are block level
			$('.' + option.container, $(this)).children().wrapAll('<div class="slides_control"/>');

			var elem = $(this),
				control = $('.slides_control', elem),
				total = control.children().size(),
				width = control.children().outerWidth(),
				height = control.children().outerHeight(),
				start = option.start - 1,
				effect = option.effect.indexOf(',') < 0 ? option.effect : option.effect.replace(' ', '').split(',')[0],
				paginationEffect = option.effect.indexOf(',') < 0 ? effect : option.effect.replace(' ', '').split(',')[1],
				next = 0, prev = 0, number = 0, current = 0, loaded, active, clicked, position, direction;

			// 2 or more slides required
			if (total < 2) {
				return;
			}

			// error corection for start slide
			if (start < 0) {
				start = 0;
			};

			if (start > total) {
				start = total - 1;
			};

			// change current based on start option number
			if (option.start) {
				current = start;
			};

			// randomizes slide order
			if (option.randomize) {
				control.randomize();
			}

			// make sure overflow is hidden
			$('.' + option.container, elem).css({
				//overflow: 'hidden',
				// fix for ie
				position: 'relative'
			});

			// set css for control div
			control.css({
				position: 'relative',
				// size of control 3 x slide width
				width: (width * 3),
				// set height to slide height
				height: height,
				// center control to slide
				left: -width
			});

			// set css for slides - 보이는 객체 설정
			control.children().css({
				position: option.position,
				top: 0,
				left: width,
				zIndex: 0,
				display: 'none'
			});

			// if autoHeight true, get and set height of first slide
			if (option.autoHeight) {
				control.animate({
					height: control.children(':eq(' + start + ')').outerHeight()
				}, option.autoHeightSpeed);
			}

			// checks if image is loaded
			if (option.preload && control.children()[0].tagName == 'IMG') {
				// adds preload image
				elem.css({
					background: 'url(' + option.preloadImage + ') no-repeat 50% 50%'
				});

				// gets image src, with cache buster
				var img = $('img:eq(' + start + ')', elem).attr('src') + '?' + (new Date()).getTime();

				// checks if image is loaded
				$('img:eq(' + start + ')', elem).attr('src', img).load(function () {
					// once image is fully loaded, fade in
					$(this).fadeIn(option.fadeSpeed, function () {
						$(this).css({
							zIndex: option.zIndex
						});
						// removes preload image
						elem.css({
							background: ''
						});
						// let the script know everything is loaded
						loaded = true;
					});
				});
			} else {
				// if no preloader fade in start slide
				control.children(':eq(' + start + ')').fadeIn(option.fadeSpeed, function () {
					// let the script know everything is loaded
					loaded = true;
				});
			}

			// click slide for next
			if (option.bigTarget) {
				// set cursor to pointer
				control.children().css({
					cursor: 'pointer'
				});
				// click handler
				control.children().click(function () {
					// animate to next on slide click
					animate('next', effect);
					return false;
				});
			}

			// pause on mouseover
			if (option.hoverPause && option.play) {
				control.children().bind('mouseover', function () {
					// on mouse over stop
					stop();
				});
				control.children().bind('mouseleave', function () {
					// on mouse leave start pause timeout
					pause();
				});
			}

			// generate next/prev buttons
			if (option.generateNextPrev) {
				$('.' + option.container, elem).after('<a href="#" class="' + option.prev + '">Prev</a>');
				$('.' + option.prev, elem).after('<a href="#" class="' + option.next + '">Next</a>');
			}

			// next button
			$('.' + option.next).css({cursor:'pointer'});
			//$('.' + option.next, elem).click(function (e) {
			$('.' + option.next).click(function (e) {
				e.preventDefault();
				if (option.play) {
					pause();
				};
				animate('next', effect);
			});

			// previous button
			$('.' + option.prev).css({ cursor: 'pointer' });
			//$('.' + option.prev, elem).click(function (e) {
			$('.' + option.prev).click(function (e) {
				e.preventDefault();
				if (option.play) {
					pause();
				};
				animate('prev', effect);
			});

			// generate pagination
			if (option.generatePagination) {
				// create unordered list
				if ($('.' + option.paginationClass).length == 0)
					elem.append('<ul class=' + option.paginationClass + '></ul>');
				
				//애니메이션보다 더 위의 레이어로 표시
				$('.' + option.paginationClass).css({zIndex: option.zIndex + 1});
				
				// for each slide create a list item and link
				control.children().each(function () {
					$('.' + option.paginationClass, elem).append('<li><a href="#'+ number +'">'+ (number+1) +'</a></li>');
					//$('.' + option.paginationClass, elem).append('<li><a href="#' + number + '"></a></li>');
					number++;
				});
				
				//코드 추가 : 재생, 정지 컨트롤러
				if(option.showControl) {
					var iSpeed = 50;
					if($('ul.slideControl').length == 0)
						elem.append('<ul class="slideControl"></ul>');
		
					//애니메이션보다 더 위의 레이어로 표시
					$('.slideControl').css({zIndex: option.zIndex + 1});
					
					$('.' + option.paginationClass).css({zIndex: option.zIndex + 1});
					
					$('ul.slideControl').append('<li><a class="pause" href="#pause" alt="pause"></a></li>');
					$('ul.slideControl').append('<li><a class="play" href="#play" alt="play"></a></li>');
					
					$('a.pause').click(function() {
						stop();
						$(this).hide(iSpeed, function(){
							$('a.play').show(iSpeed);
						});						
					});
					
					$('a.play').click(function() {
						// set interval
						playInterval = setInterval(function () {
							animate('next', effect);
						}, option.play);
						// store interval id
						elem.data('interval', playInterval);
						$(this).hide(iSpeed, function(){
							$('a.pause').show(iSpeed);
						});						
					});
					$('a.play').hide(iSpeed);
				}		
			} 
			else {
				// if pagination exists, add href w/ value of item number to links
				$('.' + option.paginationClass + ' li a', elem).each(function () {
					$(this).attr('href', '#' + number);
					number++;
				});
			}

			// add current class to start slide pagination
			$('.' + option.paginationClass + ' li:eq(' + start + ')', elem).addClass('current');

			// click handling 
			$('.' + option.paginationClass + ' li a', elem).click(function () {
				// pause slideshow
				if (option.play) {
					pause();
				};
				// get clicked, pass to animate function					
				clicked = $(this).attr('href').match('[^#/]+$');
				// if current slide equals clicked, don't do anything
				if (current != clicked) {
					animate('pagination', paginationEffect, clicked);
				}
				
				return false;
			});

			// click handling 
			$('a.link', elem).click(function () {
				// pause slideshow
				if (option.play) {
					pause();
				};
				// get clicked, pass to animate function					
				clicked = $(this).attr('href').match('[^#/]+$') - 1;
				// if current slide equals clicked, don't do anything
				if (current != clicked) {
					animate('pagination', paginationEffect, clicked);
				}

				return false;
			});

			if (option.play) {
				// set interval
				playInterval = setInterval(function () {
					animate('next', effect);
				}, option.play);
				// store interval id
				elem.data('interval', playInterval);
			};

			function stop() {
				// clear interval from stored id
				clearInterval(elem.data('interval'));		//인터벌 클리어
				elem.removeData('interval');				//객체에 저장된 인터벌 함수 제거
				clearTimeout(elem.data('pause'));			//타임아웃 클리어
			};

			function pause() {
				if (option.pause) {
					// clear timeout and interval
					clearTimeout(elem.data('pause'));
					clearInterval(elem.data('interval'));
					// pause slide show for option.pause amount
					pauseTimeout = setTimeout(function () {
						// clear pause timeout
						clearTimeout(elem.data('pause'));
						// start play interval after pause
						playInterval = setInterval(function () {
							animate("next", effect);
						}, option.play);
						// store play interval
						elem.data('interval', playInterval);
					}, option.pause);
					// store pause interval
					elem.data('pause', pauseTimeout);
				} else {
					// if no pause, just stop
					stop();
				}
			};

			// animate slides
			function animate(direction, effect, clicked) {
				if (!active && loaded) {
					active = true;
					switch (direction) {
						case 'next':
							// change current slide to previous
							prev = current;
							// get next from current + 1
							next = current + 1;
							// if last slide, set next to first slide
							next = total === next ? 0 : next;
							// set position of next slide to right of previous
							position = width * 2;
							// distance to slide based on width of slides
							direction = -width * 2;
							// store new current slide
							current = next;
							break;
						case 'prev':
							// change current slide to previous
							prev = current;
							// get next from current - 1
							next = current - 1;
							// if first slide, set next to last slide
							next = next === -1 ? total - 1 : next;
							// set position of next slide to left of previous
							position = 0;
							// distance to slide based on width of slides
							direction = 0;
							// store new current slide
							current = next;
							break;
						case 'pagination':
							// get next from pagination item clicked, convert to number
							next = parseInt(clicked, 10);
							// get previous from pagination item with class of current
							prev = $('.' + option.paginationClass + ' li.current a', elem).attr('href').match('[^#/]+$');
							// if next is greater then previous set position of next slide to right of previous
							if (next > prev) {
								position = width * 2;
								direction = -width * 2;
							} else {
								// if next is less then previous set position of next slide to left of previous
								position = 0;
								direction = 0;
							}
							// store new current slide
							current = next;
							break;
					}

					// fade animation
					if (effect === 'fade') {
						option.animationStart();
						// fade animation with crossfade
						if (option.crossfade) {
							// put hidden next above current
							control.children(':eq(' + next + ')', elem).css({
								zIndex: option.zIndex 
								// fade in next
							}).fadeIn(option.fadeSpeed, function () {
								if (option.autoHeight) {
									// animate container to height of next
									control.animate({
										height: control.children(':eq(' + next + ')', elem).outerHeight()
									}, option.autoHeightSpeed, function () {
										// hide previous
										control.children(':eq(' + prev + ')', elem).css({
											display: 'none',
											zIndex: option.zIndex - option.zIndex
										});
										// reset z index
										control.children(':eq(' + next + ')', elem).css({
											zIndex: option.zIndex - option.zIndex
										});
										// end of animation
										option.animationComplete(next + 1);
										active = false;
									});
								} else {
									// hide previous
									control.children(':eq(' + prev + ')', elem).css({
										display: 'none',
										zIndex: option.zIndex - option.zIndex
									});
									// reset zindex
									control.children(':eq(' + next + ')', elem).css({
										zIndex: option.zIndex - option.zIndex
									});
									// end of animation
									option.animationComplete(next + 1);
									active = false;
								}
							});
						} else {
							option.animationStart();
							// fade animation with no crossfade
							control.children(':eq(' + prev + ')', elem).fadeOut(option.fadeSpeed, function () {
								// animate to new height
								if (option.autoHeight) {
									control.animate({
										// animate container to height of next
										height: control.children(':eq(' + next + ')', elem).outerHeight()
									}, option.autoHeightSpeed,
									// fade in next slide
									function () {
										control.children(':eq(' + next + ')', elem).fadeIn(option.fadeSpeed);
									});
								} else {
									// if fixed height
									control.children(':eq(' + next + ')', elem).fadeIn(option.fadeSpeed, function () {
										// fix font rendering in ie, lame
										if ($.browser.msie) {
											$(this).get(0).style.removeAttribute('filter');
										}
									});
								}
								// end of animation
								option.animationComplete(next + 1);
								active = false;
							});
						}
						
					}
					// slide animation
					else {
						// move next slide to right of previous
						control.children(':eq(' + next + ')').css({
							left: position
							, display: 'block'
						});
						// animate to new height
						if (option.autoHeight) {
							option.animationStart();
							control.animate({
								left: direction,
								height: control.children(':eq(' + next + ')').outerHeight()
							}, option.slideSpeed, function () {
								control.css({
									left: -width
									, zIndex: option.zIndex - option.zIndex
								});
								control.children(':eq(' + next + ')').css({
									left: width,
									zIndex: option.zIndex
								});
								// reset previous slide
								control.children(':eq(' + prev + ')').css({
									left: width,
									display: 'none',
									zIndex: option.zIndex - option.zIndex
								});
								// end of animation
								option.animationComplete(next + 1);
								active = false;
							});
							// if fixed height
						} else {
							option.animationStart();
							// animate control
							control.animate({
								left: direction
							}, option.slideSpeed, function () {
								// after animation reset control position
								control.css({
									left: -width, 
									zIndex: option.zIndex - option.zIndex
								});
								// reset and show next
								control.children(':eq(' + next + ')').css({
									left: width,
									zIndex: option.zIndex
								});
								// reset previous slide
								control.children(':eq(' + prev + ')').css({
									left: width,
									display: 'none',
									zIndex: option.zIndex - option.zIndex
								});
								// end of animation
								option.animationComplete(next + 1);
								active = false;
							});
						}
					}
					// set current state for pagination
					if (option.pagination) {
						// remove current class from all
						$('.' + option.paginationClass + ' li.current', elem).removeClass('current');
						// add current class to next
						$('.' + option.paginationClass + ' li:eq(' + next + ')', elem).addClass('current');
					}
					
					//재생, 정지 컨트롤이 있고, 포즈 상태일 때 계속 정지 
					if($('a.play').length > 0 && $('a.play').is(':visible')) {
						stop();						
					}					
				}
			}; // end animate function
		});
	};

	// default options
	$.fn.slides.option = {
		preload: false, // boolean, Set true to preload images in an image based slideshow
		preloadImage: '/img/loading.gif', // string, Name and location of loading image for preloader. Default is "/img/loading.gif"
		container: 'slides_container', // string, Class name for slides container. Default is "slides_container"
		generateNextPrev: false, // boolean, Auto generate next/prev buttons
		next: 'next', // string, Class name for next button
		prev: 'prev', // string, Class name for previous button
		pagination: true, // boolean, If you're not using pagination you can set to false, but don't have to
		generatePagination: true, // boolean, Auto generate pagination
		paginationClass: 'pagination', // string, Class name for pagination
		fadeSpeed: 350, // number, Set the speed of the fading animation in milliseconds
		slideSpeed: 350, // number, Set the speed of the sliding animation in milliseconds
		start: 1, // number, Set the speed of the sliding animation in milliseconds
		effect: 'slide', // string, '[next/prev], [pagination]', e.g. 'slide, fade' or simply 'fade' for both
		crossfade: false, // boolean, Crossfade images in a image based slideshow
		randomize: false, // boolean, Set to true to randomize slides
		play: 0, // number, Autoplay slideshow, a positive number will set to true and be the time between slide animation in milliseconds
		pause: 0, // number, Pause slideshow on click of next/prev or pagination. A positive number will set to true and be the time of pause in milliseconds
		hoverPause: false, // boolean, Set to true and hovering over slideshow will pause it
		autoHeight: false, // boolean, Set to true to auto adjust height
		autoHeightSpeed: 350, // number, Set auto height animation time in milliseconds
		bigTarget: false, // boolean, Set to true and the whole slide will link to next slide on click
		animationStart: function () { }, // Function called at the start of animation
		animationComplete: function () { } // Function called at the completion of animation
		, position: 'absolute'
		, zIndex: 1
		, showControl: false
	};

	// Randomize slide order on load
	$.fn.randomize = function (callback) {
		function randomizeOrder() { return (Math.round(Math.random()) - 0.5); }
		return ($(this).each(function () {
			var $this = $(this);
			var $children = $this.children();
			var childCount = $children.length;
			if (childCount > 1) {
				$children.hide();
				var indices = [];
				for (i = 0; i < childCount; i++) { indices[indices.length] = i; }
				indices = indices.sort(randomizeOrder);
				$.each(indices, function (j, k) {
					var $child = $children.eq(k);
					var $clone = $child.clone(true);
					$clone.show().appendTo($this);
					if (callback !== undefined) {
						callback($child, $clone);
					}
					$child.remove();
				});
			}
		}));
	};
})(jQuery);