<?php

namespace App\Models;

use CodeIgniter\Model;

class ShieldAuthGroupUsersModel extends Model {

    protected $table = 'auth_groups_users';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType = 'object';
    // protected $useSoftDeletes = true;

    protected $allowedFields = [
        'user_id',
        'group'
        
    ];

    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    // protected $updatedField = 'MenuUpdatedAt';
    // protected $deletedField = 'deleted_at';

    // protected $validationRules = [];
    // protected $validationMessages = [];
    // protected $skipValidation = false;

    
}