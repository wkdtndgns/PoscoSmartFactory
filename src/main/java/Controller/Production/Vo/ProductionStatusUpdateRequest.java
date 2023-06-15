package Controller.Production.Vo;

import java.util.List;

public class ProductionStatusUpdateRequest {

  private List<Integer> orderNo;
  private List<Integer> productionIds;
  private int status;

  public List<Integer> getProductionIds() {
    return productionIds;
  }

  public void setProductionIds(List<Integer> productionIds) {
    this.productionIds = productionIds;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public List<Integer> getOrderNo() {
    return orderNo;
  }

  public void setOrderNo(List<Integer> orderNo) {
    this.orderNo = orderNo;
  }

  @Override
  public String toString() {
    return "ProductionStatusUpdateRequest{" +
        "orderNo=" + orderNo +
        ", productionIds=" + productionIds +
        ", status=" + status +
        '}';
  }
}
