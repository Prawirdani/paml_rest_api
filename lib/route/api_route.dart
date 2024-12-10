import 'package:paml_rest_api/app/http/controllers/customers_controller.dart';
import 'package:paml_rest_api/app/http/controllers/products_controller.dart';
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

    // Products Routes
    Router.get("/products", ProductsController().index);
    Router.post("/products", ProductsController().store);
    Router.get("/products/{id}", ProductsController().show);
    Router.put("/products/{id}", ProductsController().update);
    Router.delete("/products/{id}", ProductsController().destroy);
    Router.post("/products/{productId}/notes", ProductsController().storeNote);
    Router.put(
      "/products/{productId}/notes/{noteId}",
      ProductsController().updateNote,
    );
    Router.delete(
      "/products/{productId}/notes/{noteId}",
      ProductsController().deleteNote,
    );

    // Customers Routes
    Router.get("/customers", CustomersController().index);
    Router.post("/customers", CustomersController().store);
    Router.get("/customers/{id}", CustomersController().show);
    Router.put("/customers/{id}", CustomersController().update);
    Router.delete("/customers/{id}", CustomersController().destroy);

    Router.get("/ping", () {
      return Response.json({"message": "Hello Vania"});
    });
  }
}
