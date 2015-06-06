// Decompiled by DJ v3.5.5.77 Copyright 2003 Atanas Neshkov  Date: 3/22/2004 5:05:17 PM // Home Page : http://members.fortunecity.com/neshkov/dj.html  - Check often for new version! // Decompiler options: packimports(3) 
// Source File Name:   QueryTag.java

package coldfusion.tagext.sql;

import coldfusion.debug.Debugger;
import coldfusion.runtime.*;
import coldfusion.server.*;
import coldfusion.sql.*;
import coldfusion.tagext.*;
import coldfusion.util.FastHashtable;
import coldfusion.util.RuntimeWrapper;
import java.security.Permission;
import java.sql.*;
import java.util.*;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.*;

// Referenced classes of package coldfusion.tagext.sql:
//            TransactionTag, CachedQuery

public class QueryTag extends GenericTag
    implements BodyTag, TryCatchFinally
{
    public class UnSupportedDBTypeException extends DatabaseException
    {

        public UnSupportedDBTypeException()
        {
        }
    }

    public class DataSourceVerificationException extends DatabaseException
    {

        DataSourceVerificationException(Throwable ex, String dsn)
        {
            super(ex);
            super.datasource = dsn;
        }
    }

    public class DataSourceException extends DatabaseException
    {

        DataSourceException(String dsn)
        {
            super.datasource = dsn;
        }

        DataSourceException(Throwable ex, String dsn)
        {
            super(ex);
            super.datasource = dsn;
        }
    }

    public class DatabaseQueryException extends DatabaseException
    {

        void init(SqlImpl impl)
        {
            if(impl.getParamList() == null)
            {
                super.sql = impl.getSql();
                where = "";
            } else
            {
                super.sql = impl.getParamList().getStatement(impl.getSql());
                where = impl.getParamList().getWhere();
            }
        }

        public String where;
        public String queryError;

        DatabaseQueryException(SqlImpl impl)
        {
            init(impl);
        }

        DatabaseQueryException(Throwable ex, SqlImpl impl, String dsn)
        {
            super(ex);
            init(impl);
            super.datasource = dsn;
            queryError = ex.getMessage();
        }
    }


    public QueryTag()
    {
        debugState = -1;
        impl = new SqlImpl();
        dimpl = null;
        loc = null;
        resultTable = null;
        startTime = 0L;
        rowCount = 0;
    }

    protected Permission getPermission()
    {
        return tp;
    }

    protected SqlImpl getSqlImpl()
    {
        return impl;
    }

    public void setPageContext(PageContext pc)
    {
        dimpl = DataSrcImpl.getSqlProxy();
        super.setPageContext(pc);
    }

    public void setName(String n)
    {
        name = n;
    }

    public String getName()
    {
        return name;
    }

    public void setDatasource(String ds)
    {
        datasource = ds;
    }

    public String getDatasource()
    {
        return datasource;
    }

    public void setDbtype(String dt)
    {
        dbtype = dt;
    }

    public String getDbtype()
    {
        return dbtype;
    }

    public void setSql(String s)
    {
        sql_atr = s;
    }

    public String getSql()
    {
        return sql_atr;
    }

    public void setUsername(String u)
    {
        username = u;
    }

    public String getUsername()
    {
        return username;
    }

    public void setPassword(String p)
    {
        password = p;
    }

    protected String getPassword()
    {
        return password;
    }

    public void setMaxrows(int r)
    {
        maxrows = new Integer(r);
    }

    public Integer getMaxrows()
    {
        return maxrows;
    }

    public void setBlockfactor(int b)
    {
        blockfactor = new Integer(b);
    }

    public Integer getBlockfactor()
    {
        return blockfactor;
    }

    public void setTimeout(int t)
    {
        timeout = new Integer(t);
    }

    public Integer getTimeout()
    {
        return timeout;
    }

    public void setCachedafter(Date c)
    {
        cachedafter = c;
    }

    public Date getCachedafter()
    {
        return cachedafter;
    }

    public void setCachedwithin(double days)
    {
        cachedwithin = new Long((long)(days * 86400000D));
    }

    public Long setCachedwithin()
    {
        return cachedwithin;
    }

    public void setDebug(boolean d)
    {
        debugState = d ? 1 : 0;
    }

    public int getDebug()
    {
        return debugState;
    }

    public long getElapsedTime()
    {
        return System.currentTimeMillis() - startTime;
    }

    protected Tag findTransactionTag()
    {
        Tag tg = TransactionTag.getCurrent();
        if(tg != null)
            return tg;
        Tag tag;
        for(tag = this; (tag = tag.getParent()) != null;)
            if(tag instanceof TransactionTag)
                break;

        return tag;
    }

    protected void validate()
        throws JspException
    {
        TransactionTag txn = (TransactionTag)findTransactionTag();
        if(txn != null && !"query".equalsIgnoreCase(dbtype))
            try
            {
                txn.verifyDataSrc(datasource, username, password);
            }
            catch(SQLException ex)
            {
                throw new DataSourceVerificationException(ex, datasource);
            }
        impl.setDebug(debugState != 0);
        String dsn = dimpl.getDatasrc();
        if(datasource == null)
        {
            if(dbtype != null && dbtype.equalsIgnoreCase("query"))
            {
                JdbcImpl jimpl = new JdbcImpl();
                jimpl.setDriver("coldfusion.sql.imq.jdbcDriver");
                jimpl.setUrl("jdbc:imq:.");
                jimpl.setProperty("page_context", super.pageContext);
                impl.setConnectionSource(jimpl);
                impl.setUsername("");
                impl.setPassword("");
                impl.setCloseConnection(true);
            } else
            {
                datasource = datasource != null ? datasource : "";
                throw new InvalidTagAttributeException("CFQUERY", "datasource", datasource);
            }
        } else
        if(!datasource.equals(dsn))
        {
            dimpl.setDatasrc(datasource);
            impl.setConnectionSource(dimpl);
            impl.setCloseConnection(false);
        } else
        {
            impl.setConnectionSource(dimpl);
            impl.setCloseConnection(false);
        }
        if(username != null)
            impl.setUsername(username);
        if(password != null)
            impl.setPassword(password);
        if(maxrows != null)
        {
            int num = maxrows.intValue();
            if(num >= 0)
                impl.setMaxrows(maxrows);
        }
        if(blockfactor != null)
        {
            int num = blockfactor.intValue();
            impl.setFetchsize(blockfactor);
        }
        if(timeout != null)
        {
            int num = timeout.intValue();
            impl.setTimeout(timeout);
        }
        if(cachedwithin != null && cachedafter != null)
            throw new InvalidTagAttributeException("CFQUERY", "cachedwithin", cachedwithin);
        if(sql_atr != null && sql_atr.length() != 0)
            impl.setSql(sql_atr);
    }

    public int doStartTag()
        throws JspException
    {
        DebuggingService debuggingService = ServiceFactory.getDebuggingService();
        startTime = System.currentTimeMillis();
        if(debugState > 0 || debugState == -1 && debuggingService.check(4))
            loc = new Exception();
        validate();
        try
        {
            impl.validate();
            return sql_atr == null || sql_atr.length() == 0 ? 2 : 0;
        }
        catch(SQLException ex)
        {
            throw new DataSourceException(ex, datasource);
        }
    }

    public void doInitBody()
        throws JspException
    {
        if(super.bodyContent instanceof CFOutput)
            ((CFOutput)super.bodyContent).cfoutput(true);
    }

    public int doAfterBody()
        throws JspException
    {
        impl.setSql(super.bodyContent.getString());
        return 0;
    }

    public int doEndTag()
        throws JspException
    {
        boolean cached = false;
        boolean inTxn = findTransactionTag() != null;
        DebuggingService debuggingService = ServiceFactory.getDebuggingService();
        impl.setResultSetList(intar);
        try
        {
            long startTime = System.currentTimeMillis();
            if(cachedafter != null)
                cached = setupCachedQuery(inTxn, true);
            else
            if(cachedwithin != null)
                cached = setupCachedQuery(inTxn, false);
            else
                setQueryResult(impl.execute(inTxn));
            long endTime = System.currentTimeMillis();
            if(debuggingService.getDebugger() != null && (debugState > 0 || debugState == -1 && debuggingService.check(4)))
            {
                ParameterList pl = impl.getParamList();
                ArrayList list = pl != null ? pl.getAllParameters() : null;
                Vector vParameters = new Vector();
                int size = list != null ? list.size() : 0;
                for(int j = 0; j < size; j++)
                {
                    Struct stParam = new Struct();
                    InParameter param = (InParameter)list.get(j);
                    Object valObj = param.getObject() != null ? param.getObject() : "";
                    stParam.put("value", valObj);
                    stParam.put("sqlType", param.getSqltypeName());
                    vParameters.add(stParam);
                }

                debuggingService.getDebugger().sql(impl.getSql(), name, datasource, resultTable, loc, rowCount, startTime, endTime, cached, vParameters);
            }
            coldfusion.runtime.VariableScope vs = ((NeoPageContext)super.pageContext).getVariableScope();
            Variable et = vs.bindInternal("CFQUERY.EXECUTIONTIME");
            if(cached)
                et.set(new Long(0L));
            else
                et.set(new Long(endTime - startTime));
        }
        catch(RequestTimedOutException ex)
        {
            throw setRequestTimedOutTagName(ex);
        }
        catch(SQLException ex)
        {
            throw new DatabaseQueryException(ex, impl, datasource);
        }
        return 6;
    }

    public void doCatch(Throwable throwable)
        throws Throwable
    {
        throw throwable;
    }

    public void doFinally()
    {
        try
        {
            if(super.bodyContent instanceof CFOutput)
                ((CFOutput)super.bodyContent).cfoutput(false);
            if(impl.getParamList() != null)
                impl.getParamList().clear();
        }
        finally
        {
            release();
        }
    }

    protected boolean setupCachedQuery(boolean inTxn, boolean bCachedAfter)
        throws SQLException
    {
        DataSourceService dsSvc;
        CachedQuery c;
        boolean bFoundCached;
        q = getQueryWrapper(q);
        dsSvc = ServiceFactory.getDataSourceService();
        c = null;
        bFoundCached = false;
_L2:
        DataSourceService datasourceservice = dsSvc;
        datasourceservice;
        JVM INSTR monitorenter ;
label0:
        {
            c = (CachedQuery)dsSvc.getCachedQuery(q.toString());
            if(c == null)
                break label0;
            if(c.isInUse())
            {
                CfJspPage.checkRequestTimeout("CFQUERY");
            } else
            {
                c.setInUse(true);
                bFoundCached = true;
                break MISSING_BLOCK_LABEL_131;
            }
        }
        if(true) goto _L2; else goto _L1
_L1:
        c = getQueryWrapper(null);
        c.setInUse(true);
        dsSvc.setCachedQuery(c.toString(), c);
        bFoundCached = false;
        break MISSING_BLOCK_LABEL_131;
        Exception exception;
        exception;
        datasourceservice;
        JVM INSTR monitorexit ;
        throw exception;
        boolean cached = false;
        try
        {
            if(bFoundCached)
            {
                long refreshTime;
                if(bCachedAfter)
                    refreshTime = cachedafter.getTime();
                else
                    refreshTime = q.getCreationTime() - cachedwithin.longValue();
                if(c.getCreationTime() > refreshTime)
                {
                    setQueryResult((Table)CFPage.Duplicate(c.query));
                    cached = true;
                } else
                {
                    c.query = impl.execute(inTxn);
                    c.refresh();
                    setQueryResult((Table)CFPage.Duplicate(c.query));
                }
            } else
            {
                c.query = impl.execute(inTxn);
                setQueryResult((Table)CFPage.Duplicate(c.query));
            }
        }
        catch(SQLException sqlex)
        {
            if(c.query == null)
                dsSvc.setCachedQuery(c.toString(), null);
            throw sqlex;
        }
        catch(IllegalAccessException ex)
        {
            throw new RuntimeWrapper(ex);
        }
        finally
        {
            c.setInUse(false);
        }
        return cached;
    }

    protected RequestTimedOutException setRequestTimedOutTagName(RequestTimedOutException ex)
    {
        ex.tname = "CFQUERY";
        return ex;
    }

    protected static Object processSpecialSqlTypes(Object v, int stype)
    {
        Date theDate = Cast._Date(v);
        switch(stype)
        {
        case 91: // '['
            v = theDate;
            break;

        case 92: // '\\'
            v = new Time(theDate.getTime());
            break;

        case 93: // ']'
            v = new Timestamp(theDate.getTime());
            break;
        }
        return v;
    }

    protected void setQueryResult(Table table)
    {
        DebuggingService debuggingService = ServiceFactory.getDebuggingService();
        if(table != null && debuggingService != null && (debugState > 0 || debugState == -1 && debuggingService.check(4)))
        {
            resultTable = table;
            rowCount = table.getRowCount();
        }
        if(name != null)
            super.pageContext.setAttribute(name, table);
    }

    private CachedQuery getQueryWrapper(CachedQuery c)
    {
        if(c == null)
            c = new CachedQuery();
        else
            c.clear();
        c.dsname = datasource;
        c.sql = impl.getSql().trim();
        c.name = name;
        c.username = impl.getUsername();
        c.password = impl.getPassword();
        c.refresh();
        return c;
    }

    protected void cacheQueryResult(Table table)
    {
        setQueryResult(table);
        if(name != null)
        {
            CachedQuery c = getQueryWrapper(null);
            c.query = table;
            ServiceFactory.getDataSourceService().setCachedQuery(c.toString(), c);
        }
    }

    public void release()
    {
        datasource = null;
        dbtype = null;
        username = null;
        password = null;
        maxrows = null;
        blockfactor = null;
        timeout = null;
        cachedafter = null;
        cachedwithin = null;
        debugState = -1;
        dimpl = null;
        startTime = 0L;
        resultTable = null;
        impl.clear();
        if(q != null)
            q.clear();
        super.release();
    }

    private static final GenericTagPermission tp = new GenericTagPermission("cfquery");
    protected String datasource;
    protected String dbtype;
    protected String sql_atr;
    protected String username;
    protected String password;
    protected Integer maxrows;
    protected Integer blockfactor;
    protected Integer timeout;
    protected Date cachedafter;
    protected Long cachedwithin;
    protected String name;
    protected int debugState;
    protected SqlImpl impl;
    protected DataSrcImpl dimpl;
    private static final int intar[] = {
        0
    };
    private CachedQuery q;
    private Exception loc;
    private Table resultTable;
    private long startTime;
    private int rowCount;

}
