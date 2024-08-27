<?php

namespace App\Models;

use CodeIgniter\Model;

class MyAdminMenuModel extends Model {

    protected $table = 'my_admin_menu';
    protected $primaryKey = 'MenuId';

    protected $useAutoIncrement = true;

    protected $returnType = 'object';
    // protected $useSoftDeletes = true;

    protected $allowedFields = [
        'MenuParentId',
        'MenuName',
        'MenuUrl',
        'MenuHasSubmenu',
        'MenuIcon',
        'MenuOrder',
        'MenuIsShow',
        'MenuCreatedBy',
        'MenuUpdatedBy',
    ];

    protected $useTimestamps = true;
    protected $createdField = 'MenuCreatedAt';
    protected $updatedField = 'MenuUpdatedAt';
    // protected $deletedField = 'deleted_at';

    // protected $validationRules = [];
    // protected $validationMessages = [];
    // protected $skipValidation = false;

    public function getByMenuParentId($MenuParentId) {
        $this->where('my_admin_menu.MenuParentId', $MenuParentId);
        return $this;
    }

    public function getIsMenuParent() {
        $this->groupStart();
        $this->where('my_admin_menu.MenuParentId', null);
        $this->orWhere('my_admin_menu.MenuParentId', '0');
        $this->groupEnd();
        return $this;
    }

    public function getSortMenuNameAsc() {
        $this->orderBy('my_admin_menu.MenuName', 'ASC');
        return $this;
    }

    public function getSortMenuOrderAsc() {
        $this->orderBy('my_admin_menu.MenuOrder', 'ASC');
        return $this;
    }
}