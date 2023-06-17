package Service;

import Dao.Order;
import Dao.OrderDao;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.function.Consumer;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public class SseEmittersService {

  private final OrderDao orderDao = new OrderDao();
  private final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();

  public SseEmitter add(SseEmitter emitter) {
    this.emitters.add(emitter);
    emitter.onCompletion(() -> {
      this.emitters.remove(emitter);    // 만료되면 리스트에서 삭제
    });
    emitter.onTimeout(() -> {
      emitter.complete();
    });

    return emitter;
  }

  public void send(String type , Integer orderId) {
    Order order = orderDao.findById(orderId.toString());
    emitters.forEach(emitter -> {
      try {
        emitter.send(SseEmitter.event()
            .name(type)
            .data(order));
      } catch (IOException e) {
        throw new RuntimeException(e);
      }
    });
  }
}