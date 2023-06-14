package Dao;

import java.sql.Date;
import java.sql.Timestamp;
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

  // getters and setters
}