// Decompiled by DJ v3.0.0.63 Copyright 2002 Atanas Neshkov  Date: 27/08/2004 11:00:23 a.m.
// Home Page : http://members.fortunecity.com/neshkov/dj.html  - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   C:\JRun4\servers\cfusion_shado7\cfusion-ear\cfusion-war\junk\tests\locking\lock.cfm

import coldfusion.runtime.*;
import coldfusion.tagext.GenericTag;
import coldfusion.tagext.lang.LockTag;
import java.io.Writer;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

public final class cflock2ecfm1060491962 extends CFPage
{

    public cflock2ecfm1060491962()
    {
    }

    protected final Object runPage()
    {
        javax.servlet.jsp.JspWriter out = super.pageContext.getOut();
        javax.servlet.jsp.tagext.Tag parent = super.parent;
        LockTag lock0 = (LockTag)_initTag(class$coldfusion$tagext$lang$LockTag, 0, parent);
        lock0.setType(CfJspPage._validateTagAttrValue("cflock", "type", "exclusive"));
        lock0.setThrowontimeout(CfJspPage._validateTagAttrValue("cflock", "throwontimeout", Cast._boolean("yes")));
        lock0.setName(CfJspPage._validateTagAttrValue("cflock", "name", "testLock"));
        lock0.setTimeout(CfJspPage._validateTagAttrValue("cflock", "timeout", Cast._int("5")));
        try
        {
            int mode0;
            if((mode0 = lock0.doStartTag()) != 0)
                do
                    out.write("\r\n\tHello World\r\n");
                while(lock0.doAfterBody() != 0);
            if(lock0.doEndTag() == 5)
            {
                Object t6 = null;
                return t6;
            }
        }
        catch(Throwable t7)
        {
            lock0.doCatch(t7);
        }
        finally
        {
            lock0.doFinally();
        }
        return null;
    }

    public final Object getMetadata()
    {
        return metaData;
    }

    static final Class class$coldfusion$tagext$lang$LockTag = Class.forName("coldfusion.tagext.lang.LockTag");
    static final Object metaData = new AttributeCollection(new Object[0]);

}