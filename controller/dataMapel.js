import { query } from "../database/config.js"

// Controller untuk menambahkan data mapel
export const addMapel = async (req, res) => {
        const { mapelin } = req.body;

        // Query untuk menambahkan data ke tabel
        const insertMapelQuery = `
            INSERT INTO data_mapel (mapel)
            VALUES (?)
        `;

    try {
        // Eksekusi query
        await query(insertMapelQuery,[mapelin]);
        res.status(201).json({ message: 'Data Mapel berhasil ditambahkan.' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Terjadi kesalahan pada server.' });
    }
};

// Controller untuk mengubah data mapel
export const changeMapel = async (req, res) => {
    const { mapelId } = req.params;  // ID dari tugas yang ingin di-update
    const { mapel } = req.body;

    // Query untuk menambahkan data ke tabel
    const updateMapelQuery = `
        UPDATE data_mapel
        SET mapel = ?
        WHERE id = ?
    `;

    try {
        // Eksekusi query
        const result = await query(updateMapelQuery,[mapel, mapelId]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Data tidak ditemukan' });
        }
        res.status(201).json({ message: 'Data berhasil diubah.' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Terjadi kesalahan pada server.' });
    }
};


// menampilkan seluruh data
export const dataMapel = async (req,res) => {
    
    // query tampilkan data
    const selectMapel = 'SELECT * FROM data_mapel'

    try{
        const result = await query(selectMapel)
        res.status(200).json(result)
    }catch(error){
        res.status(500).json({message: 'Terjadi kesalahan pada server.'})
    }
}

// hapus mapel
export const deleteMapel = async (req, res) => {
    const { mapelId } = req.params; // ID dari mapel yang ingin dihapus

    const getMapelQuery = `SELECT mapel FROM data_mapel WHERE id = ?`;

    const deleteMapeldQuery = `DELETE FROM data_mapel WHERE id = ?`;
    try {
        // Ambil nama mapel terlebih dahulu
        const [mapel] = await query(getMapelQuery, mapelId);

        // Hapus mapel
        await query(deleteMapeldQuery, mapelId);

        // Kirim respons sukses dengan nama mapel
        res.status(200).json({message: `Data Mapel ${mapel.mapel} berhasil dihapus.`});
    } catch (error) {
        console.error('Error:', error); // Log kesalahan untuk debugging
        res.status(500).json({ message: 'Terjadi kesalahan pada server.' });
    }
};
