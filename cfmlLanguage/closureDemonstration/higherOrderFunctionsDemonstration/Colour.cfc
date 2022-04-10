component {

    function init(id, maori, english) {
        this.id = arguments.id
        this.maori = arguments.maori
        this.english = arguments.english
    }

    function toString() {
        return serializeJson({id=this.id, maori=this.maori, english=this.english})
    }
}
