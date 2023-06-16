package Dao;

import java.time.LocalDateTime;

public class Ratiom {
    private int id;
    private float lithium;
    private float nickel;
    private float cobalt;
    private float manganese;
    private float aluminium;
    private LocalDateTime createdTs;

    //getter & setter

    public Ratiom(int id, float lithium, float nickel, float cobalt, float manganese, float aluminium,LocalDateTime createdTs){
        this.id = id;
        this.lithium = lithium;
        this.nickel = nickel;
        this.cobalt = cobalt;
        this.manganese = manganese;
        this.aluminium = aluminium;
        this.createdTs = createdTs;
    }

    public int getId(){return  id;}
    public float getLithium(){return lithium;}
    public float getNickel(){return nickel;}
    public float getCobalt(){return cobalt;}
    public float getManganese(){return manganese;}
    public float getaluminium(){return aluminium;}
    public void setCreatedTs(LocalDateTime createdTs) {
        this.createdTs = createdTs;
    }

    @Override
public String toString() {
    return "Ratiom{" +
            "id=" + id +
            ", lithium='" + lithium + '\'' +
            ", nickel='" + nickel + '\'' +
            ", cobalt='" + cobalt + '\'' +
            ", manganese='" + manganese + '\'' +
            ", aluminium='" + aluminium + '\'' +
            ", createdTs=" + createdTs +
            '}';
}


}
