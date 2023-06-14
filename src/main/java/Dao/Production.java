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

  // getters and setters
}