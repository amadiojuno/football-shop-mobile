# football_shop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Tugas Individu 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
    - Widget tree adalah struktur hierarki widget di Flutter yang membentuk UI. Setiap widget memiliki hubungan parent-child dimana parent mengontrol posisi dan ukuran child dan child mewarisi properties dari parent (seperti tema, styling). Widget disusun secara nested dari root hingga leaf nodes
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    - MaterialApp menyediakan tema, routing, dll
    - ThemeData - Mendefinisikan tema aplikasi (warna, font, dll)
    - ColorScheme - Mengatur skema warna aplikasi dengan primary dan secondary colors
    - Scaffold - Menyediakan struktur dasar halaman dengan AppBar, body, dan elemen layout lainnya
    - AppBar - Bar di bagian atas aplikasi yang menampilkan judul "BeliBola"
    - Text - Menampilkan teks (judul, nama, npm, content, dll)
    - Padding - Memberikan jarak/padding di sekeliling widget child
    - Column - Menyusun widget secara vertikal
    - Row - Menyusun widget secara horizontal (untuk menampilkan 3 InfoCard)
    - SizedBox - Memberikan jarak/spacing vertikal atau horizontal antar widget
    - Center - Menempatkan widget child di tengah
    - GridView.count - Membuat grid layout dengan jumlah kolom tetap (3 kolom)
    - Card - Membuat kotak kartu dengan bayangan (digunakan di InfoCard)
    - Container - Widget wrapper yang mengatur ukuran, padding, dan dekorasi
    - Material - Memberikan efek Material Design pada widget (warna, border radius)
    - InkWell - Memberikan efek ripple saat widget ditekan
    - Icon - Menampilkan ikon (shopping_cart, mood, logout)
    - MediaQuery - Mengakses informasi device (lebar layar) untuk responsive design
    - ScaffoldMessenger - Menampilkan SnackBar untuk notifikasi
    - SnackBar - Menampilkan pesan sementara di bagian bawah layar
3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    - MaterialApp adalah widget root yang menyediakan tema, navigator, lokal/route dan konfigurasi aplikasi berbasis Material Design
    - Sering digunakan sebagai widget root karena membungkus seluruh aplikasi dengan Material Design system, menyediakan context global untuk tema dan navigasi, dan merupakan standar untuk aplikasi Android/iOS modern
4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
    - StatelessWidget: Tidak memiliki state yang berubah, UI statis/tetap, contoh: Text, Icon, label
    - StatefulWidget: Memiliki state yang bisa berubah (mutable), UI dinamis/interaktif, contoh: form, button dengan counter, animasi
5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
    - Object yang menyimpan lokasi widget dalam widget tree
    - Penting karena akses ke parent widget properties (tema, media query), navigasi antar halaman, menampilkan dialog/snackbar, digunakan di method build() untuk render widget berdasarkan context
6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
    - Hot reload: reload kode dan mempertahankan state runtime, cepat untuk perubahan UI/logika kecil.
    - Hot restart: muat ulang seluruh aplikasi dari awal, state akan hilang, dipakai jika perubahan struktur inisialisasi atau state global.

Tugas Individu 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
    - Navigator.push(): Menambahkan halaman baru ke atas stack navigasi, halaman sebelumnya tetap ada di stack, user bisa kembali ke halaman sebelumnya dengan tombol back, Untuk navigasi dari menu utama ke halaman semua produk dan tambah produk, user perlu bisa kembali ke menu
    - Navigator.pushReplacement(): Mengganti halaman saat ini dengan halaman baru, halaman sebelumnya dihapus dari stack, user tidak bisa kembali ke halaman sebelumnya, untuk logout atau setelah submit form berhasil dan user tidak perlu kembali ke halaman sebelumnya
2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
    - Scaffold sebagai container utama di semua halaman
    - AppBar untuk menampilkan judul aplikasi "BeliBola" dengan warna konsisten
    - Drawer navigasi antar halaman
3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
    - Padding: Memberikan spacing konsisten
    - SingleChildScrollView: Menghindari overflow saat keyboard muncul atau konten panjang
    - ListView: Efisien untuk list panjang dengan lazy loading
    - Menggunakan GridView.count untuk untuk menampilkan items dalam grid, yang serupa dengan ListView namun dalam format grid
4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
    - Theme.of(context).colorScheme.primary di AppBar di menu.dart, sehingga semua halaman akan mengikuti tema yang sama.

Tugas Individu 9
 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
    - Model mengubah JSON mentah menjadi objek Dart yang aman. Tanpa model, kita kehilangan fitur type-safety (rawan crash karena salah tipe data), null-safety, dan autocomplete kode, membuat aplikasi sulit dikelola (maintainability rendah).
 2. Apa fungsi package http dan CookieRequest? Jelaskan perbedaan peran http vs CookieRequest.
    - http: Library standar untuk kirim request (GET/POST), tapi tidak menyimpan sesi (stateless).
    - CookieRequest: Library tambahan yang membungkus http untuk menyimpan cookies/session secara otomatis, agar status login pengguna tetap terjaga antar-request.
 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
    - Agar status login (session cookie) konsisten di seluruh aplikasi. Jika dibuat instance baru di setiap halaman, cookie hilang, dan pengguna dianggap logout oleh server.
 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
    - 10.0.2.2: Agar emulator Android bisa akses localhost komputer.
    - CORS & SameSite: Agar server Django mengizinkan request dari "domain" luar (aplikasi mobile).
    - Izin Internet: Agar Android mengizinkan aplikasi mengakses jaringan.
    - Tanpa ini: Koneksi gagal atau ditolak server.
 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
    - Input di Form Flutter 
    - JSON 
    - POST ke Django 
    - Simpan di DB 
    - GET dari Django 
    - JSON 
    - Objek Dart (Model) 
    - Tampil di UI Flutter.
 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    - Register:
        - Input data di Flutter 
        - Kirim ke Django 
        - Django buat akun di DB 
        - Sukses 
        - Flutter arahkan ke halaman Login
    - Login:
        - Input username/password di Flutter 
        - Kirim via CookieRequest 
        - Django validasi & kirim Cookie Session 
        - CookieRequest simpan Cookie (status logged in) 
        - Flutter pindah ke Menu Utama
    - Logout:
        - Klik Logout
        - Request ke Django bawa Cookie 
        - Django hapus sesi server 
        - Flutter hapus Cookie lokal 
        - Kembali ke halaman Login
7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!
    - Menyiapkan autentikasi di Django**  
    - Menambahkan app `authentication` ke `INSTALLED_APPS`.  
    - Membuat URL `/auth/login/`, `/auth/register/`, dan `/auth/logout/` di `authentication/urls.py`.  
    - Membuat view:
        - `register`: menerima JSON `username`, `password1`, `password2`, validasi, lalu membuat `User` baru dan membalas `JsonResponse` status sukses/gagal.  
        - `login`: memakai `authenticate` dan `login` dari Django, jika benar mengirim `JsonResponse` berisi `status`, `message`, `username`, dan menyimpan session di cookie.  
        - `logout`: memanggil `logout` Django, menghapus sesi, lalu kirim JSON status.  
    - Mengaktifkan CORS (`django-cors-headers`), mengatur `ALLOWED_HOSTS` (termasuk `10.0.2.2`), serta pengaturan cookie (`SESSION_COOKIE_SAMESITE`, dll.) agar bisa diakses dari Flutter.

    - Membuat model Django dan endpoint JSON**  
    - Di `main/models.py` membuat model `Product` dengan field seperti `name`, `price`, `description`, `thumbnail`, `category`, `is_featured`, dan `user` (ForeignKey ke `User`).  
    - Membuat view JSON:
        - `show_json`: mengembalikan semua produk.  
        - `show_json_by_id`: detail satu produk.  
        - `show_json_my_products`: `Product.objects.filter(user=request.user)` untuk hanya produk milik user login.  
    - Mendaftarkan path ini di `main/urls.py`, misalnya `/json/`, `/json/<id>/`, `/json/my-products/`.

    - Membuat model Dart sesuai model Django**  
    - Di Flutter, membuat file `lib/models/product_entry.dart` dengan class `ProductEntry` yang memetakan field Django (`name`, `price`, `description`, `thumbnail`, `category`, `is_featured`, dll.).  
    - Menambahkan `factory ProductEntry.fromJson(Map<String, dynamic> json)` untuk mengubah JSON dari Django menjadi objek Dart.  
    - Menambahkan `toJson()` jika perlu mengirim data kembali ke Django.

    - Membuat halaman Register di Flutter 
    - Membuat `RegisterPage` (`lib/screens/register.dart`) dengan tiga `TextEditingController` (username, password, konfirmasi).  
    - Membungkus input di `Form` dengan validator sederhana (tidak kosong, password sama).  
    - Mengambil instance `CookieRequest` dari `Provider`.  
    - Saat tombol Register ditekan:
        - Memanggil `request.postJson("http://10.0.2.2:8000/auth/register/", jsonEncode({...}))`.  
        - Jika `response['status'] == true`, tampilkan `SnackBar` dan `Navigator.pushReplacement` ke `LoginPage`.  
        - Jika gagal, tampilkan pesan error di dialog/SnackBar.

    - Membuat halaman Login di Flutter
    - Membuat `LoginPage` (`lib/screens/login.dart`) dengan username & password field.  
    - Menggunakan `CookieRequest.login("http://10.0.2.2:8000/auth/login/", {...})`.  
    - Jika login berhasil (`request.loggedIn == true`):
        - Menampilkan pesan selamat datang berdasarkan `response['message']`.  
        - `Navigator.pushReplacement` ke `MyHomePage` (menu utama).  
    - Jika gagal, menampilkan dialog dengan pesan error dari backend.

    - Membagi instance CookieRequest ke seluruh aplikasi
    - Di `main.dart`, membungkus `MaterialApp` dengan `Provider(create: (_) => CookieRequest())`.  
    - Di semua halaman (login, register, list produk, dll.) mengambil `CookieRequest` dari `context.watch<CookieRequest>()`, sehingga cookie session Django tersimpan dan dipakai otomatis di setiap request.  
    - Menambahkan menu Logout di `LeftDrawer` yang memanggil `request.logout("http://10.0.2.2:8000/auth/logout/")`, lalu mengarahkan kembali ke `LoginPage`.

    - Membuat halaman daftar semua item (All Products)
    - Membuat `ProductEntryListPage` (`lib/screens/product_entry_list.dart`).  
    - Menulis fungsi `fetchProducts(CookieRequest request)` yang:
        - Memanggil `request.get("http://10.0.2.2:8000/json/")`.  
        - Mengonversi list JSON ke list `ProductEntry` dengan `ProductEntry.fromJson`.  
    - Menggunakan `FutureBuilder<List<ProductEntry>>` di `build`:
        - Menampilkan loading saat future belum selesai.  
        - Jika kosong, menampilkan teks bahwa belum ada produk.  
        - Jika ada data, menampilkan grid/list `ProductEntryCard`.  
    - Di `ProductEntryCard` (`lib/widgets/product_entry_card.dart`), menampilkan minimal:
        - `name`  
        - `price`  
        - potongan `description`  
        - gambar `thumbnail` dengan `Image.network`  
        - `category`  
        - label `is_featured` (misalnya chip “Featured”).

    - Membuat halaman detail item
    - Membuat `ProductDetailPage` (`lib/screens/product_detail.dart`) yang menerima `ProductEntry product` lewat konstruktor.  
    - Di `build`, menampilkan semua field produk:
        - Gambar `thumbnail`.  
        - `name`, `brand`, `category`.  
        - `price`, `description`, `rating`, `views`, `is_featured`, dsb.  
    - Menambahkan tombol back:
        - Mengandalkan tombol back default `AppBar` (`Navigator.pop(context)`), atau  
        - Tombol `ElevatedButton` “Back to Products” di bagian bawah.  
    - Menghubungkan dengan halaman list:
        - Di `ProductEntryListPage`, saat card ditekan, gunakan  
        `Navigator.push(MaterialPageRoute(builder: (_) => ProductDetailPage(product: product)))`.

   - Membuat halaman daftar item milik user (My Products)
   - Membuat `MyProductListPage` (`lib/screens/my_product_list.dart`).  
   - Menulis `fetchMyProducts(CookieRequest request)` yang:
        - Memanggil `request.get("http://10.0.2.2:8000/json/my-products/")`.  
        - Mengonversi hasilnya ke `List<ProductEntry>` seperti sebelumnya.  
   - Menampilkan hasilnya dengan `FutureBuilder` + `ProductEntryCard`.  
   - Menambahkan navigasi ke halaman ini:
        - Dari menu utama (`menu.dart`): item “My Products” pada grid.  
        - Dari `LeftDrawer`: `ListTile` yang `onTap`-nya `Navigator.push` ke `MyProductListPage`.  
   - Karena endpoint menggunakan `request.user`, hanya produk milik user login yang muncul, sehingga filter “produk milik pengguna yang login” terpenuhi.