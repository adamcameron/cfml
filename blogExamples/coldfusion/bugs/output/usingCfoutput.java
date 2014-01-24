import coldfusion.runtime.ArgumentCollection;
import coldfusion.runtime.AttributeCollection;
import coldfusion.runtime.CFPage;
import coldfusion.runtime.Cast;
import coldfusion.runtime.CfJspPage;
import coldfusion.runtime.LocalScope;
import coldfusion.runtime.UDFMethod;
import coldfusion.runtime.Variable;
import coldfusion.tagext.GenericTag;
import coldfusion.tagext.QueryLoop;
import coldfusion.tagext.io.OutputTag;
import coldfusion.util.Key;
import java.io.Writer;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;

public final class cfcfoutput2ecfm1560105079$funcUSINGCFOUTPUT extends UDFMethod
{
	static final Class class$coldfusion$tagext$io$OutputTag;
	static final Object metaData;

	protected final String[] getParamList()
	{
		return new String[0];
	}

	protected final Object runFunction(LocalScope __localScope, Object instance, CFPage parentPage, ArgumentCollection __arguments)
	{
		Throwable t14;
		Throwable t13;
		Object t12;
		int mode0;
		Object value;
		parentPage.bindImportPath("com.adobe.coldfusion.*");

		Variable ARGUMENTS = __localScope.bindInternal(Key.ARGUMENTS, __arguments);

		Variable THIS = __localScope.bindInternal(Key.THIS, instance);

		JspWriter out = parentPage.pageContext.getOut();

		Tag parent = parentPage.parent;

		out.write("\r\n\tTEXT WITHIN usingCfoutput():<br>\r\n\t");

		OutputTag output0 = (OutputTag)parentPage._initTag(class$coldfusion$tagext$io$OutputTag, -1, parent);

		parentPage._setCurrentLineNo(4);

		output0.hasEndTag(true);
		try {
			if ((mode0 = output0.doStartTag()) != 0)
				do {
					parentPage._setCurrentLineNo(4);

					out.write(Cast._String(CfJspPage._invokeUDF(parentPage._get("GENERATECONTENT"), "generateContent", parentPage, new Object[0])));

				} while (output0.doAfterBody() != 0);

			if (output0.doEndTag() == 5) {
				t12 = null;

				jsr 35;

			}
			jsr 29;

		} catch (Throwable localThrowable1) {
			output0.doCatch(localThrowable1);
			jsr 14;
		} catch (Throwable localThrowable2) {
			jsr 6;

		}
		Object t15 = returnAddress;

		output0.doFinally();

		ret;

		parentPage._whitespace(out, "\r\n");

		return null;
	}

	static
	{
		class$coldfusion$tagext$io$OutputTag = Class.forName("coldfusion.tagext.io.OutputTag");
		metaData = new AttributeCollection(new Object[] { "name", "usingCfoutput", "output", "true", "Parameters", new Object[0] });
	}

	protected final String getName()
	{
		return "usingCfoutput";
	}

	public final String getOutput()
	{
		return "true";
	}

	public final Object getMetadata()
	{
		return metaData;
	}
}