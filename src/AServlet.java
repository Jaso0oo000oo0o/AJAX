import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by dllo on 17/9/27.
 */
@WebServlet("/AServlet")
public class AServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        System.out.println("post!!!");
        response.getWriter().print("你是电音之王!"+request.getParameter("username"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        System.out.println("接到ajax的请求!");
        // 向客户端响应数据
        response.getWriter().print("{\"name\":\"大大\",\"age\":\"21\",\"sex\":\"men\"}");

    }
}