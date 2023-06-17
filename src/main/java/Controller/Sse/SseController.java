package Controller.Sse;
import Service.SseEmittersService;
import java.util.Optional;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import java.io.IOException;

@RestController
@RequestMapping("sse")
public class SseController {
  private final SseEmittersService sseEmitters;

  public SseController() {
    sseEmitters = new SseEmittersService();
  }

  @GetMapping(value = "/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
  public ResponseEntity<SseEmitter> connect() {
    SseEmitter emitter = new SseEmitter();
    sseEmitters.add(emitter);
    try {
      emitter.send(SseEmitter.event()
          .name("connect")
          .data("connected!"));
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
    return ResponseEntity.ok(emitter);
  }

  @GetMapping("/success/{orderId}")
  public ResponseEntity<Void> success(@PathVariable Integer orderId) {
    sseEmitters.send("success",orderId);
    return ResponseEntity.ok().build();
  }

  @GetMapping("/danger/{orderId}")
  public ResponseEntity<Void> danger(@PathVariable Integer orderId) {
    sseEmitters.send("danger",orderId);
    return ResponseEntity.ok().build();
  }
}
