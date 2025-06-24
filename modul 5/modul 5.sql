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