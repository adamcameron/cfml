<cfscript>
rainbow	= ["whero","karaka","kōwhai","kākāriki","kikorangi","tūāuri","papura"];
numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];
week = ["rāhina","rātū","rāapa","rāpare","rāmere","rāhoroi","rātapu"];

numbers = [
	one = "tahi",
	two = "rua",
	three = "toru",
	four = "wha",
	five = "rima",
	six = "ono",
	seven = "whitu",
	eight = "ware",
	nine = "iwa",
	ten = "tekau"
];

week = [
	monday = "Rāhina",
	tuesday = "Rātū",
	wednesday = "Rāapa",
	thursday = "Rāpare",
	friday = "Rāmere",
	saturday = "Rāhoroi",
	sunday = "Rātapu"
];



week = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"Monday","Rāhina"],
	[2,"Tuesday","Rātū"],
	[3,"Wednesday","Rāapa"],
	[4,"Thursday","Rāpare"],
	[5,"Friday","Rāmere"],
	[6,"Saturday","Rāhoroi"],
	[7,"Sunday","Rātapu"]
]);

numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"one","tahi"],
	[2,"two","rua"],
	[3,"three","toru"],
	[4,"four","wha"],
	[5,"five","rima"],
	[6,"six","ono"],
	[7,"seven","whitu"],
	[8,"eight","waru"],
	[9,"nine","iwa"],
	[10,"ten","tekau"]
])

colours = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"red","whero"],
	[2,"orange","karaka"],
	[3,"yellow","kōwhai"],
	[4,"green","kākāriki "],
	[5,"blue","kikorangi"],
	[6,"indigo","tūāuri"],
	[10,"violet","papura"]
]);

months = queryNew("id,mi,anglicised,en", "integer,varchar,varchar,varchar", [
	[1,"Pipiri","Hune","June"],
	[2,"Hōngongoi","Hūrae","July"],
	[3,"Here-turi-kōkā","Akuhata","August"],
	[4,"Mahuru","Hepetema","September"],
	[5,"Whiringa-ā-nuku","Oketopa","October"],
	[6,"Whiringa-ā-rangi","Noema","November"],
	[7,"Hakihea","Tihema","December"],
	[8,"Kohi-tātea","Hānuere","January"],
	[9,"Hui-tanguru","Pēpuere","February"],
	[10,"Poutū-te-rangi","Maehe","March"],
	[11,"Paenga-whāwhā","Āperira","April"],
	[12,"Haratua","Mei","May"]
]);


rainbow	= [
	red = "whero",
	orange = "karaka",
	yellow = "kōwhai",
	green = "kākāriki ",
	blue = "kikorangi",
	indigo = "tūāuri",
	violet = "papura"
];

numbers = [
	one = "tahi",
	two = "rua",
	three = "toru",
	four = "wha",
	five = "rima",
	six = "ono",
	seven = "whitu",
	eight = "waru",
	nine = "iwa",
	ten = "tekau"
];

numbers = [
    ["en" = "one", "mi" = "tahi"],
    ["en" = "two", "mi" = "rua"],
    ["en" = "three", "mi" = "toru"],
    ["en" = "four", "mi" = "wha"],
    ["en" = "five", "mi" = "rima"],
    ["en" = "six", "mi" = "ono"],
    ["en" = "seven", "mi" = "whitu"],
    ["en" = "eight", "mi" = "waru"],
    ["en" = "nine", "mi" = "iwa"],
    ["en" = "ten", "mi" = "tekau"]
]


week = [
	monday = "Rāhina",
	tuesday = "Rātū",
	wednesday = "Rāapa",
	thursday = "Rāpare",
	friday = "Rāmere",
	saturday = "Rāhoroi",
	sunday = "Rātapu"
];



</cfscript>

<cfquery>
CREATE TABLE `colours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `en` varchar(45) NOT NULL,
  `mi` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
	
INSERT INTO `colours` VALUES (1,'red','whero'),(2,'orange','karaka'),(3,'yellow','kōwhai'),(4,'green','kākāriki '),(5,'blue','kikorangi'),(6,'indigo','tūāuri'),(7,'purple','papura');


CREATE TABLE `numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `en` varchar(45) NOT NULL,
  `mi` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `numbers` VALUES (1,'one','tahi'),(2,'two','rua'),(3,'three','toru'),(4,'four','wha'),(5,'five','rima'),(6,'six','ono'),(7,'seven','whitu'),(8,'eight','waru'),(9,'nine','iwa'),(10,'ten','tekau');

CREATE TABLE `days` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `en` varchar(45) CHARACTER SET utf8 NOT NULL,
  `mi` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `days` VALUES (1,'Monday','Rāhina'),(2,'Tuesday','Rātū'),(3,'Wednesday','Rāapa'),(4,'Thursday','Rāpare'),(5,'Friday','Rāmere'),(6,'Saturday','Rāhoroi'),(7,'Sunday','Rātapu');

</cfquery>