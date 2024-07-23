import coldfusion.runtime.AttributeCollection;
import coldfusion.runtime.CFPage;
import coldfusion.runtime.Cast;
import coldfusion.runtime.CfJspPage;
import coldfusion.runtime.LocalScope;
import coldfusion.runtime.Variable;
import coldfusion.runtime.VariableScope;
import coldfusion.tagext.GenericTag;
import coldfusion.tagext.QueryLoop;
import coldfusion.tagext.io.OutputTag;
import java.io.Writer;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;

public final class cfdecomp2ecfm1942182290 extends CFPage {
	private Variable S;
	static final Class class$coldfusion$tagext$io$OutputTag;
	public static final Object metaData;

	static {
		class$coldfusion$tagext$io$OutputTag = Class.forName("coldfusion.tagext.io.OutputTag");
		metaData = new AttributeCollection(new Object[0]);
	}

	protected final void bindPageVariables(VariableScope varscope, LocalScope locscope)	{
		super.bindPageVariables(varscope, locscope);
		this.S = bindPageVariable("S", varscope, locscope);
	}

	public final Object getMetadata(){
		return metaData;
	}

	protected final Object runPage() {
		Throwable t8;
		Throwable t7;
		Object t6;
		int mode0;
		Object value;
		JspWriter out = this.pageContext.getOut();
		Tag parent = this.parent; bindImportPath("com.adobe.coldfusion.*");
		_whitespace(out, "\r\n");
		this.S.set("foo");
		_whitespace(out, "\r\n");
		OutputTag output0 = (OutputTag)_initTag(class$coldfusion$tagext$io$OutputTag, 0, parent);
		_setCurrentLineNo(3);
		output0.hasEndTag(true);
		try {
			if ((mode0 = output0.doStartTag()) != 0)
				do
					out.write(Cast._String(_autoscalarize(this.S)));
				while (output0.doAfterBody() != 0);
			if (output0.doEndTag() == 5)
				return null;
		}
		catch (Throwable localThrowable1) {
			output0.doCatch(localThrowable1);
		}
		catch (Throwable localThrowable2) {
			jsr 6;
			throw localThrowable2;
		}
		Object t9 = returnAddress;
		output0.doFinally();
		ret;
		return null;
	}
}