import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dllo on 17/9/27.
 */
@WebServlet("/BServlet")
public class BServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        Person per1 = new Person("haha",21,"men");
        Person per2 = new Person("xixi",35,"women");
        Person per3 = new Person("lala",32,"men");

        List list = new ArrayList();
        list.add(per1);
        list.add(per2);
        list.add(per3);
        JSONArray jsonArray = JSONArray.fromObject(list);
        System.out.println(jsonArray.toString());
        response.getWriter().print(jsonArray.toString());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        Person per = new Person("haha",21,"men");

        JSONObject jsonObject = JSONObject.fromObject(per);

        System.out.println(jsonObject.toString());

        response.getWriter().print(jsonObject.toString());

    }
}