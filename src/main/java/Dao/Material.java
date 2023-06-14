package Dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Material {
  private int id;

  private String name;

  private LocalDateTime createdTs;

  // getters and setters

  public Material(int id, String name, LocalDateTime createdTs) {
    this.id = id;
    this.name = name;
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

  public LocalDateTime getCreatedTs() {
    return createdTs;
  }

  public void setCreatedTs(LocalDateTime createdTs) {
    this.createdTs = createdTs;
  }

  @Override
  public String toString() {
    return "Material{" +
        "id=" + id +
        ", name='" + name + '\'' +
        ", createdTs=" + createdTs +
        '}';
  }
}
