package Comm;
public enum CompanyCategory {
  CAR(10, "자동차"),
  IT(20, "It"),
  ESS(30, "ESS"),
  BATTERY(40, "배터리");

  private final int code;
  private final String description;

  CompanyCategory(int code, String description) {
    this.code = code;
    this.description = description;
  }

  public static String getDescriptionByCode(int code) {
    for (CompanyCategory category : CompanyCategory.values()) {
      if (category.code == code) {
        return category.description;
      }
    }
    return "코드에 해당하는 카테고리가 없습니다.";
  }

  public int getCode() {
    return code;
  }

  public String getDescription() {
    return description;
  }
}

