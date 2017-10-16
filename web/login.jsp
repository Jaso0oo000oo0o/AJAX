<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 下午5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <script src="jquery-3.2.1.js"></script>
</head>
<body>
<form action="" method="post">
用户:
<input type="text" name="user" id="user">
<br>
密码:
<input type="password" name="pwd" id="pwd">
<br>
    <p></p>
    <input type="submit" value="提交">
</form>
</body>
<script>
    $(function () {
        $("input").change(function () {
            $.post(
                    "/LoginServlet",
                    {
                        name : "D",
                        body: "d"
                    },
                    function (data) {
                        $("p").html(data);
                    },
                    'json'
            )
        })
    })
</script>
</html>
