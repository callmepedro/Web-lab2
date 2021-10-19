package Components;

public class HitData {
    private final double x;
    private final double y;
    private final double r;
    private final String curTime;
    private final double execTime;
    private final boolean result;

    public HitData(double x, double y, double r, String curTime, double execTime, boolean result) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.curTime = curTime;
        this.execTime = execTime;
        this.result = result;
    }

    public String getString(){
        return String.format("<tr>" +
                "<td>%.3f</td>" +
                "<td>%.3f</td>" +
                "<td>%.3f</td>" +
                "<td>%s</td>" +
                "<td>%.3f</td>" +
                "<td>%b</td>" +
                "</tr>",  getX(), getY(), getR(), getCurTime(), getExecTime(), getResult());
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public String getCurTime() {
        return curTime;
    }

    public double getExecTime() {
        return execTime;
    }

    public boolean getResult() {
        return result;
    }
}
