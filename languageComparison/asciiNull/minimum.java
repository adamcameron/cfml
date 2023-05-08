import coldfusion.runtime.AttributeCollection;
import coldfusion.runtime.CFPage;
import coldfusion.runtime.CfJspPage;
import coldfusion.runtime.LocalScope;
import coldfusion.runtime.Variable;
import coldfusion.runtime.VariableScope;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;

public final class cfminimum2ecfm41116811 extends CFPage {
	private Variable NUL;
	public static final Object metaData;

	static {
		metaData = new AttributeCollection(new Object[0]);
	}

	protected final void bindPageVariables(VariableScope varscope, LocalScope locscope){
		super.bindPageVariables(varscope, locscope);
		this.NUL = bindPageVariable("NUL", varscope, locscope);
	}

	public final Object getMetadata() {
		return metaData;
	}

	protected final Object runPage() {
		Object value;
		JspWriter out = this.pageContext.getOut();
		Tag parent = this.parent;
		bindImportPath("com.adobe.coldfusion.*");
		this.NUL.set("");
		return null;
	}
}