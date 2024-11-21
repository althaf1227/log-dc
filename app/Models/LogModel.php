<?php

namespace App\Models;

use CodeIgniter\Model;

class LogModel extends Model
{
    protected $table = "Log_masuk";
    protected $primaryKey = 'LogId';
    protected $allowedFields = [
        'LogTanggal',
        'LogNama',
        'LogInstansi',
        'LogNomorHp',
        'LogEmail',
        'LogKeperluan',
        'LogJamMasuk',
        'LogJamKeluar',
        'LogPersetujuan',
        'LogCatatan',
        'LogStatus',
        'LogGambar'
    ];

    protected $useTimestamps = true;
    protected $createdField = 'LogInsert';
    protected $updatedField = 'LogUpdate';


    public function getcountrequest(){
        return $this->db->table('log_masuk')
        ->where('LogStatus','request')
        ->countAllResults(); 
    }

    public function getcountproses(){
        return $this->db->table('log_masuk')
        ->where('LogStatus','in process')
        ->countAllResults(); 
    }
    
    public function getcountcompleted(){
        return $this->db->table('log_masuk')
        ->where('LogStatus','completed')
        ->countAllResults(); 
    }
    public function getCountPengunjung(){
        return $this->db->table('Log_masuk')
        ->select('MONTH(LogTanggal) AS Bulan, COUNT(*) AS JumlahPengunjung')
        ->groupBy('Bulan')
        ->get()
        ->getResultArray();
    }

    function getGrafikPerStatus(){
        return $this->db->table('log_masuk')
        ->select('LogStatus, COUNT(DISTINCT LogId) AS total')
        ->groupBy('LogStatus')
        ->get()
        ->getResultArray();
    }

    public function getLatestVisitors(){
        return $this->db->table('log_masuk')
        ->select('LogNama, LogStatus, LogJamMasuk, LogJamKeluar, LogTanggal')
        ->orderBy('LogInsert', 'DESC')
        ->limit(3)
        ->get()
        ->getResultArray(); 
    }

    public function getRuangStatus(){
        $result = $this->db->table($this->table)
            ->where('LogStatus', 'in process')
            ->countAllResults();

        if ($result > 0) {
            return 'Digunakan';
        }

        return 'Kosong';
    }
}
