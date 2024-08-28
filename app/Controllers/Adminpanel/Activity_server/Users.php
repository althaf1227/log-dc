<?php

namespace App\Controllers\Adminpanel\User_management;

use App\Controllers\AdminController;

use CodeIgniter\Shield\Entities\User;

class Users extends AdminController
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

    private $_Url_Ini = "adminpanel/user-management/users";
    private $_title = "Users";
    private $_form = "Users";

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
        file_exists(WRITEPATH . "myadmin/group.json") === true ? $datagroup = json_decode(file_get_contents(WRITEPATH . "myadmin/group.json"), true) : $datagroup = null;
        $data['datagroup'] = is_null($datagroup) === false ? array_keys($datagroup) : null;
        file_exists(WRITEPATH . "myadmin/permission.json") === true ? $datapermission = json_decode(file_get_contents(WRITEPATH . "myadmin/permission.json"), true) : $datapermission = null;
        $data['datapermission'] = is_null($datapermission) === false ? array_keys($datapermission) : null;
        echo view('BackPage/AdminPanel/Pages/UserManagement/Users/UsersFormView', $data);
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

    public function getDelete($id)
    {
        if (is_null($id) || is_numeric($id) == false) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        $users = auth()->getProvider();
        $user = $users->findById($id);
        if (is_null($user)) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        $delete = $users->delete($user->id, true);
        if ($delete === true) {
            session()->setFlashdata('notif', '<div class="alert alert-success solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg><strong>Hapus Berhasil</strong>! Data berhasil dihapus</div>');
        } else {
            session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg><strong>Hapus Gagal</strong>! Data gagal dihapus</div>');
        }
        return redirect()->to(site_url() . $this->_Url_Ini);
    }

    public function getEdit($id)
    {
        if (is_null($id) || is_numeric($id) == false) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        $users = auth()->getProvider();
        $user = $users->findById($id);
        $user_identity = $user->getIdentity('all');
        $user_group = $user->getGroups();
        $user_permission = $user->getPermissions();
        // dd($user_group);
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = 'Edit ' . $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'form' => $this->_form,
            'title' => 'Edit ' . $this->_form,
        ];
        $data['operation'] = 'edit';
        
        $data['user'] = $user;
        $data['user_identity'] = $user_identity;
        $data['user_group'] = $user_group;
        $data['user_permission'] = $user_permission;
        $data['users_detail'] = auth()->user();

        file_exists(WRITEPATH . "myadmin/group.json") === true ? $datagroup = json_decode(file_get_contents(WRITEPATH . "myadmin/group.json"), true) : $datagroup = null;
        $data['datagroup'] = is_null($datagroup) === false ? array_keys($datagroup) : null;
        file_exists(WRITEPATH . "myadmin/permission.json") === true ? $datapermission = json_decode(file_get_contents(WRITEPATH . "myadmin/permission.json"), true) : $datapermission = null;
        $data['datapermission'] = is_null($datapermission) === false ? array_keys($datapermission) : null;
        echo view('BackPage/AdminPanel/Pages/UserManagement/Users/UsersFormView', $data);
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
        $UserModel = model('UserModel');
        $UserModel->select('*, users.id AS UsersId')->join('auth_identities', 'auth_identities.user_id = users.id', 'inner');
        $datausers = $UserModel->findAll();
        $data['datausers'] = $datausers;
        echo view('BackPage/AdminPanel/Pages/UserManagement/Users/UsersView', $data);
    }
    public function postIndex()
    {
        $request = \Config\Services::request();
        if ($request->isAJAX() === false) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        $validation = [
            'groups' => 'required',
            'key' => 'required',
        ];

        if (!$this->validate($validation)) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        if ($request->getPost('key') === "getAjaxPermissionUsers") {
            $group_select = $this->request->getPost('groups'); // Ini adalah array input grup
            $auth_group_users_results = [];

            // Dapatkan semua pengguna dalam grup yang dipilih
            foreach ($group_select as $group) {
                $auth_group_users = $this->ShieldAuthGroupUsersModel->where('group', $group)->findAll();
                $auth_group_users_results = array_merge($auth_group_users_results, $auth_group_users);
            }
            $auth_permission_users_results = [];

            // Dapatkan semua permission dari pengguna yang ditemukan
            foreach ($auth_group_users_results as $results_group_users) {
                $permission_user = $this->ShieldAuthPermissionUsersModel->where('user_id', $results_group_users->user_id)->findAll();
                $auth_permission_users_results = array_merge($auth_permission_users_results, $permission_user);
            }

            // Mengumpulkan permission unik dan mengubahnya menjadi format JSON yang sesuai untuk digunakan oleh JavaScript
            $permissions = [];
            foreach ($auth_permission_users_results as $permission) {
                $permissions[] = [
                    'value' => $permission->permission,
                    'label' => $permission->permission
                ];
            }

            // Menghapus duplikat permission berdasarkan nama
            $permissions = array_unique($permissions, SORT_REGULAR);

            // Mengirimkan respons JSON menggunakan setJSON()
            return $this->response->setJSON($permissions);
        } else {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }
    }
    private function _save(string $mode): array
    {
        $request = \Config\Services::request();
        $validation = [
            'txt_nama' => [
                'label' => 'Nama',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
            'slc_group' => [
                'label' => 'Group',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
            'txt_email' => [
                'label' => 'Email',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
            'txt_username' => [
                'label' => 'Username',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
            'slc_permission' => [
                'label' => 'Permission',
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
        $apply_all_users = $this->request->getPost('apply_user');
        if ($apply_all_users != 0) {
            // Mendapatkan semua pengguna dalam grup
            $auth_group_users_results = $this->ShieldAuthGroupUsersModel->where('group', $request->getPost('slc_group'))->findAll();
            // Mengambil semua izin pengguna dari hasil pengguna yang ditemukan
            $auth_permission_users_results = [];
            foreach ($auth_group_users_results as $results_group_users) {
                $permission_user = $this->ShieldAuthPermissionUsersModel->where('user_id', $results_group_users->user_id)->findAll();
                $auth_permission_users_results = array_merge($auth_permission_users_results, $permission_user);
            }
            // Mendapatkan semua izin yang unik
            $permissions = [];
            foreach ($auth_permission_users_results as $permission) {
                $permissions[] = [
                    'id' => $permission->id,
                    'user_id' => $permission->user_id,
                    'permission' => $permission->permission
                ];
            }
            $permissions = array_unique($permissions, SORT_REGULAR);
            // Menyiapkan izin untuk semua pengguna yang ada
            $new_permissions = [];
            foreach ($auth_group_users_results as $user) {
                foreach ($permissions as $permission) {
                    $new_permissions[] = [
                        'user_id' => $user->user_id,
                        'permission' => $permission['permission']
                    ];
                }
            }
            // Mengambil izin yang sudah ada di database
            $existing_permissions = $this->ShieldAuthPermissionUsersModel->findAll();

            foreach ($new_permissions as $new_permission) {
                $exists = false;

                foreach ($existing_permissions as $existing_permission) {
                    if (
                        $existing_permission->user_id == $new_permission['user_id'] &&
                        $existing_permission->permission == $new_permission['permission']
                    ) {
                        $exists = true;
                        $update_data = [
                            'id' => $existing_permission->id,
                            'user_id' => $new_permission['user_id'],
                            'permission' => $new_permission['permission']
                        ];
                        $this->ShieldAuthPermissionUsersModel->save($update_data);
                        break;
                    }
                }
                if (!$exists) {
                    $this->ShieldAuthPermissionUsersModel->save($new_permission);
                }
            }
        }
        if ($mode === "add") {
            $validation = [
                'txt_password' => [
                    'label' => 'Password',
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
                'txt_password_konfirmasi' => [
                    'label' => 'Konfirmasi Password',
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
            // Read the JSON file  
            file_exists(WRITEPATH . "myadmin/group.json") === true ? $groups_file = json_decode(file_get_contents(WRITEPATH . "myadmin/group.json"), true) : $groups_file = null;
            config('AuthGroups')->groups = $groups_file;
            file_exists(WRITEPATH . "myadmin/permission.json") === true ? $permissions_file = json_decode(file_get_contents(WRITEPATH . "myadmin/permission.json"), true) : $permissions_file = null;
            config('AuthGroups')->permissions = $permissions_file;


            $users = auth()->getProvider();
            $user = new User([
                'username' => trim($request->getPost('txt_username')),
                'email' => trim($request->getPost('txt_email')),
                'password' => trim($request->getPost('txt_password')),
            ]);
            $users->save($user);

            $UserIdentityModel = model('UserIdentityModel');
            $dataset = [
                'name' => trim($request->getPost('txt_nama'))
            ];
            $UserIdentityModel->set($dataset);
            $UserIdentityModel->where('user_id', $users->getInsertID());
            $UserIdentityModel->update();

            $user = $users->findById($users->getInsertID());

            $groups = $request->getPost('slc_group');
            foreach ($groups as $group) {
                $user->addGroup(strtolower($group));
            }

            $permissions = $request->getPost('slc_permission');
            foreach ($permissions as $permission) {
                $user->addPermission($permission);
            }

            $user->activate();



            return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
        } else if ($mode === "edit") {
            $validation = [
                'id' => [
                    'label' => 'ID',
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
            ];
            if (!$this->validate($validation)) {
                $msg = '<strong>Simpan Gagal</strong>! ' . $this->validator->listErrors() . '';
                return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
            }

            // Read the JSON file  
            file_exists(WRITEPATH . "myadmin/group.json") === true ? $groups_file = json_decode(file_get_contents(WRITEPATH . "myadmin/group.json"), true) : $groups_file = null;
            config('AuthGroups')->groups = $groups_file;
            file_exists(WRITEPATH . "myadmin/permission.json") === true ? $permissions_file = json_decode(file_get_contents(WRITEPATH . "myadmin/permission.json"), true) : $permissions_file = null;
            config('AuthGroups')->permissions = $permissions_file;

            $user_id = trim($request->getPost('id'));

            $users = auth()->getProvider();

            $user = $users->findById($user_id);

            $user_group = $user->getGroups();
            $user_permission = $user->getPermissions();

            $password = is_null($request->getPost('txt_password')) === false && $request->getPost('txt_password') != "";
            if (is_null($password) === false) {
                $user->fill([
                    'username' => trim($request->getPost('txt_username')),
                    'email' => trim($request->getPost('txt_email')),
                    'password' => trim($request->getPost('txt_password')),
                ]);
            } else {
                $user->fill([
                    'username' => trim($request->getPost('txt_username')),
                    'email' => trim($request->getPost('txt_email')),
                ]);
            }
            $users->save($user);

            $UserIdentityModel = model('UserIdentityModel');
            $dataset = [
                'name' => trim($request->getPost('txt_nama'))
            ];
            $UserIdentityModel->set($dataset);
            $UserIdentityModel->where('user_id', $user_id);
            $UserIdentityModel->update();

            $groups = $request->getPost('slc_group');
            foreach ($groups as $group) {
                if (in_array($group, $user_group) === false) {
                    $user->addGroup(strtolower($group));
                }
            }

            foreach ($user_group as $us_group) {
                if (in_array($us_group, $groups) === false) {
                    $user->removeGroup($us_group);
                }
            }

            $permissions = $request->getPost('slc_permission');
            foreach ($permissions as $permission) {
                if (in_array($permission, $user_permission) === false) {
                    $user->addPermission($permission);
                }
            }

            foreach ($user_permission as $us_permis) {
                if (in_array($us_permis, $permissions) === false) {
                    $user->removePermission($us_permis);
                }
            }

            return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
        }
    }
}
