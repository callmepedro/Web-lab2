package Components;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Locale;

public class HitData implements Serializable {
    private double x;
    private double y;
    private double r;
    private String curTime;
    private double execTime;
    private boolean result;

    public HitData() {
        this.x = 0;
        this.y = 0;
        this.r = 0;
        this.curTime = "";
        this.execTime = 0;
        this.result = false;
    }

    public HitData(double x, double y, double r, String curTime, double execTime, boolean result) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.curTime = curTime;
        this.execTime = execTime;
        this.result = result;
    }

    public String getString(){
        String xString = String.valueOf(x);
        String yString = String.valueOf(y);
        String rString = String.valueOf(r);
        return String.format(Locale.ROOT, "<tr>" +
                "<td>%s</td>" +
                "<td>%s</td>" +
                "<td>%s</td>" +
                "<td>%s</td>" +
                "<td>%f</td>" +
                "<td>%b</td>" +
                "</tr>", xString, yString, rString, getCurTime(), getExecTime(), isResult());
    }


    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }

    public String getCurTime() {
        return curTime;
    }

    public void setCurTime(String curTime) {
        this.curTime = curTime;
    }

    public double getExecTime() {
        return execTime;
    }

    public void setExecTime(double execTime) {
        this.execTime = execTime;
    }

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }
}
