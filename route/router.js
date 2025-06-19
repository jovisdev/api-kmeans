import express from "express";
import { deleteUser, getUsers, login, register } from "../controller/users.js";
import { inputNilai, hapusNilai, dataNilai } from "../controller/nilai.js";
import { clusteringKMeans } from "../controller/kmeans.js";
import { addMapel, changeMapel, dataMapel, deleteMapel } from "../controller/dataMapel.js";
import { addSiswa, changeSiswa, dataSiswa, deleteSiswa } from "../controller/dataSiswa.js";


const router = express.Router();

// users
router.post('/login', login)
router.post('/register', register)
router.get('/users', getUsers)
router.delete('/deleteuser/:userId', deleteUser)

// mapel
router.post('/addmapel', addMapel)
router.put('/changemapel/:mapelId', changeMapel)
router.delete('/deletemapel/:mapelId', deleteMapel)
router.get('/mapel', dataMapel)

// siswa
router.post('/addsiswa', addSiswa)
router.put('/changesiswa/:siswaId', changeSiswa)
router.delete('/deletesiswa/:siswaId', deleteSiswa)
router.get('/siswa', dataSiswa)

// nilai
router.post('/addnilai', inputNilai)
router.delete('/hapusnilai', hapusNilai)
router.get('/datanilai', dataNilai)

// report
// router.get('/getreport', getReport)
// router.post('/addreport', addReport)

// perhitungan
router.post('/clusteringkmeans', clusteringKMeans)
// router.get('/dataresult/:laporan_id', getResult)
// router.post('/addresult', addResult)
// router.delete('/deleteresult/:laporan_id', resetResult)

export default router;