<?php

namespace App\Controllers\Adminpanel;

use App\Controllers\AdminController;

class Dashboard extends AdminController {

    private $_Url_Ini = "adminpanel/dashboard";
    private $_title = "Adminpanel";
    private $_form = "Dashboard";

    public function getIndex() {
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'title' => $this->_title,
            'form' => $this->_form,
        ];
        echo view('BackPage/AdminPanel/Pages/Dashboard/DashboardView', $data);
    }
}