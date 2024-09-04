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
        'LogStatus'
    ];

    protected $useTimestamps = true;
    protected $createdField = 'LogInsert';
    protected $updatedField = 'LogUpdate';

    public function getStatusEnum()
    {
        
        return ['request', 'in process', 'completed'];
    }
}