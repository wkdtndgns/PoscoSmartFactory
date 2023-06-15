package Dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Material {
  private int id;

  private String name;
  private  String description;

  private LocalDateTime createdTs;

  // getters and setters

  public Material(int id, String name, String description, LocalDateTime createdTs) {
    this.id = id;
    this.name = name;
    this.description = description;
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

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
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
