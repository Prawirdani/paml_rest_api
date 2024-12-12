import 'dart:io';
import 'package:paml_rest_api/database/migrations/create_personal_access_tokens_table.dart';
import 'package:paml_rest_api/database/migrations/create_users_table.dart';
import 'package:vania/vania.dart';
import 'create_customers_table.dart';
import 'create_vendors_table.dart';
import 'create_products_table.dart';
import 'create_products_notes_table.dart';
import 'create_orders_table.dart';
import 'create_order_items_table.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
    await CreateUserTable().up();
    await CreatePersonalAccessTokensTable().up();
    await CreateCustomersTable().up();
    await CreateVendorsTable().up();
    await CreateProductsTable().up();
    await CreateProductsNotesTable().up();
    await CreateOrdersTable().up();
    await CreateOrderItemsTable().up();
  }

  dropTables() async {
    await CreateOrderItemsTable().down();
    await CreateOrdersTable().down();
    await CreateProductsNotesTable().down();
    await CreateProductsTable().down();
    await CreateVendorsTable().down();
    await CreateCustomersTable().down();
    await CreatePersonalAccessTokensTable().down();
    await CreateUserTable().down();
  }
}
