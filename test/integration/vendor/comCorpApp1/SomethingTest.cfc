import testbox.system.BaseSpec
import com.corp.app1.Something

component extends=BaseSpec {

    function run(){
        describe("Test I can instantiate fully-qualified vendor objects", () => {
            it("can create a com.corp.app1.Something via import", () => {
                something = new Something()

                expect(something).toBeInstanceOf("com.corp.app1.Something")
            })
        })
    }
}
