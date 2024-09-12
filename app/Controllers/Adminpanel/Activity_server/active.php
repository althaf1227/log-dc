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
    private $_title = "(Active)";
    private $_form = "Active";

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
        // Mendapatkan data dengan status 'request'
        $dataRequest = $Logmodel->where('LogStatus', 'request')->orderBy('LogInsert', 'ASC')->get(10)->getResultArray();
        $dataInProcess = $Logmodel->where('LogStatus', 'in process')->orderBy('LogInsert', 'ASC')->get(10)->getResultArray();
        $dataActive = array_merge($dataRequest, $dataInProcess);
        $data['DataActive'] = $dataActive;
        echo view('BackPage/AdminPanel/Pages/ActivityServer/Active/ActiveView', $data);
    }
    public function getDelete($id)
    {
        if (is_null($id) || is_numeric($id) == false)
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();

        $Logmodel = model('LogModel');
        $LogById = $Logmodel->find($id);

        if (is_null($LogById))
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();

        $delete = $Logmodel->delete($LogById['LogId'], true);
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

        $Logmodel = model('LogModel');
        $Log = $Logmodel->find($id);


        $data['Log'] = $Log;


        echo view('BackPage/AdminPanel/Pages/ActivityServer/ActivityFormView', $data);
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
        $request = \Config\Services::request();
        $urlprev = $request->getPost('hid_url') ? $request->getPost('hid_url') : "";


        if ($mode === "edit") {

            if (
                !$this->validate([
                    'SetNama' => [
                        'label' => 'Nama',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetNomorHp' => [
                        'label' => 'Nomor Handphone',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetEmail' => [
                        'label' => 'Email',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetInstansi' => [
                        'label' => 'Instansi',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetJamMasuk' => [
                        'label' => 'Jam Masuk',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetCatatan' => [
                        'label' => 'catatan',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],
                    'SetKeperluan' => [
                        'label' => 'Keperluan',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ],

                    'SetTanggal' => [
                        'label' => 'Tanggal',
                        'rules' => 'required',
                        'errors' => [
                            'required' => '{field} harus diisi'
                        ]
                    ]
                ])
            ) {
                $msg = '<strong>Gagal</strong>! ' . $this->validator->listErrors() . '';
                return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
            } else {
                $persetujuan = $request->getPost('SetPersetujuan') ? 1 : 0;
                $jamKeluar = $request->getPost('SetJamkeluar');


                $status = 'request';

                if ($persetujuan == 1) {
                    $status = 'in process';
                }
                if (!empty($jamKeluar)) {
                    $status = 'completed';
                }

                $dataset = [
                    'LogNama'        => trim($request->getPost('SetNama')),
                    'LogNomorHp'     => trim($request->getPost('SetNomorHp')),
                    'LogEmail'       => trim($request->getPost('SetEmail')),
                    'LogInstansi'    => trim($request->getPost('SetInstansi')),
                    'LogJamasuk'     => trim($request->getPost('SetJamMasuk')),
                    'LogKeperluan'   => htmlspecialchars_decode($request->getPost('SetKeperluan')),
                    'catatan'        => htmlspecialchars_decode($request->getPost('SetCatatan')),
                    'LogPersetujuan' => $persetujuan,
                    'LogTanggal'     => trim($request->getPost('SetTanggal')),
                    'LogStatus'      => $status
                ];



                if (!empty($jamKeluar)) {
                    $dataset['LogJamKeluar'] = $jamKeluar;
                }

                dd($dataset);
                $Logmodel = model('LogModel');
                $Logmodel->update($this->request->getPost('Log_Id'), $dataset);


                return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
            }
        }
    }
}
