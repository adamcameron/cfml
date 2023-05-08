<cfscript>
    messager = java {

        import javax.servlet.jsp.PageContext;

        public class Outputer {

            PageContext pageContext;

            public void output(String text) throws java.io.IOException {
                this.pageContext.getOut().print(text);
            }

            public void setPageContext(PageContext pageContext) {
                this.pageContext = pageContext;
            }
        }
    }

    messager.setPageContext(getPageContext())
    writeOutput("Before stuff added from Java<br>")
    messager.output("G'day Ray!<br>")
    writeOutput("After stuff added from Java<br>")

    writeDump(messager)
</cfscript>
