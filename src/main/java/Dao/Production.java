package Dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Production {

  private int id;

  private int orderId;

  private int factoryId;

  private int qty;

  private Date startDate;

  private Date expectedCompletionDate;

  private int status;

  private LocalDateTime createdTs;

  private String orderNo;
  private String factoryName;

  private String companyName;
  private String materialName;
  public Production(int orderId, int factoryId, int qty, Date startDate, Date expectedCompletionDate, int status) {
    this.orderId = orderId;
    this.factoryId = factoryId;
    this.qty = qty;
    this.startDate = startDate;
    this.expectedCompletionDate = expectedCompletionDate;
    this.status = status;
  }

  public Production(int id, int orderId, int factoryId, int qty, Date startDate, Date expectedCompletionDate, int status, LocalDateTime createdTs,
      String orderNo, String factoryName,String companyName,String materialName) {
    this.id = id;
    this.orderId = orderId;
    this.factoryId = factoryId;
    this.qty = qty;
    this.startDate = startDate;
    this.expectedCompletionDate = expectedCompletionDate;
    this.status = status;
    this.createdTs = createdTs;
    this.orderNo = orderNo;
    this.factoryName = factoryName;
    this.companyName = companyName;
    this.materialName = materialName;
  }

  public String getCompanyName() {
    return companyName;
  }

  public void setCompanyName(String companyName) {
    this.companyName = companyName;
  }

  public String getMaterialName() {
    return materialName;
  }

  public void setMaterialName(String materialName) {
    this.materialName = materialName;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getOrderId() {
    return orderId;
  }

  public void setOrderId(int orderId) {
    this.orderId = orderId;
  }

  public int getFactoryId() {
    return factoryId;
  }

  public void setFactoryId(int factoryId) {
    this.factoryId = factoryId;
  }

  public int getQty() {
    return qty;
  }

  public void setQty(int qty) {
    this.qty = qty;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public Date getExpectedCompletionDate() {
    return expectedCompletionDate;
  }

  public void setExpectedCompletionDate(Date expectedCompletionDate) {
    this.expectedCompletionDate = expectedCompletionDate;
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

  public String getOrderNo() {
    return orderNo;
  }

  public void setOrderNo(String orderNo) {
    this.orderNo = orderNo;
  }

  public String getFactoryName() {
    return factoryName;
  }

  public void setFactoryName(String factoryName) {
    this.factoryName = factoryName;
  }

  // getters and setters
}