import testbox.system.BaseSpec
import org.group.app2.Something

component extends=BaseSpec {

    function run(){
        describe("Test I can instantiate fully-qualified vendor objects", () => {
            it("can create a org.group.app2.Something via import", () => {
                something = new Something()

                expect(something).toBeInstanceOf("org.group.app2.Something")
            })
        })
    }
}
