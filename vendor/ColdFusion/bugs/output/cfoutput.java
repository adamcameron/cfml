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

public final class cfcfoutput2ecfm1560105079 extends CFPage
{
	private Variable USINGCFOUTPUT;
	static final Class class$coldfusion$tagext$lang$SettingTag;
	static final Class class$coldfusion$tagext$io$OutputTag;
	private static final UDFMethod usingCfoutput;
	private static final UDFMethod generateContent;
	public static final Object metaData;

	static
	{
		class$coldfusion$tagext$lang$SettingTag = Class.forName("coldfusion.tagext.lang.SettingTag");
class$coldfusion$tagext$io$OutputTag = Class.forName("coldfusion.tagext.io.OutputTag");
usingCfoutput = new cfcfoutput2ecfm1560105079.funcUSINGCFOUTPUT();
generateContent = new cfcfoutput2ecfm1560105079.funcGENERATECONTENT();

		metaData = new AttributeCollection(new Object[] { "Functions", { cfcfoutput2ecfm1560105079.funcUSINGCFOUTPUT.metaData, 
			cfcfoutput2ecfm1560105079.funcGENERATECONTENT.metaData } });
	}

	public final void registerUDFs()
	{
		registerUDF("USINGCFOUTPUT", usingCfoutput);
		registerUDF("GENERATECONTENT", generateContent);
	}

	protected final void bindPageVariables(VariableScope varscope, LocalScope locscope)
	{
		super.bindPageVariables(varscope, locscope);
		this.USINGCFOUTPUT = bindPageVariable("USINGCFOUTPUT", varscope, locscope);
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
		int mode4;
		Object value;
		JspWriter out = this.pageContext.getOut();
Tag parent = this.parent;
bindImportPath("com.adobe.coldfusion.*");
_whitespace(out, "\r\n");
_whitespace(out, "\r\n\r\n");
_whitespace(out, "\r\n\r\n");
SettingTag setting3 = (SettingTag)_initTag(class$coldfusion$tagext$lang$SettingTag, 3, parent);
_setCurrentLineNo(17);
setting3.setEnablecfoutputonly(CfJspPage._validateTagAttrValue("cfsetting", "enablecfoutputonly", Cast._boolean("true"), null));
setting3.hasEndTag(false);
if (CfJspPage._emptyTcfTag(setting3)) return null;
_whitespace(out, "\r\n\r\n");

		OutputTag output4 = (OutputTag)_initTag(class$coldfusion$tagext$io$OutputTag, 4, parent);
_setCurrentLineNo(19);
output4.hasEndTag(true);
		try { if ((mode4 = output4.doStartTag()) != 0) do out.write("Calling usingCfoutput():<br>");
while (output4.doAfterBody() != 0);
if (output4.doEndTag() == 5) { t7 = null;
jsr 35;
} jsr 29;
} catch (Throwable localThrowable1) { output4.doCatch(localThrowable1);
jsr 14;
} catch (Throwable localThrowable2) { jsr 6;
} Object t10 = returnAddress;
output4.doFinally();
ret;
_whitespace(out, "\r\n");
_setCurrentLineNo(20);
		CfJspPage._invokeUDF(_get(this.USINGCFOUTPUT), "usingCfoutput", this, new Object[0]);
return null;
	}
}