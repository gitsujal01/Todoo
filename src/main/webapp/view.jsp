<%@page import="java.util.List"%>
<%@page import="com.mycompany.Todo"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

      
    </style>
</head>
</body>

    <h1>All Todo Lists</h1>

    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Details</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                Configuration cfg = new Configuration();
                cfg.configure();
                SessionFactory sf = cfg.buildSessionFactory();
                Session sess = sf.openSession();

                Query<Todo> q = sess.createQuery("From todo");
                List<Todo> li = q.list();

                 for (Todo st : li) {
            %>
            <tr>
                <td><%= st.getId() %></td>
                <td><%= st.getTitle() %></td>
                <td><%= st.getMessage() %></td>
                <td><a href="update.jsp?id=<%= st.getId() %>">Update</a></td>
                <td><a href="delete.jsp?id=<%= st.getId() %>">Delete</a></td>
            </tr>
            <%
                }
                sess.close();
                sf.close();
            %>
        </tbody>
    </table>

    <div style="text-align: center;">
        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>


</body>
</html>
