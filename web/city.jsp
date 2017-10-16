<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 下午7:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>city</title>
    <script src="jquery-3.2.1.js"></script>
</head>
<body>
<select name="province" id="p">
    <option value="0">请选择</option>
</select>省/直辖市
<select name="city" id="c">
    <option value="0" >请选择</option>
</select>市/区
</body>
<script>
$(function () {
    $.post(
            "/CityServlet",
            {
                name : "D",
                body: "d"
            },
            function (data) {
                var _html = "";
                alert(data);
                $.each(data,function (i,n) {
                    _html += '<option value='+n.province+' >'+n.province+'</option>';

                });
                $("#p").append(_html);
            },
            'json'
    );
    $("#p").change(function () {
        $("#c").children("option").detach();
        var indexProv = $("#p>option:selected").index();
        if (indexProv>0){

            $.post(
                    "/CityServlet",
                    {
                        name : "D",
                        body: "d"
                    },
                    function (data) {
                        $.each(data[indexProv-1].city,function (i,n) {
                            $("#c").append('<option value='+n+'>'+n+'</option>');
                        });
                    },
                    'json'
            );

        }

    });

})



</script>
</html>
