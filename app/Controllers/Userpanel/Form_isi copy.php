<?php 

namespace App\Controllers\Userpanel;

use App\Controllers\AdminController;

class Form_isi extends AdminController{
    private $_Url_Ini = "/";
    private $_title = "Formulir";
    private $_form = "Formulir";

    public function getIndex(){
        $data['Url_Ini'] = $this->_Url_Ini;
        $data['title'] = $this->_form;
        $data['SysVar'] = $this->SysVar;
        $data['SysForm'] = [
            'title' => $this->_title,
            'form' => $this->_form,
        ];

        echo view('FrontPage/Userpanel/Pages/From_isi', $data);
    }

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
        $data['sejarah'] = null;
        // $data['sub_dimensi_id'] = null;
        echo view('FrontPage/Userpanel/Pages/FromIsiView', $data);
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
    private function _save(string $mode): array
    {
        $request = \Config\Services::request();
        $urlprev = $request->getPost('hid_url') ? $request->getPost('hid_url') : "";

        if ($mode === "add") {
            if (
                !$this->validate([
                    'SetNama' => [
                        'label' => 'Nama pengunjung',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetNomorHp' => [
                        'label' => 'Nomor pengunjung',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetEmail' => [
                        'label' => 'Email pengunjung',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetInstansi' => [
                        'label' => 'Instansi pengunjung',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetKeperluan' => [
                        'label' => 'Keperluan pengunjung',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                ])
            ) {
                $msg = '<strong>Gagal</strong>! ' . $this->validator->listErrors() . '';
                return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
            } else {
                $persetujuan = $request->getPost('SetPersetujuan') ? 1 : 0;

                $JamMasuk = date('H:i:s');
                $tanggal = date('Y-m-d');

                $dataset = [
                    'LogNama' => trim($request->getPost('SetNama')),
                    'LogNomorHp' => trim($request->getPost('SetNomorHp')),
                    'LogEmail' => trim($request->getPost('SetEmail')),
                    'LogInstansi' => htmlspecialchars(trim($request->getPost('SetInstansi'))),
                    'LogKeperluan' => trim($request->getPost('SetKeperluan')),
                    'LogJamMasuk' => $JamMasuk,
                    'LogTanggal' => $tanggal,
                    'LogPersetujuan' => $persetujuan,
                    'LogStatus' => 'Request',
                ];
                $LogModel = model('LogModel');
                $LogModel->save($dataset);
                return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
            }
        }        
    }
}

?>