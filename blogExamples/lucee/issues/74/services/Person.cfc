// Person.cfc

component rest=true restPath="person"  {

    pageencoding "UTF-8";

    remote query function getAsXml(required numeric id restargsource="path") httpmethod="get" restpath="{id}" produces="text/xml" {
        return getData(id);
    }

    remote query function getAsJson(required numeric id restargsource="path") httpmethod="get" restpath="{id}" produces="application/json" {
        return getData(id);
    }
    
    private query function getData(required numeric id){
        return queryNew(
            "id,lastName,firstName",
            "Integer,Varchar,Varchar",
            [[#arguments.id#, "Chabal", "Sébastien"]]
        );
    }

}