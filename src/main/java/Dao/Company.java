package Dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Company {
  private int id;

  private String name;

  private int category;

  private String introduction;

  private String location;

  private int totalCathodeQty;

  private int totalAnodeQty;

  private LocalDateTime createdTs;

  public Company(int id, String name, int category, String introduction, String location, int totalCathodeQty, int totalAnodeQty,
      LocalDateTime createdTs) {
    this.id = id;
    this.name = name;
    this.category = category;
    this.introduction = introduction;
    this.location = location;
    this.totalCathodeQty = totalCathodeQty;
    this.totalAnodeQty = totalAnodeQty;
    this.createdTs = createdTs;
  }

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

  public LocalDateTime getCreatedTs() {
    return createdTs;
  }

  public void setCreatedTs(LocalDateTime createdTs) {
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

  // getters and setters
}
