package Controller.Production;

import Controller.Production.Vo.ProductionStatusUpdateRequest;
import Service.ProductionService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "null")
@RequestMapping("production")
public class ProductionAction {

  private final ProductionService productionService;

  public ProductionAction() {
    this.productionService = new ProductionService();
  }

  @PostMapping("updateStatus")
  public boolean updateStatus(@RequestBody ProductionStatusUpdateRequest request) {
    System.out.println(request);
    productionService.updateProductionStatus(request);
    return true;
  }
}
