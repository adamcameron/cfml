import java.util.*;
import java.lang.reflect.*;

public class ClassViewer
{
    private static final String nl = System.getProperty("line.separator");

    public static final String viewClassByName(String name)
        throws Exception
    {
        return viewClass(Class.forName(name));
    }

    public static final String viewObject(Object obj)
        throws Exception
    {
        return viewClass(obj.getClass());
    }

    public static String viewClass(Class c)
        throws Exception
    {

		Class p;
		Boolean bExtends = true;

        if (c == null) {
            return "Error: Null Reference";
        }
        StringBuffer out = new StringBuffer(1024);
        out.append(Modifier.toString(c.getModifiers()));
        out.append(" class ");
        out.append(c.getName());
        out.append(nl);

        p = c.getSuperclass();
        while (bExtends){
			try {
				out.append(" extends ");
				out.append(p.getName());
		        out.append(nl);
				p = p.getSuperclass();
			} catch (Exception e){
				bExtends = false;
			}
		}


       // out.append(" extends ");
       // out.append(c.getSuperclass().getName());
      //  out.append(nl);
        Class interfaces[] = c.getInterfaces();
        if (interfaces.length > 0) {
            out.append(" implements ");
            for (int i=0;i<interfaces.length;i++) {
                if (i != 0) {
                    out.append(", ");
                }
                out.append(interfaces[i].getName());
            }
            out.append(nl);
        }
        out.append('{');
        out.append(nl);

        out.append(" /*** CONSTRUCTORS ***/");
        out.append(nl);
        Constructor[] constructors = c.getConstructors();
        for (int i=0;i<constructors.length;i++) {
            out.append(' ');
            out.append(ClassViewer.viewConstructor(constructors[i]));
            out.append(nl);
            out.append(nl);
        }
        out.append(nl);
        out.append(" /*** METHODS ***/");
        out.append(nl);
        Method[] methods = c.getMethods();
        for (int m=0;m<methods.length;m++) {
            out.append(' ');
            out.append(ClassViewer.viewMethod(methods[m]));
            out.append(nl);
            out.append(nl);
        }
        out.append(nl);
        out.append(" /*** FIELDS ***/");
        out.append(nl);
        Field[] fields = c.getFields();
        for (int f=0;f<fields.length;f++) {
            out.append(' ');
            out.append(Modifier.toString(fields[f].getModifiers()));
            out.append(' ');
            out.append(fields[f].getType().getName());
            out.append(' ');
            out.append(fields[f].getName());
            out.append(nl);
        }
        out.append(nl);
        out.append('}');
        return out.toString();
    }

    public static String viewMethod(Method m)
    {
        StringBuffer out = new StringBuffer(128);
        out.append(Modifier.toString(m.getModifiers()));
        out.append(' ');
        out.append(m.getReturnType().getName());
        out.append(' ');
        out.append(m.getName());
        out.append('(');
        Class[] params = m.getParameterTypes();
        for (int p=0;p<params.length;p++) {
            if (p != 0) {
                out.append(", ");
            }
            out.append(params[p].getName());
        }
        out.append(')');
        Class[] exc = m.getExceptionTypes();
        if (exc.length > 0) {
            out.append(nl);
            out.append(" throws ");
            for (int e=0;e<exc.length;e++) {
                if (e != 0) {
                    out.append(", ");
                }
                out.append(exc[e].getName());
            }
        }

        return out.toString();
    }

    public static String viewConstructor(Constructor c)
    {
        StringBuffer out = new StringBuffer(128);

        out.append(Modifier.toString(c.getModifiers()));
        out.append(' ');
        out.append(c.getName());
        out.append('(');
        Class[] params = c.getParameterTypes();
        for (int p=0;p<params.length;p++) {
            if (p != 0) {
                out.append(" ,");
            }
            out.append(params[p].getName());
        }
        out.append(')');
        return out.toString();
    }



    public static void main(String args[])
        throws Exception
    {
        Class c = null;
        if (args.length == 1) {
            c = Class.forName(args[1]);
        }
        else {
            c = Class.forName("ClassViewer");
        }
        System.out.print(ClassViewer.viewClass(c));
    }
}