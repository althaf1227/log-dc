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

        $LogModel = model('LogModel');

        $status_request = $LogModel->getcountrequest();
        $data['status_request'] = $status_request;

        $status_proses = $LogModel->getcountproses();
        $data['status_proses'] = $status_proses;

        $status_completed = $LogModel->getcountcompleted();
        $data['status_completed'] = $status_completed;

        $data['status'] = $LogModel->getGrafikPerStatus();
        $ar_status = [];
        $ar_total = [];
        foreach ($data['status'] as $row){
            array_push($ar_status, $row['LogStatus']);
            array_push($ar_total, $row['total']);
        }

        $data['ar_status'] = json_encode($ar_status);
        $data['ar_total'] = json_encode($ar_total);

        $data['pengunjung'] = $LogModel->getLatestVisitors();
        $data['status_ruang'] = $LogModel->getRuangStatus();

        $data['server'] = array_fill(0, 12, 0);

        foreach ($LogModel->getCountPengunjung() as $row) {
            $data['server'][$row['Bulan'] - 1] = $row['JumlahPengunjung'];
        }


        echo view('BackPage/AdminPanel/Pages/Dashboard/DashboardView', $data);
    }
}