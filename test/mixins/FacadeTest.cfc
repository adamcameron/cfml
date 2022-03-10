import testbox.system.BaseSpec
import cfmlInDocker.miscellaneous.mixins.runtime.facade.*

component extends=BaseSpec {

    function run() {
        describe("Testing facade proof of concept", () => {
            it("tests unmodified setup", () => {
                model = new MyModel(new MyRepository(new MyDao()))

                results = model.getObjectsViaInjectedRepository()

                expect(results).toBe([
                    new Colour("whero"),
                    new Colour("kakariki"),
                    new Colour("kikorangi")
                ])
            })

            it("creates facades for methods", () => {
                model = new MyModel(new MyRepository(new MyDao()), new FacadeMapper())

                results = model.getObjectsViaFacade()

                expect(results).toBe([
                    new Colour("whero"),
                    new Colour("kakariki"),
                    new Colour("kikorangi")
                ])
            })

            it("remaps function names if the map specifies it", () => {
                model = new MyModel(new MyRepository(new MyDao()), new FacadeMapper())

                results = model.getSomeObjectsViaFacade(rows=2)

                expect(results).toBe([
                    new Colour("whero"),
                    new Colour("kakariki")
                ])
            })

            it("handles public/private method access on the mixed-in function", () => {
                model = new MyModel(new MyRepository(new MyDao()), new FacadeMapper())

                results = model.getOrderedObjects(orderBy="English")

                expect(results).toBe([
                    new Colour("kikorangi"),
                    new Colour("kakariki"),
                    new Colour("whero")
                ])
            })

            it("ignores access modifiers other than public / private (falling back to private)" , () => {
                model = new MyModel(new MyRepository(new MyDao()), new FacadeMapper())

                results = model.getEnglishObjectsViaFacade()

                expect(results).toBe([
                    new Colour("red"),
                    new Colour("green"),
                    new Colour("blue")
                ])

                expect(() => model.getEnglishObjects()).toThrow(type="Expression", regex="^.*MyModel.*has no\s+function with name.*getEnglishObjects.*$")
            })

            it("doesn't bind facade function to its original context if bind option is false", () => {
                model = new MyModel(new MyRepository(new MyDao()), new FacadeMapper())
                modelVariables = model.getVariables()

                expect(getMetadata(modelVariables.this)).toBe(getMetadata(model))
            })
        })
    }
}
