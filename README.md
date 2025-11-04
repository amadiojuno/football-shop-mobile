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