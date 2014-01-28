var gdata = {
	"backgroundColor":"#9BC3FF #78A5E8",
	"tooltip":{
		borderRadius : 6,
        backgroundColor : "#fff",
        color : "#303030",
		borderWidth : 1,
		borderColor : "#909090",
        padding : 10
	},
    "shapes":[
    	{
	    	"type":"zingchart.maps",
	    	"options":{
	    		"id":"europe",
	    		"name":"world.countries",
	    		"items":["FRA","ITA","CHE","AUT","DEU","BEL","LUX"],
	    		"x":0,
	    		"y":0,
	    		"width":480,
	    		"height":550,
	    		"style":{
		    		"label":{
		    			"visible":false
		    		},
		    		"hoverState":{
		    			"visible":false
		    		}
		    	}
	    	}
    	},
    	{
    		"id":"paris",
    		"x":"2.20lon",
    		"y":"48.48lat",
    		"map":"europe",
    		"type":"circle",
    		"size":8,
    		"backgroundColor":"#f90",
    		"borderWidth":1,
    		"borderColor":"#900",
    		"label":{
    			"text":"Paris",
    			"offsetY":16
    		},
    		"tooltip":{
    			"text":"Paris/France"
    		}
    	},
    	{
    		"id":"rome",
    		"x":"12.48lon",
    		"y":"41.90lat",
    		"map":"europe",
    		"type":"star6",
    		"size":6,
    		"backgroundColor":"#f90",
    		"borderWidth":1,
    		"borderColor":"#900",
    		"label":{
    			"text":"Rome",
    			"offsetY":16
    		},
    		"tooltip":{
    			"text":"Rome/Italy"
    		}
    	},
    	{
    		"id":"berlin",
    		"x":"13.41lon",
    		"y":"52.52lat",
    		"map":"europe",
    		"type":"star4",
    		"size":7,
    		"backgroundColor":"#f90",
    		"borderWidth":1,
    		"borderColor":"#900",
    		"label":{
    			"text":"Berlin",
    			"offsetY":16
    		},
    		"tooltip":{
    			"text":"Berlin/Germany"
    		}
    	},
    	{
    		"id":"link1",
    		"map":"europe",
    		"type":"line",
    		"points":[
    			["2.20lon", "48.48lat"],
    			["12.48lon", "41.90lat"]
    		],
    		"lineWidth":2,
    		"lineColor":"#009",
    		"lineStyle":"dotted",
    		"tooltip":{
    			"text":"Link Paris->Rome"
    		}
    	},
    	{
    		"id":"link2",
    		"map":"europe",
    		"type":"line",
    		"points":[
    			["2.20lon", "48.48lat"],
    			["13.41lon", "52.52lat"]
    		],
    		"lineWidth":2,
    		"lineColor":"#009",
    		"lineStyle":"dotted",
    		"tooltip":{
    			"text":"Link Paris->Berlin"
    		}
    	},
    	{
    		"id":"area",
    		"map":"europe",
    		"type":"poly",
    		"points":[
    			["-0.36382lon", "44.2891lat"],
				["0.41851lon", "45.13099lat"],
				["3.64564lon", "45.3252lat"],
				["4.42798lon", "44.4186lat"],
				["2.6677lon", "43.9005lat"],
				["-0.36382lon", "44.2891lat"]
    		],
    		"borderWidth":2,
    		"borderColor":"#900",
    		"backgroundColor":"#c00",
    		"alpha":0.5,
    		"lineStyle":"dotted",
    		"label":{
    			"font-size":13,
    			"color":"#fff",
    			"text":"Hot!"
    		},
    		"tooltip":{
    			"text":"Area of France affected by high temperatures"
    		}
    	}
	]
}