-- nama : ilham parhadi
-- nim : 23241050
-- kelas : B

-- menggunakan datbase
USE pti_mart;
-- join
-- menaggabungkan dua buah tabel berdasarkan kolom yang sama

-- praktek 1
-- ambil nama pelanggan yang pernah bertrasnsaksi
-- artinya ambil kolom  kode_pelanggan, nama_pelanggan, dan qty dari
-- penggabungan tbale penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- praktek 2
-- mengabungkan dua tabel tanpa memperhatikan relation  keys
-- ambil nama pelanggan yang pernah bertransaksi beserta qty nya
-- menggabungkan tabel penjualan dan tabel pelanggan tanpa memperhatikan kolom yang menjadi primery key

SELECT tp.kode_pelanggan, mp.nama_pelanggan, qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON TRUE;

-- INTER JOIN
-- join yang mengambil dari dua sisi tabel yang berhubungan
-- Praktek 3
-- ambil kode pelanggan, nama produk, qty
-- dari hasil join tabel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk, tp.qty
FROM tr_penjualan as tp
INNER JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Latihan Mandiri
-- 1. Buatlah join untuk ketiga table yang terdapat pada dqlabmartbasic dengan INNER JOIN
SELECT * FROM ms_pelanggan p
JOIN tr_penjualan t
JOIN ms_produk pr ON TRUE;

-- 2. Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan, dan ms_produk yang terdapat pada dqlabmartbasic 
-- dengan LEFT JOIN, kemudian filter untuk qty yang tidak bisa bernilai NULL dengan operator IS NOT NULL
SELECT p.kode_pelanggan, p.nama_pelanggan, t.kode_transaksi, t.tgl_transaksi, t.qty, pr.kode_produk, pr.nama_produk, pr.kategori_produk,
    pr.harga AS harga_produk
FROM ms_pelanggan p
LEFT JOIN tr_penjualan t ON p.kode_pelanggan = t.kode_pelanggan
LEFT JOIN ms_produk pr ON t.kode_produk = pr.kode_produk
WHERE t.qty IS NOT NULL;
    
-- 3. Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan, dan ms_produk yang terdapat pada dqlabmartbasic
-- dengan INNER JOIN, kemudian tampilkan grouping untuk kolom kategori produk dan penjumlahan qty
SELECT pr.kategori_produk, SUM(t.qty) AS total_qty FROM ms_pelanggan AS p
INNER JOIN 
    tr_penjualan AS t ON p.kode_pelanggan = t.kode_pelanggan
INNER JOIN ms_produk AS pr ON t.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk;
    
-- 4. LATIHAN KHUSUS:Cobalah lakukan JOIN ms_produk dengan table ms_produk juga dengan kolom relationship
-- kode_produk (benar, Anda tidak salah baca) - ini kita lakukan join dengan table sendiri yang memang bisa dilakukan, jangan lupa untuk mengganti alias
SELECT 
    a.nama_produk AS produk_utama, 
    b.nama_produk AS produk_sekategori
FROM 
    ms_produk a
JOIN 
    ms_produk b 
    ON a.kategori_produk = b.kategori_produk 
    AND a.kode_produk != b.kode_produk;

