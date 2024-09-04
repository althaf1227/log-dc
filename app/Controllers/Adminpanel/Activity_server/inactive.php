<?php

namespace App\Controllers\Adminpanel\Activity_server;

use App\Controllers\AdminController;


class Inactive extends AdminController
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

    private $_Url_Ini = "adminpanel/activity-server/inactive";
    private $_title = "(Selesai)";
    private $_form = "Selesai";

    public function getindex()
    {
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'title' => 'Data Pengunjung Server ' . $this->_title,
            'form' => $this->_form,
        ];
        $Logmodel = model('LogModel');
        $dataCompleted = $Logmodel->where('LogStatus', 'completed')->orderBy('LogInsert', 'ASC')->get(10)->getResultArray();
        $dataInactive = array_merge($dataCompleted);
        $data['DataInactive'] = $dataInactive;
        echo view('BackPage/AdminPanel/Pages/ActivityServer/InActive/InActiveView', $data);
    }
    public function getEdit($id)
    {
        if (is_null($id) || is_numeric($id) == false)
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = 'Edit ' . $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'form' => $this->_form,
            'title' => 'Edit ' . $this->_form,
        ];
        $data['operation'] = 'edit';

        $Logmodel = model('LogModel');
        $Inactive = $Logmodel->find($id);
        $data['statusOptions'] = $Logmodel->getStatusEnum();
        $data['inactive'] = $Inactive;

        echo view('BackPage/AdminPanel/Pages/ActivityServer/ActivityFormView', $data);
    }
}
