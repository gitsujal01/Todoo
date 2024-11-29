<%@page import="org.hibernate.Transaction"%>
<%@page import="com.mycompany.Todo"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try {
	   int id = Integer.parseInt(request.getParameter("id"));
	   Configuration cfg = new Configuration();
	   cfg.configure();
	   SessionFactory sf = cfg.buildSessionFactory();
	   Session sess = sf.openSession();
	   Todo td = new Todo();
	   td.setId(id);
	   Transaction tx = sess.beginTransaction();
	   sess.delete(td);
	   tx.commit();
	   sess.close();
	   response.sendRedirect("show.jsp");
	   System.out.println("done");
			  
}
catch(Exception e)
{
	   out.print(e.getMessage());
}

%>>
</body>
</html>