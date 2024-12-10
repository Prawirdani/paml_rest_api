import 'package:vania/vania.dart';

class CreateProductsNotesTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('products_notes', () {
      bigIncrements("note_id");
      primary("note_id");
      bigInt("prod_id", unsigned: true);
      foreign("prod_id", "products", "prod_id", onDelete: "CASCADE");
      date("note_date");
      text("note_text");
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('products_notes');
  }
}
