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


    public function gettanggal($tahun){
        return-$this->db->table('log_masuk')
        ->where('YEAR(LogTanggal)', $tahun); 
    }
}
