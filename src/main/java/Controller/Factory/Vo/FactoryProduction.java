package Controller.Factory.Vo;

public class FactoryProduction {

  private String factoryName;
  private int totalCathodeProduction;
  private int totalAnodeProduction;

  public FactoryProduction(String factoryName, int totalCathodeProduction, int totalAnodeProduction) {
    this.factoryName = factoryName;
    this.totalCathodeProduction = totalCathodeProduction;
    this.totalAnodeProduction = totalAnodeProduction;
  }

  public FactoryProduction(int totalCathodeProduction, int totalAnodeProduction) {
    this.totalCathodeProduction = totalCathodeProduction;
    this.totalAnodeProduction = totalAnodeProduction;
  }


  public String getFactoryName() {
    return factoryName;
  }

  public void setFactoryName(String factoryName) {
    this.factoryName = factoryName;
  }

  public int getTotalCathodeProduction() {
    return totalCathodeProduction;
  }

  public void setTotalCathodeProduction(int totalCathodeProduction) {
    this.totalCathodeProduction = totalCathodeProduction;
  }

  public int getTotalAnodeProduction() {
    return totalAnodeProduction;
  }

  public void setTotalAnodeProduction(int totalAnodeProduction) {
    this.totalAnodeProduction = totalAnodeProduction;
  }

  // getters and setters ...

  @Override
  public String toString() {
    return "FactoryProduction{" +
        "factoryName='" + factoryName + '\'' +
        ", totalCathodeProduction=" + totalCathodeProduction +
        ", totalAnodeProduction=" + totalAnodeProduction +
        '}';
  }
}