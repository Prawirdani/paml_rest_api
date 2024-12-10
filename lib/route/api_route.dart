import 'package:paml_rest_api/app/http/controllers/vendors_controller.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    // Vendors Routes
    Router.get("/vendors", VendorsController().index);
    Router.post("/vendors", VendorsController().store);
    Router.get("/vendors/{id}", VendorsController().show);
    Router.put("/vendors/{id}", VendorsController().update);
    Router.delete("/vendors/{id}", VendorsController().destroy);

    Router.get("/ping", () {
      return Response.json({"message": "Hello Vania"});
    });
  }
}
