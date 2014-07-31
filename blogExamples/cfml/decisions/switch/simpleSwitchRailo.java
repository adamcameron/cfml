// simpleSwitchRailo.java
package scribble.shared.git.blogexamples.cfml.decisions._switch;

import railo.commons.color.ConstantsDouble;
import railo.runtime.PageContext;
import railo.runtime.PagePlus;
import railo.runtime.PageSource;
import railo.runtime.component.ImportDefintion;
import railo.runtime.exp.PageException;
import railo.runtime.type.ArrayImpl;
import railo.runtime.type.Collection.Key;
import railo.runtime.type.KeyImpl;
import railo.runtime.type.UDF;
import railo.runtime.type.UDFProperties;
import railo.runtime.type.scope.URL;
import railo.runtime.type.scope.Undefined;
import railo.runtime.type.util.ArrayUtil;
import railo.runtime.type.util.KeyConstants;

public final class simpleswitch_cfm$cf extends PagePlus {
	private final ImportDefintion[] imports;
	private Collection.Key[] keys;

	public simpleswitch_cfm$cf(PageSource paramPageSource) {
		initKeys();
		this.imports = new ImportDefintion[0];
		this.udfs = new UDFProperties[0];
		setPageSource(paramPageSource);
	}

	public final int getVersion(){
		return 4020103;
	}

	public final ImportDefintion[] getImportDefintions(){
		return new ImportDefintion[0];
	}

	public final long getSourceLastModified(){
		return 1406830397538L;
	}

	public final long getCompileTime(){
		return 1406830460213L;
	}

	public final void call(PageContext paramPageContext) throws Throwable {
		if (1 != 0)	{
			ArrayImpl localArrayImpl = new ArrayImpl();
			localArrayImpl.append("a");
			localArrayImpl.append("b");
			localArrayImpl.append("c");

			int i = ArrayUtil.find(localArrayImpl, paramPageContext.urlScope().get(this.keys[0]));

			switch (i) {
				case 1:
					paramPageContext.us().set(KeyConstants._RESULT, ConstantsDouble._1);
				break;
				case 2:
					paramPageContext.us().set(KeyConstants._RESULT, ConstantsDouble._2);
				break;
				case 3:
					paramPageContext.us().set(KeyConstants._RESULT, ConstantsDouble._3);
				break;
			}
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