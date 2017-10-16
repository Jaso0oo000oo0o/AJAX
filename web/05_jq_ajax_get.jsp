<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 下午3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>get</title>
    <script src="jquery-3.2.1.js"></script>
</head>
<body>
<button id="btn">点我</button>
<script>
    $(function () {
        $("#btn").click(function () {


            $.get(
                    "${pageContext.request.contextPath}/BServlet",
                    function (data) {
                        alert(data.name);
                    },
                    'json'
            );


            <%--$.getJSON("${pageContext.request.contextPath}/BServlet",--%>
            <%--function (data,status,xhr) {--%>
            <%--alert(data.sex+","+status+","+xhr.status+","+xhr.statusText)--%>
            <%--})--%>

//            $.ajax({
//                url: "/BServlet", dataType: "json", type: "get", data: "name=a",
//                success: function (data) {
//                    alert(typeof(data));
//                }, error: function (msg) {
//                    alert("错误" + msg.status + "," + msg.statusText);
//                }
//            })

        })
    })


</script>
</body>
</html>
