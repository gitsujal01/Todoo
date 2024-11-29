<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.Todo" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 900px;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
        }

        td a {
            text-decoration: none;
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        td a:hover {
            background-color: #0056b3;
        }

        .no-results {
            color: red;
            font-weight: bold;
            font-size: 18px;
        }

        .back-home-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .back-home-btn:hover {
            background-color: #0056b3;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            table {
                width: 100%;
                font-size: 14px;
            }

            th, td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Search Results for: <%= request.getParameter("title") %></h1>

    <% 
        String name = request.getParameter("title");

        if (name != null && !name.trim().isEmpty()) {
            Configuration cfg = new Configuration();
            cfg.configure();
            SessionFactory sf = cfg.buildSessionFactory();
            Session sess = sf.openSession();

            Query<Todo> q = sess.createQuery("from Todo where title like :na");
            q.setParameter("na", "%" + name + "%");
            List<Todo> li = q.list();

            if (li.isEmpty()) {
    %>
                <p class="no-results">No results found for "<%= name %>"</p>
            <% 
            } else {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Title</th>
                            <th>Message</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            for (Todo st : li) {
                        %>
                            <tr>
                                <td><%= st.getId() %></td>
                                <td><%= st.getTitle() %></td>
                                <td><%= st.getMessage() %></td>
                                <td><a href="delete.jsp?id=<%= st.getId() %>">Delete</a></td>
                                <td><a href="update.jsp?id=<%= st.getId() %>">Update</a></td>
                            </tr>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
            <% 
            }
            sess.close();
        } else {
    %>
            <p class="no-results">Please enter a valid search term.</p>
    <% 
        }
    %>

    <a href="index.jsp" class="back-home-btn">Back to Home</a>
</div>

</body>
</html>
