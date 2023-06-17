package Dao;

import Util.DatabaseUtil;
import Util.MongoUtil;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
public class LogDao {

  @Autowired
  private MongoDatabase mongoDatabase;
  public LogDao() {
    this.mongoDatabase = MongoUtil.getMongoDatabase();
  }
  public void saveLog(Log log) {
    MongoCollection<Document> collection = mongoDatabase.getCollection("log");
    collection.insertOne(log.getLog());
  }

  public List<Document> findAll(){
    MongoCollection<Document> collection = mongoDatabase.getCollection("log");
    FindIterable<Document> docs = collection.find().sort(new Document("timestamp", -1));;
    List<Document> documents = new ArrayList<>();
    for (Document doc : docs) {
      if(doc.get("message") != null){
      documents.add(doc);
      }
    }
    return documents;
  }
}
