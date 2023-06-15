package Controller.Order.Vo;

import java.util.List;

public class OrderStatusUpdateRequest {

  private List<Integer> orderId;
  private int status;

  public List<Integer> getOrderId() {
    return orderId;
  }

  public void setOrderId(List<Integer> orderId) {
    this.orderId = orderId;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  @Override
  public String toString() {
    return "OrderStatusUpdateRequest{" +
        "orderId=" + orderId +
        ", status=" + status +
        '}';
  }

  // getters and setters
}
