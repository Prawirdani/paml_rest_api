import 'package:paml_rest_api/app/http/controllers/customers_controller.dart';
import 'package:paml_rest_api/app/http/controllers/orders_controller.dart';
import 'package:paml_rest_api/app/http/controllers/products_controller.dart';
import 'package:paml_rest_api/app/http/controllers/vendors_controller.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    // Vendors Routes
    Router.group(
      () {
        Router.get("/", VendorsController().index);
        Router.post("/", VendorsController().store);
        Router.get("/{id}", VendorsController().show);
        Router.put("/{id}", VendorsController().update);
        Router.delete("/{id}", VendorsController().destroy);
      },
      prefix: "/vendors",
    );

    // Products Routes
    Router.group(
      () {
        Router.get("/", ProductsController().index);
        Router.post("/", ProductsController().store);
        Router.get("/{id}", ProductsController().show);
        Router.put("/{id}", ProductsController().update);
        Router.delete("/{id}", ProductsController().destroy);
        Router.post("/{productId}/notes", ProductsController().storeNote);
        Router.put(
          "/{productId}/notes/{noteId}",
          ProductsController().updateNote,
        );
        Router.delete(
          "/{productId}/notes/{noteId}",
          ProductsController().deleteNote,
        );
      },
      prefix: "/products",
    );

    // Customers Routes
    Router.group(
      () {
        Router.get("/", CustomersController().index);
        Router.post("/", CustomersController().store);
        Router.get("/{id}", CustomersController().show);
        Router.put("/{id}", CustomersController().update);
        Router.delete("/{id}", CustomersController().destroy);
      },
      prefix: "/customers",
    );

    // Orders Routes
    Router.group(
      () {
        Router.get("/", OrdersController().index);
        Router.post("/", OrdersController().store);
        Router.get("/{orderNum}", OrdersController().show);
        Router.delete("/{orderNum}", OrdersController().destroy);
        Router.post("/{orderNum}/items", OrdersController().storeItem);
        Router.put(
          "/{orderNum}/items/{itemId}",
          OrdersController().updateItem,
        );
        Router.delete(
          "/{orderNum}/items/{itemId}",
          OrdersController().destroyItem,
        );
      },
      prefix: "/orders",
    );

    Router.get("/ping", () {
      return Response.json({"message": "Hello Vania"});
    });
  }
}
