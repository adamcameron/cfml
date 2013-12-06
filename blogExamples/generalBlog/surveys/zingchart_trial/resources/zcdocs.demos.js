
	zcdocs.demos.items.push({
		id : "api-addnode",
		topic : "api > addnode",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["addnode","plotindex","value"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "addnode", {
					"plotindex":1,
					"value":zcdocs.utils.rvalue(0, 50)
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"addnode\", {","		\"plotindex\":1,","		\"value\":zcdocs.utils.rvalue(0, 50)","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-addobject",
		topic : "api > addobject",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ]
		},
		tokens : ["addobject"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Run Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "addobject", {
					"type":"label",
					"data":{
						"x":zcdocs.utils.rvalue(100, 400),
						"y":zcdocs.utils.rvalue(50, 300),
						"text":"Label",
						"background-color":"#f90",
						"padding":5
					}
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "addobject", {
					"type":"shape",
					"data":[
						{
							"x":zcdocs.utils.rvalue(100, 400),
							"y":zcdocs.utils.rvalue(50, 300),
							"type":"circle",
							"size":zcdocs.utils.rvalue(10, 20),
							"label":{
								"text":"Shape 1"
							},
							"background-color":"#f09"
						},
						{
							"x":zcdocs.utils.rvalue(100, 400),
							"y":zcdocs.utils.rvalue(50, 300),
							"type":"star5",
							"size":zcdocs.utils.rvalue(10, 20),
							"label":{
								"text":"Shape 2"
							},
							"background-color":"#0f9"
						}
					]
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"addobject\", {","		\"type\":\"label\",","		\"data\":{","			\"x\":zcdocs.utils.rvalue(100, 400),","			\"y\":zcdocs.utils.rvalue(50, 300),","			\"text\":\"Label\",","			\"background-color\":\"#f90\",","			\"padding\":5","		}","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"addobject\", {","		\"type\":\"shape\",","		\"data\":[","			{","				\"x\":zcdocs.utils.rvalue(100, 400),","				\"y\":zcdocs.utils.rvalue(50, 300),","				\"type\":\"circle\",","				\"size\":zcdocs.utils.rvalue(10, 20),","				\"label\":{","					\"text\":\"Shape 1\"","				},","				\"background-color\":\"#f09\"","			},","			{","				\"x\":zcdocs.utils.rvalue(100, 400),","				\"y\":zcdocs.utils.rvalue(50, 300),","				\"type\":\"star5\",","				\"size\":zcdocs.utils.rvalue(10, 20),","				\"label\":{","					\"text\":\"Shape 2\"","				},","				\"background-color\":\"#0f9\"","			}","		]","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-addplot",
		topic : "api > addplot",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ]
		},
		tokens : ["addplot","data","values"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "addplot", {
					"data":{
						"values":zcdocs.utils.rvalues(5, 0, 50)
					}
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"addplot\", {","		\"data\":{","			\"values\":zcdocs.utils.rvalues(5, 0, 50)","		}","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-addscalevalue",
		topic : "api > addscalevalue",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"values":["Jan","Feb","Mar","Apr","May"]
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        }
		    ]
		},
		tokens : ["addscalevalue","scale","nodeindex","value"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "addscalevalue", {
					"scale":"scale-x",
					"value":"End"
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "addscalevalue", {
					"scale":"scale-x",
					"nodeindex":2,
					"value":"Mid"
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"addscalevalue\", {","		\"scale\":\"scale-x\",","		\"value\":\"End\"","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"addscalevalue\", {","		\"scale\":\"scale-x\",","		\"nodeindex\":2,","		\"value\":\"Mid\"","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-appendseriesdata",
		topic : "api > appendseriesdata",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["appendseriesdata","data","plotindex"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Run Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "appendseriesdata", {
					"plotindex":1,
					"data":{
						"lineWidth":4,
						"lineColor":"#f00"
					}
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "appendseriesdata", {
					"data":[
						{
							"lineWidth":8,
							"lineColor":"#0f0"
						},
						{
							"lineWidth":1,
							"lineColor":"#00f"
						}
					]
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"appendseriesdata\", {","		\"plotindex\":1,","		\"data\":{","			\"lineWidth\":4,","			\"lineColor\":\"#f00\"","		}","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"appendseriesdata\", {","		\"data\":[","			{","				\"lineWidth\":8,","				\"lineColor\":\"#0f0\"","			},","			{","				\"lineWidth\":1,","				\"lineColor\":\"#00f\"","			}","		]","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-appendseriesvalues",
		topic : "api > appendseriesvalues",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["appendseriesvalues","values","plotindex"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "appendseriesvalues", {
					"plotindex":1,
					"values":[21,16,9,17,34]
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "appendseriesvalues", {
					"values":[
						[21,16,9,17,34],
						[31,26,19,27,44]
					]
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"appendseriesvalues\", {","		\"plotindex\":1,","		\"values\":[21,16,9,17,34]","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"appendseriesvalues\", {","		\"values\":[","			[21,16,9,17,34],","			[31,26,19,27,44]","		]","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-clearfeed-startfeed-stopfeed",
		topic : "api > clearfeed, startfeed, stopfeed",
		json : {
		    "type":"line",
		    "refresh":{
		    	"type":"feed",
		    	"url":"resources/feed.php?min=0&max=40&plots=1",
		    	"interval":1
		    },
		    "scale-x":{
		    	"values":[]
		    },
		    "series":[
		        {
		            "values":[]
		        }
		    ]
		},
		tokens : ["clearfeed","startfeed","stopfeed"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Clear</button>","<button class=\"btn btn-info\" id=\"demo2\">Start</button>","<button class=\"btn btn-info\" id=\"demo3\">Stop</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "clearfeed");
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "startfeed");
			});
			$("#demo3").bind('click', function() {
				zingchart.exec("demo-chart", "stopfeed");
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "stopfeed");
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"clearfeed\");","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"startfeed\");","});","$(\"#demo3\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"stopfeed\");","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"stopfeed\");","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#demo3").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-clearselection",
		topic : "api > clearselection",
		json : {
		    "type":"bar",
		    "plot":{
				"selection-mode":"multiple",
				"background-mode":"none",
		    	"selected-state":{
		    		"background-color":"#900 #f90",
		    		"border-color":"#999",
		    		"border-width":1
		    	}
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		        	"values":[42,13,21,15,33]
		        }
		    ],
		    "selection":[
		    	[0,3],
		    	[2,4]
		    ]
		},
		tokens : ["clearselection"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "clearselection");
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"clearselection\");","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-disable",
		topic : "api > disable",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["disable"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "disable", {
					"text":"Please wait until we do something..."
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "enable");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"disable\", {","		\"text\":\"Please wait until we do something...\"","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"enable\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-fullscreen",
		topic : "api > fullscreen",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        }
		    ]
		},
		tokens : ["exitfullscreen","fullscreen"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "fullscreen");
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "exitfullscreen");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"fullscreen\");","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"exitfullscreen\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getgraphlength",
		topic : "api > getgraphlength",
		json : {
		"layout":"2x2",
		"graphset":[
			{
			    "type":"line",
			    "plotarea":{
			    	"margin":"10 10 20 30"
			    },
			    "series":[
			        {
			            "values":[11,26,7,44,19]
			        }
			    ]
			},
			{
			    "type":"line3d",
			    "plotarea":{
			    	"margin":"10 10 20 30"
			    },
			    "series":[
			        {
			            "values":[11,26,7,44,19]
			        }
			    ]
			},
			{
			    "type":"bar",
			    "plotarea":{
			    	"margin":"10 10 20 30"
			    },
			    "series":[
			        {
			            "values":[11,26,7,44,19]
			        }
			    ]
			},
			{
			    "type":"bar3d",
			    "plotarea":{
			    	"margin":"10 10 20 30"
			    },
			    "series":[
			        {
			            "values":[11,26,7,44,19]
			        }
			    ]
			}
		]
		},
		tokens : ["getgraphlength"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getgraphlength',
					zingchart.exec("demo-chart", "getgraphlength")
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getgraphlength',","		zingchart.exec(\"demo-chart\", \"getgraphlength\")","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getinterval-setinterval-feed",
		topic : "api > getinterval, setinterval",
		json : {
		    "type":"line",
		    "refresh":{
		    	"type":"feed",
		    	"url":"resources/feed.php?min=0&max=40&plots=1",
		    	"interval":1000
		    },
		    "scale-x":{
		    	"values":[]
		    },
		    "series":[
		        {
		            "values":[]
		        }
		    ]
		},
		tokens : ["getinterval","setinterval"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Get</button>","<button class=\"btn btn-info\" id=\"demo2\">Set</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getinterval', zingchart.exec("demo-chart", "getinterval"));
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "setinterval", {
					"interval":zcdocs.utils.rvalue(200, 2000)
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "stopfeed");
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getinterval', zingchart.exec(\"demo-chart\", \"getinterval\"));","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setinterval\", {","		\"interval\":zcdocs.utils.rvalue(200, 2000)","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"stopfeed\");","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getnodelength",
		topic : "api > getnodelength",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19,32,27]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["getnodelength"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getnodelength',
					zingchart.exec("demo-chart", "getnodelength", {
						"plotindex":1
					})
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getnodelength',","		zingchart.exec(\"demo-chart\", \"getnodelength\", {","			\"plotindex\":1","		})","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getnodevalue",
		topic : "api > getnodevalue",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19,32,27]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["getnodevalue"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getnodevalue',
					zingchart.exec("demo-chart", "getnodevalue", {
						"plotindex":1,
						"nodeindex":3
					})
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getnodevalue',","		zingchart.exec(\"demo-chart\", \"getnodevalue\", {","			\"plotindex\":1,","			\"nodeindex\":3","		})","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getplotlength",
		topic : "api > getplotlength",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["getplotlength"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getplotlength',
					zingchart.exec("demo-chart", "getplotlength")
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getplotlength',","		zingchart.exec(\"demo-chart\", \"getplotlength\")","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getplotvalues",
		topic : "api > getplotvalues",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19,32,27]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["getplotvalues"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getplotvalues',
					zingchart.exec("demo-chart", "getplotvalues", {
						"plotindex":1
					})
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getplotvalues',","		zingchart.exec(\"demo-chart\", \"getplotvalues\", {","			\"plotindex\":1","		})","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getrender",
		topic : "api > getrender",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        }
		    ]
		},
		tokens : ["getrender"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getrender',
					zingchart.exec("demo-chart", "getrender")
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getrender',","		zingchart.exec(\"demo-chart\", \"getrender\")","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getselection",
		topic : "api > getselection",
		json : {
		    "type":"bar",
		    "plot":{
				"selection-mode":"multiple",
				"background-mode":"none",
		    	"selected-state":{
		    		"background-color":"#900 #f90",
		    		"border-color":"#999",
		    		"border-width":1
		    	}
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		        	"values":[42,13,21,15,33]
		        }
		    ],
		    "selection":[
		    	[0,3],
		    	[2,4]
		    ]
		},
		tokens : ["getselection"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				var s = zingchart.exec("demo-chart", "getselection");
				zcdocs.demos.dump('getselection', s);
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	var s = zingchart.exec(\"demo-chart\", \"getselection\");","	zcdocs.demos.dump('getselection', s);","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getseriesdata",
		topic : "api > getseriesdata",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["getseriesdata","data","plotindex"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump(
					zingchart.exec("demo-chart", "getseriesdata", {
						"plotindex":1
					})
				);
			});
			$("#demo2").bind('click', function() {
				zcdocs.demos.dump(
					zingchart.exec("demo-chart", "getseriesdata")
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump(","		zingchart.exec(\"demo-chart\", \"getseriesdata\", {","			\"plotindex\":1","		})","	);","});","$(\"#demo2\").bind('click', function() {","	zcdocs.demos.dump(","		zingchart.exec(\"demo-chart\", \"getseriesdata\")","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getseriesvalues",
		topic : "api > getseriesvalues",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["getseriesvalues","data","plotindex"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump(
					zingchart.exec("demo-chart", "getseriesvalues", {
						"plotindex":1
					})
				);
			});
			$("#demo2").bind('click', function() {
				zcdocs.demos.dump(
					zingchart.exec("demo-chart", "getseriesvalues")
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump(","		zingchart.exec(\"demo-chart\", \"getseriesvalues\", {","			\"plotindex\":1","		})","	);","});","$(\"#demo2\").bind('click', function() {","	zcdocs.demos.dump(","		zingchart.exec(\"demo-chart\", \"getseriesvalues\")","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getversion",
		topic : "api > getversion",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        }
		    ]
		},
		tokens : ["getversion"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getversion',
					zingchart.exec("demo-chart", "getversion")
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getversion',","		zingchart.exec(\"demo-chart\", \"getversion\")","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-getxyinfo",
		topic : "api > getxyinfo",
		json : {
		    "type":"line",
		    "title":{
		    	"text":"Click on the chart to add nodes"
		    },
		    "series":[
		        {
		            "values":[
			            [3,11],
			            [5,26],
			            [9,7],
			            [14,44],
			            [16,19]
		            ]
		        }
		    ]
		},
		tokens : ["getxyinfo"],
		html : null,
		js : function() {
			zingchart.click = function(p) {
			
				if (p.target != 'none' && p.target != 'node') {
					return;
				}
			
				var info = zingchart.exec("demo-chart", "getxyinfo", {
					x : p.x,
					y : p.y
				});
			
				zcdocs.demos.dump('getxyinfo', info);
			
				var pos = null, val = null;
				for (var i=0;i<info.length;i++) {
					if (info[i].infotype == 'key-scale') {
						pos = info[i].scalepos;
					} else if (info[i].infotype == 'value-scale') {
						val = info[i].scalevalue;
					}
				}
			
				zingchart.exec(p.id, 'addnode', {
					plotindex : 0,
					nodeindex : parseFloat(pos.toFixed(2)),
					value : [parseFloat(pos.toFixed(2)), parseFloat(val.toFixed(2))]
				});
			
			};
		},
		console : 1,
		code : ["zingchart.click = function(p) {","","	if (p.target != 'none' && p.target != 'node') {","		return;","	}","","	var info = zingchart.exec(\"demo-chart\", \"getxyinfo\", {","		x : p.x,","		y : p.y","	});","","	zcdocs.demos.dump('getxyinfo', info);","","	var pos = null, val = null;","	for (var i=0;i<info.length;i++) {","		if (info[i].infotype == 'key-scale') {","			pos = info[i].scalepos;","		} else if (info[i].infotype == 'value-scale') {","			val = info[i].scalevalue;","		}","	}","","	zingchart.exec(p.id, 'addnode', {","		plotindex : 0,","		nodeindex : parseFloat(pos.toFixed(2)),","		value : [parseFloat(pos.toFixed(2)), parseFloat(val.toFixed(2))]","	});","","};"],
		clean : function() {
			zingchart.click = null;
		}
	});
	zcdocs.demos.items.push({
		id : "api-hideplot-showplot",
		topic : "api > hideplot, showplot",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["hideplot","showplot"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Hide</button>","<button class=\"btn btn-info\" id=\"demo2\">Show</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "hideplot", {
					"plotindex":1
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "showplot", {
					"plotindex":1
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"hideplot\", {","		\"plotindex\":1","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"showplot\", {","		\"plotindex\":1","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-modify",
		topic : "api > modify",
		json : {
		    "type":"line",
		    "title":{
		    	"text":"Chart Title"
		    },
		    "plotarea":{
		    	"background-color":"#f90 #c63"
		    },
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[18,12,27,34,21]
		        }
		    ]
		},
		tokens : ["modify","data"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Demo 2</button>","<button class=\"btn btn-info\" id=\"demo3\">Demo 3</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "modify", {
					"object":"title",
					"data":{
						"text":"A new title for the chart",
						"background-color":"#060 #030"
					}
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "modify", {
					"object":"legend",
					"data":{
						"border-width":2,
						"border-color":"#06f"
					}
				});
			});
			$("#demo3").bind('click', function() {
				zingchart.exec("demo-chart", "modify", {
					"data":{
						"plotarea":{
							"border-width":4,
							"border-color":"#f60",
							"background-color":"#c66 #63c"
						}
					}
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"modify\", {","		\"object\":\"title\",","		\"data\":{","			\"text\":\"A new title for the chart\",","			\"background-color\":\"#060 #030\"","		}","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"modify\", {","		\"object\":\"legend\",","		\"data\":{","			\"border-width\":2,","			\"border-color\":\"#06f\"","		}","	});","});","$(\"#demo3\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"modify\", {","		\"data\":{","			\"plotarea\":{","				\"border-width\":4,","				\"border-color\":\"#f60\",","				\"background-color\":\"#c66 #63c\"","			}","		}","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#demo3").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-removeobject",
		topic : "api > removeobject",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ],
		    "labels":[
		    	{
		    		"id":"label1",
		    		"text":"Label 1",
		    		"x":50,
					"y":50,
		    		"background-color":"#f90",
					"padding":5
		    	},{
		    		"id":"label2",
		    		"text":"Label 2",
		    		"x":150,
					"y":50,
		    		"background-color":"#f09",
					"padding":5
		    	}
		    ],
		    "shapes":[
		    	{
		    		"id":"shape1",
					"x":100,
					"y":100,
					"type":"circle",
					"size":15,
					"label":{
						"text":"Shape 1"
					},
					"background-color":"#f09"
				},
				{
					"id":"shape2",
					"x":150,
					"y":100,
					"type":"star5",
					"size":20,
					"label":{
						"text":"Shape 2"
					},
					"background-color":"#0f9"
				}
		    ]
		},
		tokens : ["removeobject"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Run Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "removeobject", {
					"type":"label",
					"id":"label1"
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "removeobject", {
					"type":"shape",
					"id":["shape1", "shape2"]
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"removeobject\", {","		\"type\":\"label\",","		\"id\":\"label1\"","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"removeobject\", {","		\"type\":\"shape\",","		\"id\":[\"shape1\", \"shape2\"]","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-removescalevalue",
		topic : "api > removescalevalue",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"values":["Jan","Feb","Mar","Apr","May"]
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        }
		    ]
		},
		tokens : ["removescalevalue","scale","nodeindex","value"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "removescalevalue", {
					"scale":"scale-x"
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "removescalevalue", {
					"scale":"scale-x",
					"nodeindex":1
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"removescalevalue\", {","		\"scale\":\"scale-x\"","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"removescalevalue\", {","		\"scale\":\"scale-x\",","		\"nodeindex\":1","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-repaintobjects",
		topic : "api > repaintobjects",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ]
		},
		tokens : ["repaintobjects"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "addobject", {
					"type":"label",
					"update":false,
					"data":{
						"x":zcdocs.utils.rvalue(100, 400),
						"y":zcdocs.utils.rvalue(50, 300),
						"text":"Label",
						"background-color":"#f90",
						"padding":5
					}
				});
				zingchart.exec("demo-chart", "addobject", {
					"type":"shape",
					"update":false,
					"data":[
						{
							"x":zcdocs.utils.rvalue(100, 400),
							"y":zcdocs.utils.rvalue(50, 300),
							"type":"circle",
							"size":zcdocs.utils.rvalue(10, 20),
							"label":{
								"text":"Shape 1"
							},
							"background-color":"#f09"
						},
						{
							"x":zcdocs.utils.rvalue(100, 400),
							"y":zcdocs.utils.rvalue(50, 300),
							"type":"star5",
							"size":zcdocs.utils.rvalue(10, 20),
							"label":{
								"text":"Shape 2"
							},
							"background-color":"#0f9"
						}
					]
				});
				zingchart.exec("demo-chart", "repaintobjects", {});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"addobject\", {","		\"type\":\"label\",","		\"update\":false,","		\"data\":{","			\"x\":zcdocs.utils.rvalue(100, 400),","			\"y\":zcdocs.utils.rvalue(50, 300),","			\"text\":\"Label\",","			\"background-color\":\"#f90\",","			\"padding\":5","		}","	});","	zingchart.exec(\"demo-chart\", \"addobject\", {","		\"type\":\"shape\",","		\"update\":false,","		\"data\":[","			{","				\"x\":zcdocs.utils.rvalue(100, 400),","				\"y\":zcdocs.utils.rvalue(50, 300),","				\"type\":\"circle\",","				\"size\":zcdocs.utils.rvalue(10, 20),","				\"label\":{","					\"text\":\"Shape 1\"","				},","				\"background-color\":\"#f09\"","			},","			{","				\"x\":zcdocs.utils.rvalue(100, 400),","				\"y\":zcdocs.utils.rvalue(50, 300),","				\"type\":\"star5\",","				\"size\":zcdocs.utils.rvalue(10, 20),","				\"label\":{","					\"text\":\"Shape 2\"","				},","				\"background-color\":\"#0f9\"","			}","		]","	});","	zingchart.exec(\"demo-chart\", \"repaintobjects\", {});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-resize",
		topic : "api > resize",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        }
		    ]
		},
		tokens : ["resize","width","height"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "resize", {
					"width":zcdocs.utils.rvalue(240, 480),
					"height":zcdocs.utils.rvalue(205, 410)
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "resize", {
					"width":zcdocs.utils.rvalue(50, 100)+'%',
					"height":zcdocs.utils.rvalue(50, 100)+'%'
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "resize", {
					"width":"100%",
					"height":"100%"
				});
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"resize\", {","		\"width\":zcdocs.utils.rvalue(240, 480),","		\"height\":zcdocs.utils.rvalue(205, 410)","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"resize\", {","		\"width\":zcdocs.utils.rvalue(50, 100)+'%',","		\"height\":zcdocs.utils.rvalue(50, 100)+'%'","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"resize\", {","		\"width\":\"100%\",","		\"height\":\"100%\"","	});","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-select",
		topic : "api > select",
		json : {
		    "type":"bar",
		    "plot":{
				"selection-mode":"multiple",
				"background-mode":"none",
		    	"selected-state":{
		    		"background-color":"#900 #f90",
		    		"border-color":"#999",
		    		"border-width":1
		    	}
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		        	"values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["select"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Run Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "select", [
					{
						"plotindex":0,
						"nodeindex":[0,2]
				    },
				    {
						"plotindex":1,
						"nodeindex":"1-3"
				    }
				]);
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "select", [
					{
						"plotindex":0,
						"nodeindex":"0-2",
						"toggle":true
				    },
				    {
						"plotindex":1,
						"nodeindex":[1,3]
				    }
				]);
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"select\", [","		{","			\"plotindex\":0,","			\"nodeindex\":[0,2]","	    },","	    {","			\"plotindex\":1,","			\"nodeindex\":\"1-3\"","	    }","	]);","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"select\", [","		{","			\"plotindex\":0,","			\"nodeindex\":\"0-2\",","			\"toggle\":true","	    },","	    {","			\"plotindex\":1,","			\"nodeindex\":[1,3]","	    }","	]);","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-set3dview",
		topic : "api > set3dview",
		json : {
		    "type":"bar3d",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[21,16,37,14,7]
		        }
		    ]
		},
		tokens : ["set3dview"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "set3dview", {
					"x-angle":zcdocs.utils.rvalue(-20, 0),
					"y-angle":zcdocs.utils.rvalue(-20, 20),
					"z-angle":zcdocs.utils.rvalue(-10, 10),
					"depth":zcdocs.utils.rvalue(20, 40),
					"zoom":zcdocs.utils.rvalue(0.5, 1, false)
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "set3dview", {
					"x-angle":-20,
					"y-angle":10,
					"z-angle":0,
					"depth":40,
					"zoom":1
				});
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"set3dview\", {","		\"x-angle\":zcdocs.utils.rvalue(-20, 0),","		\"y-angle\":zcdocs.utils.rvalue(-20, 20),","		\"z-angle\":zcdocs.utils.rvalue(-10, 10),","		\"depth\":zcdocs.utils.rvalue(20, 40),","		\"zoom\":zcdocs.utils.rvalue(0.5, 1, false)","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"set3dview\", {","		\"x-angle\":-20,","		\"y-angle\":10,","		\"z-angle\":0,","		\"depth\":40,","		\"zoom\":1","	});","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-setdata",
		topic : "api > setdata",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        }
		    ]
		},
		tokens : ["setdata","data"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "setdata", {
					"data":{
					    "type":"bar",
					    "series":[
					        {
					            "values":[7,44,11,11,26]
					        },
					        {
					            "values":[17,24,31,8,16]
					        }
					    ]
					}
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setdata\", {","		\"data\":{","		    \"type\":\"bar\",","		    \"series\":[","		        {","		            \"values\":[7,44,11,11,26]","		        },","		        {","		            \"values\":[17,24,31,8,16]","		        }","		    ]","		}","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-setnodevalue",
		topic : "api > setnodevalue",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["setnodevalue"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "setnodevalue", {
					"plotindex":1,
					"nodeindex":2,
					"value":zcdocs.utils.rvalue(0, 50)
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setnodevalue\", {","		\"plotindex\":1,","		\"nodeindex\":2,","		\"value\":zcdocs.utils.rvalue(0, 50)","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-setselection",
		topic : "api > setselection",
		json : {
		    "type":"bar",
		    "plot":{
				"selection-mode":"multiple",
				"background-mode":"none",
		    	"selected-state":{
		    		"background-color":"#900 #f90",
		    		"border-color":"#999",
		    		"border-width":1
		    	}
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		        	"values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["setselection"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "setselection", {
					"selection":[
				    	[0,3],
				    	[2,4]
				    ]
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setselection\", {","		\"selection\":[","	    	[0,3],","	    	[2,4]","	    ]","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-setseriesdata",
		topic : "api > setseriesdata",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["setseriesdata"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "setseriesdata", {
					"plotindex":1,
					"data":{
						"values":zcdocs.utils.rvalues(5, 0, 50),
						"line-color":zcdocs.utils.rcolor()
					}
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "setseriesdata", {
					"data":[
						{
							"values":zcdocs.utils.rvalues(5, 0, 50),
							"line-color":zcdocs.utils.rcolor()
						},{
							"values":zcdocs.utils.rvalues(5, 0, 50),
							"line-color":zcdocs.utils.rcolor()
						}
					]
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setseriesdata\", {","		\"plotindex\":1,","		\"data\":{","			\"values\":zcdocs.utils.rvalues(5, 0, 50),","			\"line-color\":zcdocs.utils.rcolor()","		}","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setseriesdata\", {","		\"data\":[","			{","				\"values\":zcdocs.utils.rvalues(5, 0, 50),","				\"line-color\":zcdocs.utils.rcolor()","			},{","				\"values\":zcdocs.utils.rvalues(5, 0, 50),","				\"line-color\":zcdocs.utils.rcolor()","			}","		]","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-setseriesvalues",
		topic : "api > setseriesvalues",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["setseriesvalues","values","plotindex"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "setseriesvalues", {
					"plotindex":1,
					"values":[21,16,9,17,34]
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "setseriesvalues", {
					"values":[
						[21,16,9,17,34],
						[31,26,19,27,44]
					]
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setseriesvalues\", {","		\"plotindex\":1,","		\"values\":[21,16,9,17,34]","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setseriesvalues\", {","		\"values\":[","			[21,16,9,17,34],","			[31,26,19,27,44]","		]","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-update",
		topic : "api > update",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        }
		    ]
		},
		tokens : ["update"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "appendseriesvalues", {
					"plotindex":0,
					"values":[25,31,17],
					"update":false
				});
				zingchart.exec("demo-chart", "addplot", {
					"data":{
						"values":[23,13,8,29,32,19,41,33],
						"update":false
					}
				});
				zingchart.exec("demo-chart", "update");
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"appendseriesvalues\", {","		\"plotindex\":0,","		\"values\":[25,31,17],","		\"update\":false","	});","	zingchart.exec(\"demo-chart\", \"addplot\", {","		\"data\":{","			\"values\":[23,13,8,29,32,19,41,33],","			\"update\":false","		}","	});","	zingchart.exec(\"demo-chart\", \"update\");","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-updateobject",
		topic : "api > updateobject",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ],
		    "labels":[
		    	{
		    		"id":"label1",
		    		"text":"Label 1",
		    		"x":50,
					"y":50,
		    		"background-color":"#f90",
					"padding":5
		    	},{
		    		"id":"label2",
		    		"text":"Label 2",
		    		"x":150,
					"y":50,
		    		"background-color":"#f09",
					"padding":5
		    	}
		    ],
		    "shapes":[
		    	{
		    		"id":"shape1",
					"x":100,
					"y":100,
					"type":"circle",
					"size":15,
					"label":{
						"text":"Shape 1"
					},
					"background-color":"#f09"
				},
				{
					"id":"shape2",
					"x":150,
					"y":100,
					"type":"star5",
					"size":20,
					"label":{
						"text":"Shape 2"
					},
					"background-color":"#0f9"
				}
		    ]
		},
		tokens : ["updateobject"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Run Demo 2</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "updateobject", {
					"type":"label",
					"data":{
						"id":"label1",
						"border-width":2,
						"border-color":"#f00",
						"padding":10,
						"text":"New Text"
					}
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "updateobject", {
					"type":"shape",
					"data":{
						"id":"shape1",
						"border-width":2,
						"border-color":"#f00",
						"type":"star7",
						"label":{
							"text":"New Text"
						}
					}
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"updateobject\", {","		\"type\":\"label\",","		\"data\":{","			\"id\":\"label1\",","			\"border-width\":2,","			\"border-color\":\"#f00\",","			\"padding\":10,","			\"text\":\"New Text\"","		}","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"updateobject\", {","		\"type\":\"shape\",","		\"data\":{","			\"id\":\"shape1\",","			\"border-width\":2,","			\"border-color\":\"#f00\",","			\"type\":\"star7\",","			\"label\":{","				\"text\":\"New Text\"","			}","		}","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-zoomin-zoomout-viewall",
		topic : "api > zoomin, zoomout, viewall",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"zooming":true
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,19,42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zoomin","zoomout","viewall"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">ZoomIn</button>","<button class=\"btn btn-info\" id=\"demo2\">ZoomOut</button>","<button class=\"btn btn-info\" id=\"demo3\">ViewAll</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "zoomin");
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "zoomout");
			});
			$("#demo3").bind('click', function() {
				zingchart.exec("demo-chart", "viewall");
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"zoomin\");","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"zoomout\");","});","$(\"#demo3\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"viewall\");","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#demo2").unbind('click');
$("#demo3").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-zoomto",
		topic : "api > zoomto",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"zooming":true
		    },
		    "scale-y":{
		    	"zooming":true
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,19,42,13,21,15,33,21,4]
		        }
		    ]
		},
		tokens : ["zoomto","xmin","xmax","ymin","ymax"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "zoomto", {
					"xmin":2,
					"xmax":4,
					"ymin":10,
					"ymax":30
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"zoomto\", {","		\"xmin\":2,","		\"xmax\":4,","		\"ymin\":10,","		\"ymax\":30","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "api-zoomtovalues",
		topic : "api > zoomtovalues",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"zooming":true,
		    	"values":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,19,42,13,21,15,33,21,4]
		        }
		    ]
		},
		tokens : ["zoomtovalues","xmin","xmax"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "zoomtovalues", {
					"xmin":"Mar",
					"xmax":"Sep"
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 0,
		code : ["$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"zoomtovalues\", {","		\"xmin\":\"Mar\",","		\"xmax\":\"Sep\"","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "chord-angle-padding",
		topic : "chord > options > angle-padding",
		json : {
			"type":"chord",
			"options":{
				"angle-padding":10
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B"
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D"
		        }
			]
		},
		tokens : ["chord","angle-padding"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-band-space",
		topic : "chord > options > band-space",
		json : {
			"type":"chord",
			"options":{
				"band-space":40
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B"
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D"
		        }
			]
		},
		tokens : ["chord","band-space"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-band-width",
		topic : "chord > options > band-width",
		json : {
			"type":"chord",
			"options":{
				"band-width":40
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B"
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D"
		        }
			]
		},
		tokens : ["chord","band-width"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-color-type-color",
		topic : "chord > options > color-type,color",
		json : {
			"type":"chord",
			"options":{
				"color-type":"color",
				"color":"#f90"
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B"
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D"
		        }
			]
		},
		tokens : ["chord","color-type","color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-color-type-palette",
		topic : "chord > options > color-type,palette",
		json : {
			"type":"chord",
			"options":{
				"color-type":"palette",
				"palette":["#15252d","#768766","#e5db82","#bb9944","#bb6622","#b1200f","#342e3a"]
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B"
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D"
		        }
			]
		},
		tokens : ["chord","color-type","palette"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-color-type-random",
		topic : "chord > options > color-type,random",
		json : {
			"type":"chord",
			"options":{
				"color-type":"random"
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B"
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D"
		        }
			]
		},
		tokens : ["chord","color-type","random"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-radius",
		topic : "chord > options > radius",
		json : {
			"type":"chord",
			"options":{
				"radius":0.6
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B"
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D"
		        }
			]
		},
		tokens : ["chord","radius"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-static",
		topic : "chord > options > static",
		json : {
			"type":"chord",
			"options":{
				"static":true
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B"
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D"
		        }
			]
		},
		tokens : ["chord","static"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-style-band",
		topic : "chord > options > style > band",
		json : {
			"type":"chord",
			"options":{
				"style":{
					"band":{
						"border-width":2,
						"border-color":"#900"
					}
				}
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B",
		            "style":{
		            	"band":{
		            		"gradient-colors":"#ffffcc #ffeda0 #fed976 #feb24c",
		            		"gradient-stops":"0.1 0.4 0.6 0.9"
		        		}
		            }
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D",
		            "style":{
		            	"band":{
		            		"border-color":"#009",
		            		"border-width":3
		        		}
		            }
		        }
			]
		},
		tokens : ["chord","style","band"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-style-chord",
		topic : "chord > options > style > chord",
		json : {
			"type":"chord",
			"options":{
				"style":{
					"chord":{
						"border-width":2,
						"border-color":"#900"
					}
				}
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B",
		            "style":{
		            	"chord":{
		            		"gradient-colors":"#ffffcc #ffeda0 #fed976 #feb24c",
		            		"gradient-stops":"0.1 0.4 0.6 0.9"
		        		}
		            }
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D",
		            "style":{
		            	"chord":{
		            		"border-color":"#009",
		            		"border-width":3
		        		}
		            }
		        }
			]
		},
		tokens : ["chord","style","chard"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-style-label",
		topic : "chord > options > style > label",
		json : {
			"type":"chord",
			"options":{
				"style":{
					"label":{
						"color":"#900"
					}
				}
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B",
		            "style":{
		            	"label":{
		            		"color":"#090"
		        		}
		            }
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D",
		            "style":{
		            	"label":{
		            		"color":"#009",
		            		"bold":1
		        		}
		            }
		        }
			]
		},
		tokens : ["chord","style","label"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-style-tick",
		topic : "chord > options > style > tick",
		json : {
			"type":"chord",
			"options":{
				"style":{
					"tick":{
						"size":5,
						"line-color":"#900"
					}
				}
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B",
		            "style":{
		            	"tick":{
		            		"size":15,
		            		"line-width":2,
		            		"line-color":"#090"
		        		}
		            }
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D",
		            "style":{
		            	"tick":{
		            		"size":20,
		            		"line-color":"#009",
		            		"line-width":3
		        		}
		            }
		        }
			]
		},
		tokens : ["chord","style","tick"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "chord-style-tooltip",
		topic : "chord > options > style > tooltip",
		json : {
			"type":"chord",
			"options":{
				"style":{
					"tooltip":{
						"border-width":2,
						"border-color":"#900",
						"background-color":"#fc0"
					},
					"band":{
						"tooltip":{
							"text":"Band of item %text"
						}
					},
					"chord":{
						"tooltip":{
							"text-chord":"Chord between %text-source (%value-source) and %text-destination (%value-destination)",
							"text":"Self-chord of item %text with value %value"
						}
					}
				}
			},
			"series":[
				{
		            "values":[6637,5700,4789,2771],
		           	"text":"A"
		        },
		        {
		            "values":[7737,2691,2202,7006],
		            "text":"B",
		            "style":{
		            	"tooltip":{
		            		"background-color":"#090",
		            		"color":"#fff"
		        		},
						"band":{
							"tooltip":{
								"text":"Specific text for band of item %text"
							}
						},
						"chord":{
							"tooltip":{
								"text-chord":"%text-source/%value-source links to %text-destination/%value-destination",
								"text":"%text has value %value"
							}
						}
		            }
		        },
		        {
		            "values":[8574,9898,4084,1765],
		            "text":"C"
		        },
		        {
		            "values":[5309,1602,8395,2908],
		            "text":"D"
		        }
			]
		},
		tokens : ["chord","style","tooltip","text","text-chord"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "events-animation_end",
		topic : "events > animation_end",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "plot":{
		    	"animation":{
		    		"speed":3000,
		    		"effect":3,
		    		"method":1
		    	}
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.animation_end"],
		html : null,
		js : function() {
			zingchart.animation_end = function(p) {
				zcdocs.demos.dump('animation_end', p);
			}
		},
		console : 1,
		code : ["zingchart.animation_end = function(p) {","	zcdocs.demos.dump('animation_end', p);","}"],
		clean : function() {
			zingchart.animation_end = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-animation_start",
		topic : "events > animation_start",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "plot":{
		    	"animation":{
		    		"speed":3000,
		    		"effect":3,
		    		"method":1
		    	}
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.animation_start"],
		html : null,
		js : function() {
			zingchart.animation_start = function(p) {
				zcdocs.demos.dump('animation_start', p);
			}
		},
		console : 1,
		code : ["zingchart.animation_start = function(p) {","	zcdocs.demos.dump('animation_start', p);","}"],
		clean : function() {
			zingchart.animation_start = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-animation_step",
		topic : "events > animation_step",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "plot":{
		    	"animation":{
		    		"speed":3000,
		    		"effect":3,
		    		"method":2
		    	}
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.animation_step"],
		html : null,
		js : function() {
			zingchart.animation_step = function(p) {
				zcdocs.demos.dump('animation_step', p);
			}
		},
		console : 1,
		code : ["zingchart.animation_step = function(p) {","	zcdocs.demos.dump('animation_step', p);","}"],
		clean : function() {
			zingchart.animation_step = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-click",
		topic : "events > click",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.click"],
		html : null,
		js : function() {
			zingchart.click = function(p) {
				zcdocs.demos.dump('click', p);
			}
		},
		console : 1,
		code : ["zingchart.click = function(p) {","	zcdocs.demos.dump('click', p);","}"],
		clean : function() {
			zingchart.click = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-complete",
		topic : "events > complete",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.complete"],
		html : null,
		js : function() {
			zingchart.complete = function(p) {
				zcdocs.demos.dump('complete', p);
			}
		},
		console : 1,
		code : ["zingchart.complete = function(p) {","	zcdocs.demos.dump('complete', p);","}"],
		clean : function() {
			zingchart.complete = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-dataparse",
		topic : "events > dataparse",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.dataparse"],
		html : null,
		js : function() {
			zingchart.dataparse = function(p, d) {
				zcdocs.demos.dump('dataparse', p);
				zcdocs.demos.dump('dataparse', d.graphset[0].series[0].values);
				return d;
			}
		},
		console : 1,
		code : ["zingchart.dataparse = function(p, d) {","	zcdocs.demos.dump('dataparse', p);","	zcdocs.demos.dump('dataparse', d.graphset[0].series[0].values);","	return d;","}"],
		clean : function() {
			zingchart.dataparse = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-dataready",
		topic : "events > dataready",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.dataready"],
		html : null,
		js : function() {
			zingchart.dataready = function(p) {
				zcdocs.demos.dump('dataready', p);
			}
		},
		console : 1,
		code : ["zingchart.dataready = function(p) {","	zcdocs.demos.dump('dataready', p);","}"],
		clean : function() {
			zingchart.dataready = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-gcomplete",
		topic : "events > gcomplete",
		json : {
			"layout":"1x2",
			"graphset":[
				{
				    "type":"bar",
				    "id":"mybar",
				    "series":[
				        {
				            "values":[11,26,7,44,11]
				        },
				        {
				            "values":[42,13,21,15,33]
				        }
				    ]
				},
				{
				    "type":"line",
				    "id":"myline",
				    "series":[
				        {
				            "values":[11,26,7,44,11]
				        },
				        {
				            "values":[42,13,21,15,33]
				        }
				    ]
				}
			]
		},
		tokens : ["zingchart.gcomplete"],
		html : null,
		js : function() {
			zingchart.gcomplete = function(p) {
				zcdocs.demos.dump('gcomplete', p);
			}
		},
		console : 1,
		code : ["zingchart.gcomplete = function(p) {","	zcdocs.demos.dump('gcomplete', p);","}"],
		clean : function() {
			zingchart.gcomplete = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-gload",
		topic : "events > gload",
		json : {
			"layout":"1x2",
			"graphset":[
				{
				    "type":"bar",
				    "id":"mybar",
				    "series":[
				        {
				            "values":[11,26,7,44,11]
				        },
				        {
				            "values":[42,13,21,15,33]
				        }
				    ]
				},
				{
				    "type":"line",
				    "id":"myline",
				    "series":[
				        {
				            "values":[11,26,7,44,11]
				        },
				        {
				            "values":[42,13,21,15,33]
				        }
				    ]
				}
			]
		},
		tokens : ["zingchart.gload"],
		html : null,
		js : function() {
			zingchart.gload = function(p) {
				zcdocs.demos.dump('gload', p);
			}
		},
		console : 1,
		code : ["zingchart.gload = function(p) {","	zcdocs.demos.dump('gload', p);","}"],
		clean : function() {
			zingchart.gload = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-guide_mousemove",
		topic : "events > guide_mousemove",
		json : {
		    "type":"line",
		    "stacked":1,
		    "legend":{
		    },
		    "guide":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.guide_mousemove"],
		html : null,
		js : function() {
			zingchart.guide_mousemove = function(p) {
				zcdocs.demos.dump('guide_mousemove', p);
			}
		},
		console : 1,
		code : ["zingchart.guide_mousemove = function(p) {","	zcdocs.demos.dump('guide_mousemove', p);","}"],
		clean : function() {
			zingchart.guide_mousemove = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-label_click",
		topic : "events > label_click",
		json : {
		    "type":"bar",
		    "labels":[
		    	{
		    		"x":200,
		    		"y":50,
		    		"background-color":"#f90",
		    		"padding":5,
		    		"border-width":1,
		    		"border-color":"#999",
		    		"text":"Simple Label"
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ]
		},
		tokens : ["zingchart.label_click"],
		html : null,
		js : function() {
			zingchart.label_click = function(p) {
				zcdocs.demos.dump('label_click', p);
			}
		},
		console : 1,
		code : ["zingchart.label_click = function(p) {","	zcdocs.demos.dump('label_click', p);","}"],
		clean : function() {
			zingchart.label_click = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-label_mouseout",
		topic : "events > label_mouseout",
		json : {
		    "type":"bar",
		    "labels":[
		    	{
		    		"x":200,
		    		"y":50,
		    		"background-color":"#f90",
		    		"padding":5,
		    		"border-width":1,
		    		"border-color":"#999",
		    		"text":"Simple Label"
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ]
		},
		tokens : ["zingchart.label_mouseout"],
		html : null,
		js : function() {
			zingchart.label_mouseout = function(p) {
				zcdocs.demos.dump('label_mouseout', p);
			}
		},
		console : 1,
		code : ["zingchart.label_mouseout = function(p) {","	zcdocs.demos.dump('label_mouseout', p);","}"],
		clean : function() {
			zingchart.label_mouseout = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-label_mouseover",
		topic : "events > label_mouseover",
		json : {
		    "type":"bar",
		    "labels":[
		    	{
		    		"x":200,
		    		"y":50,
		    		"background-color":"#f90",
		    		"padding":5,
		    		"border-width":1,
		    		"border-color":"#999",
		    		"text":"Simple Label"
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ]
		},
		tokens : ["zingchart.label_mouseover"],
		html : null,
		js : function() {
			zingchart.label_mouseover = function(p) {
				zcdocs.demos.dump('label_mouseover', p);
			}
		},
		console : 1,
		code : ["zingchart.label_mouseover = function(p) {","	zcdocs.demos.dump('label_mouseover', p);","}"],
		clean : function() {
			zingchart.label_mouseover = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-legend_item_click",
		topic : "events > legend_item_click",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.legend_item_click"],
		html : null,
		js : function() {
			zingchart.legend_item_click = function(p) {
				zcdocs.demos.dump('legend_item_click', p);
			}
		},
		console : 1,
		code : ["zingchart.legend_item_click = function(p) {","	zcdocs.demos.dump('legend_item_click', p);","}"],
		clean : function() {
			zingchart.legend_item_click = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-load",
		topic : "events > load",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.load"],
		html : null,
		js : function() {
			zingchart.load = function(p) {
				zcdocs.demos.dump('load', p);
			}
		},
		console : 1,
		code : ["zingchart.load = function(p) {","	zcdocs.demos.dump('load', p);","}"],
		clean : function() {
			zingchart.load = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-menu_item_click",
		topic : "events > menu_item_click",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.menu_item_click"],
		html : null,
		js : function() {
			zingchart.menu_item_click = function(p) {
				zcdocs.demos.dump('menu_item_click', p);
			}
		},
		console : 1,
		code : ["zingchart.menu_item_click = function(p) {","	zcdocs.demos.dump('menu_item_click', p);","}"],
		clean : function() {
			zingchart.menu_item_click = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-modify",
		topic : "events > modify",
		json : {
		    "type":"bar",
		    "title":{
		    	"text":"Chart title"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.modify"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>"],
		js : function() {
			zingchart.modify = function(p) {
				zcdocs.demos.dump('modify', p);
			}
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "modify", {
					"object":"title",
					"data":{
						"text":"A new title"
					}
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 1,
		code : ["zingchart.modify = function(p) {","	zcdocs.demos.dump('modify', p);","}","$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"modify\", {","		\"object\":\"title\",","		\"data\":{","			\"text\":\"A new title\"","		}","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			zingchart.modify = null;
$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "events-node_add",
		topic : "events > node_add",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.node_add"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>"],
		js : function() {
			zingchart.node_add = function(p) {
				zcdocs.demos.dump('node_add', p);
			}
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "addnode", {
					"plotindex":1,
					"value":zcdocs.utils.rvalue(0, 50)
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 1,
		code : ["zingchart.node_add = function(p) {","	zcdocs.demos.dump('node_add', p);","}","$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"addnode\", {","		\"plotindex\":1,","		\"value\":zcdocs.utils.rvalue(0, 50)","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "events-node_click",
		topic : "events > node_click",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.node_click"],
		html : null,
		js : function() {
			zingchart.node_click = function(p) {
				zcdocs.demos.dump('node_click', p);
			}
		},
		console : 1,
		code : ["zingchart.node_click = function(p) {","	zcdocs.demos.dump('node_click', p);","}"],
		clean : function() {
			zingchart.node_click = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-node_doubleclick",
		topic : "events > node_doubleclick",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.node_doubleclick"],
		html : null,
		js : function() {
			zingchart.node_doubleclick = function(p) {
				zcdocs.demos.dump('node_doubleclick', p);
			}
		},
		console : 1,
		code : ["zingchart.node_doubleclick = function(p) {","	zcdocs.demos.dump('node_doubleclick', p);","}"],
		clean : function() {
			zingchart.node_doubleclick = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-node_mouseout",
		topic : "events > node_mouseout",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.node_mouseout"],
		html : null,
		js : function() {
			zingchart.node_mouseout = function(p) {
				zcdocs.demos.dump('node_mouseout', p);
			}
		},
		console : 1,
		code : ["zingchart.node_mouseout = function(p) {","	zcdocs.demos.dump('node_mouseout', p);","}"],
		clean : function() {
			zingchart.node_mouseout = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-node_mouseover",
		topic : "events > node_mouseover",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "plot":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.node_mouseover"],
		html : null,
		js : function() {
			zingchart.node_mouseover = function(p) {
				zcdocs.demos.dump('node_mouseover', p);
			}
		},
		console : 1,
		code : ["zingchart.node_mouseover = function(p) {","	zcdocs.demos.dump('node_mouseover', p);","}"],
		clean : function() {
			zingchart.node_mouseover = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-node_remove",
		topic : "events > node_remove",
		json : {
		    "type":"line",
		    "series":[
		        {
		            "values":[11,26,7,44,19]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.node_remove"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			zingchart.node_remove = function(p) {
				zcdocs.demos.dump('node_remove', p);
			}
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "removenode", {
					"plotindex":1,
					"nodeindex":2
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "reload");
			});
		},
		console : 1,
		code : ["zingchart.node_remove = function(p) {","	zcdocs.demos.dump('node_remove', p);","}","$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"removenode\", {","		\"plotindex\":1,","		\"nodeindex\":2","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"reload\");","});"],
		clean : function() {
			$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "events-plot_click",
		topic : "events > plot_click",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "plot":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.plot_click"],
		html : null,
		js : function() {
			zingchart.plot_click = function(p) {
				zcdocs.demos.dump('plot_click', p);
			}
		},
		console : 1,
		code : ["zingchart.plot_click = function(p) {","	zcdocs.demos.dump('plot_click', p);","}"],
		clean : function() {
			zingchart.plot_click = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-plot_doubleclick",
		topic : "events > plot_doubleclick",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "plot":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.plot_doubleclick"],
		html : null,
		js : function() {
			zingchart.plot_doubleclick = function(p) {
				zcdocs.demos.dump('plot_doubleclick', p);
			}
		},
		console : 1,
		code : ["zingchart.plot_doubleclick = function(p) {","	zcdocs.demos.dump('plot_doubleclick', p);","}"],
		clean : function() {
			zingchart.plot_doubleclick = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-plot_mouseout",
		topic : "events > plot_mouseout",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "plot":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.plot_mouseout"],
		html : null,
		js : function() {
			zingchart.plot_mouseout = function(p) {
				zcdocs.demos.dump('plot_mouseout', p);
			}
		},
		console : 1,
		code : ["zingchart.plot_mouseout = function(p) {","	zcdocs.demos.dump('plot_mouseout', p);","}"],
		clean : function() {
			zingchart.plot_mouseout = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-plot_mouseover",
		topic : "events > plot_mouseover",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "plot":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.plot_mouseover"],
		html : null,
		js : function() {
			zingchart.plot_mouseover = function(p) {
				zcdocs.demos.dump('plot_mouseover', p);
			}
		},
		console : 1,
		code : ["zingchart.plot_mouseover = function(p) {","	zcdocs.demos.dump('plot_mouseover', p);","}"],
		clean : function() {
			zingchart.plot_mouseover = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-reload",
		topic : "events > reload",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.reload"],
		html : null,
		js : function() {
			zingchart.reload = function(p) {
				zcdocs.demos.dump('reload', p);
			}
		},
		console : 1,
		code : ["zingchart.reload = function(p) {","	zcdocs.demos.dump('reload', p);","}"],
		clean : function() {
			zingchart.reload = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-resize",
		topic : "events > resize",
		json : {
		    "type":"bar",
		    "legend":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.resize"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>"],
		js : function() {
			zingchart.resize = function(p) {
				zcdocs.demos.dump('resize', p);
			}
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "resize", {
					"width":zcdocs.utils.rvalue(300, 450),
					"height":zcdocs.utils.rvalue(150, 250)
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "resize", {
					"width":480,
					"height":300
				});
			});
		},
		console : 1,
		code : ["zingchart.resize = function(p) {","	zcdocs.demos.dump('resize', p);","}","$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"resize\", {","		\"width\":zcdocs.utils.rvalue(300, 450),","		\"height\":zcdocs.utils.rvalue(150, 250)","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"resize\", {","		\"width\":480,","		\"height\":300","	});","});"],
		clean : function() {
			zingchart.resize = null;
$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "events-setdata",
		topic : "events > setdata",
		json : {
			"layout":"1x2",
			"graphset":[
				{
					"id":"graph1",
				    "type":"bar",
				    "series":[
				        {
				            "values":[11,26,7,44,11]
				        }
				    ]
				},
		        {
		        	"id":"graph2",
				    "type":"line",
				    "series":[
				        {
				            "values":[42,13,21,15,33]
				        }
				    ]
		        }
		    ]
		},
		tokens : ["zingchart.setdata"],
		html : ["<button class=\"btn btn-danger\" id=\"reset\">Reset</button>","<button class=\"btn btn-info\" id=\"demo1\">Run Demo 1</button>","<button class=\"btn btn-info\" id=\"demo2\">Run Demo 2</button>"],
		js : function() {
			zingchart.setdata = function(p) {
				zcdocs.demos.dump('setdata', p);
			}
			$("#demo1").bind('click', function() {
				zingchart.exec("demo-chart", "setdata", {
					"data":{
						"layout":"1x2",
						"graphset":[
							{
								"id":"graph1",
								"type":"bar",
								"series":[
									{
										"values":zcdocs.utils.rvalues(5, 10, 60)
									}
								]
							},
							{
								"id":"graph2",
								"type":"line",
								"series":[
									{
										"values":zcdocs.utils.rvalues(5, 10, 60)
									}
								]
							}
					    ]
					}
				});
			});
			$("#demo2").bind('click', function() {
				zingchart.exec("demo-chart", "setdata", {
					"graphid":"graph2",
					"data":{
						"id":"graph2",
						"type":"line",
						"series":[
							{
								"values":zcdocs.utils.rvalues(5, 10, 60)
							}
						]
					}
				});
			});
			$("#reset").bind('click', function() {
				zingchart.exec("demo-chart", "setdata", {
					"data":{
						"layout":"1x2",
						"graphset":[
							{
								"id":"graph1",
								"type":"bar",
								"series":[
									{
										"values":[11,26,7,44,11]
									}
								]
							},
							{
								"id":"graph2",
								"type":"line",
								"series":[
									{
										"values":[42,13,21,15,33]
									}
								]
							}
						]
					}
				});
			});
		},
		console : 1,
		code : ["zingchart.setdata = function(p) {","	zcdocs.demos.dump('setdata', p);","}","$(\"#demo1\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setdata\", {","		\"data\":{","			\"layout\":\"1x2\",","			\"graphset\":[","				{","					\"id\":\"graph1\",","					\"type\":\"bar\",","					\"series\":[","						{","							\"values\":zcdocs.utils.rvalues(5, 10, 60)","						}","					]","				},","				{","					\"id\":\"graph2\",","					\"type\":\"line\",","					\"series\":[","						{","							\"values\":zcdocs.utils.rvalues(5, 10, 60)","						}","					]","				}","		    ]","		}","	});","});","$(\"#demo2\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setdata\", {","		\"graphid\":\"graph2\",","		\"data\":{","			\"id\":\"graph2\",","			\"type\":\"line\",","			\"series\":[","				{","					\"values\":zcdocs.utils.rvalues(5, 10, 60)","				}","			]","		}","	});","});","$(\"#reset\").bind('click', function() {","	zingchart.exec(\"demo-chart\", \"setdata\", {","		\"data\":{","			\"layout\":\"1x2\",","			\"graphset\":[","				{","					\"id\":\"graph1\",","					\"type\":\"bar\",","					\"series\":[","						{","							\"values\":[11,26,7,44,11]","						}","					]","				},","				{","					\"id\":\"graph2\",","					\"type\":\"line\",","					\"series\":[","						{","							\"values\":[42,13,21,15,33]","						}","					]","				}","			]","		}","	});","});"],
		clean : function() {
			zingchart.setdata = null;
$("#demo1").unbind('click');
$("#reset").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "events-shape_click",
		topic : "events > shape_click",
		json : {
		    "type":"bar",
		    "shapes":[
		    	{
		    		"x":200,
		    		"y":50,
		    		"size":35,
		    		"type":"star6",
		    		"background-color":"#f90",
		    		"padding":5,
		    		"border-width":1,
		    		"border-color":"#999",
		    		"label":{
		    			"text":"Simple Shape"
					}
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ]
		},
		tokens : ["zingchart.shape_click"],
		html : null,
		js : function() {
			zingchart.shape_click = function(p) {
				zcdocs.demos.dump('shape_click', p);
			}
		},
		console : 1,
		code : ["zingchart.shape_click = function(p) {","	zcdocs.demos.dump('shape_click', p);","}"],
		clean : function() {
			zingchart.shape_click = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-shape_mouseout",
		topic : "events > shape_mouseout",
		json : {
		    "type":"bar",
		    "shapes":[
		    	{
		    		"x":200,
		    		"y":50,
		    		"size":35,
		    		"type":"star6",
		    		"background-color":"#f90",
		    		"padding":5,
		    		"border-width":1,
		    		"border-color":"#999",
		    		"label":{
		    			"text":"Simple Shape"
					}
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ]
		},
		tokens : ["zingchart.shape_mouseout"],
		html : null,
		js : function() {
			zingchart.shape_mouseout = function(p) {
				zcdocs.demos.dump('shape_mouseout', p);
			}
		},
		console : 1,
		code : ["zingchart.shape_mouseout = function(p) {","	zcdocs.demos.dump('shape_mouseout', p);","}"],
		clean : function() {
			zingchart.shape_mouseout = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-shape_mouseover",
		topic : "events > shape_mouseover",
		json : {
		    "type":"bar",
		    "shapes":[
		    	{
		    		"x":200,
		    		"y":50,
		    		"size":35,
		    		"type":"star6",
		    		"background-color":"#f90",
		    		"padding":5,
		    		"border-width":1,
		    		"border-color":"#999",
		    		"label":{
		    			"text":"Simple Shape"
					}
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        }
		    ]
		},
		tokens : ["zingchart.shape_mouseover"],
		html : null,
		js : function() {
			zingchart.shape_mouseover = function(p) {
				zcdocs.demos.dump('shape_mouseover', p);
			}
		},
		console : 1,
		code : ["zingchart.shape_mouseover = function(p) {","	zcdocs.demos.dump('shape_mouseover', p);","}"],
		clean : function() {
			zingchart.shape_mouseover = null;
		}
	});
	zcdocs.demos.items.push({
		id : "events-zoom",
		topic : "events > zoom",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"zooming":true
		    },
		    "scale-y":{
		    	"zooming":true
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,19,42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["zingchart.zoom"],
		html : null,
		js : function() {
			zingchart.zoom = function(p) {
				zcdocs.demos.dump('zoom', p);
			}
		},
		console : 1,
		code : ["zingchart.zoom = function(p) {","	zcdocs.demos.dump('zoom', p);","}"],
		clean : function() {
			zingchart.zoom = null;
		}
	});
	zcdocs.demos.items.push({
		id : "generic-alpha",
		topic : "generic > alpha",
		json : {
		    "type":"bar",
		    "legend":{
		    	"alpha":0.25,
		    	"marker":{
		    		"alpha":0.5
		    	},
		    	"item":{
		    		"alpha":0.75
		    	}
		    },
		    "plot":{
		    	"alpha":0.5
		    },
		    "labels":[
		    	{
		    		"x":100,
		    		"y":50,
		    		"text":"This is<br>a label<br>with object alpha",
		    		"background-color":"#f90",
		    		"alpha":0.25
		    	},
		    	{
		    		"x":200,
		    		"y":50,
		    		"text":"This is<br>a label<br>with object and text alpha",
		    		"background-color":"#f90",
		    		"alpha":0.25,
		    		"text-alpha":1
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "alpha":1
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["alpha","text-alpha"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-angle",
		topic : "generic > angle",
		json : {
		    "type":"bar",
		    "scale-x":{
		    	"item":{
		    		"font-angle":-90
		    	}
		    },
		    "tooltip":{
		    	"font-angle":-45
		    },
		    "labels":[
		    	{
		    		"x":100,
		    		"y":60,
		    		"text":"This is a label",
		    		"angle":30
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["angle","font-angle"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-background-colors",
		topic : "generic > background-color attributes",
		json : {
		    "type":"bar",
		    "background-color":"#E2E0A1 #EAD8C5",
		    "plotarea":{
		    	"background-color":"#C5EAD5"
		    },
		    "legend":{
		    	"background-color-1":"#D9C5EA",
		    	"background-color-2":"#EAC5E1"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "background-color":"#A654C9"
		        },
		        {
		            "values":[42,13,21,15,33],
		            "background-color-1":"#E2CB16"
		        },
		        {
		            "values":[23,24,13,4,18],
		            "background-color-2":"#3FBA51"
		        }
		    ]
		},
		tokens : ["background-color","background-color-1","background-color-2"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-background-images",
		topic : "generic > background-image attributes",
		json : {
		    "type":"bar",
		    "background-image":"images/brick.png",
		    "background-repeat":"repeat",
		    "plotarea":{
		    	"background-image":"images/wood.png",
		    	"background-repeat":"repeat"
		    },
		    "legend":{
		    	"width":140,
		    	"height":70,
		    	"background-image":"images/dollar.png",
		    	"background-repeat":"no-repeat",
		    	"background-position":"98% 8%"
		    },
		    "series":[
		        {
		            "values":[11,26],
			    	"background-image":"images/dollar.png",
			    	"background-repeat":"no-repeat",
			    	"background-fit":"x"
		        },
		        {
		            "values":[42,13],
			    	"background-image":"images/dollar.png",
			    	"background-repeat":"no-repeat",
			    	"background-fit":"y"
		        },
		        {
		            "values":[23,24],
		            "background-image":"images/dollar.png",
			    	"background-repeat":"no-repeat",
			    	"background-fit":"xy"
		        }
		    ]
		},
		tokens : ["background-image","background-fit","background-position","background-repeat"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-border-radius",
		topic : "generic > border-radius attributes",
		json : {
		    "type":"bar",
			"border-color":"#f0f",
			"border-width":4,
			"border-radius":20,
			"legend":{
				"border-radius":"15 15 0 0",
				"header":{
					"text":"Legend",
					"color":"#fff",
					"border-radius":"15 15 0 0"
				}
			},
		    "plot":{
		    	"border-width":0,
		    	"stacked":true
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "border-radius-bottom-left":15,
		            "border-radius-bottom-right":15
		        },
		        {
		            "values":[42,13,21,15,33],
		            "border-radius-top-left":15,
		            "border-radius-top-right":15
		        }
		    ]
		},
		tokens : ["border-radius","border-radius-top-left","border-radius-top-right","border-radius-bottom-right","border-radius-bottom-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-borders",
		topic : "generic > border attributes",
		json : {
		    "type":"bar",
			"border-color":"#f0f",
			"line-style":"dashed",
		    "labels":[
		    	{
		    		"border-color":"#009",
		    		"border-width":5,
		    		"text":"Some label",
		    		"x":150,
		    		"y":50,
		    		"padding":10
		    	}
		    ],
		    "plot":{
		    	"border-width":2
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "border-width":5,
		            "border-color":"#f00"
		        },
		        {
		            "values":[42,13,21,15,33],
		            "line-style":"dotted"
		        },
		        {
		            "values":[23,24,13,4,18],
		            "line-style":"dashed",
		            "border-color":"#000"
		        }
		    ]
		},
		tokens : ["border-width","border-color","line-style"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-callouts",
		topic : "generic > callout attributes",
		json : {
		    "style":{
		    	".lbl":{
		    		"background-color":"#ff3",
		    		"border-color":"#000",
		    		"border-width":1,
		    		"padding":"5 10"
		    	}
		    },
			"graphset":[
				{
				    "type":"line",
				    "labels":[
				    	{
				    		"class":"lbl",
				    		"text":"Label 1",
				    		"callout":true,
				    		"callout-offset":20,
				    		"hook":{
				    			"type":"node",
				    			"index":1,
				    			"plot":0,
				    			"offset-y":-50
				    		},
				    		"callout-hook":{
				    			"type":"node",
				    			"index":1,
				    			"plot":0,
				    			"offset-y":-10
				    		}
				    	},
				    	{
				    		"class":"lbl",
				    		"text":"Label 2",
				    		"callout":true,
				    		"callout-position":"top",
				    		"callout-width":30,
				    		"callout-extension":10,
				    		"hook":{
				    			"type":"node",
				    			"index":3,
				    			"plot":1,
				    			"offset-y":40
				    		},
				    		"callout-hook":{
				    			"type":"node",
				    			"index":3,
				    			"plot":1,
				    			"offset-y":20
				    		}
				    	}
				    ],
				    "series":[
				        {
				            "values":[11,26,7,44,11]
				        },
				        {
				            "values":[42,13,21,15,33]
				        }
				    ]
				}
			]
		},
		tokens : ["callout","callout-position","callout-width","callout-height","callout-hook","callout-extension"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-explicit-positioning-dimensions",
		topic : "generic > explicit positioning and dimensions",
		json : {
		    "type":"line",
		    "plotarea":{
		    	"x":50,
		    	"y":50,
		    	"width":300,
		    	"height":200
		    },
		    "legend":{
		    	"x":"70%",
		    	"y":"70%",
		    	"width":"20%",
		    	"height":"10%"
		    },
		    "labels":[
		    	{
		    		"x":400,
		    		"y":50,
		    		"text":"A label",
		    		"width":50,
		    		"height":50,
		    		"background-color":"#f90"
		    	}
		    ],
		    "shapes":[
		    	{
		    		"x":100,
		    		"y":350,
		    		"size":40,
		    		"type":"circle",
		    		"background-color":"#f90",
		    		"border-color":"#090",
		    		"border-width":1
		    	},{
		    		"x":250,
		    		"y":350,
		    		"size":30,
		    		"type":"star5",
		    		"background-color":"#090",
		    		"border-color":"#009",
		    		"border-width":2
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11,42,13,21,15,33,23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["x","y","width","height","size"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-fills",
		topic : "generic > fill attributes",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"gradient-colors":"#7DC4B6 #B0D660 #D660D6",
		    	"gradient-stops":"0.1 0.4 0.6",
		    	"fill-type":"radial",
		    	"fill-offset-x":-100,
		    	"fill-offset-y":-60
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "gradient-colors":"#A654C9 #41C1C1 #C15041",
		            "gradient-stops":"0.1 0.5 0.9",
		            "fill-type":"linear",
		            "fill-angle":180
		        },
		        {
		            "values":[42,13,21,15,33],
		            "background-color-1":"#E2CB16",
		            "fill-angle":45
		        },
		        {
		            "values":[23,24,13,4,18],
		            "background-color-2":"#3FBA51",
		            "fill-angle":90
		        }
		    ]
		},
		tokens : ["fill-type","fill-angle","fill-offset-x","fill-offset-y"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-gradients",
		topic : "generic > gradient attributes",
		json : {
		    "type":"bar",
		    "gradient-colors":"#E2E0A1 #EAD8C5 #98E0A3 #E0E098",
		    "gradient-stops":"0.1 0.4 0.6 0.9",
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "gradient-colors":"#A654C9 #41C1C1 #C15041",
		            "gradient-stops":"0.2 0.4 0.8"
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["gradient-colors","gradient-stops"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-lines",
		topic : "generic > line attributes",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"line-color":"#f0f",
		    	"line-style":"dashed"
		    },
		    "scale-y":{
		    	"line-color":"#f90",
		    	"line-style":"dotted",
		    	"line-width":4
		    },
		    "shapes":[
		    	{
		    		"type":"line",
		    		"line-color":"#009",
		    		"line-width":8,
		    		"points":[
		    			[150,50],
		    			[180,50],
		    			[180,100],
		    			[210,100]
		    		],
		    		"label":{
		    			"text":"Some line",
		    			"offset-x":40
		    		}
		    	}
		    ],
		    "plot":{
		    	"line-width":3
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "line-width":5,
		            "line-color":"#f00"
		        },
		        {
		            "values":[42,13,21,15,33],
		            "line-style":"dotted"
		        },
		        {
		            "values":[23,24,13,4,18],
		            "line-gap-size":10,
		            "line-segment-size":5
		        }
		    ]
		},
		tokens : ["line-width","line-color","line-style","line-gap-size","line-segment-size"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-margins",
		topic : "generic > margins",
		json : {
		    "type":"line",
		    "plotarea":{
		    	"margin":"10 10 120 60"
		    },
		    "legend":{
		    	"margin-top":"auto",
		    	"margin-right":"auto",
		    	"margin-bottom":10,
		    	"margin-left":"auto"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["margin","margin-top","margin-right","margin-bottom","margin-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-offsets",
		topic : "generic > offsets",
		json : {
		    "type":"pie",
		    "scale":{
		    	"size-factor":0.4
		    },
		    "labels":[
		    	{
		    		"x":50,
		    		"y":50,
		    		"width":100,
		    		"height":40,
		    		"alpha":0.25,
		    		"text":"Original",
		    		"background-color":"#f90"
		    	},{
		    		"x":50,
		    		"y":50,
		    		"width":100,
		    		"height":40,
		    		"offset-x":40,
		    		"offset-y":20,
		    		"alpha":0.25,
		    		"background-color":"#f90",
		    		"text":"With Offset"
		    	}
		    ],
		    "plot":{
		    	"value-box":{
		    	}
		    },
		    "series":[
		        {
		            "values":[11],
		            "text":"Apple"
		        },
		        {
		            "values":[42],
		            "text":"Banana"
		        },
		        {
		            "values":[24],
		            "text":"Cherry",
		            "offset-r":20
		        }
		    ]
		},
		tokens : ["offset-x","offset-y","offset-r"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-paddings",
		topic : "generic > paddings",
		json : {
		    "type":"line",
		    "tooltip":{
		    	"padding-top":5,
		    	"padding-right":10,
		    	"padding-bottom":15,
		    	"padding-left":20
		    },
		    "labels":[
		    	{
		    		"x":100,
		    		"y":50,
		    		"text":"This is a label",
		    		"padding":10,
		    		"background-color":"#f90",
		    		"border-width":1,
		    		"border-color":"#000"
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["padding","padding-top","padding-right","padding-bottom","padding-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-shadows",
		topic : "generic > shadow attributes",
		json : {
		    "type":"bar",
		    "legend":{
		    	"alpha":1,
				"background-color":"#f90",
				"text":"Some label",
				"x":150,
				"y":50,
				"padding":10,
				"shadow":true,
				"shadow-angle":45,
				"shadow-distance":5,
				"shadow-alpha":0.75,
				"shadow-color":"#f00"
		    },
		    "plot":{
		    	"shadow":true,
		    	"shadow-distance":4
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "shadow-alpha":0.9,
		            "shadow-color":"#ff0"
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["shadow","shadow-alpha","shadow-color","shadow-angle","shadow-distance","shadow-blur"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-text-alignments",
		topic : "generic > text alignment attributes",
		json : {
		    "style":{
		    	".lbl":{
		    		"background-color":"#ff3",
		    		"border-color":"#000",
		    		"border-width":1,
		    		"width":100,
		    		"height":80
		    	}
		    },
			"graphset":[
				{
				    "type":"line",
				    "plotarea":{
				    	"margin-top":180
				    },
				    "labels":[
				    	{
				    		"class":"lbl",
				    		"text":"Top<br>Left",
				    		"x":60,
				    		"y":40,
				    		"text-align":"left",
				    		"vertical-align":"top"
				    	},{
				    		"class":"lbl",
				    		"text":"Middle<br>Center",
				    		"x":200,
				    		"y":40,
				    		"text-align":"center",
				    		"vertical-align":"middle"
				    	},{
				    		"class":"lbl",
				    		"text":"Bottom<br>Right",
				    		"x":340,
				    		"y":40,
				    		"text-align":"right",
				    		"vertical-align":"bottom"
				    	}
				    ],
				    "series":[
				        {
				            "values":[11,26,7,44,11]
				        },
				        {
				            "values":[42,13,21,15,33]
				        }
				    ]
				}
			]
		},
		tokens : ["text-align","vertical-align"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-text-modifiers",
		topic : "generic > text modifier attributes",
		json : {
		    "type":"bar",
		    "legend":{
		    	"header":{
		    		"text":"Header",
		    		"italic":true
		    	},
		    	"footer":{
		    		"text":"Footer",
		    		"underline":true
		    	}
		    },
		    "scale-x":{
		    	"label":{
		    		"text":"Scale X",
		    		"bold":true
		    	},
		    	"item":{
		    		"text-decoration":"underline"
		    	}
		    },
		    "scale-y":{
		    	"item":{
		    		"font-style":"italic"
		    	}
		    },
		    "tooltip":{
		    	"text":"The value of the node is %node-value",
		    	"font-weight":"bold"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["bold","font-weight","italic","font-style","underline","text-decoration"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-text-styling",
		topic : "generic > text styling attributes",
		json : {
		    "type":"bar",
		    "legend":{
		    	"header":{
		    		"text":"Header",
		    		"font-size":17,
		    		"font-family":"Impact"
		    	},
		    	"footer":{
		    		"text":"Footer",
		    		"color":"#f00"
		    	}
		    },
		    "scale-x":{
		    	"label":{
		    		"text":"Scale X",
		    		"font-color":"#0f0",
		    		"font-size":13
		    	},
		    	"item":{
		    		"font-family":"Courier"
		    	}
		    },
		    "tooltip":{
		    	"text":"The value of the node is %node-value",
		    	"font-size":19,
		    	"font-family":"Helvetica"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["color","font-color","font-family","font-size"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-text",
		topic : "generic > text",
		json : {
		    "type":"bar",
		    "legend":{
		    	"header":{
		    		"text":"Header"
		    	},
		    	"footer":{
		    		"text":"Footer"
		    	}
		    },
		    "tooltip":{
		    	"text":"The value of the node is %node-value"
		    },
		    "labels":[
		    	{
		    		"x":200,
		    		"y":80,
		    		"text":"This is a label"
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["text"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "generic-visible",
		topic : "generic > visible",
		json : {
		    "type":"bar",
		    "legend":{
		    	"visible":false
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["visible"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-headers",
		topic : "graph > headers",
		json : {
		    "type":"line",
		    "title":{
		    	"text":"This is the title of the chart"
		    },
		    "subtitle":{
		    	"text":"This is the subtitle of the chart",
		    	"color":"green",
		    	"italic":true
		    },
		    "source":{
		    	"text":"This is a chart element displaying the source of the data",
		    	"color":"red",
		    	"underline":true
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11,42,13,21,15,33,23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["title","subtitle","source"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-alpha",
		topic : "graph > legend > alpha",
		json : {
		    "type":"bar",
		    "legend":{
		    	"alpha" : 0.5
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","alpha"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-background-color-1",
		topic : "graph > legend > background-color-1",
		json : {
		    "type":"bar",
		    "legend":{
		    	"background-color-1" : "#333",
		    	"background-color-2" : "#999",
		    	"item" : {
			    	"color" : "#FFF"
		    	}
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","background-color-1"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-background-color-2",
		topic : "graph > legend > background-color-2",
		json : {
		    "type":"bar",
		    "legend":{
		    	"background-color-1" : "#333",
		    	"background-color-2" : "#999",
		    	"item" : {
			    	"color" : "#FFF"
		    	}
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","background-color-2"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-background-color",
		topic : "graph > legend > background-color",
		json : {
		    "type":"bar",
		    "legend":{
		    	"background-color" : "#333"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","background-color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-background-fit",
		topic : "graph > legend > background-fit",
		json : {
		    "type":"bar",
		    "legend":{
		    	"background-image" : "./images/wood.png",
		    	"background-fit" : "y"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","background-fit"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-background-image",
		topic : "graph > legend > background-image",
		json : {
		    "type":"bar",
		    "legend":{
		    	"background-image" : "./images/wood.png",
		    	"background-fit" : "y"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","background-image"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-background-position",
		topic : "graph > legend > background-position",
		json : {
		    "type":"bar",
		    "legend":{
		    	"background-image" : "./images/dollar.png",
		    	"background-position" : "20 10",
		    	"background-repeat" : "no-repeat"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","background-position"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-background-repeat",
		topic : "graph > legend > background-repeat",
		json : {
		    "type":"bar",
		    "legend":{
		    	"background-image" : "./images/dollar.png",
		    	"background-repeat" : "repeat-x"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","background-repeat"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-border-color",
		topic : "graph > legend > border-color",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"border-color" : "#333",
		    	"border-width" : 2
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","border-color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-border-radius-bottom-left",
		topic : "graph > legend > border-radius-bottom-left",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"border-color" : "#333",
		    	"border-radius-bottom-left" : "5px",
		    	"border-width" : 2
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","border-radius-bottom-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-border-radius-bottom-right",
		topic : "graph > legend > border-radius-bottom-right",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"border-color" : "#333",
		    	"border-radius-bottom-right" : "5px",
		    	"border-width" : 2
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","border-radius-bottom-right"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-border-radius-top-left",
		topic : "graph > legend > border-radius-top-left",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"border-color" : "#333",
		    	"border-radius-top-left" : "5px",
		    	"border-width" : 2
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","border-radius-top-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-border-radius-top-right",
		topic : "graph > legend > border-radius-top-right",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"border-color" : "#333",
		    	"border-radius-top-right" : "5px",
		    	"border-width" : 2
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","border-radius-top-right"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-border-width",
		topic : "graph > legend > border-width",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"border-color" : "#333",
		    	"border-width" : 2
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","border-width"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-callout-extension",
		topic : "graph > legend > callout-extension",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"callout" : true,
		    	"callout-extension" : "40px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","callout-extension"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-callout-height",
		topic : "graph > legend > callout-height",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"callout" : true,
		    	"callout-extension" : "40px",
		    	"callout-height" : "40px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","callout-height"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-callout-hook",
		topic : "graph > legend > callout-hook",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"callout" : true,
		    	"callout-hook" : [200, 300]
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","callout-hook"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-callout-offset",
		topic : "graph > legend > callout-offset",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"callout" : true,
		    	"callout-offset" : "26px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","callout-offset"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-callout-position",
		topic : "graph > legend > callout-position",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"callout" : true,
		    	"callout-position" : "left"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","callout-position"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-callout-width",
		topic : "graph > legend > callout-width",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"callout" : true,
		    	"callout-width" : "50px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","callout-width"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-callout",
		topic : "graph > legend > callout",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"callout" : true
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","callout"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-drag-handler",
		topic : "graph > legend > drag-handler",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"draggable" : true,
		    	"drag-handler" : "icon"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","drag-handler"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-draggable",
		topic : "graph > legend > draggable",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"draggable" : true
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","draggable"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-fill-angle",
		topic : "graph > legend > fill-angle",
		json : {
		    "type":"bar",
		    "legend":{ 
		        "background-color-1" : "#fff",
		    	"background-color-2" : "#ccc",
		    	"fill-type" : "linear",
		    	"fill-angle" : 90
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","fill-angle"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-fill-offset-x",
		topic : "graph > legend > fill-offset-x",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"background-color-1" : "#fff",
		    	"background-color-2" : "#ccc",
		    	"fill-type" : "linear",
		    	"fill-angle" : 115,
		    	"fill-offset-x" : "10px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","fill-offset-x"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-fill-offset-y",
		topic : "graph > legend > fill-offset-y",
		json : {
		    "type":"bar",
		    "legend":{ 
		    	"background-color-1" : "#fff",
		    	"background-color-2" : "#ccc",
		    	"fill-type" : "linear",
		    	"fill-angle" : 115,
		    	"fill-offset-y" : "10px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","fill-offset-y"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-fill-type",
		topic : "graph > legend > fill-type",
		json : {
		    "type":"bar",
		    "legend":{ 
		        "background-color-1" : "#fff",
		    	"background-color-2" : "#ccc",
		    	"fill-type" : "radial",
		    	"fill-angle" : 90
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","fill-type"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-footer",
		topic : "graph > legend > footer",
		json : {
		    "type":"bar",
		    "legend":{
		    	"footer":{
		    		"text":"Some Footer",
		    		"background-color":"#f90"
		    	}
		    },
		    "plot":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","footer"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-gradient-colors",
		topic : "graph > legend > gradient-colors",
		json : {
		    "type":"bar",
		    "legend":{ 
		        "gradient-colors": "#ccc #fff #ccc",
		        "gradient-stops": "0.1 0.5 0.9"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","gradient-colors"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-gradient-stops",
		topic : "graph > legend > gradient-stops",
		json : {
		    "type":"bar",
		    "legend":{ 
		        "gradient-colors": "#ccc #fff #ccc",
		        "gradient-stops": "0.1 0.5 0.9"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","gradient-stops"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-header",
		topic : "graph > legend > header",
		json : {
		    "type":"bar",
		    "legend":{
		    	"header":{
		    		"text":"The Header",
		    		"background-color":"#90f"
		    	}
		    },
		    "plot":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","header"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-height",
		topic : "graph > legend > height",
		json : {
		    "type":"bar",
		    "legend":{
		    	"height" : "100px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","height"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-icon",
		topic : "graph > legend > icon",
		json : {
		    "type":"bar",
		    "legend":{
		    	"draggable":true,
		    	"minimize":true,
		    	"drag-handler":"icon",
		    	"icon":{
		    		"line-color":"#ff0",
		    		"line-width":2,
		    		"alpha":0.8
		    	}
		    },
		    "plot":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","icon"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-item",
		topic : "graph > legend > item",
		json : {
		    "type":"bar",
		    "legend":{
		    	"item":{
		    		"color":"#f00",
		    		"bold":true
		    	},
		    	"item-off":{
		    		"color":"#00f",
		    		"italic":true
		    	}
		    },
		    "plot":{
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","item","item-off"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-layout",
		topic : "graph > legend > layout",
		json : {
		"layout":"2x",
		"graphset":[
			{
			    "type":"line",
			    "legend":{
			    	"layout":"2x"
			    },
			    "series":[
			        {
			            "values":[11,26,7,44,11]
			        },
			        {
			            "values":[42,13,21,15,33]
			        },
			        {
			            "values":[23,24,13,4,18]
			        },
			        {
			            "values":[21,16,17,34,19]
			        }
			    ]
			},
			{
			    "type":"line",
			    "legend":{
			    	"layout":"float"
			    },
			    "series":[
			        {
			            "values":[11,26,7,44,11]
			        },
			        {
			            "values":[42,13,21,15,33]
			        },
			        {
			            "values":[23,24,13,4,18]
			        },
			        {
			            "values":[21,16,17,34,19]
			        }
			    ]
			}
		]
		},
		tokens : ["legend","layout"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-margin-bottom",
		topic : "graph > legend > margin-bottom",
		json : {
		    "type":"bar",
		    "legend":{
		    	"margin-bottom": "10px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","margin-bottom"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-margin-left",
		topic : "graph > legend > margin-left",
		json : {
		    "type":"bar",
		    "legend":{
		    	"margin-left": "10px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","margin-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-margin-right",
		topic : "graph > legend > margin-right",
		json : {
		    "type":"bar",
		    "legend":{
		    	"margin-right": "10px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","margin-right"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-margin-top",
		topic : "graph > legend > margin-top",
		json : {
		    "type":"bar",
		    "legend":{
		    	"margin-top": "40px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","margin-top"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-margin",
		topic : "graph > legend > margin",
		json : {
		    "type":"bar",
		    "legend":{
		    	"margin": "10px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","margin"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-marker",
		topic : "graph > legend > marker",
		json : {
		    "type":"bar",
		    "legend":{
		    	"marker":{
		    		"border-color":"#f00",
		    		"border-width":2,
		    		"type":"circle"
		    	}
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","marker"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-offset-x",
		topic : "graph > legend > offset-x",
		json : {
		    "type":"bar",
		    "legend":{
		    	"offset-x": "10px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","offset-x"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-offset-y",
		topic : "graph > legend > offset-y",
		json : {
		    "type":"bar",
		    "legend":{
		    	"offset-y": "10px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","offset-y"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-position",
		topic : "graph > legend > position",
		json : {
		    "type":"bar",
		    "legend":{
		    	"position" : "100px 50px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","position"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-shadow-alpha",
		topic : "graph > legend > shadow-alpha",
		json : {
		    "type":"bar",
		    "legend":{
		    	"shadow" : true,
		    	"shadow-alpha" : 0.5
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","shadow-alpha"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-shadow-angle",
		topic : "graph > legend > shadow-angle",
		json : {
		    "type":"bar",
		    "legend":{
		    	"shadow" : true,
		    	"shadow-angle" : 115
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","shadow-angle"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-shadow-blur",
		topic : "graph > legend > shadow-blur",
		json : {
		    "type":"bar",
		    "legend":{
		    	"shadow" : true,
		    	"shadow-blur" : "6px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","shadow-blur"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-shadow-color",
		topic : "graph > legend > shadow-color",
		json : {
		    "type":"bar",
		    "legend":{
		    	"shadow" : true,
		    	"shadow-color" : "#f00"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","shadow-color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-shadow-distance",
		topic : "graph > legend > shadow-distance",
		json : {
		    "type":"bar",
		    "legend":{
		    	"shadow" : true,
		    	"shadow-distance" : "6px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","shadow-distance"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-shadow",
		topic : "graph > legend > shadow",
		json : {
		    "type":"bar",
		    "legend":{
		    	"shadow" : false
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","shadow"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-toggle-action",
		topic : "graph > legend > toggle-action",
		json : {
			"layout":"2x",
			"graphset":[
				{
				    "type":"bar",
				    "legend":{
				    	"toggle-action":"hide"
				    },
				    "series":[
				        {
				            "values":[11,26,7,44,11]
				        },
				        {
				            "values":[42,13,21,15,33]
				        },
				        {
				     		"values":[23,24,13,4,18]
				        }
				    ]
				},
				{
				    "type":"bar",
				    "legend":{
				    	"toggle-action":"remove"
				    },
				    "series":[
				        {
				            "values":[11,26,7,44,11]
				        },
				        {
				            "values":[42,13,21,15,33]
				        },
				        {
				     		"values":[23,24,13,4,18]
				        }
				    ]
				}
			]
		},
		tokens : ["toggle-action"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-visible",
		topic : "graph > legend > visible",
		json : {
		    "type":"bar",
		    "legend":{
		    	"visible" : false
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","visible"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-width",
		topic : "graph > legend > width",
		json : {
		    "type":"bar",
		    "legend":{
		    	"width" : "100px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","width"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-x",
		topic : "graph > legend > x",
		json : {
		    "type":"bar",
		    "legend":{
		    	"x" : "100px",
		    	"y" : "140px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","x"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-legend-y",
		topic : "graph > legend > y",
		json : {
		    "type":"bar",
		    "legend":{
		    	"x" : "100px",
		    	"y" : "140px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["legend","y"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-alpha",
		topic : "graph > plot > alpha",
		json : {
		    "type":"bar",
		    "plot":{
		    	"alpha" : 0.2
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","alpha"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-background-color-1",
		topic : "graph > plot > background-color-1",
		json : {
		    "type":"bar",
		    "plot" : {
				"background-color-1" : "#004d88",
				"background-color-2" : "#00213b"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","background-color-1"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-background-color-2",
		topic : "graph > plot > background-color-2",
		json : {
		    "type":"bar",
		    "plot" : {
				"background-color-1" : "#004d88",
				"background-color-2" : "#00213b"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","background-color-2"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-background-color",
		topic : "graph > plot > background-color",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color" : "#004d88"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","background-color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-background-fit",
		topic : "graph > plot > background-fit",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-image" : "./images/wood.png",
		    	"background-fit" : "x"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","background-fit"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-background-image",
		topic : "graph > plot > background-image",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-image" : "./images/wood.png",
		    	"background-fit" : "y"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","background-image"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-background-position",
		topic : "graph > plot > background-position",
		json : {
		    "type":"bar",
		    "plot" : {
		        "background-image" : "./images/wood.png",
		        "background-fit" : "x",
		    	"background-position" : "50 100"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","background-position"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-background-repeat",
		topic : "graph > plot > background-repeat",
		json : {
		    "type":"bar",
		    "plot" : {
		        "background-image" : "./images/wood.png",
			    "background-repeat" : "no-repeat"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","background-repeat"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-border-color",
		topic : "graph > plot > border-color",
		json : {
		    "type":"bar",
		    "plot" : {
			    "border-color" : "#00baff",
			    "border-width" : "2px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","border-color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-border-radius-bottom-left",
		topic : "graph > plot > border-radius-bottom-left",
		json : {
		    "type":"bar",
		    "plot" : {
			    "border-color" : "#00baff",
			    "border-radius-bottom-left" : "5px",
			    "border-width" : "2px"	    
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","border-radius-bottom-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-border-radius-bottom-right",
		topic : "graph > plot > border-radius-bottom-right",
		json : {
		    "type":"bar",
		    "plot" : {
			    "border-color" : "#00baff",
			    "border-radius-bottom-right" : "5px",
			    "border-width" : "2px"	    
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","border-radius-bottom-right"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-border-radius-top-left",
		topic : "graph > plot > border-radius-top-left",
		json : {
		    "type":"bar",
		    "plot" : {
			    "border-color" : "#00baff",
			    "border-radius-top-left" : "5px",
			    "border-width" : "2px"	    
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","border-radius-top-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-border-radius-top-right",
		topic : "graph > plot > border-radius-top-right",
		json : {
		    "type":"bar",
		    "plot" : {
			    "border-color" : "#00baff",
			    "border-radius-top-right" : "5px",
			    "border-width" : "2px"	    
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","border-radius-top-right"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-border-radius",
		topic : "graph > plot > border-radius",
		json : {
		    "type":"bar",
		    "plot" : {
			    "border-color" : "#00baff",
			    "border-radius" : "5px",
			    "border-width" : "2px"	    
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","border-radius"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-border-width",
		topic : "graph > plot > border-width",
		json : {
		    "type":"bar",
		    "plot" : {
			    "border-color" : "#00baff",
			    "border-width" : "2px"	    
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","border-width"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-fill-angle",
		topic : "graph > plot > fill-angle",
		json : {
		    "type":"bar",
		    "plot" : {
		        "background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"fill-angle" : -115
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","fill-angle"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-fill-offset-x",
		topic : "graph > plot > fill-offset-x",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"fill-offset-x" : -115
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","fill-offset-x"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-fill-offset-y",
		topic : "graph > plot > fill-offset-y",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"fill-offset-y" : -115
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","fill-offset-y"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-fill-type",
		topic : "graph > plot > fill-type",
		json : {
		    "type":"bar",
		    "plot" : {
		        "background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"fill-type" : "radial"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","fill-type"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-gradient-colors",
		topic : "graph > plot > gradient-colors",
		json : {
		    "type":"bar",
		    "plot" : {
		    	  "gradient-colors" : "#005e9a #9ec8e3 #092f47",
		          "gradient-stops" : "0.1 0.4 0.9"
		        },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","gradient-colors"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-gradient-stops",
		topic : "graph > plot > gradient-stops",
		json : {
		    "type":"bar",
		    "plot" : {
		    	  "gradient-colors" : "#005e9a #9ec8e3 #092f47",
		          "gradient-stops" : "0.1 0.4 0.9"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","gradient-stops"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-offset-x",
		topic : "graph > plot > offset-x",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"offset-x" : 20
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","offset-x"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-offset-y",
		topic : "graph > plot > offset-y",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"offset-y" : -40
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","offset-y"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-shadow-alpha",
		topic : "graph > plot > shadow-alpha",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"shadow" : true,
		    	"shadow-angle" : 45,
		    	"shadow-alpha" : 0.8,
		    	"shadow-color" : "#CCC",
		    	"shadow-distance" : "4px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","shadow-alpha"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-shadow-angle",
		topic : "graph > plot > shadow-angle",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"shadow" : true,
		    	"shadow-angle" : 45,
		    	"shadow-alpha" : 0.8,
		    	"shadow-color" : "#CCC",
		    	"shadow-distance" : "4px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","shadow-angle"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-shadow-blur",
		topic : "graph > plot > shadow-blur",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"shadow" : true,
		    	"shadow-angle" : 45,
		    	"shadow-alpha" : 0.8,
		    	"shadow-blur" : "6px",
		    	"shadow-color" : "#CCC",
		    	"shadow-distance" : "4px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","shadow-blur"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-shadow-color",
		topic : "graph > plot > shadow-color",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color-1" : "#1b4566",
		        "background-color-2" : "#13324a",
		    	"shadow" : true,
		    	"shadow-angle" : 45,
		    	"shadow-alpha" : 0.8,
		    	"shadow-color" : "#CCC",
		    	"shadow-distance" : "4px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","shadow-color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-shadow-distance",
		topic : "graph > plot > shadow-distance",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"shadow" : true,
		    	"shadow-angle" : 45,
		    	"shadow-alpha" : 0.8,
		    	"shadow-color" : "#CCC",
		    	"shadow-distance" : "4px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","shadow-distance"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-shadow",
		topic : "graph > plot > shadow",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"background-color-1" : "#004d88",
		        "background-color-2" : "#00213b",
		    	"shadow" : true,
		    	"shadow-angle" : 45,
		    	"shadow-alpha" : 0.8,
		    	"shadow-color" : "#CCC",
		    	"shadow-distance" : "4px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","shadow"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plot-visible",
		topic : "graph > plot > visible",
		json : {
		    "type":"bar",
		    "plot" : {
		    	"visible" : false
		    },
		    "series":[
		        {
		        	"background-color-1" : "#004d88",
		        	"background-color-2" : "#00213b",
		            "values":[11,26,7,44,11]
		        },
		        {
		        	"background-color-1" : "#1b4566",
		        	"background-color-2" : "#13324a",
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","visible"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-alpha",
		topic : "graph > plotarea > alpha",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"alpha" : 0.2,
		    	"background-color" : "#000"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","alpha"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-background-color-1",
		topic : "graph > plotarea > background-color-1",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"background-color-1" : "#FFF",
		    	"background-color-2" : "#CCC"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","background-color-1"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-background-color-2",
		topic : "graph > plotarea > background-color-2",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"background-color-1" : "#FFF",
		    	"background-color-2" : "#CCC"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","background-color-2"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-background-color",
		topic : "graph > plotarea > background-color",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"alpha" : 0.2,
		    	"background-color" : "#000"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","background-color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-background-fit",
		topic : "graph > plotarea > background-fit",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"background-image" : "./images/wood.png",
		    	"background-fit" : "y"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","background-fit"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-background-image",
		topic : "graph > plotarea > background-image",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"background-image" : "./images/wood.png",
		    	"background-fit" : "y"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","background-image"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-background-position",
		topic : "graph > plotarea > background-position",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"background-image" : "./images/wood.png",
		    	"background-repeat" : "no-repeat",
		    	"background-position" : "50 100"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","background-position"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-background-repeat",
		topic : "graph > plotarea > background-repeat",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"background-image" : "./images/wood.png",
		    	"background-repeat" : "no-repeat",
		    	"background-position" : "50 100"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","background-repeat"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-border-color",
		topic : "graph > plotarea > border-color",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"border-color" : "#0ff",
		    	"border-width" : "2px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","border-color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-border-radius-bottom-left",
		topic : "graph > plotarea > border-radius-bottom-left",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"border-color" : "#000 ",
		    	"border-width" : "2px",
		    	"border-radius-bottom-left" : "5px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","border-radius-bottom-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-border-radius-bottom-right",
		topic : "graph > plotarea > border-radius-bottom-right",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"border-color" : "#000 ",
		    	"border-width" : "2px",
		    	"border-radius-bottom-right" : "5px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","border-radius-bottom-right"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-border-radius-top-left",
		topic : "graph > plotarea > border-radius-top-left",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"border-color" : "#000 ",
		    	"border-width" : "2px",
		    	"border-radius-top-left" : "5px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","border-radius-top-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-border-radius-top-right",
		topic : "graph > plotarea > border-radius-top-right",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"border-color" : "#000 ",
		    	"border-width" : "2px",
		    	"border-radius-top-right" : "5px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","border-radius-top-right"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-border-radius",
		topic : "graph > plotarea > border-radius",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"border-color" : "#000",
		    	"border-width" : "2px",
		    	"border-radius" : "5px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","border-radius"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-border-width",
		topic : "graph > plotarea > border-width",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"border-color" : "#0ff",
		    	"border-width" : "2px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","border-width"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-callout",
		topic : "graph > plotarea > callout",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"callout" : true,
		    	"callout-extension" : "10px"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","callout"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-margins",
		topic : "graph > plotarea > margins",
		json : {
		    "type":"bar",
		    "scale-x":{
		    	"values":["A very long label", "B", "C", "Another long label", "E"],
		    	"item":{
		    		"font-angle":90,
		    		"auto-align":true
		    	},
		    	"label":{
		    		"text":"Some<br>Multi-line<br>Label"
		    	}
		    },
		    "scale-y":{
		    	"decimals":10,
		    	"label":{
		    		"text":"Some<br>Multi-line<br>Label"
		    	}
		    },
		    "plotarea":{
		    	"margin-left":"dynamic",
		    	"margin-bottom":"dynamic"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","margin","margin-top","margin-right","margin-bottom","margin-left"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotarea-shadow",
		topic : "graph > plotarea > shadow",
		json : {
		    "type":"bar",
		    "plotarea":{
		    	"shadow" : true
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11]
		        },
		        {
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plotarea","shadow"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-plotseries-background-image copy",
		topic : "graph > plot > background-image",
		json : {
		    "type":"bar",
		    "series":[
		        {
		        	"background-image" : "./images/wood.png",
		        	"background-fit" : "y",
		            "values":[11,26,7,44,11]
		        },
		        {
		        	"background-image" : "./images/brick.png",
		        	"background-fit" : "y",
		            "values":[42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["plot","background-image"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-preview-background-color",
		topic : "graph > preview > background-color",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"zooming":true
		    },
		    "preview":{
		    	"background-color":"#f90"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11,42,13,21,15,33,23,24,13,4,18,11,26,7,44,11,42,13,21,15,33,23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["background-color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-preview-border-color",
		topic : "graph > preview > border-color",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"zooming":true
		    },
		    "preview":{
		    	"border-color":"#f90",
		    	"border-width":2
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11,42,13,21,15,33,23,24,13,4,18,11,26,7,44,11,42,13,21,15,33,23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["border-color","border-width"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-tooltip-html-mode",
		topic : "graph > tooltip > html-mode",
		json : {
		    "type":"line",
		    "tooltip":{
		    	"html-mode":true,
		    	"background-color":"#f90",
		    	"padding":"5 10",
		    	"border-color":"#009",
		    	"border-width":2,
		    	"border-radius":5,
		    	"alpha":0.75,
		    	"width":90,
		    	"height":110,
		    	"vertical-align":"top",
		    	"text":"<table border=\"1\"><tr><td>The</td><td>value</td></tr><tr><td>of</td><td>this</td></tr><tr><td>node</td><td>is</td></tr><tr><td colspan=\"2\">%node-value</td></tr></table>"
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11,42,13,21,15,33,23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["tooltip","html-mode"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-tooltip",
		topic : "graph > tooltip",
		json : {
		    "type":"line",
		    "tooltip":{
		    	"background-color":"#f90",
		    	"padding":"5 10",
		    	"border-color":"#009",
		    	"border-width":2,
		    	"border-radius":5,
		    	"alpha":0.75,
		    	"text":"The value of this node is %node-value."
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11,42,13,21,15,33,23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["tooltip"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-zoom-preserve-zoom",
		topic : "graph > zoom > preserve-zoom",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"zooming":true
		    },
		    "scale-y":{
		    	"zooming":true
		    },
		    "zoom":{
		    	"preserve-zoom":true
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11,42,13,21,15,33,23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["zoom","preserve-zoom"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "graph-zoom",
		topic : "graph > zoom",
		json : {
		    "type":"line",
		    "scale-x":{
		    	"zooming":true
		    },
		    "scale-y":{
		    	"zooming":true
		    },
		    "zoom":{
		    	"background-color":"#f90",
		    	"border-color":"#009",
		    	"border-width":2,
		    	"alpha":0.75
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11,42,13,21,15,33,23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["zoom"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "gui-button-alpha",
		topic : "gui > context-menu > button > alpha",
		json : {
		    "type":"bar",
		    "legend":{
		    	"visible":false
		    },
		    "series":[
		        {
		            "values":[11,26,7,44,11],
		            "visible":false
		        },
		        {
		            "values":[42,13,21,15,33]
		        },
		        {
		            "values":[23,24,13,4,18]
		        }
		    ]
		},
		tokens : ["alpha"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "loader-context-button-alpha",
		topic : "root > gui > context-menu > button > alpha",
		json : {
			"gui" : {
				"context-menu" : {
			    	"button" : {
			    		 "alpha" : 0.5,
				    	 "text" : "Click Here Options",
			             "padding": "15px 15px 7px 15px",
			             "background-color": "#ff6600 #ff9933",
			             "border-color": "#000000",
			             "border-width": "3px",
			             "border-radius": "15px",
			             "font-color": "#000",
			             "font-size" : 16,
			             "visible":1
			    	}
			    } 
		    },
		    "graphset" : [{
			    "type":"bar",
			    "series":[
			        {
			            "values":[11,26,7,44,11]
			        },
			        {
			            "values":[42,13,21,15,33]
			        },
			        {
			            "values":[23,24,13,4,18]
			        }
			    ]
			 }]
		},
		tokens : ["button","alpha"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-getinfo",
		topic : "maps > getinfo",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":300,
			    		"groups":["EUROPE"]
			    	}
		    	}
			]
		},
		tokens : ["getinfo"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getinfo',
					zingchart.maps.getInfo("map")
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getinfo',","		zingchart.maps.getInfo(\"map\")","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "maps-getiteminfo",
		topic : "maps > getiteminfo",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":300,
			    		"groups":["EUROPE"]
			    	}
		    	}
			]
		},
		tokens : ["getiteminfo"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getiteminfo',
					zingchart.maps.getItemInfo("map", "FRA")
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getiteminfo',","		zingchart.maps.getItemInfo(\"map\", \"FRA\")","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "maps-getitems",
		topic : "maps > getitems",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":300,
			    		"groups":["EUROPE"]
			    	}
		    	}
			]
		},
		tokens : ["getitems"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				zcdocs.demos.dump('getitems',
					zingchart.maps.getItems("map")
				);
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	zcdocs.demos.dump('getitems',","		zingchart.maps.getItems(\"map\")","	);","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "maps-getlonlat",
		topic : "maps > getlonlat",
		json : {
			"labels":[
				{
					x:10,
					y:10,
					text:"Click on the map to convert x/y to lon/lat",
					backgroundColor:"#f90",
					padding:5
				}
			],
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":300,
			    		"groups":["EUROPE"]
			    	}
		    	}
			]
		},
		tokens : ["getlonlat"],
		html : null,
		js : function() {
			zingchart.click = function(p) {
				var lonlat = zingchart.maps.getLonLat("map", [p.x, p.y]);
				zcdocs.demos.dump('getlonlat', lonlat);
			};
		},
		console : 1,
		code : ["zingchart.click = function(p) {","	var lonlat = zingchart.maps.getLonLat(\"map\", [p.x, p.y]);","	zcdocs.demos.dump('getlonlat', lonlat);","};"],
		clean : function() {
			zingchart.click = null;
		}
	});
	zcdocs.demos.items.push({
		id : "maps-getxy",
		topic : "maps > getxy",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":300,
			    		"items":["FRA","BEL","NLD","DEU","CHE","ITA","LUX"],
				    	"style":{
							"hover-state":{
								"visible":false
							}
						}
			    	}
		    	}
			]
		},
		tokens : ["getxy"],
		html : ["<button class=\"btn btn-info\" id=\"demo1\">Demo 1</button>"],
		js : function() {
			$("#demo1").bind('click', function() {
				// coordinates for Paris
				var lonlat = [2.20, 48.48];
				var xy = zingchart.maps.getXY("map", lonlat);
				zcdocs.demos.dump('getxy', xy);
				zingchart.exec("demo-chart", "addobject", {
					type : 'shape',
					data : {
						x : xy[0],
						y : xy[1],
						type : "circle",
						size : 5,
						backgroundColor : '#f90',
						label : {
							text : "Paris",
							offsetY : -15
						}
					}
				});
			});
		},
		console : 1,
		code : ["$(\"#demo1\").bind('click', function() {","	// coordinates for Paris","	var lonlat = [2.20, 48.48];","	var xy = zingchart.maps.getXY(\"map\", lonlat);","	zcdocs.demos.dump('getxy', xy);","	zingchart.exec(\"demo-chart\", \"addobject\", {","		type : 'shape',","		data : {","			x : xy[0],","			y : xy[1],","			type : \"circle\",","			size : 5,","			backgroundColor : '#f90',","			label : {","				text : \"Paris\",","				offsetY : -15","			}","		}","	});","});"],
		clean : function() {
			$("#demo1").unbind('click');
		}
	});
	zcdocs.demos.items.push({
		id : "maps-groups",
		topic : "maps > options > groups",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410,
			    		"groups":["EUROPE"]
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","world.countries","groups"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-ignore",
		topic : "maps > options > ignore",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.continents",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410,
			    		"ignore":["ANTARCTICA","AUSTRALIA","SOUTHAMERICA","AFRICA"]
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","world.continents","ignore"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-items",
		topic : "maps > options > items",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"usa",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410,
			    		"items":["TX","OK","AR","LA"]
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","usa","items"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-rou",
		topic : "maps > rou",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"rou",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","rou"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-scale",
		topic : "maps > options > scale",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"usa",
			    		"x":0,
			    		"y":0,
			    		"scale":true,
			    		"width":480,
			    		"height":410
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","usa","scale"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-style-hover-state",
		topic : "maps > options > style > hover-state",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410,
			    		"groups":["EUROPE"],
				    	"style":{
				    		"hover-state":{
				    			"background-color":"#f90 #ff0",
				    			"border-color":"#f00"
				    		}
				    	}
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","world.countries","hover-state"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-style-items-connector",
		topic : "maps > options > style > items > connector",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410,
			    		"groups":["EUROPE"],
			    		"style":{
					    	"items":{
					    		"NLD":{
					    			"label":{
					    				"background-color":"#f00",
					    				"color":"#fff",
					    				"bold":1
					    			},
				    				"connector":{
				    					"points":[
				    						[5.27, 52.77],
				    						[3.27, 54.77],
				    						[3.27, 55.77]
				    					],
				    					"line-width":4,
				    					"line-color":"#0f0",
				    					"anchor":"b"
				    				}
					    		}
					    	}
				    	}
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","world.countries","items","connector"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-style-items",
		topic : "maps > options > style > items",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410,
			    		"groups":["EUROPE"],
			    		"style":{
					    	"items":{
					    		"FRA":{
					    			"label":{
					    				"color":"#f00",
					    				"bold":1
					    			},
					    			"background-color":"#f90 #ff0",
					    			"tooltip":{
					    				"gradient-colors":"#f00 #0f0 #00f",
					    				"gradient-stops":"0.1 0.5 0.9",
					    				"text":"Custom text for item FRA"
					    			}
					    		},
					    		"ESP":{
					    			"label":{
					    				"color":"#0f0",
					    				"italic":1
					    			},
					    			"background-color":"#90f #f0f",
					    			"tooltip":{
					    				"border-width":4,
					    				"border-color":"#f00",
					    				"text":"Custom text for item ESP"
					    			}
					    		}
					    	}
				    	}
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","world.countries","items"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-style-label",
		topic : "maps > options > style > label",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410,
			    		"groups":["EUROPE"],
				    	"style":{
				    		"label":{
				    			"color":"#f00",
				    			"font-size":10
				    		}
				    	}
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","world.countries","label"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-style-tooltip",
		topic : "maps > options > style > tooltip",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410,
			    		"groups":["EUROPE"],
				    	"style":{
				    		"tooltip":{
				    			"background-color":"#f90 #ff0",
				    			"border-color":"#f00"
				    		}
				    	}
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","world.countries","tooltip"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-usa",
		topic : "maps > usa",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"usa",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","usa"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-world-continents",
		topic : "maps > world continents",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.continents",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","world.continents"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "maps-world-countries",
		topic : "maps > world countries",
		json : {
		    "shapes":[
		    	{
			    	"type":"zingchart.maps",
			    	"options":{
			    		"id":"map",
			    		"name":"world.countries",
			    		"x":0,
			    		"y":0,
			    		"width":480,
			    		"height":410,
				    	"style":{
				    		"label":{
				    			"visible":false
				    		}
				    	}
			    	}
		    	}
			]
		},
		tokens : ["zingchart.maps","world.countries"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "pareto-line-plot",
		topic : "pareto > options > line-plot",
		json : {
		"graphset":[
		    {
		        "type":"pareto",
		        "options":{
		        	"line-plot":{
		        		"line-color":"#f00",
		        		"line-width":4,
		        		"value-box":{
		        			"color":"#ff0",
		        			"background-color":"#333"
		        		}
		        	}
		        },
		        "scale-x":{
		            "values":["Cross Platform","Runtime","GUI","Functional"],
		            "items-overlap":true,
		            "max-items":9999
		        },
		        "series":[
		            {
		                "values":[235000,125100,464200,434500],
		                "border-width":2,
		                "border-color":"#fff",
		                "shadow":1,
		                "shadow-distance":4,
		                "hover-state":{
		                    "visible":false
		                }
		            }
		        ]
		    }
		]
		},
		tokens : ["pareto","line-plot"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "pareto-scale-y-2",
		topic : "pareto > options > scale-y-2",
		json : {
		"graphset":[
		    {
		        "type":"pareto",
		        "options":{
		        	"scale-y-2":{
		        		"line-color":"#f00",
		        		"tick":{
		        			"line-color":"#f00"
		        		},
		        		"item":{
		        			"color":"#fff",
		        			"background-color":"#903"
		        		},
		        		"label":{
		        			"text":"Percentage"
		        		}
		        	}
		        },
		        "scale-x":{
		            "values":["Cross Platform","Runtime","GUI","Functional"],
		            "items-overlap":true,
		            "max-items":9999
		        },
		        "series":[
		            {
		                "values":[235000,125100,464200,434500],
		                "styles":[
		                	{
		                		"background-color":"#874c11"
		                	},
		                	{
		                		"background-color":"#cc3300"
		                	},
		                	{
		                		"background-color":"#6d6d22"
		                	},
		                	{
		                		"background-color":"#666697"
		                	}
		                ],
		                "border-width":2,
		                "border-color":"#fff",
		                "shadow":1,
		                "shadow-distance":4,
		                "hover-state":{
		                    "visible":false
		                }
		            }
		        ]
		    }
		]
		},
		tokens : ["pareto","scale-y-2"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-col-space",
		topic : "rankflow > options > col-space",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"col-space":5
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","col-space"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-color-type-color",
		topic : "rankflow > options > color-type > color",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"color-type":"color",
				"color":"#f90"
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","color-type","color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-color-type-palette",
		topic : "rankflow > options > color-type > palette",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"color-type":"palette",
				"palette":["#15252d","#768766","#e5db82","#bb9944","#bb6622","#b1200f","#342e3a"]
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","color-type","palette"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-color-type-random",
		topic : "rankflow > options > color-type > random",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"color-type":"random"
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","color-type","random"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-row-space",
		topic : "rankflow > options > row-space",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"row-space":0
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","row-space"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-sep-space",
		topic : "rankflow > options > sep-space",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"sep-space":10
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","sep-space"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-static",
		topic : "rankflow > options > static",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"static":true
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","static"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-style-flow",
		topic : "rankflow > options > style > flow",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"style":{
					"flow":{
						"border-color":"#c00",
						"border-width":1
					}
				}
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2,
					"style":{
						"flow":{
							"border-color":"#0c0",
							"border-width":4
						}
					}
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4,
			        "style":{
						"flow":{
							"gradient-stops":"0.1 0.4 0.6 0.9",
							"gradient-colors":"#00c #0f9 #f90 #90f"
						}
					}
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","flow"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-style-item-flow",
		topic : "rankflow > options > style > item-flow",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"style":{
					"item-flow":{
						"color":"#c00"
					}
				}
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2,
					"style":{
						"item-flow":{
							"color":"#0c0"
						}
					}
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4,
					"style":{
						"item-flow":{
							"color":"#00c"
						}
					}
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","item-flow"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-style-item-overall",
		topic : "rankflow > options > style > item-overall",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"style":{
					"item-overall":{
						"color":"#c00"
					}
				}
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2,
					"style":{
						"item-overall":{
							"color":"#0c0"
						}
					}
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4,
					"style":{
						"item-overall":{
							"color":"#00c"
						}
					}
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","item-overall"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-style-label-overall",
		topic : "rankflow > options > style > label-overall",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"],
			    "item":{
			    	"color":"#c00",
			    	"background-color":"#fff"
			    }
			},
			"options":{
				"style":{
					"label-overall":{
						"color":"#00c",
						"background-color":"#ff0",
						"text":"CUSTOM TEXT<br>HERE"
					}
				}
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","label-overall"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-style-rank",
		topic : "rankflow > options > style > rank-left,rank-right,rank-overall",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"style":{
					"rank-left":{
						"background-color":"#c00"
					},
					"rank-right":{
						"background-color":"#0c0"
					},
					"rank-overall":{
						"background-color":"#00c"
					}
				}
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","rank-left","rank-right","rank-overall"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "rankflow-style-tooltip",
		topic : "rankflow > options > style > tooltip",
		json : {
			"type":"rankflow",
			"title":{
				"text":"Airline Scorecard"
			},
			"plotarea":{
				"margin":"30 10 10 10"
			},
			"scale-x":{
			    "labels":[" <br>ON-TIME","CANCELED<br>FLIGHTS","BAGGAGE<br>HANDLING"],
			    "values":["ON-TIME","CANCELED FLIGHTS","BAGGAGE HANDLING"]
			},
			"options":{
				"style":{
					"tooltip":{
						"border-color":"#c00",
						"border-width":1,
						"text":"%text: %rank on %scale-value"
					}
				}
			},
			"series":[
			    {
			        "text":"Air West",
			        "ranks":[3,4,1],
			        "rank":1
			    },
			    {
			        "text":"Braniff",
			        "ranks":[1,1,5],
			        "rank":2,
					"style":{
						"tooltip":{
							"border-color":"#0c0",
							"border-width":4,
							"text":"%scale-value of %text<br>is ranked at %rank"
						}
					}
			    },
			    {
			        "text":"Capital",
			        "ranks":[6,2,6],
			        "rank":3
			    },
			    {
			        "text":"Eastern",
			        "ranks":[9,8,2],
			        "rank":4,
			        "style":{
						"flow":{
							"gradient-stops":"0.1 0.4 0.6 0.9",
							"gradient-colors":"#00c #0f9 #f90 #90f"
						}
					}
			    },
			    {
			        "text":"Galaxy",
			        "ranks":[4,5,3],
			        "rank":5
			    },
			    {
			        "text":"PSA",
			        "ranks":[5,3,4],
			        "rank":6
			    },
			    {
			        "text":"Pan Am",
			        "ranks":[2,6,7],
			        "rank":7
			    },
			    {
			        "text":"Sunbird",
			        "ranks":[7,7,9],
			        "rank":8
			    },
			    {
			        "text":"Western",
			        "ranks":[8,9,8],
			        "rank":9
			    }
			]
		},
		tokens : ["rankflow","tooltip"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "shapes-points",
		topic : "shapes > points",
		json : {
		    "type":"line",
		    "shapes":[
		    	{
		    		"type":"poly",
		    		"border-color":"#009",
		    		"background-color":"#f90",
		    		"border-width":2,
		    		"points":[
		    			[300,50],
		    			[400,50],
		    			[400,100],
		    			[380,100],
		    			[380,80],
		    			[320,80],
		    			[320,100],
		    			[300,100],
		    			[300,50]
		    		]
		    	},{
		    		"type":"line",
		    		"line-color":"#900",
		    		"line-width":6,
		    		"points":[
		    			[400,150],
		    			[450,100],
		    			[400,200]
		    		]
		    	}
		    ],
		    "series":[
		        {
		            "values":[11,26,7,44,11,42,13,21,15,33]
		        }
		    ]
		},
		tokens : ["points"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-alpha",
		topic : "treemap > options > alpha-aspect,min-alpha",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"alpha-aspect":true,
					"min-alpha":0.2
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","alpha-aspect","min-alpha"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-aspect-type-palette",
		topic : "treemap > options > aspect-type",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"aspect-type":"palette"
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","aspect-type"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-aspect-type-random",
		topic : "treemap > options > aspect-type",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"aspect-type":"random"
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","aspect-type"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-aspect-type-transition",
		topic : "treemap > options > color-start,color-end",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"aspect-type":"transition",
					"color-start":"#c00",
					"color-end":"#300"
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","aspect-type","color-start","color-end"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-box",
		topic : "treemap > options > box",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"box" : {
						"border-color":"#000",
						"border-width":1,
						"border-radius":10,
						"padding":5,
						"background-color-1":"#333",
						"fill-angle":45,
						"font-size":12,
						"color":"#f90",
						"bold":true
					}
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","box"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-hover-state",
		topic : "treemap > options > hover-state",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"hover-state":{
						"border-color":"#f00",
						"border-width":2,
						"alpha":1,
						"background-color":"#333 #f90"
					}
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","hover-state"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-max-children",
		topic : "treemap > options > max-childs",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"max-children":[8,2,4]
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","max-childs"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-max-depth",
		topic : "treemap > options > max-depth",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"max-depth":2
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","max-depth"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-palette",
		topic : "treemap > options > palette",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"aspect-type":"palette",
					"palette":["#c98411", "#281300", "#991e00", "#470000", "#ff921f", "#feb950","#704700","#8a773c"]
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","aspect-type","palette"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-split-type-alternate",
		topic : "treemap > options > split-type",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"split-type":"alternate"
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","split-type"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-split-type-balanced",
		topic : "treemap > options > split-type",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"split-type":"balanced"
		        },
		        "series":[
		            {
		                "text":"North America",
		                "children":[
		                    {
		                        "text":"United States",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","split-type"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "treemap-tooltip",
		topic : "treemap > options > tooltip-box,tooltip-group",
		json : {
		"graphset":[
		    {
		        "type":"treemap",
		        "plotarea":{
		            "margin":0
		        },
		        "tooltip":{
		
		        },
		        "options":{
					"tooltip-box":{
						"text":"<b style='font-size:17px'>%text</b>\n \n<b>Value:</b> %value",
						"background-color":"#900",
						"text-align":"left"
					},
					"tooltip-group":{
						"text":"<b style='font-size:17px'>%text</b>\n \n<b>Value:</b> %value\n<b>Custom Data:</b> %data-custom",
						"background-color":"#090 0c0",
						"border-radius":10,
						"border-width":2,
						"text-align":"left"
					}
		        },
		        "series":[
		            {
		                "text":"North America",
		                "data-custom":"Males: 48%, Females: 52%",
		                "children":[
		                    {
		                        "text":"United States",
		                        "data-custom":"Males: 49%, Females: 51%",
		                        "children":[
		                            {
		                                "text":"Texas",
		                                "value":21
		                            },
		                            {
		                                "text":"California",
		                                "value":53
		                            },
		                            {
		                                "text":"Ohio",
		                                "value":12
		                            },
		                            {
		                                "text":"New York",
		                                "value":46
		                            },
		                            {
		                                "text":"Michigan",
		                                "value":39
		                            },
		                            {
		                                "text":"Alabama",
		                                "value":25
		                            }
		                        ]
		                    },
		                    {
		                        "text":"Canada",
		                        "value":113
		                    },
		                    {
		                        "text":"Mexic",
		                        "value":78
		                    }
		                ]
		            },
		            {
		                "text":"Europe",
		                "data-custom":"Males: 52%, Females: 48%",
		                "children":[
		                    {
		                        "text":"France",
		                        "value":42
		                    },
		                    {
		                        "text":"Spain",
		                        "value":28
		                    },
		                    {
		                        "text":"Switzerland",
		                        "value":13
		                    },
		                    {
		                        "text":"Germany",
		                        "value":56
		                    },
		                    {
		                        "text":"Cyprus",
		                        "value":7
		                    }
		                ]
		            },
		            {
		                "text":"Africa",
		                "data-custom":"Males: 55%, Females: 45%",
		                "children":[
		                    {
		                        "text":"Egypt",
		                        "value":22
		                    },
		                    {
		                        "text":"Congo",
		                        "value":38
		                    },
		                    {
		                        "text":"Lesotho",
		                        "value":9
		                    }
		                ]
		            },
		            {
		                "text":"Asia",
		                "data-custom":"Males: 43%, Females: 57%",
		                "children":[
		                    {
		                        "text":"India",
		                        "value":92
		                    },
		                    {
		                        "text":"China",
		                        "value":68
		                    },
		                    {
		                        "text":"Mongolia",
		                        "value":25
		                    }
		                ]
		            },
		            {
		                "text":"South America",
		                "data-custom":"Males: 47%, Females: 53%",
		                "children":[
		                    {
		                        "text":"Brazil",
		                        "value":42
		                    },
		                    {
		                        "text":"Argentina",
		                        "value":28
		                    },
		                    {
		                        "text":"Peru",
		                        "value":15
		                    },
		                    {
		                        "text":"Uruguay",
		                        "value":33
		                    }
		                ]
		            },
		            {
		                "text":"Australia(continent)",
		                "data-custom":"Males: 57%, Females: 43%",
		                "children":[
		                    {
		                        "text":"Australia(country)",
		                        "value":121
		                    },
		                    {
		                        "text":"New Zeeland",
		                        "value":24
		                    }
		                ]
		            }
		        ]
		    }
		]
		},
		tokens : ["treemap","tooltip-box","tooltip-group"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-aspect-flow-center",
		topic : "wordcloud > options > aspect",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"max-items":100,
					"min-length":4,
					"aspect":"flow-center"
		        }
		    }
		]
		},
		tokens : ["wordcloud","aspect","flow-center"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-aspect-flow-top",
		topic : "wordcloud > options > aspect",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"max-items":100,
					"min-length":4,
					"aspect":"flow-top"
		        }
		    }
		]
		},
		tokens : ["wordcloud","aspect","flow-top"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-aspect-spiral",
		topic : "wordcloud > options > aspect",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"max-items":100,
					"min-length":4,
					"aspect":"spiral"
		        }
		    }
		]
		},
		tokens : ["wordcloud","aspect","spiral"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-color-type-color",
		topic : "wordcloud > options > color-type",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"color-type":"color",
					"color":"#900"
		        }
		    }
		]
		},
		tokens : ["wordcloud","color-type","color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-color-type-palette",
		topic : "wordcloud > options > color-type",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"color-type":"palette"
		        }
		    }
		]
		},
		tokens : ["wordcloud","color-type","palette"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-color",
		topic : "wordcloud > options > aspect-type",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"aspect-type":"palette"
		        }
		    }
		]
		},
		tokens : ["wordcloud","aspect-type","color"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-font-size",
		topic : "wordcloud > options > min-font-size,max-font-size",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
		        	"max-items":30,
					"min-font-size":29,
					"max-font-size":51
		        }
		    }
		]
		},
		tokens : ["wordcloud","min-font-size","max-font-size"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-ignore",
		topic : "wordcloud > options > ignore",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"ignore":["in","of","by","an","on","it","to","the","and"]
		        }
		    }
		]
		},
		tokens : ["wordcloud","ignore"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-max-items",
		topic : "wordcloud > options > max-items",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
		        	"max-items":20,
					"ignore":["in","of","by","an","on","it","to","the","and"]
		        }
		    }
		]
		},
		tokens : ["wordcloud","max-items"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-min-length",
		topic : "wordcloud > options > min-length",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"max-items":50,
		        	"min-length":6
		        }
		    }
		]
		},
		tokens : ["wordcloud","min-length"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-palette",
		topic : "wordcloud > options > palette",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"min-length":4,
					"color-type":"palette",
					"palette":["#15252d","#768766","#e5db82","#bb9944","#bb6622","#b1200f","#342e3a"]
		        }
		    }
		]
		},
		tokens : ["wordcloud","palette"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-rotate",
		topic : "wordcloud > options > rotate",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"min-length":4,
					"rotate":true
		        }
		    }
		]
		},
		tokens : ["wordcloud","rotate"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-step-angle-radius",
		topic : "wordcloud > options > step-angle,step-radius",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"max-font-size":15,
					"min-length":4,
					"max-items":100,
					"step-angle":45,
					"step-radius":50
		        }
		    }
		]
		},
		tokens : ["wordcloud","step-angle","step-radius"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-style-hover-state",
		topic : "wordcloud > options > hover-state",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"max-font-size":21,
					"style":{
						"hover-state":{
							"color":"#f00",
							"background-color":"#f90"
						}
					}
		        }
		    }
		]
		},
		tokens : ["wordcloud","hover-state"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-style-tooltip",
		topic : "wordcloud > options > tooltip",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"style":{
						"tooltip":{
							"visible":true,
							"color":"#fff",
							"background-color":"#900",
							"border-color":"#f90",
							"border-width":2,
							"border-radius":10,
							"text":"Item [ %text ] was found %hits times"
						}
					}
		        }
		    }
		]
		},
		tokens : ["wordcloud","tooltip"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-style",
		topic : "wordcloud > options > style",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"style":{
						"italic":true,
						"border-color":"#900",
						"border-width":1
					}
		        }
		    }
		]
		},
		tokens : ["wordcloud","style"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-text",
		topic : "wordcloud > options > text",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]"
		        }
		    }
		]
		},
		tokens : ["wordcloud","text"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});
	zcdocs.demos.items.push({
		id : "wordcloud-token",
		topic : "wordcloud > options > token",
		json : {
		"graphset":[
		    {
		        "type":"wordcloud",
		        "options":{
					"text":"Marillion From Wikipedia, the free encyclopedia Marillion  Marillion, 2009. L-R: Ian Mosley, Pete Trewavas, Steve Hogarth, Mark Kelly, and Steve Rothery. Background information Origin Aylesbury, Buckinghamshire, England Genres Progressive rock, neo-progressive rock, alternative rock, pop rock, acoustic rock Years active 1979-present Labels EMI, Capitol, Castle, Racket Records (Intact), IRS, Caroline, Sanctuary, Velvel/Koch, Edel, Liberty, Pony Canyon Associated acts Fish, Steve Hogarth, How We Live, the Europeans, the Wishing Tree, Arena, Iris, Ian Mosley & Ben Castle, Transatlantic, Kino, Edison's Children Website www.marillion.com Members Steve Rothery Mark Kelly Pete Trewavas Ian Mosley Steve Hogarth Past members Mick Pointer Brian Jelliman Doug Irvine Fish Diz Minnett Andy Ward John Marter Jonathan Mover Marillion are a British rock band, formed in Aylesbury, Buckinghamshire, England, in 1979. Their recorded studio output is composed of sixteen albums generally regarded in two distinct eras, delineated by the departure of original vocalist and frontman Fish in late 1988, and the subsequent arrival of replacement Steve Hogarth in early 1989. While the Fish era was more commercially successful, the band has enjoyed Top 10 albums and singles in the UK under the leadership of both singers. the band continue to tour internationally, and were ranked 38th in Classic Rock's 50 Best Live Acts of All Time in 2008.[1] Contents  [hide]  1 Line-up and sound changes 2 History 2.1 the Fish era 2.1.1 Formation and early years (1979-1982) 2.1.2 Script for a Jester's Tear and Fugazi (1983-1984) 2.1.3 Misplaced Childhood and international success (1985) 2.1.4 Clutching at Straws and the departure of Fish (1986-1988) 2.2 the Steve Hogarth era 2.2.1 Seasons End and Holidays in Eden (1989-1991) 2.2.2 Brave, Afraid of Sunlight and split with EMI (1992-1995) 2.2.3 This Strange Engine, Radiation and marillion.com (1996-1999) 2.2.4 Anoraknophobia and Marbles (2000-2006) 2.2.5 Somewhere Else and Happiness is the Road (2007-2008) 2.2.6 Less is More and Sounds That Can't Be Made 3 Marillion in the media 4 Members 5 Discography 5.1 Studio albums 6 References 7 External links [edit]Line-up and sound changes  the core line-up[2] of Steve Rothery (lead guitar, and the sole 'pre-Fish' original member), Pete Trewavas (bass), Mark Kelly (keyboards) and Ian Mosley (drums) has been unchanged since 1984. the band has enjoyed critical[3] and commercial success with a string of UK Top Ten hits spanning their career, an estimated fifteen million total worldwide album sales and even an entry[4] into the Guinness Book of World Records. Marillion's music has changed stylistically throughout their career. the band themselves stated that each new album tends to represent a reaction to the preceding one, and for this reason their output is difficult to 'pigeonhole'. Their original sound (with Fish on vocals) is best described as guitar and keyboard led progressive rock or neo-prog, and would be sometimes compared with Gabriel-era Genesis.[5][6] More recently, their sound has been compared, on successive albums, to that of Radiohead, Massive Attack, Keane, Crowded House, the Blue Nile and Talk Talk, although not consistently comparable sonically with any of these acts. the band themselves in 2007, tongue-in-cheek, described their own output merely as: Songs about Death and Water since 1979... Marillion are widely considered within the industry[7] to have been one of the first mainstream acts to have fully recognised and tapped the potential for commercial musicians to interact with their fans via the Internet circa 1996, and are nowadays often characterised as a rock & roll 'Web Cottage Industry'.[8] the history of the band's use of the internet is described by Michael Lewis in the book Next: the Future Just Happened as an example of how the internet is shifting power away from established elites, such as record producers. the band are also renowned for having an extremely dedicated following[7] (often self-termed 'Freaks') with some fans regularly travelling significant distances to attend single gigs, driven in large part by the close fan base involvement which the band cultivate via their website, podcasts, biennial conventions[9] and regular fanclub[10] publications. [edit]History  [edit]The Fish era [edit]Formation and early years (1979-1982) Marillion was formed in 1979 as Silmarillion, after J.R.R. Tolkien's book the Silmarillion, by Mick Pointer, Steve Rothery, and others. They played their first gig at Berkhamsted Civic Centre, Hertfordshire, on 1 March 1980.[11] the band name was shortened to Marillion in 1981 to avoid potential copyright conflicts[12] at the same time as Fish and bassist Diz Minnett joined after an audition at Leyland Farm Studios in Buckinghamshire on 2 January 1981. Rothery and keyboardist Brian Jelliman completed the first line-up; the first gig with this line-up was at the Red Lion Pub in Bicester, Oxfordshire, on 14 March 1981. By the end of 1981, Kelly had replaced Jelliman, with Trewavas replacing Minnett in 1982. the early works of Marillion contained Fish's poetic and introspective lyrics melded with a complex and subtle musical tapestry to create a sound that reflected the band's influences, notably Queen, early Genesis, Pink Floyd, Van der Graaf Generator, Rush (specifically from the late 1970s), and Yes. Marillion's first recording was a demo tape produced by Les Payne in July 1981 that included early versions of He Knows You Know, Garden Party, and Charting the Single. the group attracted attention with a three-track session for the Friday Rock Show (early versions of the Web, Three Boats Down from the Candy, and Forgotten Sons) and were subsequently signed by EMI. They released their first single, Market Square Heroes, in 1982, with the epic song Grendel on the B-side of the 12 version. Following the single, the band released their first full-length album in 1983. [edit]Script for a Jester's Tear and Fugazi (1983-1984) the music on their debut album, Script for a Jester's Tear, was born out of the intensive gigging of the previous years. Although it had some progressive rock stylings, it also had a darker edge, suggested by the bedsit squalour on the album's cover. During the tour to promote Script for a Jester's Tear, Mick Pointer left the band. the second album, Fugazi, built upon the success of the first album with a more electronic sound and produced the single 'Assassing', although the band encountered numerous production problems.[4] Marillion then released their first live album, Real to Reel, in November 1984, featuring songs from Fugazi and Script for a Jester's Tear, as well as 'Cinderella Search' (B-side to 'Assassing'), recorded in March and July 1984. [edit]Misplaced Childhood and international success (1985) Marillion with Fish (1986) Their third and commercially most successful studio album was Misplaced Childhood. With the blessing of their record company, the band was free to depart stylistically from their previous albums, in the process developing a more mainstream sound. the lead single from the album, Kayleigh, received major promotion by EMI and gained heavy rotation on BBC Radio 1 and Independent Local Radio stations as well as television appearances, bringing the band to the attention of a much wider audience. the band were able to shoGraphase their ability on the album to juxtapose pert pop ballads (Kayleigh, charting at No. 2 in the United Kingdom, behind charity fundraiser You'll Never Walk Alone by the Crowd, and Lavender, which charted at #5) with longer song cycles of lost youth, first love, drug abuse, drink, prostitution and, ultimately, rebirth and redemption, all inspired by Fish's life experiences. Following the exposure given to Kayleigh and its subsequent chart success, the album went to No. 1 in the United Kingdom, knocking Bryan Ferry off the top spot and holding off a challenge from Sting, who released his first solo album in the same week. the album came sixth in Kerrang! magazine's Albums Of the Year in 1985. Kayleigh also gave Marillion its sole entry on the Billboard Hot 100, reaching #74. In the summer of 1986, the band played to their biggest ever audience as special guests to Queen at a festival in Germany attended by a crowd of 150,000 people. [edit]Clutching at Straws and the departure of Fish (1986-1988) the fourth studio album, Clutching at Straws, shed some of its predecessor's pop stylings and retreated into a darker exploration of excess, alcoholism, and life on the road, representing the strains of constant touring that would result in the departure of Fish to pursue a solo career. It did continue the group's commercial success, however; lead single Incommunicado charted at No. 6 in the UK charts gaining the band an appearance on 'Top of the Pops'. Fish has also stated in interviews since that he believes this was the best album he made with the band.[13] the album came sixth in Kerrang! magazine's Albums Of the Year in 1987. the loss of the larger-than-life Fish left a hole that would be difficult to fill. Fish explained his reasons for leaving in an interview in 2003: By 1987 we were over-playing live because the manager was on 20 per cent of the gross. He was making a fantastic amount of money while we were working our asses off. Then I found a bit of paper proposing an American tour. At the end of the day the band would have needed a 14,000 loan from EMI as tour support to do it. That was when I knew that, if I stayed with the band, I'd probably end up a raging alcoholic and be found overdosed and dying in a big house in Oxford with Irish wolfhounds at the bottom of my bed.[14] Giving the band a choice to continue with either him or the manager, the band sided with the manager and Fish left for a solo career. His last live performance with the band was at Craigtoun Country Park on 23 July 1988.[15] After lengthy legal battles, informal contact between Fish and the other four band members apparently did not resume until 1999; Fish would later disclose in the liner notes to the 2-CD reiussue of Clutching at Straws that he and his former bandmates had met up and discussed the demise of the band and renewed their friendship, and had come to the consensus that an excessive touring schedule and too much pressure from the band's management led to the rift. Although reportedly now on good personal terms, both camps had always made it very clear that the oft-speculated-upon reunion would never happen. However, when Fish headlined the 'Hobble on the Cobbles' free concert in Aylesbury's Market Square on 26 August 2007, the attraction of playing their debut single in its spiritual home proved strong enough to overcome any lingering bad feeling between the former band members, and Kelly, Mosley, Rothery, and Trewavas replaced Fish's backing band for an emotional encore of 'Market Square Heroes'. In a press interview following the event, Fish denied this would lead to a full reunion, saying that: Hogarth does a great job with the band. We forged different paths over the 19 years.[16] [edit]The Steve Hogarth era [edit]Seasons End and Holidays in Eden (1989-1991) After the split, the band found Steve Hogarth, the former keyboardist and sometime vocalist of the Europeans. Hogarth stepped into a difficult situation, as the band had already recorded some demos of the next studio album, which eventually would have become Seasons End. Hogarth was a significant contrast with Fish, coming from a New Wave musical background instead of progressive rock. He also had never owned a Marillion album before joining the band.[17] After Fish left the group (taking his lyrics with him), Hogarth set to work crafting new lyrics to existing songs with lyricist and author John Helmer. the demo sessions of the songs from Seasons End with Fish vocals and lyrics can be found on the bonus disc of the remastered version of Clutching at Straws, while the lyrics found their way into various Fish solo albums such as his first solo album, Vigil In a Wilderness of Mirrors, some snippets on his second, Internal Exile and even a line or two found its way to his third album, Suits. Hogarth's second album with the band, Holidays In Eden, was the first he wrote in partnership with the band, and includes the song Dry Land which Hogarth had written and recorded in a previous project with the band How We Live. As quoted from Steve Hogarth, Holidays in Eden was to become Marillion's 'pop'est album ever, and was greeted with delight by many, and dismay by some of the hardcore fans.[18] Despite its pop stylings, the album failed to crossover beyond the band's existing fanbase and produced no major hit singles. [edit]Brave, Afraid of Sunlight and split with EMI (1992-1995) Holidays in Eden was followed by Brave, a dark and richly complex concept album that took the band 18 months to release. the album also marked the start of the band's longtime relationship with producer Dave Meegan. While critically acclaimed, the album received little promotion from EMI and did poorly commercially. An independent film based on the album, which featured the band, was also released. the next album, Afraid Of Sunlight, would be the band's last album with record label EMI. Once again, it received little promotion and no mainstream radio airplay, and its sales were disappointing for the band. Despite this, it was one of their most critically acclaimed albums and was included in Q's 50 Best Albums of 1995.[19] One track of note on the album is Out Of This World, a song about Donald Campbell, who died while trying to set a speed record on water. the song inspired an effort to recover both Campbell's body and the Bluebird K7, the boat which Campbell crashed in, from the water.[20] the recovery was finally undertaken in 2001, and both Steve Hogarth and Steve Rothery were invited.[21] In 1998, Steve Hogarth claimed this was the best album he had made with the band.[22] [edit]This Strange Engine, Radiation and marillion.com (1996-1999) What followed was a string of albums and events that saw Marillion struggling to find their place in the music business. This Strange Engine was released in 1997 with little promotion from their new label Castle Records, and the band could not afford to make tour stops in the United States. Luckily, their dedicated US fan base decided to solve the problem by raising some $60,000 themselves online to give to the band to come to the US.[23] the band's loyal fanbase (combined with the Internet) would eventually become vital to the band's existence. the band's tenth album Radiation saw the band taking a different approach and was received by fans with mixed reactions.[6] marillion.com was released the following year and showed some progression in the new direction. the band were still unhappy with their record label situation. As Steve Hogarth explained: We'd come to the end of our record deal and there were various indie labels interested in us. But we didn't feel comfortable with any of them. We're a band with a big fanbase, but the problem is that, as a result, no-one has an incentive to market us. Record labels know they could spend a fiver on promoting our album and our fans would still go and buy it if they had to find it under a stone. And we knew what would happen if we signed to an indie label. They'd do nothing, sell the album to the fanbase and put the money in the bank.[24] [edit]Anoraknophobia and Marbles (2000-2006) the band decided that they would try a radical experiment by asking their fans if they would help fund the recording of the next album by pre-ordering it before recording even started. the result was over 12,000 pre-orders which raised enough money to record and release Anoraknophobia in 2001.[25] the band was able to strike a deal with EMI to also help distribute the album. This allowed Marillion to retain all the rights to their music while enjoying commercial distribution. By this time the band had also parted company with their long-time manager, saving 20 per cent of the band's income. the success of Anoraknophobia allowed the band to start recording their next album, but they decided to leverage their fanbase once again to help raise money towards marketing and promotion of a new album. the band put up the album for pre-order in mid-production. This time fans responded by pre-ordering 18,000 copies.[26] Marbles was released in 2004 with a 2-CD version that is only available at Marillion's website - kind of a 'thank-you' gesture to the over 18,000 fans who pre-ordered it, and as even a further thanks to the fans, their names were credited in the sleeve notes (this 'thank you' to the fans also occurred with the previous album, Anoraknophobia). Marillion in 2007, left to right: Steve Rothery, Steve Hogarth, Pete Trewavas (front row), Mark Kelly, Ian Mosley (back row) the band's management organised the biggest promotional schedule since they had left EMI and Steve Hogarth secured interviews with prominent broadcasters on BBC Radio, including Matthew Wright, Bob Harris, Stuart Maconie, Simon Mayo and Mark Lawson. Marbles also became the band's most critically acclaimed album since Afraid of Sunlight, prompting many positive reviews in the press.[27][28][29][30][31][32][33] the band released You're Gone as the lead single from the album. Aware that the song was unlikely to gain much mainstream radio airplay, they released it in three separate formats and encouraged fans to buy a copy of each format to get it into the UK top ten. the single reached No. 7, the first time a Marillion song had reached the UK top ten since Incommunicado in 1987 and the band's first chart hit since Beautiful in 1995. the second single from the album, Don't Hurt Yourself, reached #16. Following this, they released a download-only single, the Damage (live), recorded at the band's sell-out gig at the London Astoria. It was the highest new entry in the new UK download chart at number 2.[citation needed] All of this succeeded in putting the band back in the public consciousness, making the campaign a success. Marillion continued to tour throughout 2005 playing several summer festivals and embarking on acoustic tours of both Europe and the United States, followed up by the Not Quite Christmas Tour of Europe throughout the end of 2005. A new DVD, Colours and Sound, was released in Feb 2006, documenting the creation, promotion, release, and subsequent European tour in support of the album Marbles. [edit]Somewhere Else and Happiness is the Road (2007-2008) April 2007 saw Marillion release their fourteenth studio album Somewhere Else, their first album in 10 years to make the UK Top #30. the success of the album was further underscored by that of the download-only single See it Like a Baby, making UK No. 45 (March 2007) and the traditional CD release of Thankyou Whoever You Are / Most Toys, which made UK#15 and No. 6 in Holland during June 2007. In July 2008 the band posted a contest for fans to create a music video for the soon-to-be released single Whatever is Wrong with You, and post it on YouTube. the winner would win 5,000.[34][35] Happiness Is the Road, released in October 2008, again featured a pre-order deluxe edition with a list of the fans who bought in advance, and a more straightforward regular release. It is another double album, with one disc based around a concept and the second containing the other songs that aren't part of the theme. Before the album's release, on 9 September 2008, Marillion achieved a world first[citation needed] by pre-releasing their own album via P2P networks themselves. Upon attempting to play the downloaded files, users were shown a video from the band explaining why they had taken this route. Downloaders were then able to opt to purchase the album at a user-defined price or select to receive DRM-free files for free, in exchange for an email address. the band explained that although they do not support piracy, they realised their music would inevitably be distributed online anyway, and wanted to attempt to engage with p2p users and make the best of the situation.[36] [edit]Less is More and Sounds That Can't Be Made the band's most recent studio album (2 October 2009) is an acoustic album featuring new arrangements of previously released tracks (except one, the new track: 'It's Not Your Fault') entitled Less Is More. Their seventeenth studio album will be titled Sounds That Can't Be Made and is scheduled for release in September 2012, and is available to pre-order on the marillion.com website. Parts of the album were recorded at Peter Gabriel's Real World Studios in 2011. [edit]Marillion in the media  By their own admission, the band have never been fashionable in the eyes of the media. On the subject of joining the band, Steve Hogarth once said: At about the same time, Matt Johnson of the The asked me to play piano on his tour. I always say I had to make a choice between the most hip band in the world, and the least. In the same interview, he claimed: We're just tired of the opinions of people who haven't heard anything we've done in ten years. A lot of what's spread about this band is laughable.[17] Much of the band's enduring and unfashionable reputation stems from their emergence in the early 1980s as the most commercially successful band of the neo-progressive rock movement, an unexpected revival of the progressive rock musical style that had fallen out of critical favour in the mid-1970s. Some early critics were quick to dismiss the band as clones of Peter Gabriel-era Genesis due to musical similarities, such as their extended songs, a prominent and Mellotron-influenced keyboard sound, vivid and fantastical lyrics and the equally vivid and fantastical artwork by Mark Wilkinson used for the sleeves of their albums and singles. Lead singer Fish was also often compared with Gabriel due to his early vocal style and theatrical stage performances, which in the early years often included wearing face paint. In fact, Marillion's influences were more diverse than that. Fish was heavily influenced by Peter Hammill, two of guitarist Steve Rothery's biggest influences were David Gilmour and Andrew Latimer, keyboard player Mark Kelly's biggest inspiration was Rick Wakeman, Pete Trewavas especially loved Paul McCartney's bass lines and Mick Pointer was fond of Neil Peart's drumming. As Jonh Wilde summarised in Melody Maker in 1989: At the end of a strange year for pop music, Marillion appeared in November 1982 with Market Square Heroes. There were many strange things about 1982, but Marillion were the strangest of them all. For six years, they stood out of time. Marillion were the unhippest group going. As punk was becoming a distant echo, they appeared with a sound and an attitude that gazed back longingly to the age of Seventies pomp. When compared to Yes, Genesis and ELP, they would take it as a compliment. the Eighties have seen some odd phenomena. But none quite as odd as Marillion. Along the way, as if by glorious fluke, they turned out some singles that everybody quietly liked - Garden Party, Punch and Judy and Incommunicado. By this time, Marillion did not need the support of the hip-conscious. They were massive. Perhaps the oddest thing about Marillion was that they became one of the biggest groups of the decade. They might have been an anomaly but they were monstrously effective.[37] the band's unfashionable reputation and image problem has often been mentioned in the media, even in otherwise positive reviews. In Q in 1987, David Hepworth claimed: Marillion may represent the inelegant, unglamorous, public bar end of the current Rock Renaissance but they are no less part of it for that. Clutching at Straws suggests that they may be finally coming in from the cold.[38] In the same magazine in 1995, Dave Henderson wrote: It's not yet possible to be sacked for showing an affinity for Marillion, but has there ever been a band with a larger stigma attached? He also claimed that if the album Afraid of Sunlight had been made by a new, no baggage-of-the-past combo, it would be greeted with open arms, hailed as virtual genius.[39] In Record Collector in 2002, Tim Jones claimed they were one of the most unfairly berated bands in Britain and one of its best live rock acts.[40] In 2004, Classic Rock's Jon Hotten wrote: That genre thing has been a bugbear of Marillion's, but it no longer seems relevant. What are Radiohead if not a progressive band? and claimed Marillion were making strong, singular music with the courage of their convictions, and we should treasure them more than we do.[29] In the Q & Mojo Classic Special Edition Pink Floyd & the Story of Prog Rock, an article on Marillion written by Mick Wall described them as 'probably the most misunderstood band in the world'.[41] In 2007, Stephen Dalton of the Times stated: 'The band have just released their 14th album, Somewhere Else, which is really rather good. Containing tracks that shimmer like Coldplay, ache like Radiohead and thunder like Muse, it is better than 80 per cent of this month's releases. But you are unlikely to hear Marillion on British radio, read about them in the music press or see them play a major festival. This is largely because Marillion have - how can we put this kindly? - an image problem. Their music is still perceived as bloated, bombastic mullet-haired prog-rock, even by people who have never heard it. In fairness, they did once release an album called Script for a Jester's Tear. But, come on, we all had bad hair days in the 1980s.[42] Despite publishing a very good review for their 1995 album Afraid Of Sunlight and including it in their 50 Best Albums of 1995, Q refused to interview the band or write a feature on them. Steve Hogarth later said: How can they say, this is an amazing record... no, we don't want to talk to you? It's hard to take when they say, here's a very average record... we'll put you on the front cover.[17] In 1999, DJ Simon Mayo commented on BBC Radio 1: Marillion ... where are they now? And who cares anyway? Fans objecting to the comment brought the station's computer system to a standstill with thousands of emails of complaint. Mayo subsequently apologised for his comment to keyboard player Mark Kelly when he phoned the show to take part in a quiz.[43] To accompany the release of Anoraknophobia in 2001, the band issued a press release asking critics to review the album in a manner that is both accurate and fair. So, our challenge to you is to firstly listen to the album. Then write a review without using any of the following words: Progressive rock, Genesis, Fish, heavy metal, dinosaurs, predictable, concept album. Because if you do, we'll know that you haven't listened to it.[43] Reviewing the band's appearance on BBC Two's the Future Just Happened in 2001, Gareth McLean of the Guardian described the band as once dodgy and now completely rubbish and their fans as slightly simple folks. He also dismissed the band's efforts to continue their career without a label by dealing directly with their fans on the Internet, claiming: One suspects that their decision occurred round about the time that the record industry decided to shun Marillion.[44] In an interview in 2000, Hogarth expressed regret about the band retaining their name after he joined: If we had known when I joined Marillion what we know now, we'd have changed the name and been a new band. It was a mistake to keep the name, because what it represented in the mid-Eighties is a millstone we now carry. If we'd changed it, I think we would have been better off. We would have been judged for our music. It's such a grave injustice that the media constantly calls us a 'dinosaur prog band'. They only say that out of ignorance because they haven't listened to anything we've done for the last 15 bloody years. If you hear anything we've done in the last five or six years, that description is totally irrelevant... It's a massive frustration that no-one will play our stuff. If we send our single to Radio 1 they say: 'Sorry, we don't play music by bands who are over so-many years old... and here's the new U2 single.' I suppose it's something everyone has to cope with - every band are remembered for their big hit single, irrespective of how much they change over the years. But you can only transcend that by continuing to have hits. It's Catch 22. However, Hogarth was still able to be optimistic: You know, at some stage, someone has to notice that we're doing interesting things. Someday someone will take a retrospective look at us and be surprised.[45] the band have been prepared to send up their unfashionable status, naming their 2001 album Anoraknophobia and printing T-shirts with the logo Marillion: Uncool as F*ck. In 2004, the band were denied an appearance on the BBC's flagship chart television show Top of the Pops, despite the band's single, You're Gone, becoming a No. 7 hit and the second highest new entry of the week. Following the renewed media interest in the band generated by the song, BBC presenter Jonathan Ross described the band as a prog-rock band that sing about goblins, to which Marillion's manager Lucy Jordache responded: Do you think I'd be going round with someone in a pointy hat? Guitarist Steve Rothery commented: We recorded Script for a Jester's Tear 22 years ago. I think that was when Ross had his own hair.'[46] Several bandmembers are currently active[when?] in UK music industry bodies - amongst them the FAC, whilst Mark Kelly was elected in November 2009 to both the Performer and Main Boards of the UK's PPL.[47]",
					"token":"character",
					"min-font-size":31,
					"max-font-size":91
		        }
		    }
		]
		},
		tokens : ["wordcloud","token"],
		html : null,
		js : null,
		console : 0,
		code : null,
		clean : function() {
			
		}
	});