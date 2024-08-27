<?php

namespace App\Controllers\Adminpanel\User_management;

use App\Controllers\AdminController;

class Users_menu extends AdminController
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

    private $_Url_Ini = "adminpanel/user-management/users-menu";
    private $_title = "Users Menu";
    private $_form = "Users Menu";
    private array $_menus_id = [];

    public function getIndex()
    {
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'title' => 'Data ' . $this->_title,
            'form' => $this->_form,
        ];
        $UserModel = model('UserModel');
        $UserModel->select('*, users.id AS UsersId')->join('auth_identities', 'auth_identities.user_id = users.id', 'inner')->orderBy('auth_identities.name', 'ASC');
        $datausers = $UserModel->findAll();
        $data['datausers'] = $datausers;
        echo view('BackPage/AdminPanel/Pages/UserManagement/UsersMenu/UsersMenuView', $data);
    }

    public function postIndex()
    {
        $request = \Config\Services::request();
        if ($request->isAJAX() == false) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        $validation = [
            'id' => 'required',
            'key' => 'required',
        ];
        if (!$this->validate($validation)) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        if ($request->getPost('key') == "ajax_getusersmenu") {
            $validation = [
                'slc_users' => [
                    'label' => 'Users',
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
            ];
            if (!$this->validate($validation)) {
                $msg = $this->validator->listErrors();
                echo '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg><strong>Simpan Gagal</strong>! ' . $msg . '</div>';
                die();
            }

            $users_id = trim($request->getPost('slc_users'));
            $data['Url_Ini'] = $this->_Url_Ini;
            $datamenu = $this->MyAdminMenuModel->getSortMenuOrderAsc()->findAll();
            $data['datamenu'] = $datamenu;
            $datausersmenu = $this->MyAdminUsersMenuModel->getByUsersId($users_id)->findAll();
            $data['datausersmenu'] = array_column($datausersmenu, 'UsersMenuMenuId');
            $data['users_id'] = $users_id;
            echo view('BackPage/AdminPanel/Pages/UserManagement/UsersMenu/Ajax/AjaxgetUsersMenuView', $data);
        } else if ($request->getPost('key') == "ajax_act_saveusersmenu") {
            $validation = [
                'users_id' => [
                    'label' => 'Users Id',
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
                'chk_menu' => [
                    'label' => 'Menu',
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
            ];
            if (!$this->validate($validation)) {
                $msg = $this->validator->listErrors();
                echo json_encode(array('success' => false, 'message' => $msg));
                die();
            }

            $users_id = trim($request->getPost('users_id'));
            $jumlah_menu = count($request->getPost('chk_menu'));
            $this->MyAdminUsersMenuModel->transStart();
            for ($i = 0; $i < $jumlah_menu; $i++) {
                unset($dataset);
                $menu_id = trim($request->getPost('chk_menu')[$i]);
                $this->_insert_menu($users_id, $menu_id);
            }

            $ar_url_menu = [];
            $datausersmenu = $this->MyAdminUsersMenuModel->getByUsersId($users_id)->findAll();
            foreach ($datausersmenu as $rowusersmenu) {
                if (in_array($rowusersmenu->UsersMenuMenuId, array_unique($this->_menus_id)) == false) {
                    $menu_id = $rowusersmenu->UsersMenuMenuId;
                    $menu = $this->MyAdminMenuModel->find($menu_id);
                    if (is_null($menu) === false) {
                        array_push($ar_url_menu, $menu->MenuUrl);
                        $this->MyAdminUsersMenuModel->delete($rowusersmenu->UsersMenuId);
                    }
                }
            }

            if (count($ar_url_menu) > 0) {
                $users = auth()->getProvider();

                $user = $users->findById($users_id);

                $users_permission = $user->getPermissions();

                foreach ($ar_url_menu as $url_menu) {
                    foreach ($users_permission as $user_permission) {
                        $url_permission_new = explode('.', $user_permission);
                        if ($url_permission_new[0] == $url_menu) {
                            $user->removePermission($user_permission);
                        }
                    }
                }
            }

            $this->MyAdminUsersMenuModel->transComplete();
            $msg = 'Data berhasil disimpan';
            echo json_encode(array('success' => true, 'message' => $msg));
            die();
        }
    }

    private function _insert_menu(int $users_id, int $menu_id)
    {
        array_push($this->_menus_id, $menu_id);
        $menu = $this->MyAdminMenuModel->find($menu_id);

        unset($dataset);
        $datausersmenu = $this->MyAdminUsersMenuModel->getByUsersId($users_id)->getByMenuId($menu_id)->findAll();
        if (count($datausersmenu) == 0) {
            $dataset['UsersMenuUsersId'] = $users_id;
            $dataset['UsersMenuMenuId'] = $menu_id;
            $dataset['UsersMenuCreatedBy'] = session('ses_account')['name'];
            $this->MyAdminUsersMenuModel->insert($dataset);
        }
        if (is_null($menu->MenuParentId) == false && $menu->MenuParentId != '0') {
            $menu_id = $menu->MenuParentId;
            $this->_insert_menu($users_id, $menu_id);
        }
    }
}
