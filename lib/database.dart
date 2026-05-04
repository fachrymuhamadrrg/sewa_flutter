import 'package:drift/drift.dart';

part 'database.g.dart';

class Alats extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get price => text()();
  TextColumn get location => text()();
  TextColumn get imageUrl => text()();
}

@DriftDatabase(tables: [Alats, Sesssions])
class MyDatabase extends _$MyDatabase {
  MyDatabase(super.e);

  @override
  int get schemaVersion => 1;
}

class Sesssions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text()();
  BoolColumn get isLoggedIn => boolean().withDefault(const Constant(true))();
}
