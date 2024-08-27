<?php

namespace App\Models;

use CodeIgniter\Model;

class ShieldAuthPermissionUsersModel extends Model {

    protected $table = 'auth_permissions_users';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType = 'object';
    // protected $useSoftDeletes = true;

    protected $allowedFields = [
        'user_id',
        'permission'
        
    ];

    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    // protected $deletedField = 'deleted_at';

    // protected $validationRules = [];
    // protected $validationMessages = [];
    // protected $skipValidation = false;

    
}