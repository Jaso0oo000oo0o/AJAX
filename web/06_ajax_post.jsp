<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 下午3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>post</title>
    <script src="jquery-3.2.1.js"></script>

</head>
<body>
<button id="btn">点击</button>
<table>
    <tr>
        <th>姓名</th>
        <th>年龄</th>
        <th>性别</th>
    </tr>
    <tbody id="tb"></tbody>


</table>
<script>
    $(function () {
        $("#btn").click(function () {
            $.post(
                    "/BServlet",
                    {
                        name : "D",
                        des: "fd"
                    },
                    function (data) {
                        var _html = "";
                        alert(data);
                        $.each (data,function (i,n) {
                            _html += '<tr><td>'+n.name+'</td>'+
                                            '<td>'+n.age+'</td>'+
                                    '<td>'+n.sex+'</td></th>';
                        });
                        $("#tb").html(_html);

                    },
                    'json'
            );

        });


    })
    
</script>
</body>
</html>
