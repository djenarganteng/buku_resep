# Product Requirements Document

## 1. Ringkasan Produk

**Nama Produk:** Resep Nusantara  
**Platform:** Android (Flutter)  
**Versi Dokumen:** 1.0  
**Tanggal:** 8 Mei 2026  

Resep Nusantara adalah aplikasi mobile yang membantu pengguna menemukan, menyimpan, dan menjelajahi resep makanan khas Indonesia berdasarkan nama masakan, daerah asal, dan bahan. Aplikasi ini dirancang untuk menghadirkan pengalaman eksplorasi kuliner Nusantara yang hangat, mudah dipakai, dan relevan untuk kebutuhan memasak sehari-hari.

Produk menonjolkan kekayaan kuliner daerah Indonesia melalui:
- beranda editorial dengan rekomendasi resep
- katalog daerah Indonesia
- pencarian resep berdasarkan bahan, daerah, dan nama makanan
- detail resep yang lengkap
- koleksi resep tersimpan melalui bookmark

## 2. Latar Belakang

Banyak pengguna ingin memasak makanan Indonesia, tetapi kesulitan menemukan resep yang:
- mudah dicari berdasarkan bahan yang tersedia
- jelas asal daerahnya
- memiliki langkah yang cukup rinci
- bisa disimpan untuk dipakai kembali

Resep Nusantara dibuat untuk menjawab kebutuhan tersebut dengan fokus pada resep tradisional Indonesia dan pengalaman menjelajah yang sederhana di perangkat mobile.

## 3. Tujuan Produk

### Tujuan Utama
- Membantu pengguna menemukan resep makanan Indonesia dengan cepat.
- Membantu pengguna memilih masakan berdasarkan daerah asal, bahan, atau kategori waktu makan.
- Memberi pengalaman membaca resep yang nyaman dan lengkap.
- Mendorong pengguna menyimpan resep favorit ke halaman koleksi.

### Tujuan Bisnis / Distribusi
- Menyiapkan aplikasi untuk distribusi di Google Play Store.
- Menyediakan aplikasi showcase yang punya identitas visual kuat dan mudah dipahami pengguna baru.

## 4. Target Pengguna

### Persona 1: Mahasiswa / Anak Kost
- Ingin mencari resep praktis dari bahan yang tersedia.
- Membutuhkan langkah yang jelas dan sederhana.
- Sering mencari resep berdasarkan kata kunci bahan seperti `telur`, `ayam`, atau `santan`.

### Persona 2: Ibu Rumah Tangga / Pengguna Harian
- Ingin inspirasi menu sarapan, siang, malam, dan minuman.
- Menyimpan resep favorit untuk dimasak ulang.
- Lebih tertarik pada resep tradisional yang familiar.

### Persona 3: Pengguna yang Suka Kuliner Nusantara
- Tertarik menjelajahi resep berdasarkan daerah di Indonesia.
- Ingin mengetahui ragam hidangan khas tiap wilayah.

## 5. Problem Statement

Pengguna membutuhkan aplikasi resep Indonesia yang:
- tidak membingungkan saat pertama dipakai
- punya pencarian yang fleksibel
- menyajikan resep lokal Indonesia, bukan resep global umum
- memungkinkan penyimpanan resep favorit

## 6. Nilai Utama Produk

- **Lokal:** fokus pada makanan khas Indonesia
- **Mudah dicari:** bisa berdasarkan bahan, daerah, atau nama makanan
- **Lengkap:** detail bahan dan langkah tidak terlalu pendek
- **Personal:** resep favorit bisa disimpan di koleksi

## 7. Scope Produk

### In Scope
- Login dan daftar akun lokal
- Beranda dengan identitas visual kuliner Nusantara
- Katalog resep pilihan editor
- Katalog daerah Indonesia
- Halaman semua daerah
- Halaman resep per daerah
- Halaman jelajah dengan pencarian terpadu
- Bookmark resep
- Halaman koleksi resep tersimpan
- Halaman detail resep
- Halaman profil pengguna

### Out of Scope
- Backend online / sinkronisasi cloud
- Login dengan Google / Apple / nomor telepon
- Komentar, rating pengguna, dan ulasan komunitas
- Video memasak
- Keranjang belanja bahan
- Notifikasi push
- Fitur AI rekomendasi real-time

## 8. Fitur Utama

### 8.1 Autentikasi Lokal
Pengguna dapat:
- mendaftar dengan nama, email, dan password
- login menggunakan akun yang pernah dibuat
- melihat data profil yang mengikuti data saat daftar

Kebutuhan:
- user tidak bisa login jika belum pernah daftar
- user tidak bisa login jika email/password salah
- form tidak boleh kosong

### 8.2 Beranda
Beranda menjadi pintu utama eksplorasi resep.

Isi utama:
- hero quote bertema kuliner Indonesia
- jumlah total resep yang dapat diklik
- kolom pencarian yang mengarah ke Jelajah
- resep pilihan editor
- daftar daerah populer
- akses ke katalog semua daerah

### 8.3 Jelajah / Search
Halaman Jelajah adalah pusat pencarian resep.

Pencarian harus dapat menemukan resep berdasarkan:
- nama makanan
- nama daerah
- bahan

Kebutuhan:
- hasil tampil cepat dan relevan
- kata yang cocok disorot pada hasil
- hasil tetap nyaman dibaca pada layar mobile

### 8.4 Katalog Daerah
Pengguna dapat menjelajahi resep berdasarkan daerah Indonesia.

Kebutuhan:
- tersedia daftar daerah dengan tampilan rapi
- tersedia pencarian daerah
- tersedia filter per pulau
- saat daerah dipilih, pengguna melihat minimal 5 resep daerah tersebut

### 8.5 Detail Resep
Setiap resep harus punya:
- judul
- asal daerah
- kategori
- waktu memasak
- rating visual
- deskripsi
- daftar bahan yang lengkap
- langkah memasak yang rinci
- status bookmark

### 8.6 Bookmark dan Koleksi
Pengguna dapat:
- menyimpan resep dari detail resep
- melihat semua resep yang disimpan pada halaman Koleksiku
- menghapus resep dari koleksi

Kebutuhan:
- bookmark tersimpan lokal
- status bookmark konsisten di seluruh aplikasi

### 8.7 Profil
Pengguna dapat melihat dan memperbarui informasi akun lokal.

Kebutuhan:
- nama dan email mengikuti data akun tersimpan
- password field mendukung toggle show/hide

## 9. User Flow Utama

### Flow A: Pengguna Baru
1. Buka aplikasi
2. Masuk ke halaman Login
3. Pilih `Daftar`
4. Isi nama, email, password
5. Selesai daftar
6. Kembali ke Login
7. Login menggunakan akun yang baru dibuat
8. Masuk ke aplikasi

### Flow B: Cari Resep dari Bahan
1. Pengguna masuk ke aplikasi
2. Buka Jelajah atau tekan kolom cari dari Beranda
3. Ketik bahan, misalnya `santan`
4. Sistem menampilkan resep terkait
5. Pengguna membuka detail resep
6. Pengguna dapat bookmark resep

### Flow C: Jelajah Resep Daerah
1. Pengguna masuk ke Beranda
2. Pilih daerah atau buka katalog semua daerah
3. Buka daftar resep daerah
4. Pilih resep
5. Baca detail resep

### Flow D: Simpan Resep Favorit
1. Pengguna membuka detail resep
2. Tekan tombol bookmark / simpan resep
3. Buka tab `Koleksiku`
4. Resep muncul di daftar koleksi

## 10. Requirement Fungsional

### Autentikasi
- Sistem harus menyediakan halaman Login.
- Sistem harus menyediakan halaman Daftar.
- Sistem harus memvalidasi email dan password saat login.
- Sistem harus menyimpan akun lokal agar dapat dipakai login berulang.

### Resep
- Sistem harus menyediakan dataset resep Indonesia.
- Sistem harus menampilkan resep per kategori seperti sarapan, siang, malam, dan minuman.
- Sistem harus menampilkan resep per daerah.
- Setiap daerah harus memiliki minimal 5 resep.

### Pencarian
- Sistem harus mendukung pencarian berdasarkan nama resep.
- Sistem harus mendukung pencarian berdasarkan bahan.
- Sistem harus mendukung pencarian berdasarkan daerah.

### Koleksi
- Sistem harus menyimpan status bookmark secara lokal.
- Sistem harus menampilkan daftar resep yang dibookmark pada tab Koleksiku.

### Profil
- Sistem harus menampilkan nama dan email user aktif.
- Sistem harus mengizinkan perubahan data profil lokal.

## 11. Requirement Non-Fungsional

- Aplikasi harus responsif di layar mobile Android.
- Navigasi utama harus mudah dipahami pada penggunaan pertama.
- Waktu buka halaman utama harus terasa ringan pada perangkat menengah.
- Teks dan tombol harus terbaca jelas.
- Data lokal harus tetap tersedia setelah aplikasi ditutup dan dibuka kembali.

## 12. Desain dan UX Direction

### Arah Visual
- Nuansa hangat dan editorial
- Palet warna terinspirasi kuliner Nusantara
- Penekanan pada foto makanan
- Tampilan modern, lembut, dan ramah

### Prinsip UX
- Navigasi bawah sederhana: Beranda, Jelajah, Koleksiku
- Pencarian mudah diakses
- Resep detail harus nyaman dibaca tanpa terasa padat
- Bookmark harus terasa jelas dan konsisten

## 13. Metrik Keberhasilan

Metrik awal yang dapat digunakan:
- Persentase pengguna yang berhasil login setelah daftar
- Jumlah pencarian resep per sesi
- Jumlah resep yang dibuka dari Beranda
- Jumlah bookmark yang dibuat
- Jumlah pengguna yang membuka halaman daerah

## 14. Risiko dan Catatan

### Risiko Produk
- Data resep masih lokal dan belum terhubung backend
- Password saat ini disimpan lokal sehingga perlu peningkatan keamanan jika produk berkembang
- Skala dataset resep perlu terus dijaga agar konsisten kualitasnya

### Risiko Teknis
- Build Android release membutuhkan keystore yang aman dan konsisten
- Plugin tertentu dapat menimbulkan cache build yang tidak stabil di Windows

## 15. Kesiapan Rilis Play Store

Checklist minimum:
- package Android final
- release signing aktif
- app bundle `.aab`
- icon aplikasi final
- screenshot aplikasi
- deskripsi singkat dan panjang
- privacy policy
- data safety form

## 16. Pengembangan Selanjutnya

Prioritas berikutnya yang disarankan:
- sinkronisasi akun dan koleksi ke backend
- filter resep berdasarkan waktu masak
- filter resep berdasarkan tingkat kesulitan
- halaman rekomendasi personal
- mode offline yang lebih kuat
- fitur berbagi resep

## 17. Ringkasan Penutup

Resep Nusantara diposisikan sebagai aplikasi resep Indonesia yang sederhana, hangat, dan kaya identitas lokal. Fokus produk saat ini adalah memudahkan pengguna menemukan resep khas Indonesia melalui pencarian, eksplorasi daerah, dan penyimpanan resep favorit. Dengan fondasi fitur yang sudah ada, produk ini sudah layak dikembangkan lebih lanjut sebagai aplikasi showcase maupun distribusi publik di Play Store.
