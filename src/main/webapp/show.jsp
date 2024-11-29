<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="com.mycompany.Todo" %>  <!-- Make sure to import your Todo class -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Todo Lists</title>
    <!-- Adding some CSS for styling -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 30px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 1.1em;
        }

        td a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        td a:hover {
            background-color: #007bff;
            color: white;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 90%;
            }

            th, td {
                padding: 10px;
            }
        }

        /* Back to Home Link Styling */
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
            background-color: #45a049;
        }

        /* Footer Styling */
        .footer {
            text-align: center;
            margin-top: 30px;
            padding: 10px;
            background-color: #333;
            color: white;
        }

        .footer p {
            margin: 0;
            font-size: 0.9em;
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

              /*   Query<>odo> q = sess.createQuery("from Todo", Todo.class); */
          Query<Todo> q = sess.createQuery("FROM Todo", Todo.class);

                List<Todo> li = q.list();

                
                
                
                
                 for (Todo st : li) {
            %>
            <tr>
                <td><%= st.getId() %></td>
                <td><%= st.getTitle()%></td>
                <td><%= st.getMessage() %></td>
                <td><a href="update.jsp?id=<%= st.getId() %>">Update</a></td>
                <td><a href="delete.jsp?id=<%= st.getId() %>">Delete</a></td>
            </tr>
            <%
                }
             
            %>
        </tbody>
    </table>

    <div style="text-align: center;">
        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>


</body>
</html>
