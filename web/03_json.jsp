<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 上午11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>json</title>
</head>
<body>
<script>
    var perStr = "{\"name\":\"大大\",\"age\":\"25\",\"sex\":\"男\"}";
    var per = eval("("+perStr+")");
    alert(per.name+","+per.age+","+per.sex);


</script>
</body>
</html>
