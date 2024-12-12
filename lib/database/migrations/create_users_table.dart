import 'package:vania/vania.dart';

class CreateUserTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('users', () {
      id();
      string('name');
      string('email');
      string('password');
      dateTime("created_at", nullable: false);
      dateTime("updated_at", nullable: true);
      dateTime("deleted_at", nullable: true);
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('users');
  }
}
