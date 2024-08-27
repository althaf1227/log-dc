<?php

namespace App\Controllers\Adminpanel;

use App\Controllers\AdminController;

class Profile extends AdminController
{

    private $_Url_Ini = "adminpanel/profile";
    private $_title = "Adminpanel";
    private $_form = "Profil";

    public function getIndex()
    {
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'title' => $this->_title,
            'form' => $this->_form,
        ];

        $UserLoginModel = model('LoginModel');
        $datauserlogin = $UserLoginModel->where('success', 1)->where('user_id', $this->SysVar['user']->id)->orderBy('id', 'desc')->findAll(10);
        $data['datauserlogin'] = $datauserlogin;

        $nama_group = isset($this->SysVar['user']->getGroups()[0]) ? $this->SysVar['user']->getGroups()[0] : null;
        $data['nama_group'] = ucwords(strtolower($nama_group));
        echo view('BackPage/AdminPanel/Pages/Profile/ProfileView', $data);
    }

    public function postIndex()
    {
        $request = \Config\Services::request();
        $validation = [
            'mode' => [
                'label' => 'Mode',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
        ];
        if (!$this->validate($validation)) throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();

        $mode = trim($request->getPost('mode'));
        if ($mode == 'ubah_data_diri') {
            $validation = [
                'email' => [
                    'label' => 'Email',
                    'rules' => 'required|valid_email',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
                'name' => [
                    'label' => 'Nama',
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
            ];
            if (!$this->validate($validation)) {
                $msg = '<strong>Gagal</strong>! '.$this->validator->listErrors().'';
                session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>'.$msg.'</div>');
                return redirect()->to(site_url($this->_Url_Ini))->withInput();
            }

            $email = trim($request->getPost('email'));
            $nama = trim($request->getPost('name'));

            $user = auth()->user();
            $user_id = $user->id;

            $UserModel = auth()->getProvider();
            $users = $UserModel->findById($user_id);

            $db = \Config\Database::connect();
            $db->transBegin();

            $users->fill([
                'email' => $email,
            ]);
            $UserModel->save($users);

            $UserIdentityModel = model('UserIdentityModel');
            $dataset = [
                'name' => $nama
            ];
            $UserIdentityModel->set($dataset);
            $UserIdentityModel->where('user_id', $user_id);
            $UserIdentityModel->update();

            $db->transComplete();

            $msg = '<strong>Simpan Berhasil</strong>! Data berhasil diubah';
            session()->setFlashdata('notif', '<div class="alert alert-success solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>'.$msg.'</div>');
            return redirect()->to(site_url($this->_Url_Ini));
        } else if ($mode == 'ubah_password') {
            $validation = [
                'password' => [
                    'label' => 'Password',
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
                'password_baru' => [
                    'label' => 'Password Baru',
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
                'password_baru_konfirmasi' => [
                    'label' => 'Konfirmasi Password Baru',
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} harus diisi'
                    ]
                ],
            ];
            if (!$this->validate($validation)) {
                $msg = '<strong>Gagal</strong>! '.$this->validator->listErrors().'';
                session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>'.$msg.'</div>');
                return redirect()->to(site_url($this->_Url_Ini))->withInput();
            }

            $username = $this->SysVar['user']->username;
            $password = trim($request->getPost('password'));
            $password_baru = trim($request->getPost('password_baru'));
            $password_baru_konfirmasi = trim($request->getPost('password_baru_konfirmasi'));

            if ($password_baru_konfirmasi !== $password_baru) {
                $msg = '<strong>Gagal</strong>! Konfirmasi Password tidak sama';
                session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>'.$msg.'</div>');
                return redirect()->to(site_url($this->_Url_Ini))->withInput();
            }

            $credentials = [
                'username' => $username,
                'password' => $password
            ];

            $validCreds = auth()->check($credentials);

            if (! $validCreds->isOK()) {
                $msg = '<strong>Gagal</strong>! Password Salah';
                session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>'.$msg.'</div>');
                return redirect()->to(site_url($this->_Url_Ini))->withInput();
            }

            $user = auth()->user();
            $user_id = $user->id;

            $UserModel = auth()->getProvider();
            $users = $UserModel->findById($user_id);

            $db = \Config\Database::connect();
            $db->transBegin();

            $users->fill([
                'password' => $password_baru_konfirmasi,
            ]);
            $UserModel->save($users);

            $db->transComplete();

            $msg = '<strong>Simpan Berhasil</strong>! Data berhasil diubah';
            session()->setFlashdata('notif', '<div class="alert alert-success solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>'.$msg.'</div>');
            return redirect()->to(site_url($this->_Url_Ini));
        } else {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }
    }
}
