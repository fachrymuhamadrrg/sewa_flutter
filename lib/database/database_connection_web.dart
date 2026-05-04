import 'package:drift/drift.dart';

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    throw UnsupportedError(
        'Database SQLite dari drift dengan plugin saat ini belum dikonfigurasi untuk Web (membutuhkan sqlite3.wasm). '
        'Namun, UI aplikasi tetap bisa dijalankan untuk keperluan testing UI (Hot Reload Chrome). '
        'Pastikan tidak memanggil query ke database jika sedang menjalankan di Chrome.');
  });
}
