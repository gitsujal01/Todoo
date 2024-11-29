<%@ page import="com.mycompany.Todo" %> 
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Todo</title>
    <!-- Adding some CSS for styling -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #4CAF50;
            margin-top: 30px;
        }

        .container {
            width: 40%;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-size: 1.1em;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            text-align: center;
            font-size: 1.2em;
            margin-top: 20px;
        }

        .success-message {
            color: green;
            text-align: center;
            font-size: 1.2em;
            margin-top: 20px;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <h2>Update Todo</h2>

    <div class="container">
        <form action="Update" method="post">
            <% 
                try {
                    int idd = Integer.parseInt(request.getParameter("id"));

                    Configuration cfg = new Configuration();
                    cfg.configure(); 
                    SessionFactory sf = cfg.buildSessionFactory();
                    Session sess = sf.openSession();

                    Todo td = (Todo) sess.get(Todo.class, idd);
                    if (td == null) {
                        out.println("<div class='error-message'>Todo not found.</div>");
                        return;
                    }
            %>

            <!-- Hidden field for ID -->
            <div class="form-group">
                <label for="id">ID:</label>
                <input type="text" name="id" readonly value="<%= td.getId() %>">
            </div>

            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" name="title" value="<%= td.getTitle() %>" required>
            </div>

            <div class="form-group">
                <label for="message">Message:</label>
                <input type="text" name="message" value="<%= td.getMessage() %>" required>
            </div>

            <div class="form-group">
                <input type="submit" value="Update Todo">
            </div>

            <% 
                } catch (Exception e) {
                    out.println("<div class='error-message'>Error: " + e.getMessage() + "</div>");
                }
            %>
        </form>
    </div>
</body>
</html>
