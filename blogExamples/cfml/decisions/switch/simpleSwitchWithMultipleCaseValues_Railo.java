// simpleSwitchWithMultipleCaseValues_Railo.java

package scribble.shared.git.blogexamples.cfml.decisions._switch;

import railo.commons.color.ConstantsDouble;
import railo.runtime.PageContext;
import railo.runtime.PagePlus;
import railo.runtime.PageSource;
import railo.runtime.component.ImportDefintion;
import railo.runtime.exp.PageException;
import railo.runtime.op.Caster;
import railo.runtime.type.Collection.Key;
import railo.runtime.type.KeyImpl;
import railo.runtime.type.UDF;
import railo.runtime.type.UDFProperties;
import railo.runtime.type.scope.URL;
import railo.runtime.type.scope.Undefined;
import railo.runtime.type.util.KeyConstants;
import railo.runtime.type.util.ListUtil;

public final class simpleswitchwithmultiplecasevalues_cfm$cf extends PagePlus
{
  private final ImportDefintion[] imports;
  private Collection.Key[] keys;

  public simpleswitchwithmultiplecasevalues_cfm$cf(PageSource paramPageSource)
  {
    initKeys();
    this.imports = new ImportDefintion[0];
    this.udfs = new UDFProperties[0];
    setPageSource(paramPageSource);
  }

  public final int getVersion()
  {
    return 4020103;
  }

  public final ImportDefintion[] getImportDefintions()
  {
    return new ImportDefintion[0];
  }

  public final long getSourceLastModified()
  {
    return 1406875848852L;
  }

  public final long getCompileTime()
  {
    return 1406876032911L;
  }

	public final void call(PageContext paramPageContext) throws Throwable {
		paramPageContext.write("\r\n");
		String str = Caster.toString(paramPageContext.urlScope().get(this.keys[0]));
		
		if ((ListUtil.listFindForSwitch("a", str, ",") == -1 ? 0 : 1) != 0) {
			paramPageContext.write("\r\n\t\t");
			paramPageContext.us().set(KeyConstants._RESULT, ConstantsDouble._1);
			paramPageContext.write("\r\n\t");
		}
		else if ((ListUtil.listFindForSwitch("b,c", str, ",") == -1 ? 0 : 1) != 0) {
			paramPageContext.write("\r\n\t\t");
			paramPageContext.us().set(KeyConstants._RESULT, ConstantsDouble._2);
			paramPageContext.write("\r\n\t");
		}
		else if ((ListUtil.listFindForSwitch("d;e", str, ";") == -1 ? 0 : 1) != 0) {
			paramPageContext.write("\r\n\t\t");
			paramPageContext.us().set(KeyConstants._RESULT, ConstantsDouble._3);
			paramPageContext.write("\r\n\t");
		} else {
			paramPageContext.write("\r\n\t\t");
			paramPageContext.us().set(KeyConstants._RESULT, ConstantsDouble._4);
			paramPageContext.write("\r\n\t");
		}
	}

  public final Object udfCall(PageContext paramPageContext, UDF paramUDF, int paramInt)
    throws Throwable
  {
    return null;
  }

  public final void threadCall(PageContext paramPageContext, int paramInt)
    throws Throwable
  {
  }

  public final Object udfDefaultValue(PageContext paramPageContext, int paramInt1, int paramInt2, Object paramObject)
    throws PageException
  {
    return paramObject;
  }

  private final void initKeys()
  {
    this.keys = new Collection.Key[] { KeyImpl.intern("OPTION") };
  }
}