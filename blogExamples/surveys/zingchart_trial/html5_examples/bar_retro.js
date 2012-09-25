var gdata = {
"graphset":[
    {
        "type":"bar",
        "alpha":1,
        "stacked":true,
        "background-image":"images/retro_bg.jpg",
        "plotarea":{
            "margin":"100px 40px 60px 60px"
        },
        "title":{
            "text":"TOP DOWNLOADED ARTIST",
            "font-family":"Trebuchet MS",
            "font-size":28,
            "font-color":"#93B7C5",
            "background-color":-1,
            "margin-top":15,
            "margin-right":15,
            "margin-bottom":10,
            "text-align":"right"
        },
        "scale-x":{
            "values":["Jan","Feb","Mar","Apr"],
            "line-color":"#307C70",
            "line-style":"solid",
            "line-width":"3px",
            "guide":{
                "line-color":"#ECC43B",
                "line-style":"dashed",
                "alpha":"1"
            },
            "tick":{
                "line-width":"3px",
                "line-color":"#307C70",
                "alpha":"1"
            },
            "item":{
                "font-size":"12px",
                "font-color":"#307C70",
                "font-weight":"bold",
                "font-family":"Trebuchet MS"
            },
            "minor-guide":{
                "visible":false
            }
        },
        "scale-y":{
            "line-width":"3px",
            "alpha":1,
            "line-color":"#307C70",
            "format":"%v",
            "line-style":"solid",
            "guide":{
                "line-color":"#ECC43B",
                "alpha":"1",
                "line-style":"dashed"
            },
            "tick":{
                "line-width":"3px",
                "line-color":"#307C70",
                "alpha":"1"
            },
            "item":{
                "font-size":"12px",
                "font-color":"#307C70",
                "font-weight":"bold",
                "font-family":"Trebuchet MS"
            },
            "minor-guide":{
                "visible":false
            }
        },
        "legend":{
            "layout":"1x4",
            "position":"55% 15%",
            "width":"400px",
            "height":"40px",
            "visible":true,
            "background-color":-1,
            "border-width":"0px",
            "item":{
                "font-family":"Trebuchet MS",
                "font-weight":"bold",
                "font-size":"11px",
                "font-color":"#307C70",
                "padding":"-2 2",
                "shadow":0
            }
        },
        "tooltip":{
            "visible":true,
            "font-family":"Trebuchet MS",
            "text-align":"left",
            "border-width":"2px",
            "border-color":"#ffffff",
            "padding":"10 10"
        },
        "plot":{
            "alpha":1,
            "animate":true,
            "tooltip-text":"Series text: %t<br>Value: %v",
            "speed":0.5,
            "effect":5
        },
        "series":[
            {
                "values":[43,38,30,33],
                "background-color":"#6FA3C1",
                "text":"Rihanna"
            },
            {
                "values":[33,23,21,13],
                "background-color":"#F79434",
                "text":"P!nk"
            },
            {
                "values":[11,15,16,22],
                "background-color":"#7A6652",
                "text":"Lady Gaga"
            },
            {
                "values":[8,5,10,8],
                "background-color":"#A2A500",
                "text":"Ke$ha"
            }
        ]
    }
]
}