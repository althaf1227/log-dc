<?php

namespace App\Controllers\Adminpanel\User_management;

use App\Controllers\AdminController;

class Group extends AdminController
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

    private $_Url_Ini = "adminpanel/user-management/group";
    private $_title = "Group";
    private $_form = "Group";

    public function getAdd()
    {
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = $this->_title . ' - Tambah ' . $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['operation'] = 'add';
        $data['SysForm'] = [
            'form' => $this->_form,
            'title' => 'Tambah ' . $this->_form,
        ];
        echo view('BackPage/AdminPanel/Pages/UserManagement/Group/GroupFormView', $data);
    }

    public function postAdd()
    {
        $save = $this->_save("add");
        if (is_array($save) === false) {
            $msg = 'Save fail';
            session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>' . $msg . '</div>');
            return redirect()->to(site_url() . $this->_Url_Ini);
        }
        if (isset($save['success']) && $save['success'] === true) {
            if ($save['status_code'] === 1) {
                $msg = '<strong>Simpan Berhasil</strong>! Data berhasil ditambahkan';
                session()->setFlashdata('notif', '<div class="alert alert-success solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>' . $msg . '</div>');
                return redirect()->to($save['redirect_to']);
            } else if ($save['status_code'] === 2) {
                $msg = '<strong>Simpan Gagal</strong>! Data gagal ditambahkan';
                session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>' . $msg . '</div>');
                return redirect()->to($save['redirect_to'])->withInput();
            } else if ($save['status_code'] === 3) {
                $msg = 'Tidak ada data yang ditambahkan';
                session()->setFlashdata('notif', '<div class="alert alert-warning solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>' . $msg . '</div>');
                return redirect()->to($save['redirect_to'])->withInput();
            }
        } else {
            $msg = $save['message'];
            session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>' . $msg . '</div>');
            return redirect()->to($save['redirect_to'])->withInput();
        }
    }

    public function getIndex()
    {
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'title' => 'Data ' . $this->_title,
            'form' => $this->_form,
        ];
        file_exists(WRITEPATH . "myadmin/group.json") === true ? $datagroup = json_decode(file_get_contents(WRITEPATH . "myadmin/group.json"), true) : $datagroup = null;
        $data['datagroup'] = is_null($datagroup) === false ? array_keys($datagroup) : null;
        echo view('BackPage/AdminPanel/Pages/UserManagement/Group/GroupView', $data);
    }

    public function getEdit()
    {
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = 'Edit ' . $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'form' => $this->_form,
            'title' => 'Edit ' . $this->_form,
        ];
        $data['operation'] = 'edit';
        file_exists(WRITEPATH . "myadmin/group.json") === true ? $groups_file = json_decode(file_get_contents(WRITEPATH . "myadmin/group.json"), true) : $groups_file = null;
        $data['groups'] = is_null($groups_file) === false ? array_keys($groups_file) : null;
        echo view('BackPage/AdminPanel/Pages/UserManagement/Group/GroupFormView', $data);
    }

    public function postEdit()
    {
        $save = $this->_save("edit");
        if (is_array($save) === false) {
            $msg = 'Save fail';
            session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>' . $msg . '</div>');
            return redirect()->to(site_url() . $this->_Url_Ini);
        }
        if (isset($save['success']) && $save['success'] === true) {
            if ($save['status_code'] === 1) {
                $msg = '<strong>Simpan Berhasil</strong>! Data berhasil diubah';
                session()->setFlashdata('notif', '<div class="alert alert-success solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>' . $msg . '</div>');
                return redirect()->to($save['redirect_to']);
            } else if ($save['status_code'] === 2) {
                $msg = '<strong>Simpan Gagal</strong>! Data gagal diubah';
                session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>' . $msg . '</div>');
                return redirect()->to($save['redirect_to'])->withInput();
            } else if ($save['status_code'] === 3) {
                $msg = 'Tidak ada data yang diubah';
                session()->setFlashdata('notif', '<div class="alert alert-warning solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>' . $msg . '</div>');
                return redirect()->to($save['redirect_to'])->withInput();
            }
        } else {
            $msg = $save['message'];
            session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>' . $msg . '</div>');
            return redirect()->to($save['redirect_to'])->withInput();
        }
    }

    private function _save(string $mode): array
    {
        helper('filesystem');
        $request = \Config\Services::request();
        $validation = [
            'txa_nama_group' => [
                'label' => 'Nama Group',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
            'hid_url' => [
                'label' => 'URL',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
        ];
        $urlprev = $request->getPost('hid_url') ? $request->getPost('hid_url') : "";
        if (!$this->validate($validation)) {
            $msg = '<strong>Gagal</strong>! ' . $this->validator->listErrors() . '';
            return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
        }

        if ($mode === "add") {
            file_exists(WRITEPATH . "myadmin/group.json") === true ? $groups_file = json_decode(file_get_contents(WRITEPATH . "myadmin/group.json"), true) : $groups_file = null;
            $groups = explode("\r\n", trim($request->getPost('txa_nama_group')));
            $array = [];
            foreach ($groups as $group) {
                $array['' . strtolower($group) . ''] = [
                    'title' => strtolower($group),
                    'description' => strtolower($group),
                ];
            }
            $array_join = is_null($groups_file) === false ? array_merge($groups_file, $array) : $array;

            $file_content = json_encode($array_join);
            if (write_file(WRITEPATH . "myadmin/group.json", $file_content) === true) {
                return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
            } else {
                $msg = 'Data gagal ditambahkan';
                return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
            }
        } else if ($mode === "edit") {
            $groups = explode("\r\n", trim($request->getPost('txa_nama_group')));
            $array = [];
            foreach ($groups as $group) {
                $array['' . strtolower($group) . ''] = [
                    'title' => strtolower($group),
                    'description' => strtolower($group),
                ];
            }
            $file_content = json_encode($array);
            if (write_file(WRITEPATH . "myadmin/group.json", $file_content) === true) {
                return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
            } else {
                $msg = 'Data gagal diubah';
                return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
            }
        }
    }
}
