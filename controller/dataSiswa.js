import { query } from "../database/config.js";

// Controller untuk menambahkan data siswa
export const addSiswa = async (req, res) => {
    try {
        const { nis, nama, kelamin, kelas } = req.body;

        // Validasi input
        if (!nis || !nama || !kelamin || !kelas) {
            return res.status(400).json({ message: 'Semua data harus diisi.' });
        }

        // Query untuk menambahkan data ke tabel Siswa
        const insertDataQuery = `
            INSERT INTO data_siswa (nis, nama, kelamin, kelas)
            VALUES (?, ?, ?, ?)
        `;

        // Eksekusi query
        await query(insertDataQuery, [nis, nama, kelamin, kelas]);

        res.status(201).json({ message: 'Data berhasil ditambahkan.' });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ message: 'Terjadi kesalahan pada server.', error: error.message });
    }
};

// Controller untuk mengubah data siswa
export const changeSiswa = async (req, res) => {
    const { siswaId } = req.params;  // ID dari siswa yang ingin di-update
    const {nis, nama, kelamin, kelas} = req.body;

    // Query untuk menambahkan data ke tabel
    const updateDataQuery = `
        UPDATE data_siswa
        SET nis = ?, nama = ?, kelamin = ?, kelas = ?
        WHERE id = ?
    `;

    try {
        // Eksekusi query
        const result = await query(updateDataQuery,[nis, nama, kelamin, kelas, siswaId]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Data tidak ditemukan' });
        }
        res.status(201).json({ message: 'Data berhasil diubah.' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Terjadi kesalahan pada server.' });
    }
};

// hapus data siswa
export const deleteSiswa = async (req, res) => {
    const { siswaId } = req.params; // ID dari siswa yang ingin dihapus

    const getSiswaQuery = `SELECT nama FROM data_siswa WHERE id = ?`;

    const deleteSiswaQuery = `DELETE FROM data_siswa WHERE id = ?`;

    try {
        // Ambil nama data terlebih dahulu
        const [siswa] = await query(getSiswaQuery, siswaId);

        // Hapus data
        await query(deleteSiswaQuery, siswaId);

        // Kirim respons sukses dengan nama data
        res.status(200).json({message: `data ${siswa.nama} berhasil dihapus.`});
    } catch (error) {
        console.error('Error:', error); // Log kesalahan untuk debugging
        res.status(500).json({ message: 'Terjadi kesalahan pada server.' });
    }
};

export const dataSiswa = async (req,res) => {
    
    // query tampilkan data
    const selectSiswa = 'SELECT * FROM data_siswa ORDER BY nama asc'

    try{
        const result = await query(selectSiswa)
        res.status(200).json(result)
    }catch(error){
        res.status(500).json({message: 'Terjadi kesalahan pada server.'})
    }
}
