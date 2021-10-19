import Components.HitList;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ControllerServlet", value = "/entry")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher;
        if (request.getParameter("x-value") != null &&
                request.getParameter("y-value") != null &&
                request.getParameter("r-value") != null){

            dispatcher = request.getRequestDispatcher("AreaCheckServlet");
        }
        else if (request.getParameter("clear-table") != null) {
            dispatcher = request.getRequestDispatcher("ClearTableServlet");
        }
        else {
            dispatcher = request.getRequestDispatcher("index.jsp");
        }
        dispatcher.forward(request, response);
    }
}
