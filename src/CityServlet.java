import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * Created by dllo on 17/9/27.
 */
@WebServlet("/CityServlet")
public class CityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        System.out.println("---------post--------");
        Analysis analysis = new Analysis();
        List<China> chinas = analysis.ana();

        for (China china : chinas) {
            System.out.println(china);
        }

        JSONArray array = JSONArray.fromObject(chinas);
        response.getWriter().print(array.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
    }
}