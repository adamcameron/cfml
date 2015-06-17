import coldfusion.runtime.ArgumentCollection;
import coldfusion.runtime.AttributeCollection;
import coldfusion.runtime.CFPage;
import coldfusion.runtime.CfJspPage;
import coldfusion.runtime.LocalScope;
import coldfusion.runtime.UDFMethod;
import coldfusion.runtime.Variable;
import coldfusion.tagext.GenericTag;
import coldfusion.tagext.QueryLoop;
import coldfusion.tagext.io.OutputTag;
import coldfusion.tagext.lang.ImportedTag;
import coldfusion.tagext.lang.ModuleTag;
import coldfusion.util.Key;
import java.io.Writer;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

public final class cfcfoutput2ecfm1560105079$funcGENERATECONTENT extends UDFMethod
{
	static final Class class$coldfusion$tagext$lang$ImportedTag;
	static final Class class$coldfusion$tagext$io$OutputTag;
	static final Object metaData;

	protected final String[] getParamList()
	{
		return new String[0];
	}

	protected final Object runFunction(LocalScope __localScope, Object instance, CFPage parentPage, ArgumentCollection __arguments)
	{
		Throwable t24;
		Throwable t23;
		Object t22;
		Object t21;
		Throwable t20;
		Object t19;
		Throwable t18;
		Throwable t17;
		Object t16;
		int mode1;
		OutputTag output1;
		int mode2;
		Object value;
		parentPage.bindImportPath("com.adobe.coldfusion.*");
Variable ARGUMENTS = __localScope.bindInternal(Key.ARGUMENTS, __arguments);
Variable THIS = __localScope.bindInternal(Key.THIS, instance);
Variable S = __localScope.bindInternal("S");
JspWriter out = parentPage.pageContext.getOut();
Tag parent = parentPage.parent;
parentPage._whitespace(out, "\r\n\t");
		S.set("");
parentPage._whitespace(out, "\r\n\t");
ImportedTag module2 = (ImportedTag)parentPage._initTag(class$coldfusion$tagext$lang$ImportedTag, -1, parent);
parentPage._setCurrentLineNo(9);
module2.setName("savecontent", "/WEB-INF/cftags", null, true);
Object t12 = "s";
CfJspPage._validateTagAttrValue("cfsavecontent", "variable", t12, null);
module2.setAttributecollection(new AttributeCollection(new Object[] { "variable", t12 }));
module2.hasEndTag(true);
		try { if ((mode2 = module2.doStartTag()) != 0) { try { out = parentPage._pushBody(module2, mode2, out);
					do { out.write("\r\n\t\tBEFORE CFOUTPUT<br>\r\n\t\t");
output1 = (OutputTag)parentPage._initTag(class$coldfusion$tagext$io$OutputTag, -1, module2);
parentPage._setCurrentLineNo(11);
output1.hasEndTag(true);
						try { if ((mode1 = output1.doStartTag()) != 0) do out.write("IN OUTPUT<br>");
while (output1.doAfterBody() != 0);
if (output1.doEndTag() == 5) { t16 = null;
jsr 41;
} jsr 29;
} catch (Throwable localThrowable1) { output1.doCatch(localThrowable1);
jsr 14;
} catch (Throwable localThrowable2) { jsr 6;
} t19 = returnAddress;
output1.doFinally();
ret;
out.write("\r\n\t\tAFTER CFOUTPUT<br>\r\n\t");
} while (module2.doAfterBody() != 0);
jsr 14;
} catch (Throwable localThrowable3) { jsr 6;
} t21 = returnAddress;
out = parentPage._popBody(mode2, out);
ret;
} if (module2.doEndTag() == 5) { t22 = null;
jsr 35;
} jsr 29;
} catch (Throwable localThrowable4) { module2.doCatch(localThrowable4);
jsr 14;
} catch (Throwable localThrowable5) { jsr 6;
} Object t25 = returnAddress;
module2.doFinally();
ret;
parentPage._whitespace(out, "\r\n\t");
return parentPage._autoscalarize(S);
parentPage._whitespace(out, "\r\n");
return null;
	}

	static
	{
		class$coldfusion$tagext$lang$ImportedTag = Class.forName("coldfusion.tagext.lang.ImportedTag");
		class$coldfusion$tagext$io$OutputTag = Class.forName("coldfusion.tagext.io.OutputTag");
		metaData = new AttributeCollection(new Object[] { "name", "generateContent", "output", "false", "Parameters", new Object[0] });
	}

	protected final String getName()
	{
		return "generateContent";
	}

	public final String getOutput()
	{
		return "false";
	}

	public final Object getMetadata()
	{
		return metaData;
	}
}