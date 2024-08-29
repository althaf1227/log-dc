<?php

namespace App\Controllers\Adminpanel\Activity_server;

use App\Controllers\AdminController;


class active extends AdminController
{
    /**
     * --------------------------------------------------------------------------
     * MyAdmin Package
     * --------------------------------------------------------------------------
     *
     * @developer       DiskominfoPatiDevTeam
     * @instansi        Dinas Komunikasi dan Informatika
     * @version         1.2
     */

    private $_Url_Ini = "adminpanel/activity-server/active";
    private $_title = "Active";
    private $_form = "Active";

    public function getindex()
    {
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'title' => 'Data ' . $this->_title,
            'form' => $this->_form,
        ];
        $Logmodel = model('LogModel');
        // Mendapatkan data dengan status 'request'
        $dataRequest = $Logmodel->where('LogStatus', 'request')->orderBy('LogInsert', 'ASC')->get(10)->getResultArray();
        $dataInProcess = $Logmodel->where('LogStatus', 'in process')->orderBy('LogInsert', 'ASC')->get(10)->getResultArray();
        $dataActive = array_merge($dataRequest, $dataInProcess);
        $data['DataActive'] = $dataActive;
        echo view('BackPage/AdminPanel/Pages/ActivityServer/Active/ActiveView', $data);
    }
}
