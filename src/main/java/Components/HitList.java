package Components;

import java.util.ArrayList;
import java.util.List;

public class HitList {
    private List<HitData> hitList;

    public HitList(){
        this.hitList = new ArrayList<>();
    }

    public HitList(List<HitData> hitList){
        this.hitList = hitList;
    }

    public List<HitData> getHitList() {
        return hitList;
    }

    public void setHitList(List<HitData> hitList) {
        this.hitList = hitList;
    }
}
