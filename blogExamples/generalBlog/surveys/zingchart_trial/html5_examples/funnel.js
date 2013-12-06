var gdata = {
"graphset":[
    {
        "type":"vfunnel",
        "scale-x-2":{
            "values":["Process 1","Process 2","Process 3"]
        },
        "tooltip":{

        },
        "scale-y-2":{
            "values":["Step 1","Step 2","Step 3","Step 4","Step 5"],
            "item":{
                "offset-x":30
            }
        },
        "chart":{
            "margin":"60 80 10 40"
        },
        "plot":{
            "tooltip-text":"%v Actions",
            "scales":"scale-x-2,scale-y-2",
            "offset":30
        },
        "series":[
            {
                "values":[100,null,null],
                "entry":{
                    "values":[1,1,1],
                    "labels":["OP 1",null,null]
                }
            },
            {
                "values":[90,90,null],
                "entry":{
                    "values":[1,1,1],
                    "labels":["OP 2","TX",null]
                }
            },
            {
                "values":[75,80,70],
                "exit":{
                    "values":[null,1,null],
                    "labels":[null,"OP 3",null]
                }
            },
            {
                "values":[55,50,40]
            },
            {
                "values":[20,30,10],
                "exit":[
                    {
                        "values":[null,null,1],
                        "labels":[null,null,"OUT 1"]
                    },
                    {
                        "values":[null,null,1],
                        "labels":[null,null,"OUT 2"]
                    }
                ]
            }
        ]
    }
]
}