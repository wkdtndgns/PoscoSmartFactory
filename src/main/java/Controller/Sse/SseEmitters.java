package Controller.Sse;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public class SseEmitters {

  private final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();

  private int count = 0;

  SseEmitter add(SseEmitter emitter) {
    this.emitters.add(emitter);
    emitter.onCompletion(() -> {
      this.emitters.remove(emitter);    // 만료되면 리스트에서 삭제
    });
    emitter.onTimeout(() -> {
      emitter.complete();
    });

    return emitter;
  }

  public void count() {
    count++;
    emitters.forEach(emitter -> {
      try {
        emitter.send(SseEmitter.event()
            .name("count")
            .data(count));
      } catch (IOException e) {
        throw new RuntimeException(e);
      }
    });
  }
}
