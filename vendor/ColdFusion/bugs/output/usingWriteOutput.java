import coldfusion.runtime.ArgumentCollection;
import coldfusion.runtime.AttributeCollection;
import coldfusion.runtime.CFPage;
import coldfusion.runtime.Cast;
import coldfusion.runtime.CfJspPage;
import coldfusion.runtime.LocalScope;
import coldfusion.runtime.UDFMethod;
import coldfusion.runtime.Variable;
import coldfusion.util.Key;
import java.io.Writer;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;

public final class cfwriteOutput2ecfm206667922$funcUSINGWRITEOUTPUT extends UDFMethod
{
	static final Object metaData;

	protected final String[] getParamList()
	{
		return new String[0];
	}

	protected final Object runFunction(LocalScope __localScope, Object instance, CFPage parentPage, ArgumentCollection __arguments)
	{
		Object value;
		parentPage.bindImportPath("com.adobe.coldfusion.*");

		Variable ARGUMENTS = __localScope.bindInternal(Key.ARGUMENTS, __arguments);

		Variable THIS = __localScope.bindInternal(Key.THIS, instance);

		JspWriter out = parentPage.pageContext.getOut();

		Tag parent = parentPage.parent;

		out.write("\r\n\tTEXT WITHIN usingWriteOutput():<br>\r\n\t");

		parentPage._setCurrentLineNo(4);

		parentPage._setCurrentLineNo(4);

		parentPage.WriteOutput(Cast._String(CfJspPage._invokeUDF(parentPage._get("GENERATECONTENT"), "generateContent", parentPage, new Object[0])));

		parentPage._whitespace(out, "\r\n");

		return null;
	}

	static
	{
		metaData = new AttributeCollection(new Object[] { "name", "usingWriteOutput", "output", "true", "Parameters", new Object[0] });
	}

	protected final String getName()
	{
		return "usingWriteOutput";
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