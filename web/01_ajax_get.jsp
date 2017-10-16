<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 上午10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>get</title>
</head>
<body>
<h1>谁是电音之王</h1>
<h1 id="hh"></h1>
<button id="btn">?</button>



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
    document.getElementById("btn").onclick = function () {
        alert("1");
        //1.创建异步对象
        var xmlHttp = createXMLHttpRequest();
        //2.打开与服务器的连接
        //  参数: 1.method: 请求方式 ; 2.  url    ; 3. 是否异步
        xmlHttp.open("get","/AServlet",true);
        //3.发送请求
        xmlHttp.send(null);
        //4.给异步对象添加事件监听
        xmlHttp.onreadystatechange = function () {
            // 当xmlHttp状态发生改变时
            //双重判断, 状态是4(服务器响应结束) 并且服务器响应状态码是200
            if (xmlHttp.status == 200 && xmlHttp.readyState == 4){
                //接收数据
                var text = xmlHttp.responseText;
                var t = eval("("+text+")");
                alert(text);
                document.getElementById("hh").innerHTML  = t.name+t.age+t.sex;
            }
        }

    }
</script>
</body>
</html>
