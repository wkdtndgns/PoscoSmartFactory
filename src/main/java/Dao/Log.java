package Dao;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import org.bson.Document;

public class Log {

  private Document log;
  private LocalDateTime createdTs;
  public Log(String message) {
    LocalDateTime localDateTimeNow = LocalDateTime.now();

    log = new Document("message", message)
        .append("year", localDateTimeNow.format(DateTimeFormatter.ofPattern("yyyy")))
        .append("month", localDateTimeNow.format(DateTimeFormatter.ofPattern("MM")))
        .append("day", localDateTimeNow.format(DateTimeFormatter.ofPattern("dd")))
        .append("timestamp", localDateTimeNow.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS")));
  }

  public Document getLog() {
    return log;
  }
}
