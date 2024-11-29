<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            padding: 30px;
            text-align: center;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        textarea {
            height: 120px;
            resize: none;
        }

        input[type="submit"],
        .back-home-btn {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover,
        .back-home-btn:hover {
            background-color: #45a049;
        }

        .back-home-btn {
            background-color: #007bff;
            margin-top: 10px;
        }

        .back-home-btn:hover {
            background-color: #0056b3;
        }

        /* Link styling for "Show all" with blue background */
        .show-all-link {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .show-all-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Create Your Todo</h1>
    <form action="Insert" method="post">
        <input type="text" name="title" placeholder="Enter Title" required>
        <textarea name="message" placeholder="Enter Message" required></textarea>
        
        <input type="submit" value="Save">

        <a href="index.jsp">
            <input type="button" class="back-home-btn" value="Back to Home">
        </a>
        

        <a href="show.jsp" class="show-all-link">Show all</a>
    </form>
</div>

</body>
</html>
