<?php

namespace App\Models;

use CodeIgniter\Model;

use CodeIgniter\Shield\Entities\User;

class MyAdminUsersMenuModel extends Model {

    protected $table = 'my_admin_users_menu';
    protected $primaryKey = 'UsersMenuId';

    protected $useAutoIncrement = true;

    protected $returnType = 'object';
    // protected $useSoftDeletes = true;

    protected $allowedFields = [
        'UsersMenuUsersId',
        'UsersMenuMenuId',
        'UsersMenuCreatedBy',
        'UsersMenuUpdatedBy',
    ];

    protected $useTimestamps = true;
    protected $createdField = 'UsersMenuCreatedAt';
    protected $updatedField = 'UsersMenuUpdatedAt';
    // protected $deletedField = 'deleted_at';

    // protected $validationRules = [];
    // protected $validationMessages = [];
    // protected $skipValidation = false;

    public function getByUsersId($UsersId) {
        $this->where('my_admin_users_menu.UsersMenuUsersId', $UsersId);
        return $this;
    }

    public function getByMenuId($MenuId) {
        $this->where('my_admin_users_menu.UsersMenuMenuId', $MenuId);
        return $this;
    }

    public function getMenuForUser(User $user): array
    {
        $rows = $this->builder()
            ->select('*')
            ->join('my_admin_menu', 'my_admin_menu.MenuId = my_admin_users_menu.UsersMenuMenuId', 'inner')
            ->where('my_admin_menu.MenuIsShow', '1')
            ->where('my_admin_users_menu.UsersMenuUsersId', $user->id)
            ->orderBy('my_admin_menu.MenuOrder', 'ASC')
            ->get()
            ->getResultArray();

        // return array_column($rows, 'MenuName');
        return $rows;
    }
}