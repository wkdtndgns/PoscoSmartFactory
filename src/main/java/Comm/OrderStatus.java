package Comm;

public enum OrderStatus {
  진행중(10),
  발송(20),
  완료(30);

  private final int status;

  OrderStatus(int status) {
    this.status = status;
  }

  public int getStatus() {
    return this.status;
  }

  // 이 메소드는 주어진 정수 값에 해당하는 OrderStatus를 반환합니다.
  // 만약 일치하는 OrderStatus가 없다면 null을 반환합니다.
  public static OrderStatus fromInt(int status) {
    for (OrderStatus orderStatus : values()) {
      if (orderStatus.getStatus() == status) {
        return orderStatus;
      }
    }
    return null;
  }
}