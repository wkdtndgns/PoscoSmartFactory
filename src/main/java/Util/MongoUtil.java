package Util;

import Service.LogService;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class MongoUtil {
  private static MongoClient mongoClient;
  private LogService logService;
  private static MongoDatabase mongoDatabase;

  public static MongoClient getMongoClient() {
    if (mongoClient == null) {
      AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(MongoConfig.class);
      mongoClient = context.getBean(MongoClient.class);
    }
    return mongoClient;
  }

  public static MongoDatabase getMongoDatabase() {
    if (mongoDatabase == null) {
      mongoDatabase = getMongoClient().getDatabase("SmartFactory");
    }
    return mongoDatabase;
  }
}
