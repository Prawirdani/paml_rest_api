import 'package:vania/vania.dart';

class CreateProductsTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('products', () {
      bigIncrements('prod_id');
      primary("prod_id");
      bigInt('vend_id', unsigned: true);
      foreign(
        "vend_id",
        "vendors",
        "vend_id",
        onDelete: "CASCADE",
      );
      string('prod_name', unique: true, length: 25);
      integer('prod_price');
      text('prod_desc');
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('products');
  }
}
