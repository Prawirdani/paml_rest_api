import 'package:vania/vania.dart';

class CreateOrdersTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('orders', () {
      bigIncrements("order_num");
      primary("order_num");
      date("order_date", nullable: false);
      bigInt("cust_id", unsigned: true);
      foreign("cust_id", "customers", "cust_id", onDelete: "CASCADE");
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('orders');
  }
}
