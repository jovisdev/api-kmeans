import { query } from "../database/config.js";
import kMeansClustering from "../utils/kmeansmath.js";
import { euclideanDistance } from "../utils/kmeansmath.js";

export const clusteringKMeans = async (req, res) => {
  try {
    const dataQuery = `
      SELECT n.siswa_id, s.nama AS nama_siswa, n.mapel_id, m.mapel AS nama_mapel, n.nilai 
      FROM data_nilai n
      JOIN data_siswa s ON s.id = n.siswa_id
      JOIN data_mapel m ON m.id = n.mapel_id
      ORDER BY n.siswa_id, n.mapel_id
    `;
    const rawData = await query(dataQuery);

    if (!rawData.length) {
      return res.status(404).json({ message: 'Data tidak ditemukan.' });
    }

    // 1. Buat mapping mapelId -> nama mapel
    const mapelIdToNama = {};
    rawData.forEach(item => {
      mapelIdToNama[item.mapel_id] = item.nama_mapel;
    });
    const mapelIds = [...new Set(rawData.map(item => item.mapel_id))].sort((a, b) => a - b);
    const mapelLabels = mapelIds.map(id => mapelIdToNama[id]);

    // 2. Group data siswa dan info nama
    const grouped = {};
    const siswaInfo = {};
    rawData.forEach(item => {
      const id = item.siswa_id;
      if (!grouped[id]) grouped[id] = {};
      grouped[id][item.mapel_id] = parseFloat(item.nilai);
      siswaInfo[id] = item.nama_siswa;
    });

    // 3. Susun dataset numerik
    const siswaIds = Object.keys(grouped).map(id => parseInt(id)).sort((a, b) => a - b);
    const dataset = siswaIds.map(id =>
      mapelIds.map(fid => parseFloat(grouped[id]?.[fid] ?? 0))
    );


    const k = parseInt(req.body.k || '3');
    const centroidIds = req.body.centroid_ids || [];

    let initialCentroids = null;
    if (centroidIds.length === k) {
      initialCentroids = centroidIds.map(id =>
        mapelIds.map(fid => parseFloat(grouped[id]?.[fid] ?? 0))
      );
    }


    const { final_centroids, final_assignments, iterations } = kMeansClustering(dataset, k, initialCentroids);

    // const hasil_akhir = [];
    // for (let i = 0; i < k; i++) {
    //   const cluster = [];
    //   final_assignments.forEach((clusterIdx, idx) => {
    //     if (clusterIdx === i) {
    //       cluster.push({
    //         nama: siswaInfo[siswaIds[idx]],
    //         nilai_mapel: dataset[idx]
    //       });
    //     }
    //   });
    //   hasil_akhir.push(cluster);
    // }

    const hasil_akhir = [];
    for (let i = 0; i < k; i++) {
      const cluster = [];
      final_assignments.forEach((clusterIdx, idx) => {
        if (clusterIdx === i) {
          const point = dataset[idx];
          const distance = euclideanDistance(point, final_centroids[clusterIdx]);
          cluster.push({
            nama: siswaInfo[siswaIds[idx]],
            nilai_mapel: point,
            cluster: i,
            distance_to_centroid: distance
          });
        }
      });
      hasil_akhir.push(cluster);
    }

    return res.json({
      status: 'success',
      jumlah_iterasi: iterations.length,
      jumlah_cluster: k,
      mapel_labels: mapelLabels,
      final_centroids,
      hasil_pengelompokan: hasil_akhir // array of array per cluster
    });

  } catch (error) {
    console.error('KMeans Error:', error);
    res.status(500).json({ message: 'Terjadi kesalahan saat proses clustering.' });
  }
};





// import { query } from "../database/config.js";
// import kMeansClustering from "../utils/kmeansmath.js";

// export const clusteringKMeans = async (req, res) => {
//     try {
//       const dataQuery = `
//         SELECT siswa_id, mapel_id, nilai 
//         FROM data_nilai
//         ORDER BY siswa_id, mapel_id
//       `;
//       const rawData = await query(dataQuery);
  
//       if (!rawData.length) {
//         return res.status(404).json({ message: 'Data tidak ditemukan.' });
//       }
  
//       // Susun matriks data
//       const grouped = {};
//       rawData.forEach(item => {
//         const id = item.siswa_id;
//         if (!grouped[id]) grouped[id] = {};
//         grouped[id][item.mapel_id] = parseFloat(item.nilai);
//       });

//       const mapelIds = [...new Set(rawData.map(item => item.mapel_id))].sort((a, b) => a - b);
//       const dataset = Object.values(grouped).map(row =>
//         mapelIds.map(fid => row[fid] ?? 0)
//       );
  
//       const k = parseInt(req.query.k || '3');
//       const { final_centroids, final_assignments, iterations } = kMeansClustering(dataset, k);
  
//       return res.json({
//         status: 'success',
//         jumlah_cluster: k,
//         final_centroids,
//         final_assignments,
//         log_iterasi: iterations // ✅ log lengkap dikembalikan ke client
//       });
  
//     } catch (error) {
//       console.error('KMeans Error:', error);
//       res.status(500).json({ message: 'Terjadi kesalahan saat proses clustering.' });
//     }
//   };
  