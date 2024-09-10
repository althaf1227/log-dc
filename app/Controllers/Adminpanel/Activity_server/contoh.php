<?php

namespace App\Controllers\Adminpanel\Setting;

use App\Controllers\AdminController;

class Visi_Misi extends AdminController
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

    private $_Url_Ini = "adminpanel/setting/visi-misi";
    private $_title = "Visi Misi";
    private $_form = "Visi Misi";

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
        $data['visi_misi'] = null;
        echo view('BackPage/AdminPanel/Pages/Setting/VisiMisi/VisiMisiFormView', $data);
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
        if (is_null($id) || is_numeric($id) == false)
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();

        $VisiMisiById = $this->VisiMisiModel->find($id);

        if (is_null($VisiMisiById))
        throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();

        $delete = $this->VisiMisiModel->delete($VisiMisiById['VisiMisiId'], true);
        if ($delete === true) {
            session()->setFlashdata('notif', '<div class="alert alert-success solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg><strong>Hapus Berhasil</strong>! Data berhasil dihapus</div>');
        } else {
            session()->setFlashdata('notif', '<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg><strong>Hapus Gagal</strong>! Data gagal dihapus</div>');
        }
        
        return redirect()->to(site_url() . $this->_Url_Ini);
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

        $VisiMisi = $this->VisiMisiModel->find($id);
        $data['VisiMisi'] = $VisiMisi;

        echo view('BackPage/AdminPanel/Pages/Setting/VisiMisi/VisiMisiFormView', $data);
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
        $data['datavisimisi'] = $this->VisiMisiModel->orderBy('VisiMisiInsert', 'ASC')->get(10)->getResultArray();
        echo view('BackPage/AdminPanel/Pages/Setting/VisiMisi/VisiMisiView', $data);
    }

    private function _save(string $mode): array
    {
        $request = \Config\Services::request();
        $urlprev = $request->getPost('hid_url') ? $request->getPost('hid_url') : "";

        if ($mode === "add") {
            if (
                !$this->validate([
                    'SetVisiMisiJudul ' => [
                        'label' => 'Judul Sejarah',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetVisiMisiText' => [
                        'label' => 'Isi Sejarah',
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

                $dataset = [
                    'VisiMisiJudul' => trim($request->getPost('SetVisiMisiJudul')),
                    'VisiMisiText' => htmlspecialchars_decode($request->getPost('SetVisiMisiText')),
                ];
                $this->VisiMisiModel->save($dataset);
                return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
            }
        } else if ($mode === "edit") {

            if (
                !$this->validate([
                    'SetVisiMisiJudul' => [
                        'label' => 'Judul Sejarah',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetVisiMisiText' => [
                        'label' => 'isi Sejarah',
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
                $dataset = [
                    'VisiMisiJudul' => trim($request->getPost('SetVisiMisiJudul')),
                    'VisiMisiText' => htmlspecialchars_decode($request->getPost('SetVisiMisiText')),
                ];

                $this->VisiMisiModel->update($request->getPost('visi_misi_id'), $dataset);
            
                return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
            }
        }
    }
}
