package Pack01;


class Person {

  String id;
  Integer pw;

  Person() {
  }

  public Person(String id, Integer pw) {
    this.id = id;
    this.pw = pw;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public Integer getPw() {
    return pw;
  }

  public void setPw(Integer pw) {
    this.pw = pw;
  }
}