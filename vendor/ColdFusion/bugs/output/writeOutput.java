import coldfusion.runtime.AttributeCollection;
import coldfusion.runtime.CFPage;
import coldfusion.runtime.Cast;
import coldfusion.runtime.CfJspPage;
import coldfusion.runtime.LocalScope;
import coldfusion.runtime.UDFMethod;
import coldfusion.runtime.Variable;
import coldfusion.runtime.VariableScope;
import coldfusion.tagext.GenericTag;
import coldfusion.tagext.QueryLoop;
import coldfusion.tagext.io.OutputTag;
import coldfusion.tagext.lang.SettingTag;
import java.io.Writer;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;

public final class cfwriteOutput2ecfm206667922 extends CFPage
{
	private Variable USINGWRITEOUTPUT;
	static final Class class$coldfusion$tagext$lang$SettingTag;
	static final Class class$coldfusion$tagext$io$OutputTag;
	private static final UDFMethod usingWriteOutput;
	private static final UDFMethod generateContent;
	public static final Object metaData;

	static
	{
		class$coldfusion$tagext$lang$SettingTag = Class.forName("coldfusion.tagext.lang.SettingTag");
class$coldfusion$tagext$io$OutputTag = Class.forName("coldfusion.tagext.io.OutputTag");
usingWriteOutput = new cfwriteOutput2ecfm206667922.funcUSINGWRITEOUTPUT();
generateContent = new cfwriteOutput2ecfm206667922.funcGENERATECONTENT();

		metaData = new AttributeCollection(new Object[] { "Functions", { cfwriteOutput2ecfm206667922.funcUSINGWRITEOUTPUT.metaData, 
			cfwriteOutput2ecfm206667922.funcGENERATECONTENT.metaData } });
	}

	public final void registerUDFs()
	{
		registerUDF("USINGWRITEOUTPUT", usingWriteOutput);
		registerUDF("GENERATECONTENT", generateContent);
	}

	protected final void bindPageVariables(VariableScope varscope, LocalScope locscope)
	{
		super.bindPageVariables(varscope, locscope);
		this.USINGWRITEOUTPUT = bindPageVariable("USINGWRITEOUTPUT", varscope, locscope);
	}

	public final Object getMetadata()
	{
		return metaData;
	}

	protected final Object runPage()
	{
		Throwable t9;
		Throwable t8;
		Object t7;
		int mode3;
		Object value;
		JspWriter out = this.pageContext.getOut();
Tag parent = this.parent;
bindImportPath("com.adobe.coldfusion.*");
_whitespace(out, "\r\n");
_whitespace(out, "\r\n\r\n");
_whitespace(out, "\r\n\r\n");
SettingTag setting2 = (SettingTag)_initTag(class$coldfusion$tagext$lang$SettingTag, 2, parent);
_setCurrentLineNo(17);
setting2.setEnablecfoutputonly(CfJspPage._validateTagAttrValue("cfsetting", "enablecfoutputonly", Cast._boolean("true"), null));
setting2.hasEndTag(false);
if (CfJspPage._emptyTcfTag(setting2)) return null;
_whitespace(out, "\r\n\r\n");

		OutputTag output3 = (OutputTag)_initTag(class$coldfusion$tagext$io$OutputTag, 3, parent);
_setCurrentLineNo(19);
output3.hasEndTag(true);
		try { if ((mode3 = output3.doStartTag()) != 0) do out.write("Calling usingWriteOutput():<br>");
while (output3.doAfterBody() != 0);
if (output3.doEndTag() == 5) { t7 = null;
jsr 35;
} jsr 29;
} catch (Throwable localThrowable1) { output3.doCatch(localThrowable1);
jsr 14;
} catch (Throwable localThrowable2) { jsr 6;
} Object t10 = returnAddress;
output3.doFinally();
ret;
_whitespace(out, "\r\n");
_setCurrentLineNo(20);
		CfJspPage._invokeUDF(_get(this.USINGWRITEOUTPUT), "usingWriteOutput", this, new Object[0]);
return null;
	}
}