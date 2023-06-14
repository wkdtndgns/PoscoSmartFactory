package Domain;

import javax.persistence.*;
import java.sql.Timestamp;

// For Companies
@Entity
@Table(name = "t_companies")
public class Company {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  private String name;

  private int category;

  private String introduction;

  private String location;

  private int totalCathodeQty;

  private int totalAnodeQty;

  private Timestamp createdTs;


  // getters and setters

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getCategory() {
    return category;
  }

  public void setCategory(int category) {
    this.category = category;
  }

  public String getIntroduction() {
    return introduction;
  }

  public void setIntroduction(String introduction) {
    this.introduction = introduction;
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public int getTotalCathodeQty() {
    return totalCathodeQty;
  }

  public void setTotalCathodeQty(int totalCathodeQty) {
    this.totalCathodeQty = totalCathodeQty;
  }

  public int getTotalAnodeQty() {
    return totalAnodeQty;
  }

  public void setTotalAnodeQty(int totalAnodeQty) {
    this.totalAnodeQty = totalAnodeQty;
  }

  public Timestamp getCreatedTs() {
    return createdTs;
  }

  public void setCreatedTs(Timestamp createdTs) {
    this.createdTs = createdTs;
  }

  @Override
  public String toString() {
    return "Company{" +
        "id=" + id +
        ", name='" + name + '\'' +
        ", category=" + category +
        ", introduction='" + introduction + '\'' +
        ", location='" + location + '\'' +
        ", totalCathodeQty=" + totalCathodeQty +
        ", totalAnodeQty=" + totalAnodeQty +
        ", createdTs=" + createdTs +
        '}';
  }
}
