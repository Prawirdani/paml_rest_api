import 'package:vania/vania.dart';

class CreateOrderItemsTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('order_items', () {
      bigIncrements("order_item_id");
      primary("order_item_id");
      bigInt("order_num", unsigned: true);
      foreign("order_num", "orders", "order_num", onDelete: "CASCADE");
      bigInt("prod_id", unsigned: true);
      foreign("prod_id", "products", "prod_id", onDelete: "CASCADE");
      integer("quantity", nullable: false);
      integer("size");
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('order_items');
  }
}
