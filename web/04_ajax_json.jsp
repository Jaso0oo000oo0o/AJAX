<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 下午2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>json</title>
</head>
<body>
<button id="btn1">点我~get</button>
<button id="btn2">点我~post</button>
<h1 id="hh"></h1>
</body>
<script>
    function createXMLHttpRequest() {
        try {
            return new XMLHttpRequest();//大多数浏览器
        } catch (e) {
            try {
                return ActvieXObject("Msxml2.XMLHTTP");//IE6.0
            } catch (e) {
                try {
                    return ActvieXObject("Microsoft.XMLHTTP");//IE5.5及更早版本
                } catch (e) {
                    alert("哥们儿，您用的是什么浏览器啊？");
                    throw e;
                }
            }
        }
    }
    document.getElementById("btn1").onclick = function () {
        var xmlHttp = createXMLHttpRequest();
        xmlHttp.open("get","/BServlet",true);
        xmlHttp.send(null);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.status == 200 && xmlHttp.readyState == 4){
                var text = xmlHttp.responseText;
                alert(text);
                var t = eval("("+text+")");
                alert(text);
                document.getElementById("hh").innerHTML  = t.name+t.age+t.sex;
            }

        }
    }

    document.getElementById("btn2").onclick = function () {
        var xmlHttp = createXMLHttpRequest();
        xmlHttp.open("post","/BServlet",true);
        xmlHttp.setRequestHeader("Context-Type","application/x-www-form-urlencoded");
        xmlHttp.send("uname=jaso&pwd=12345");
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.status == 200 && xmlHttp.readyState == 4){
                var text = xmlHttp.responseText;
                var t = eval("("+text+")");
                document.getElementById("hh").innerHTML  = t[0].name+t[0].age+t[0].sex+"&"+t[1].name+t[1].age+t[1].sex;
            }

        }

    }
</script>
</html>
