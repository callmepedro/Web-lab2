import Components.HitData;
import Components.HitList;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "AreaCheckServlet", value = "/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            long startTime = System.nanoTime();

            String xValueStr = request.getParameter("x-value");
            String yValueStr = request.getParameter("y-value");
            String rValueStr = request.getParameter("r-value");

            xValueStr = xValueStr.length() > 10 ? xValueStr.substring(0, 10) : xValueStr;
            yValueStr = yValueStr.length() > 10 ? yValueStr.substring(0, 10) : yValueStr;
            rValueStr = rValueStr.length() > 10 ? rValueStr.substring(0, 10) : rValueStr;


            double xValue = Double.parseDouble(xValueStr);
            double yValue = Double.parseDouble(yValueStr);
            double rValue = Double.parseDouble(rValueStr);

            boolean result = checkHitResult(xValue, yValue, rValue);

            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
            String curTime = dateFormat.format(new Date());
            double execTime = (double) (System.nanoTime() - startTime) / 1000000;
            HitData hitData = new HitData(xValue, yValue, rValue, curTime, execTime, result);

            HttpSession session = request.getSession();

            HitList hitList = (HitList) session.getAttribute("hitList");
            if (hitList == null) {
                hitList = new HitList();
            }
            hitList.getHitList().add(hitData);
            session.setAttribute("hitList", hitList);

            PrintWriter writer = response.getWriter();
            writer.println(hitData.getString());

        } catch (NumberFormatException e){
            response.sendError(403, "Invalid value. " + e.getMessage());
        }
    }

    private boolean checkHitResult(double x, double y, double r) {
        return checkTriangle(x, y, r) || checkRectangle(x, y, r) || checkCircle(x, y, r);
    }

    private boolean checkTriangle(double x, double y, double r){
        return x <= 0 && y <= 0 && x + 2*y >= -r;
    }

    private boolean checkRectangle(double x, double y, double r){
        return x >= 0 && x <= r/2 && y <= 0 && y >= -r;
    }

    private boolean checkCircle(double x, double y, double r){
        return x >= 0 && y >= 0 && x*x + y*y <= r*r/4;
    }
}




