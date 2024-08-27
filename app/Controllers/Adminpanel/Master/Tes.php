<?php

namespace App\Controllers\Adminpanel\Master;

use App\Controllers\AdminController;

class Tes extends AdminController {

    private $_Url_Ini = "adminpanel/master/tes";
    private $_title = "Tes";
    private $_form = "Tes";

    public function getAdd() {
        echo 'ADD';
    }

    public function postAdd() {
    }

    public function getExport() {
        echo 'EXPORT';
    }

    public function getDelete($id) {
        echo 'DELETE';
    }

    public function getEdit($id) {
        echo 'EDIT';
    }

    public function postEdit() {
    }

    public function getIndex() {
        echo 'INDEX';
    }

    public function postIndex() {
    }

    private function _save($mode) {
    }
}