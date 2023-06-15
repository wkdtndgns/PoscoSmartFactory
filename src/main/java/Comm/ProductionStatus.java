package Comm;

public enum ProductionStatus {
  IN_PROGRESS(10),
  COMPLETED(20);

  private final int status;

  ProductionStatus(int status) {
    this.status = status;
  }

  public int getStatus() {
    return this.status;
  }

  // 이 메소드는 주어진 정수 값에 해당하는 ProductionStatus를 반환합니다.
  // 만약 일치하는 ProductionStatus가 없다면 null을 반환합니다.
  public static ProductionStatus fromInt(int status) {
    for (ProductionStatus productionStatus : values()) {
      if (productionStatus.getStatus() == status) {
        return productionStatus;
      }
    }
    return null;
  }
}