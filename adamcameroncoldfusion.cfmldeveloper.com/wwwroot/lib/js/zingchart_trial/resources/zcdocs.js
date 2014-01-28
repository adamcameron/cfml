$(document).ready(function() {

	$('.carousel').carousel({
		interval: 2000
	});

	zcdocs.utils = {
		rvalue : function(min, max, integer) {
			if (typeof(integer) == 'undefined') integer = true;
			var v = min + (max-min)*Math.random();
			return integer?parseInt(v, 10):v;
		},
		rvalues : function(n, min, max, integer) {
			if (typeof(i) == 'undefined') integer = true;
			var v = [];
			for (var i=0;i<n;i++) {
				v.push(zcdocs.utils.rvalue(min, max, integer));
			}
			return v;
		},
		rcolor : function() {
			return '#' + (function(h){return new Array(7-h.length).join("0")+h})((Math.random()*(0xFFFFFF+1)<<0).toString(16));
		}
	};

	zcdocs.demos.dump = function() {
		if ($('#console')) {
			for (var i=0;i<arguments.length;i++) {
				$('#console').append(zcdocs.dump(arguments[i]) + '; ');
			}
			$('#console').append('<br/>');
		}
		if (console && console.log) {
			console.log(arguments);
		}
	}

	function syncNavBar(bFirst) {
		$('#toc').css('height', '');
		if ($('#toc').height() > $(window).height() - 90) {
			$('#toc').css('height', $(window).height() - 90);
		}
		if (bFirst) {
			$('#toc').fadeIn();
		}
	}

	syncNavBar(true);
	$(window).resize(function() {
		syncNavBar(false);
	});

	$('#toc li').click(function() {
		$('#toc li').removeClass('active');
		$(this).addClass('active');
	});

	if ($('#toc').length) {
		$(window).resize(function() {
			$('#toc').css('top', $('#topbar').height() + 15).css('right', $('#lcolumn').offset().left).css('width', $('#rcolumn').width());
		});
		$('#toc').css('top', $('#topbar').height() + 15).css('right', $('#lcolumn').offset().left).css('width', $('#rcolumn').width());

		$('#toc a').tooltip({
			placement:'left'
		});
	}

	zcdocs.demos.clean = function() {
		var demo = zcdocs.demos.items[zcdocs.demos.position];
		// run the clean code
		if (demo.clean) {
			demo.clean.call();
		}
	}

	zcdocs.demos.render = function() {
		var demo = zcdocs.demos.items[zcdocs.demos.position];

		zingchart.exec('demo-chart', 'destroy');

		$('#zcdemo .modal-header h3').html(demo.topic);

		var strhtml = '';
		if (demo.html) {
			strhtml += demo.html.join('');
		}
		$('#demo-html').html(strhtml);

		var offsety = 0;
		if (strhtml != '') {
			offsety = 30;
		}

		// run the jscode
		if (demo.console) {
			$('#demo-chart').height(300);
			$('#demo-info').height(300);
			$('#console').show().height(90);
			$('#demo-json').height(252 - offsety);
			$('#demo-javascript').height(252 - offsety);
		} else {
			$('#console').hide().height(0);
			$('#demo-chart').height(410);
			$('#demo-info').height(410);
			$('#demo-json').height(362 - offsety);
			$('#demo-javascript').height(362 - offsety);
		}

		zingchart.OFFSET = 1;
		//zcdocs.demos.output = 'flash';
		//by default use FORCESCALE true on maps
		zingchart.maps.FORCESCALE = true;
		zingchart.render({
			id : 'demo-chart',
			data : JSON.stringify(demo.json), // provide stringified json to prevent object overwrite
			output : (zcdocs.demos.output=='html5')?'svg':'flash',
			liburl : 'zingchart/zingchart.swf',
			preservecontainer : true
		});

		$('#demo-tab li').removeClass('active');
		$('#demo-info-content>div').removeClass('active').removeClass('in');

		var bActive = false;

		var strjavascript = '';
		if (demo.code) {
			strjavascript += demo.code.join("\n");
			for (var i in demo.tokens) {
				strjavascript = strjavascript.replace(new RegExp(demo.tokens[i], 'g'), '<b>' + demo.tokens[i] + '</b>');
			}
		}
		$('#demo-javascript').html(strjavascript);
		if (strjavascript != '') {
			if (!bActive) {
				bActive = true;
				$('#tab-javascript').addClass('active');
				$('#demo-javascript').addClass('active').addClass('in');
			}
			$('#tab-javascript').show();
		} else {
			$('#tab-javascript').hide();
		}

		var strjson = '';
		strjson += zcdocs.formatJSON(JSON.stringify(demo.json));
		strjson = strjson.replace(/</g, '&lt;').replace(/>/g, '&gt;');
		for (var i in demo.tokens) {
			strjson = strjson.replace(new RegExp('"' + demo.tokens[i] + '"', 'g'), '"<b>' + demo.tokens[i] + '</b>"');
		}
		$('#demo-json').html(strjson);
		if (strjson != '') {
			if (!bActive) {
				bActive = true;
				$('#tab-json').addClass('active');
				$('#demo-json').addClass('active').addClass('in');
			}
			$('#tab-json').show();
		} else {
			$('#tab-json').hide();
		}

		if (demo.js) {
			demo.js.call();
		}

	}

	$('.demos-run').click(function() {
		zcdocs.demos.position = 0;
		zcdocs.demos.render();
	});

	$('.demo').click(function() {
		var demoid = this.id.replace('demo-', '');

		zcdocs.demos.position = -1;
		for (var i=0;i<zcdocs.demos.items.length;i++) {
			if (demoid == zcdocs.demos.items[i].id) {
				zcdocs.demos.position = i;
			}
		}
		if (zcdocs.demos.position != -1) {
			zcdocs.demos.render();
		}
	});

	$('#zcjsontree').on('show', function() {
		$(this).css('width', 640).css('margin-left', -320);
		$(this).css('height', 500).css('margin-top', -250);
	});

	$('#zcdemo').on('show', function() {
		$(this).css('width', 840).css('margin-left', -420);
		$(this).css('height', 520).css('margin-top', -260);
	});

	$('#zcdemo').on('hide', function() {
		zcdocs.demos.clean();
		zingchart.exec('demo-chart', 'destroy');
		$('#console').html('');
	});

	$('#json-tree a').click(function() {
		$('#zcjsontree').modal('hide')
	});

	$('#zcdemo li.previous a').click(function() {
		zcdocs.demos.clean();
		$('#console').html('');
		zcdocs.demos.position--;
		if (zcdocs.demos.position < 0) {
			zcdocs.demos.position = zcdocs.demos.items.length-1;
		}
		zcdocs.demos.render();
	});

	$('#zcdemo li.next a').click(function() {
		zcdocs.demos.clean();
		$('#console').html('');
		zcdocs.demos.position++;
		if (zcdocs.demos.position > zcdocs.demos.items.length-1) {
			zcdocs.demos.position = 0;
		}
		zcdocs.demos.render();
	});

	//==================================================

	zcdocs.formatJSON = function(sJson) {
		sJson = sJson.replace(/\t|\r|\n/g, '');
		var sJson_ = '';
		var bValue = false;
		var bArray = false;
		var iLevel = 0;
		var sChar_ = '';
		for (var i=0;i<sJson.length;i++) {
			sChar = sJson.substr(i, 1);
			switch (sChar) {
				case '"':
					bValue = !bValue;
					sJson_ += sJson.substr(i, 1);
					sChar_ = sChar;
					break;
				case '{':
					sJson_ += sJson.substr(i, 1);
					if (!bValue) {
						sJson_ += "\n" + (new Array(iLevel+1).join('    '));
						iLevel++;
						sChar_ = sChar;
					}
					break;
				case '}':
					if (!bValue) {
						sJson_ += "\n" + (new Array(iLevel-2+1).join('    '));
						iLevel--;
						sChar_ = sChar;
					}
					sJson_ += sJson.substr(i, 1);
					break;
				case '[':
					var iPos1 = sJson.indexOf(']', i);
					var iPos2a = sJson.indexOf('}', i);
					iPos2a = (iPos2a == -1)?999999:iPos2a;
					var iPos2b = sJson.indexOf('{', i);
					iPos2b = (iPos2b == -1)?999999:iPos2b;
					iPos2 = iPos2a<iPos2b?iPos2a:iPos2b;
					if (iPos1 < iPos2) {
						bArray = true;
						sJson_ += sJson.substr(i, 1);
					} else {
						bArray = false;
						sJson_ += sJson.substr(i, 1);
						sJson_ += "\n" + (new Array(iLevel+1).join('    '));
						iLevel++;
					}
					sChar_ = sChar;
					break;
				case ']':
					if (bArray) {
						bArray = false;
					}
					if (sChar_ == '}') {
						iLevel--;
						sJson_ += "\n" + (new Array(iLevel-1+1).join('    '));
					}
					sJson_ += sJson.substr(i, 1);
					sChar_ = sChar;
					break;
				case ' ':
					if (bValue) {
						sJson_ += sJson.substr(i, 1);
						sChar_ = sChar;
					}
					break;
				case ',':
					sJson_ += sJson.substr(i, 1);
					if (!bValue && !bArray) {
						sJson_ += "\n" + (new Array(iLevel-1+1).join('    '));
					}
					sChar_ = sChar;
					break;
				default:
					sJson_ += sJson.substr(i, 1);
					sChar_ = sChar;
					break;
			}
		}
		return sJson_;
	};

	//==================================================

	zcdocs.dump = function(mObject, l) {
		if (typeof(l) == 'undefined') {
			l = 0;
		}
		var sType = typeof(mObject);
		if (sType != 'object' || mObject === null) {
			if (sType == 'string') {
				mObject = '"' + mObject.replace('\\', '\\\\').replace('"', '\"') + '"';
			}
			return String(mObject);
		} else {
			var n, v, aTokens=[], bArray=(mObject && mObject.constructor == Array);
			if (l > 0) {
				aTokens.push('Object');
			} else {
				for (n in mObject) {
					if (mObject.hasOwnProperty(n) && typeof(mObject[n]) != 'function') {
						v = mObject[n];
						sType = typeof(v);
						if (sType == 'string') {
							v = '"' + v.replace('\\', '\\\\').replace('"', '\\"') + '"';
						} else if (sType == 'object' && v !== null) {
							v = zcdocs.dump(v, l+1);
						}
						aTokens.push((bArray?'':'"' + n + '":') + String(v));
					}
				}
			}
			return (bArray?'[':'{') + String(aTokens) + (bArray?']':'}');
		}
	};

});