// simpleSwitchCf11.java
import coldfusion.runtime.AttributeCollection;
import coldfusion.runtime.CFPage;
import coldfusion.runtime.CfJspPage;
import coldfusion.runtime.LocalScope;
import coldfusion.runtime.SwitchTable;
import coldfusion.runtime.Variable;
import coldfusion.runtime.VariableScope;
import coldfusion.util.FastHashtable;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;

public final class cfsimpleSwitch2ecfm1789124596 extends CFPage {
	private Variable RESULT;
	private static final FastHashtable __HTSWT_0;
	public static final Object metaData;

	static {
		__HTSWT_0 = new SwitchTable()
			.addStringCase("A", 0)
			.addStringCase("C", 2)
			.addStringCase("B", 1)
		;
		metaData = new AttributeCollection(new Object[0]);
	}

	protected final void bindPageVariables(VariableScope varscope, LocalScope locscope) {
		super.bindPageVariables(varscope, locscope);
		this.RESULT = bindPageVariable("RESULT", varscope, locscope);
	}

	public final Object getMetadata(){
		return metaData;
	}

	protected final Object runPage() {
		Object value;
		JspWriter out = this.pageContext.getOut();
		Tag parent = this.parent;
		bindImportPath("com.adobe.coldfusion.*");
		switch (CfJspPage.__caseValue(__HTSWT_0, _resolveAndAutoscalarize("URL", new String[] { "OPTION" }))) {
			case 0:
				this.RESULT.set("1");
			break;
			case 1:
				this.RESULT.set("2");
			break;
			case 2:
				this.RESULT.set("3");
			break;
			}
			return null;
		}
}
