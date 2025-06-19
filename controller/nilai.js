import { query } from "../database/config.js";

export const inputNilai = async (req, res) => {
    try {
        const dataNilai = req.body;
        if (!Array.isArray(dataNilai) || dataNilai.length === 0) {
            return res.status(400).json({ message: 'Data tidak boleh kosong.' });
        }

        for (const { siswa_id, mapel_id, nilai } of dataNilai) {

            // Validasi input
            if (!siswa_id || mapel_id == null || nilai == null) {
                return res.status(400).json({ message: 'Semua data harus diisi.' });
            }

            // Validasi apakah mapel_id ada di tabel mapel
            const [mapel] = await query('SELECT id, mapel FROM data_mapel WHERE id = ?', [mapel_id]);
            if (!mapel) {
                return res.status(404).json({ message: `Data Mapel dengan ID ${mapel_id} tidak ditemukan.` });
            }

            // Validasi apakah siswa_id ada di tabel siswa
            const [siswa] = await query('SELECT id, nama FROM data_siswa WHERE id = ?', [siswa_id]);
            if (!siswa) {
                return res.status(404).json({ message: `Data dengan ID ${siswa_id} tidak ditemukan.` });
            }

            // Mengecek apakah penilaian sudah ada untuk mapel_id dan siswa_id
            const [existingValue] = await query('SELECT id FROM data_nilai WHERE siswa_id = ? AND mapel_id = ?', [siswa_id, mapel_id]);

            if (existingValue) {
                // Jika penilaian sudah ada, lakukan UPDATE
                const updateQuery = 'UPDATE data_nilai SET nilai = ? WHERE id = ?';
                await query(updateQuery, [nilai, existingValue.id]);
            } else {
                // Jika penilaian belum ada, lakukan INSERT
                const insertQuery = 'INSERT INTO data_nilai (siswa_id, mapel_id, nilai) VALUES (?, ?, ?)';
                await query(insertQuery, [siswa_id, mapel_id, nilai]);
            }
        }

        res.status(200).json({
            message: 'Data berhasil diproses (ditambahkan atau diperbarui).',
        });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ message: 'Terjadi kesalahan pada server.', error: error.message });
    }
};

export const hapusNilai = async (req, res) => {
    // Query untuk menghapus data penilaian
    const deleteNilaiQuery = `
        DELETE FROM data_nilai
    `;

    try {
        // Eksekusi query
        const result = await query(deleteNilaiQuery);
        res.status(200).json({ message: 'Data nilai berhasil dihapus.', result });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Terjadi kesalahan pada server.' });
    }
}

// export const konversiPenilaian = async (req,res) => {
    
//     // query tampilkan data
//     const selectPenilaian = 'SELECT * FROM penilaian'

//     try{
//         const result = await query(selectPenilaian)
//         res.status(200).json(result)
//     }catch(error){
//         res.status(500).json({message: 'Terjadi kesalahan pada server.'})
//     }
// }

export const dataNilai = async (req,res) => {
    
    // query tampilkan data
    const selectNilai = `
    SELECT p.id, p.siswa_id, p.mapel_id, p.nilai 
    FROM data_nilai p 
    INNER JOIN data_mapel k ON p.mapel_id = k.id;
`;

    try{
        const result = await query(selectNilai)
        res.status(200).json(result)
    }catch(error){
        res.status(500).json({message: 'Terjadi kesalahan pada server.'})
    }
}


