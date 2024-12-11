### Tugas REST API PAML (Pengembangan Aplikasi Mobile Lanjut)
Example simple REST API using [Vania](https://vdart.dev/docs/intro).

#### Pre-requisite
- [Vania CLI](https://vdart.dev/docs/Getting%20Started)
- [Dart](https://dart.dev/get-dart) v3.0.0 or higher
- MySQL/MariaDB

#### To Run This Project
1. Clone repositori ini
2. Buat sebuah database kosong (MariaDB/MySQL)
3. Masuk ke direktori project dan install dependencies dengan perintah `dart pub get`
4. Rename `.env.example` ke `.env` dan sesuaikan konfigurasi database (DB).
5. Jalankan migrasi dengan perintah `vania migrate`
6. Gunakan perintah `vania serve` untuk menjalankan server
7. Download [Postman Collection](./PAML_REST_API.postman_collection.json), import ke Postman, dan gunakan collection tersebut untuk testing API
