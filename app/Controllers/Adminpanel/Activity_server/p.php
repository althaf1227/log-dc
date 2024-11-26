<input type="hidden" name="GambarLama"
                                                value="<?php echo esc($sejarah['SejarahGambar']); ?>" required />
<div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetSejarahGambar">Upload Gambar
                                            Sejarah<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <div class="form-group">
                                                <div>
                                                    <label for="formFileLg" class="form-label">Upload Gambar <small
                                                            class="text-primary">(Format file dalam bentuk jpg, png,
                                                            jpeg)</small></label>
                                                    <input type="file" class="form-control" name="SetSejarahGambar"
                                                        id="gambar-input" onchange="previewGambar()">
                                                    <div class="header-section">
                                                        <span id="error-message-gambar"
                                                            class="error-message text-danger"></span>
                                                    </div>
                                                    <div id="preview-gambar">
                                                        <?php if (!empty($sejarah)):

                                                            $file_extension = pathinfo($sejarah['SejarahGambar'], PATHINFO_EXTENSION);
                                                            if (in_array($file_extension, ['jpg', 'jpeg', 'png'])): ?>
                                                                <div class="thumbnail"
                                                                    data-name="<?= $sejarah['SejarahGambar'] ?>">
                                                                    <img src="<?= base_url("uploads/sejarah/") . $sejarah['SejarahGambar'] ?>"
                                                                        alt="Thumbnail">
                                                                    <button class="remove-btn" onclick="removeElement(this)"><i
                                                                            class="fas fa-times"></i></button>
                                                                </div>
                                                                <input type="hidden" name="existingFiles"
                                                                    value="<?= $sejarah['SejarahId'] ?>"
                                                                    data-name="<?= $sejarah['SejarahGambar'] ?>">

                                                            <?php else: ?>
                                                                <div class="thumbnail"
                                                                    data-name="<?= $sejarah['SejarahGambar'] ?>">
                                                                    <span><?= $sejarah['SejarahGambar'] ?></span>
                                                                    <button class="remove-btn" onclick="removeElement(this)"><i
                                                                            class="fas fa-times"></i></button>
                                                                </div>
                                                                <input type="hidden" name="existingFiles"
                                                                    value="<?= $sejarah['SejarahId'] ?>"
                                                                    data-name="<?= $sejarah['SejarahGambar'] ?>">
                                                            <?php endif;

                                                        endif; ?>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>


<?php 
else if ($mode === "edit") {

    if (
        !$this->validate([
            'SetSejarahJudul' => [
                'label' => 'Judul Sejarah',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
            'SetSejarahText' => [
                'label' => 'isi Sejarah',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus diisi'
                ]
            ],
            // 'SejarahGambar' => [
            //     'rules' => 'uploaded[SejarahGambar]|mime_in[SejarahGambar,image/jpg,image/jpeg,image/png]|max_size[SejarahGambar,1024]',
            //     'errors' => [
            //         'uploaded' => 'Gambar icon harus diupload.',
            //         'max_size' => 'Ukuran file terlalu besar. Maksimal 1MB.'
            //     ],
            // ],
        ])
    ) {
        $msg = '<strong>Gagal</strong>! ' . $this->validator->listErrors() . '';
        return array('success' => false, 'status_code' => 0, 'redirect_to' => $urlprev, 'message' => $msg);
    } else {
        $sejarah = $this->SejarahModel->find($request->getPost('existingFiles'));
        $Gambarsejarah = $request->getFile('SetSejarahGambar');
    
        if ($Gambarsejarah->getError() != 4) {
            
            $randomGambarName = $Gambarsejarah->getRandomName();
            $Gambarsejarah->move('uploads/Sejarah/', $randomGambarName);
    
            
            $oldFilePath = 'uploads/Sejarah/' . $this->request->getPost('GambarLama');
            if (file_exists($oldFilePath)) {
                unlink($oldFilePath);
            }
    
            $dataset = [
                'SejarahJudul' => trim($request->getPost('SetSejarahJudul')),
                'SejarahText' => htmlspecialchars_decode($request->getPost('SetSejarahText')),
                'SejarahGambar' => $randomGambarName,
            ];
        } else {
            
            $dataset = [
                'SejarahJudul' => trim($request->getPost('SetSejarahJudul')),
                'SejarahText' => htmlspecialchars_decode($request->getPost('SetSejarahText')),
            ];
        }
    
        // Update data sejarah
        $this->SejarahModel->update($request->getPost('sejarah_id'), $dataset);
    
        return array('success' => true, 'status_code' => 1, 'redirect_to' => site_url() . $this->_Url_Ini);
    }
}
?>