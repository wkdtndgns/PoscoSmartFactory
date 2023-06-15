package Dao;

import java.sql.Date;
import java.text.DecimalFormat;
import java.time.LocalDateTime;

public class Order {

  private int id;

  private int companyId;

  private int factoryId;

  private int materialId;

  private int qty;

  private float purchasePrice;

  private Date orderDate;

  private Date expectedDeliveryDate;

  private int status;

  private LocalDateTime createdTs;

  private String companyName;

  private String factoryName;
  private String materialName;

  private int cathodeProduction;

  private int anodeProduction;

  public Order(int companyId, int factoryId, int materialId, int qty, float purchasePrice, Date orderDate, Date expectedDeliveryDate, int status) {
    this.companyId = companyId;
    this.factoryId = factoryId;
    this.materialId = materialId;
    this.qty = qty;
    this.purchasePrice = purchasePrice;
    this.orderDate = orderDate;
    this.expectedDeliveryDate = expectedDeliveryDate;
    this.status = status;
  }

  public Order(int id, int companyId, int factoryId, int materialId, int qty, float purchasePrice, Date orderDate, Date expectedDeliveryDate,
      int status, LocalDateTime createdTs, String companyName, String factoryName, String materialName) {
    this.id = id;
    this.companyId = companyId;
    this.factoryId = factoryId;
    this.materialId = materialId;
    this.qty = qty;
    this.purchasePrice = purchasePrice;
    this.orderDate = orderDate;
    this.expectedDeliveryDate = expectedDeliveryDate;
    this.status = status;
    this.createdTs = createdTs;
    this.companyName = companyName;
    this.factoryName = factoryName;
    this.materialName = materialName;
  }

  public Order(int id, int companyId, int factoryId, int materialId, int qty, int cathodeProduction, int anodeProduction) {
    this.id = id;
    this.companyId = companyId;
    this.factoryId = factoryId;
    this.materialId = materialId;
    this.qty = qty;
    this.cathodeProduction = cathodeProduction;
    this.anodeProduction = anodeProduction;
  }
  // getters and setters


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

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getCompanyId() {
    return companyId;
  }

  public void setCompanyId(int companyId) {
    this.companyId = companyId;
  }

  public int getFactoryId() {
    return factoryId;
  }

  public void setFactoryId(int factoryId) {
    this.factoryId = factoryId;
  }

  public int getMaterialId() {
    return materialId;
  }

  public void setMaterialId(int materialId) {
    this.materialId = materialId;
  }

  public int getQty() {
    return qty;
  }

  public void setQty(int qty) {
    this.qty = qty;
  }

  public float getPurchasePrice() {
    return purchasePrice;
  }

  public String getPurchasePriceToString() {
    DecimalFormat formatter = new DecimalFormat("#,###");
    return formatter.format(this.purchasePrice);
  }

  public void setPurchasePrice(float purchasePrice) {
    this.purchasePrice = purchasePrice;
  }

  public Date getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(Date orderDate) {
    this.orderDate = orderDate;
  }

  public Date getExpectedDeliveryDate() {
    return expectedDeliveryDate;
  }

  public void setExpectedDeliveryDate(Date expectedDeliveryDate) {
    this.expectedDeliveryDate = expectedDeliveryDate;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public LocalDateTime getCreatedTs() {
    return createdTs;
  }

  public void setCreatedTs(LocalDateTime createdTs) {
    this.createdTs = createdTs;
  }

  public String getCompanyName() {
    return companyName;
  }

  public void setCompanyName(String companyName) {
    this.companyName = companyName;
  }

  public String getFactoryName() {
    return factoryName;
  }

  public void setFactoryName(String factoryName) {
    this.factoryName = factoryName;
  }

  public String getMaterialName() {
    return materialName;
  }

  public void setMaterialName(String materialName) {
    this.materialName = materialName;
  }

  @Override
  public String toString() {
    return "Order{" +
        "id=" + id +
        ", companyId=" + companyId +
        ", factoryId=" + factoryId +
        ", materialId=" + materialId +
        ", qty=" + qty +
        ", purchasePrice=" + purchasePrice +
        ", orderDate=" + orderDate +
        ", expectedDeliveryDate=" + expectedDeliveryDate +
        ", status=" + status +
        ", createdTs=" + createdTs +
        ", companyName='" + companyName + '\'' +
        ", factoryName='" + factoryName + '\'' +
        ", materialName='" + materialName + '\'' +
        ", cathodeProduction=" + cathodeProduction +
        ", anodeProduction=" + anodeProduction +
        '}';
  }
}