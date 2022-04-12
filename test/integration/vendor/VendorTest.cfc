import testbox.system.BaseSpec

component extends=BaseSpec {

    function run(){
        describe("Test I can instantiate fully-qualified vendor objects", () => {
            it("can create a com.corp.app1.Something", () => {
                something = new com.corp.app1.Something()

                expect(something).toBeInstanceOf("com.corp.app1.Something")
            })
            it("can create a org.group.app2.Something", () => {
                something = new org.group.app2.Something()

                expect(something).toBeInstanceOf("org.group.app2.Something")
            })
        })
    }
}
