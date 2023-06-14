package Dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Factory {
  private int id;

  private String name;

  private String location;

  private int cathodeProduction;

  private int anodeProduction;

  private int cathodeStock;

  private int anodeStock;

  private LocalDateTime createdTs;

  // getters and setters


  public Factory(int id, String name, String location, int cathodeProduction, int anodeProduction, int cathodeStock, int anodeStock,
      LocalDateTime createdTs) {
    this.id = id;
    this.name = name;
    this.location = location;
    this.cathodeProduction = cathodeProduction;
    this.anodeProduction = anodeProduction;
    this.cathodeStock = cathodeStock;
    this.anodeStock = anodeStock;
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

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public int getCathodeProduction() {
    return cathodeProduction;
  }

  public void setCathodeProduction(int cathodeProduction) {
    this.cathodeProduction = cathodeProduction;
  }

  public int getAnodeProduction() {
    return anodeProduction;
  }

  public void setAnodeProduction(int anodeProduction) {
    this.anodeProduction = anodeProduction;
  }

  public int getCathodeStock() {
    return cathodeStock;
  }

  public void setCathodeStock(int cathodeStock) {
    this.cathodeStock = cathodeStock;
  }

  public int getAnodeStock() {
    return anodeStock;
  }

  public void setAnodeStock(int anodeStock) {
    this.anodeStock = anodeStock;
  }

  public LocalDateTime getCreatedTs() {
    return createdTs;
  }

  public void setCreatedTs(LocalDateTime createdTs) {
    this.createdTs = createdTs;
  }

  @Override
  public String toString() {
    return "Factory{" +
        "id=" + id +
        ", name='" + name + '\'' +
        ", location='" + location + '\'' +
        ", cathodeProduction=" + cathodeProduction +
        ", anodeProduction=" + anodeProduction +
        ", cathodeStock=" + cathodeStock +
        ", anodeStock=" + anodeStock +
        ", createdTs=" + createdTs +
        '}';
  }
}
