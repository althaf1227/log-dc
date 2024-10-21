<?php

namespace App\Controllers\Adminpanel\User_management;

use App\Controllers\AdminController;

class Menu extends AdminController
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

    private $_Url_Ini = "adminpanel/user-management/menu";
    private $_title = "Menu";
    private $_form = "Menu";

    public function getAdd()
    {
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = 'Tambah ' . $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'form' => $this->_form,
            'title' => 'Tambah ' . $this->_form,
        ];
        $data['operation'] = 'add';
        $datamenuparent = $this->MyAdminMenuModel->getIsMenuParent()->getSortMenuOrderAsc()->findAll();
        $data['datamenuparent'] = $datamenuparent;
        echo view('BackPage/AdminPanel/Pages/UserManagement/Menu/MenuFormView', $data);
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
                $msg = '<strong>Simpan Berhasil</strong>! Data berhasil disimpan';
                session()->setFlashdata('notif', '<div class="alert alert-success solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>' . $msg . '</div>');
                return redirect()->to($save['redirect_to']);
            } else if ($save['status_code'] === 2) {
                $msg = '<strong>Simpan Gagal</strong>! Data gagal ditambahkan';
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

    public function getDelete($id)
    {
        if (is_null($id) || is_numeric($id) == false) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        $menu = $this->MyAdminMenuModel->find($id);
        if (is_null($menu)) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();

        $success_delete = 0;
        $db = \Config\Database::connect();
        $db->transStart();
        $query = "SELECT `ID`.`level`, `DATA`.* FROM(SELECT @ids AS `_ids`, (SELECT @ids := GROUP_CONCAT(`MenuId`) FROM `my_admin_menu` WHERE FIND_IN_SET(`MenuParentId`, @ids)) AS `cids`, @l := @l+1 AS `LEVEL` FROM `my_admin_menu`, (SELECT @ids :=?, @l := 0 ) `b` WHERE @ids IS NOT NULL) `ID`, `my_admin_menu` `DATA` WHERE FIND_IN_SET(`DATA`.`MenuId`, `ID`.`_ids`) ORDER BY `LEVEL`, `MenuId`";
        $datamenu = $db->query($query, [$id])->getResult();
        if (count($datamenu) > 0) {
            $id_menu = array_column($datamenu, 'MenuId');
            $this->MyAdminMenuModel->delete($id_menu);
            if ($this->MyAdminMenuModel->connID->affected_rows > 0) {
                $success_delete++;
            }

            $ar_menu_url = [];
            foreach ($datamenu as $rowmenu) {
                array_push($ar_menu_url, $rowmenu->MenuUrl);
            }
            file_exists(WRITEPATH . "myadmin/permission.json") === true ? $permission_file = json_decode(file_get_contents(WRITEPATH . "myadmin/permission.json"), true) : $permission_file = null;
            if (is_null($permission_file) === false) {
                $array = [];
                foreach (array_keys($permission_file) as $url_permission) {
                    $url_permission_new = explode('.', $url_permission);
                    if (in_array($url_permission_new[0], $ar_menu_url) === false) {
                        $array['' . $url_permission_new[0] . '.' . $url_permission_new[1] . ''] = '' . $url_permission_new[1] . '';
                    }
                }
                $file_content = json_encode($array);
                helper("filesystem");
                if (write_file(WRITEPATH . "myadmin/permission.json", $file_content) === false) {
                    $msg = 'Error write permission';
                    return array('success' => false, 'status_code' => 0, 'message' => $msg);
                    die();
                }
            }
        }
        if ($success_delete > 0) {
            $db->transComplete();
            session()->setFlashdata('notif', '<div class="alert alert-success solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg><strong>Hapus Berhasil</strong>! Data berhasil dihapus</div>');
        } else {
            session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg><strong>Hapus Gagal</strong>! Tidak ada data dihapus</div>');
        }
        return redirect()->to(site_url() . $this->_Url_Ini);
    }

    public function getEdit($id)
    {
        if (is_null($id) || is_numeric($id) == false) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        $menu = $this->MyAdminMenuModel->find($id);
        if (is_null($menu)) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();

        $datamenuparent = $this->MyAdminMenuModel->getIsMenuParent()->getSortMenuOrderAsc()->findAll();

        $permissions_aksi = null;
        file_exists(WRITEPATH . "myadmin/permission.json") === true ? $permission_file = json_decode(file_get_contents(WRITEPATH . "myadmin/permission.json"), true) : null;
        if (is_null($permission_file) === false) {
            $ar_permission_aksi = [];
            foreach (array_keys($permission_file) as $url_permission) {
                $url_permission_new = explode('.', $url_permission);
                if ($menu->MenuUrl == $url_permission_new[0]) {
                    array_push($ar_permission_aksi, $url_permission_new[1]);
                }
            }
            $permissions_aksi = array_values($ar_permission_aksi);
        }

        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = 'Edit ' . $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'form' => $this->_form,
            'title' => 'Edit ' . $this->_form,
        ];
        $data['operation'] = 'edit';
        $data['menu'] = $menu;
        $data['datamenuparent'] = $datamenuparent;
        $data['permissions_aksi'] = $permissions_aksi;
        echo view('BackPage/AdminPanel/Pages/UserManagement/Menu/MenuFormView', $data);
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

    public function getIndex()
    {
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'title' => 'Data ' . $this->_title,
            'form' => $this->_form,
        ];
        $datamenu = $this->MyAdminMenuModel->findAll();
        $data['datamenu'] = $datamenu;
        echo view('BackPage/AdminPanel/Pages/UserManagement/Menu/MenuView', $data);
    }

    private function _save(string $mode): array
    {
        $request = \Config\Services::request();
        $validation = [
            'txt_namamenu' => [
                'label' => 'Nama Menu',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
            'txt_url' => [
                'label' => 'URL Menu',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
            'slc_jenis' => [
                'label' => 'Jenis Menu',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
            // 'txt_icon' => [
            //     'label' => 'Icon Menu',
            //     'rules' => 'required',
            //     'errors' => [
            //         'required' => '{field} harus diisi'
            //     ]
            // ],
            'txt_urutan' => [
                'label' => 'Urutan Menu',
                'rules' => 'required|numeric',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'numeric' => '{field} harus diisi angka'
                ]
            ],
            'rad_tampilkan' => [
                'label' => 'Tampilkan',
                'rules' => 'required|in_list[1,0]',
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

        $nama_menu = trim($request->getPost('txt_namamenu'));
        $url_menu = trim($request->getPost('txt_url'));
        $jenis_menu = trim($request->getPost('slc_jenis'));
        $icon_menu = is_null($request->getPost('txt_icon')) == false ? trim($request->getPost('txt_icon')) : null;
        $urutan_menu = trim($request->getPost('txt_urutan'));
        $is_tampilkan_menu = trim($request->getPost('rad_tampilkan'));
        $permission_new = is_null($request->getPost('txa_permission')) == false ? explode("\r\n", trim($request->getPost('txa_permission'))) : null;
        if ($jenis_menu === 'sub_menu') {
            $validation = [
                'slc_menuparent' => [
                    'label' => 'Menu Parent',
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
            ];
            if (!$this->validate($validation)) {
                $msg = '<strong>Gagal</strong>! ' . $this->validator->listErrors() . '';
                return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
            }

            $menu_parent_id = trim($request->getPost('slc_menuparent'));
            $menu = $this->MyAdminMenuModel->find($menu_parent_id);
            if (is_null($menu)) {
                $msg = 'Menu ' . $this->_form . ' tidak ditemukan';
                return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
            }
            if ($menu->MenuHasSubmenu === '0') {
                $this->MyAdminMenuModel->update($menu_parent_id, ['MenuHasSubmenu' => 1]);
            }
        }

        unset($dataset);
        $this->MyAdminMenuModel->db->transStart();
        if ($mode === "add") {
            if ($jenis_menu === 'menu_utama') {
                $datamenu = $this->MyAdminMenuModel->getIsMenuParent()->where('my_admin_menu.MenuOrder >=', $urutan_menu)->getSortMenuOrderAsc()->findAll();
            } else if ($jenis_menu === 'sub_menu') {
                $datamenu = $this->MyAdminMenuModel->getByMenuParentId($menu_parent_id)->where('my_admin_menu.MenuOrder >=', $urutan_menu)->getSortMenuOrderAsc()->findAll();
            }
            if (count($datamenu) != 0) {
                $new_number = null;
                foreach ($datamenu as $rowmenu) {
                    if (is_null($new_number)) {
                        $new_number = $urutan_menu;
                    }

                    if ($rowmenu->MenuOrder == $new_number) {
                        $new_number = $new_number + 1;
                        unset($dataset);
                        $dataset['MenuOrder'] = $new_number;
                        $this->MyAdminMenuModel->update($rowmenu->MenuId, $dataset);
                    } else {
                        $new_number = $new_number + 1;
                    }
                }
            }
            if ($jenis_menu === 'sub_menu') $dataset['MenuParentId'] = $menu_parent_id;
            $dataset['MenuName'] = $nama_menu;
            $dataset['MenuUrl'] = $url_menu;
            $dataset['MenuIcon'] = $icon_menu;
            $dataset['MenuOrder'] = $urutan_menu;
            $dataset['MenuIsShow'] = $is_tampilkan_menu;
            $dataset['MenuCreatedBy'] = session('ses_account')['name'];
            $this->MyAdminMenuModel->insert($dataset);
            if ($this->MyAdminMenuModel->connID->affected_rows > 0) {
                if ($jenis_menu === 'sub_menu') {
                    file_exists(WRITEPATH . "myadmin/permission.json") === true ? $permission_file = json_decode(file_get_contents(WRITEPATH . "myadmin/permission.json"), true) : $permission_file = null;

                    $ar_aksi = [];
                    $array = [];
                    foreach ($permission_new as $action) {
                        array_push($ar_aksi, $action);
                    }
                    foreach ($ar_aksi as $aksi) {
                        $array['' . $url_menu . '.' . $aksi . ''] = '' . $aksi . '';
                    }
                    if (isset($array)) {
                        $array_join = is_null($permission_file) === false ? array_merge($permission_file, $array) : $array;
                        $file_content = json_encode($array_join);
                        helper("filesystem");
                        if (write_file(WRITEPATH . "myadmin/permission.json", $file_content) === false) {
                            $msg = 'Error write permission';
                            return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
                        }
                    }
                }

                $this->MyAdminMenuModel->db->transComplete();
                return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
            } else {
                return array('success' => false, 'status_code' => 2, 'redirect_to' => $urlprev);
            }
        } else if ($mode === "edit") {
            $is_editdata = false;
            $id = trim($request->getPost('hid_menuid'));
            $menu = $this->MyAdminMenuModel->find($id);
            if (is_null($menu)) {
                $msg = 'Data ' . $this->_form . ' tidak ditemukan';
                return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
            }

            if ($jenis_menu === 'sub_menu') {
                if ($menu_parent_id !== $menu->MenuParentId) {
                    $is_editdata = true;
                    $dataset['MenuParentId'] = $menu_parent_id;
                }

                file_exists(WRITEPATH . "myadmin/permission.json") === true ? $permission_file = json_decode(file_get_contents(WRITEPATH . "myadmin/permission.json"), true) : $permission_file = null;
                if (is_null($permission_file) === false) {
                    $permission_file_old = $permission_file;
                    $array = [];
                    foreach (array_keys($permission_file) as $url_permission) {
                        $url_permission_new = explode('.', $url_permission);
                        if ($url_menu != $url_permission_new[0]) {
                            $array['' . $url_permission_new[0] . '.' . $url_permission_new[1] . ''] = '' . $url_permission_new[1] . '';
                        }
                    }
                    $file_content = json_encode($array);
                    helper("filesystem");
                    if (write_file(WRITEPATH . "myadmin/permission.json", $file_content) === false) {
                        $msg = 'Error write permission';
                        return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
                    }
                }

                $ar_aksi = [];
                foreach ($permission_new as $action) {
                    array_push($ar_aksi, $action);
                }
                $array = [];
                foreach ($ar_aksi as $aksi) {
                    $array['' . $url_menu . '.' . $aksi . ''] = '' . $aksi . '';
                }
                if (isset($array)) {
                    file_exists(WRITEPATH . "myadmin/permission.json") === true ? $permission_file = json_decode(file_get_contents(WRITEPATH . "myadmin/permission.json"), true) : $permission_file = null;
                    $array_join = is_null($permission_file) === false ? array_merge($permission_file, $array) : $array;
                    $file_content = json_encode($array_join);
                    helper("filesystem");
                    if (write_file(WRITEPATH . "myadmin/permission.json", $file_content) === false) {
                        $msg = 'Error write permission';
                        return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
                    }
                }
                file_exists(WRITEPATH . "myadmin/permission.json") === true ? $permission_file_new = json_decode(file_get_contents(WRITEPATH . "myadmin/permission.json"), true) : $permission_file_new = null;
                if (is_null($permission_file_new) === false) {
                    if (count(array_diff(array_keys($permission_file_old), array_keys($permission_file_new))) > 0 || count(array_diff(array_keys($permission_file_new), array_keys($permission_file_old))) > 0) {
                        $is_editdata = true;
                    }
                }
            }

            if ($nama_menu !== $menu->MenuName) {
                $is_editdata = true;
                $dataset['MenuName'] = $nama_menu;
            }
            if ($url_menu !== $menu->MenuUrl) {
                $is_editdata = true;
                $dataset['MenuUrl'] = $url_menu;
            }
            if ($icon_menu !== $menu->MenuIcon) {
                $is_editdata = true;
                $dataset['MenuIcon'] = $icon_menu;
            }
            if ($urutan_menu !== $menu->MenuOrder) {
                $is_editdata = true;
                $dataset['MenuOrder'] = $urutan_menu;
            }
            if ($is_tampilkan_menu !== $menu->MenuIsShow) {
                $is_editdata = true;
                $dataset['MenuIsShow'] = $is_tampilkan_menu;
            }
            if ($is_editdata === true) {
                $dataset['MenuUpdatedAt'] = date('Y-m-d H:i:s');
                $dataset['MenuUpdatedBy'] = session('ses_account')['name'];
                $this->MyAdminMenuModel->update($id, $dataset);
                if ($this->MyAdminMenuModel->connID->affected_rows > 0) {
                    if ($urutan_menu !== $menu->MenuOrder) {
                        if ($jenis_menu === 'menu_utama') {
                            $datamenu = $this->MyAdminMenuModel->getIsMenuParent()->where('my_admin_menu.MenuOrder >=', $urutan_menu)->whereNotIn('my_admin_menu.MenuId', [$menu->MenuId])->getSortMenuOrderAsc()->findAll();
                        } else if ($jenis_menu === 'sub_menu') {
                            $datamenu = $this->MyAdminMenuModel->getByMenuParentId($menu_parent_id)->where('my_admin_menu.MenuOrder >=', $urutan_menu)->whereNotIn('my_admin_menu.MenuId', [$menu->MenuId])->getSortMenuOrderAsc()->findAll();
                        }
                        if (count($datamenu) != 0) {
                            $new_number = null;
                            foreach ($datamenu as $rowmenu) {
                                if (is_null($new_number)) {
                                    $new_number = $urutan_menu;
                                }

                                if ($rowmenu->MenuOrder == $new_number) {
                                    $new_number = $new_number + 1;
                                    unset($dataset);
                                    $dataset['MenuOrder'] = $new_number;
                                    $this->MyAdminMenuModel->update($rowmenu->MenuId, $dataset);
                                } else {
                                    $new_number = $new_number + 1;
                                }
                            }
                        }
                    }
                    $this->MyAdminMenuModel->db->transComplete();
                    return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
                } else {
                    $msg = 'Data gagal diubah';
                    return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
                }
            } else {
                $msg = 'Tidak ada data yang diubah';
                return array('success' => false, 'status_code' => 3, 'redirect_to' => $urlprev, 'message' => $msg);
            }
            return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
        }
    }
}
