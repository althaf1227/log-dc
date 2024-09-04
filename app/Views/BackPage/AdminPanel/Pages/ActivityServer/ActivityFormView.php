<?php echo $this->extend('BackPage/AdminPanel/Layout/template'); ?>

<?php echo $this->section('content'); ?>

<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title"><?php echo $SysForm['title']; ?></h4>
                    </div>
                    <div class="card-body">
                        <?php
                        if (session()->getFlashdata('notif'))
                            echo session()->getFlashdata('notif');
                        ?>

                        <?php if (session('error') !== null): ?>
                            <div class="alert alert-danger" role="alert"><?= session('error') ?></div>
                        <?php elseif (session('errors') !== null): ?>
                            <div class="alert alert-danger" role="alert">
                                <?php if (is_array(session('errors'))): ?>
                                    <?php foreach (session('errors') as $error): ?>
                                        <?= $error ?>
                                        <br>
                                    <?php endforeach ?>
                                <?php else: ?>
                                    <?= session('errors') ?>
                                <?php endif ?>
                            </div>
                        <?php endif ?>

                        <div class="form-validation">
                            <?php if (isset($operation) && $operation == "add") { ?>
                                <form id="form_edit" method="post" action="<?php echo site_url($Url_Ini . '/add'); ?>"
                                    class="needs-validation" enctype="multipart/form-data" novalidate>
                                <?php } else if (isset($operation) && isset($activity) && $operation == "edit") { ?>
                                    <form id="form_edit" method="post"
                                        action="<?php echo site_url($Url_Ini . '/edit'); ?>" class="needs-validation"
                                        enctype="multipart/form-data" novalidate>
                                        <input type="hidden" name="sejarah_id"
                                            value="<?php echo esc($activity['LogId']); ?>" required />
                                    <?php } ?>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetNama">Nama Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="SetNama"
                                                name="SetNama" value="<?php if (is_null(old('SetNama')) == false) {
                                                                            echo old('SetNama');
                                                                        } else {
                                                                            if (isset($operation) && isset($activity) && $operation == "edit")
                                                                                echo esc($activity['LogNama']);
                                                                        } ?>" placeholder="Masukan Nama.." required />
                                            <div class="invalid-feedback">Masukan Nama.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetNomorHp">Nomor Hp Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="SetNomorHp"
                                                name="SetNomorHp" value="<?php if (is_null(old('SetNomorHp')) == false) {
                                                                                echo old('SetNomorHp');
                                                                            } else {
                                                                                if (isset($operation) && isset($activity) && $operation == "edit")
                                                                                    echo esc($activity['LogNomorHp']);
                                                                            } ?>" placeholder="Masukan Nomor Handphone.." required />
                                            <div class="invalid-feedback">Masukan Nomor Handphone.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetEmail">Email Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="SetEmail"
                                                name="SetEmail" value="<?php if (is_null(old('SetEmail')) == false) {
                                                                            echo old('SetEmail');
                                                                        } else {
                                                                            if (isset($operation) && isset($activity) && $operation == "edit")
                                                                                echo esc($activity['LogEmail']);
                                                                        } ?>" placeholder="Masukan Email.." required />
                                            <div class="invalid-feedback">Masukan Email.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetInstansi">Instansi Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="SetInstansi"
                                                name="SetInstansi" value="<?php if (is_null(old('SetInstansi')) == false) {
                                                                                echo old('SetInstansi');
                                                                            } else {
                                                                                if (isset($operation) && isset($activity) && $operation == "edit")
                                                                                    echo esc($activity['LogInstansi']);
                                                                            } ?>" placeholder="Masukan Instansi.." required />
                                            <div class="invalid-feedback">Masukan Instansi.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetJamMasuk">Jam Masuk Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="time" class="form-control" id="SetJamMasuk"
                                                name="SetJamMasuk" value="<?php if (is_null(old('SetJamMasuk')) == false) {
                                                                                echo old('SetJamMasuk');
                                                                            } else {
                                                                                if (isset($operation) && isset($activity) && $operation == "edit")
                                                                                    echo esc($activity['LogJamMasuk']);
                                                                            } ?>" placeholder="Masukan Jam masuk .." required />
                                            <div class="invalid-feedback">Masukan Jam masuk.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetJamkeluar">Jam keluar Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="time" class="form-control" id="SetJamkeluar"
                                                name="SetJamkeluar" value="<?php if (is_null(old('SetJamkeluar')) == false) {
                                                                                echo old('SetJamkeluar');
                                                                            } else {
                                                                                if (isset($operation) && isset($activity) && $operation == "edit")
                                                                                    echo esc($activity['LogJamkeluar']);
                                                                            } ?>" placeholder="Masukan Jam keluar .." required />
                                            <div class="invalid-feedback">Masukan Jam keluar.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetPersetujuan">Keperluan Pengunjung<span
                                                class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <textarea id="mytextarea"
                                                name="SetPersetujuan"><?php if (is_null(old('SetPersetujuan')) == false) {
                                                                            echo old('SetPersetujuan');
                                                                        } else {
                                                                            if (isset($operation) && isset($activity) && $operation == "edit")
                                                                                echo esc($activity['LogPersetujuan']);
                                                                        } ?></textarea>
                                            <div class="invalid-feedback">Masukan keperluan anda.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetCatatan">Catatan untuk Pengunjung<span
                                                class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <textarea id="mytextarea"
                                                name="SetCatatan"><?php if (is_null(old('SetCatatan')) == false) {
                                                                        echo old('SetCatatan');
                                                                    } else {
                                                                        if (isset($operation) && isset($activity) && $operation == "edit")
                                                                            echo esc($activity['LogCatatan']);
                                                                    } ?></textarea>
                                            <div class="invalid-feedback">Masukan Catatan.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetPersetujuan">Berikan Persetujuan<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="checkbox" class="form-check-input" id="SetPersetujuan" name="SetPersetujuan" required />
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetTanggal">Tanggal Pengunjungan<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="time" class="form-control" id="SetTanggal"
                                                name="SetTanggal" value="<?php if (is_null(old('SetTanggal')) == false) {
                                                                                echo old('SetTanggal');
                                                                            } else {
                                                                                if (isset($operation) && isset($activity) && $operation == "edit")
                                                                                    echo esc($activity['LogTanggal']);
                                                                            } ?>" placeholder="Masukan Tanggal Pengunjungan .." required />
                                            <div class="invalid-feedback">Masukan Tanggal Pengunjungan.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetStatus">Status Pengunjungan<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <select id="SetStatus" name="SetStatus" class="form-control">
                                                <?php foreach ($statusOptions as $status): ?>
                                                    <option value="<?= $status ?>"><?= ucfirst($status) ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <div class="col-sm-9 ms-auto">
                                            <input type="hidden" name="hid_url" value="<?php echo current_url(); ?>" />
                                            <button type="submit" id="btn_simpan"
                                                class="btn btn-primary">Simpan</button>
                                        </div>
                                    </div>
                                    </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php echo $this->endSection(); ?>

<?php echo $this->section('content_css'); ?>
<link rel="stylesheet" href="<?php echo base_url('assets/theme/davur/assets/vendor/select2/css/select2.min.css'); ?>">
<style>
    #preview {
        display: flex;
        flex-wrap: wrap;
    }

    .thumbnail {
        display: inline-block;
        margin: 10px;
        position: relative;
        border: 1px solid #ddd;
        padding: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .thumbnail img,
    .thumbnail embed {
        max-width: 200px;
        max-height: 200px;
    }

    .remove-btn {
        position: absolute;
        top: 5px;
        right: 5px;
        background: grey;
        color: white;
        border: none;
        border-radius: 20%;
        width: 25px;
        height: 25px;
        font-size: 13px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .remove-btn:hover {
        background: #D31212;
    }

    .remove-btn i {
        pointer-events: none;
    }
</style>
<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js'); ?>
<script src="<?php echo base_url('assets/theme/davur/assets/vendor/select2/js/select2.full.min.js'); ?>"></script>

<!-- Form validate init -->
<script src="<?php echo base_url('assets/theme/davur/assets/js/plugins-init/jquery.validate-init.js'); ?>"></script>
<script src="<?php echo base_url('assets/theme/davur/assets/vendor/tinymce/tinymce.min.js'); ?>"></script>

<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js_custom'); ?>

<script>
    $(document).ready(function() {

        $("#btn_simpan").on("click", function(e) {
            var form = $("#form_edit")[0];
            if (form.checkValidity()) {
                $("#btn_simpan").prop("disabled", true);
                form.submit();
            }

        });
    });
    tinymce.init({
        selector: 'textarea#mytextarea',
        plugins: 'advlist autolink lists link image charmap preview anchor searchreplace visualblocks code fullscreen insertdatetime media table code',
        toolbar: 'undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
        menubar: 'file edit view insert format tools table help',
        height: 300,
        license_key: 'gpl'
    });

    function previewGambar() {
        const preview = document.getElementById('preview-gambar');
        const input = document.getElementById('gambar-input');
        const files = input.files;
        const errorMessage = document.getElementById('error-message-gambar');

        // Hapus semua thumbnail yang ada
        while (preview.firstChild) {
            preview.removeChild(preview.firstChild);
        }

        // Reset error message
        errorMessage.textContent = '';

        // Loop melalui setiap file yang diunggah
        for (const file of files) {
            if (!file.type.match('image.*')) {
                errorMessage.textContent = 'File yang diunggah harus berupa gambar (jpg, png, jpeg).';
                input.value = ''; // Reset input file
                return;
            }

            const reader = new FileReader();
            reader.onload = function(event) {
                const thumbnail = document.createElement('div');
                thumbnail.className = 'thumbnail';
                thumbnail.setAttribute('data-name', file.name); // Menambahkan atribut data untuk nama file

                // Gambar
                const img = new Image();
                img.src = event.target.result;
                thumbnail.appendChild(img);

                const removeBtn = document.createElement('button');
                removeBtn.classList.add('remove-btn');
                removeBtn.innerHTML = '<i class="fas fa-times"></i>';
                removeBtn.onclick = () => {
                    thumbnail.remove();
                    // Hapus elemen input file dari pratinjau
                    document.querySelector(`input[data-name="${file.name}"]`).remove();
                };

                thumbnail.appendChild(removeBtn);
                preview.appendChild(thumbnail);

                // Buat elemen input file baru
                const fileInputClone = input.cloneNode();
                fileInputClone.removeAttribute('id'); // Hapus ID agar tidak duplikat
                fileInputClone.style.display = 'none'; // Sembunyikan elemen input
                fileInputClone.setAttribute('data-name', file.name); // Set atribut data-name

                // Set nilai file input clone
                const dt = new DataTransfer();
                dt.items.add(file);
                fileInputClone.files = dt.files;

                // Tambahkan elemen input file baru ke pratinjau
                preview.appendChild(fileInputClone);
            };
            reader.readAsDataURL(file);
        }

        // Kosongkan elemen input file utama setelah memproses file
        input.value = '';
    }

    function previewFiles() {
        const preview = document.getElementById('preview-file');
        const input = document.getElementById('file-input');
        const files = input.files;
        const errorMessage = document.getElementById('error-message-file');

        // Hapus semua thumbnail yang ada
        while (preview.firstChild) {
            preview.removeChild(preview.firstChild);
        }
        errorMessage.textContent = '';

        // Loop melalui setiap file yang diunggah
        for (const file of files) {
            if (!file.type.match('application/*')) {
                errorMessage.textContent = 'Format file yang diunggah harus berupa gambar (pdf, docx, xlsx ,pptx )';
                input.value = ''; // Reset input file
                return;
            }
            const reader = new FileReader();
            reader.onload = function(event) {
                const thumbnail = document.createElement('div');
                thumbnail.className = 'thumbnail';
                thumbnail.setAttribute('data-name', file.name); // Menambahkan atribut data untuk nama file

                if (file.type === 'application/pdf') {
                    const embed = document.createElement('embed');
                    embed.src = event.target.result;
                    thumbnail.appendChild(embed);
                } // DOCX, XLSX, PPTX
                else if (file.type === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ||
                    file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ||
                    file.type === 'application/vnd.openxmlformats-officedocument.presentationml.presentation') {
                    const link = document.createElement('a');
                    link.href = event.target.result;
                    link.target = '_blank';

                    const icon = document.createElement('i');
                    let iconClass;
                    if (file.type === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document') {
                        iconClass = 'fas fa-file-word';
                    } else if (file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
                        iconClass = 'fas fa-file-excel';
                    } else if (file.type === 'application/vnd.openxmlformats-officedocument.presentationml.presentation') {
                        iconClass = 'fas fa-file-powerpoint';
                    }
                    icon.className = iconClass;
                    icon.style.fontSize = '50px';
                    icon.style.marginRight = '10px';
                    icon.style.verticalAlign = 'middle'; // Optional: To align icon and text

                    link.appendChild(icon);
                    link.appendChild(document.createTextNode(` View ${file.name}`));
                    thumbnail.appendChild(link);
                } else {
                    thumbnail.textContent = `Unsupported file type: ${file.name}`;
                }

                const removeBtn = document.createElement('button');
                removeBtn.classList.add('remove-btn');
                removeBtn.innerHTML = '<i class="fas fa-times"></i>';
                removeBtn.onclick = () => {
                    thumbnail.remove();
                    // Hapus elemen input file dari pratinjau
                    document.querySelector(`input[data-name="${file.name}"]`).remove();
                };

                thumbnail.appendChild(removeBtn);
                preview.appendChild(thumbnail);

                // Buat elemen input file baru
                const fileInputClone = input.cloneNode();
                fileInputClone.removeAttribute('id'); // Hapus ID agar tidak duplikat
                fileInputClone.style.display = 'none'; // Sembunyikan elemen input
                fileInputClone.setAttribute('data-name', file.name); // Set atribut data-name

                // Set nilai file input clone
                const dt = new DataTransfer();
                dt.items.add(file);
                fileInputClone.files = dt.files;

                // Tambahkan elemen input file baru ke pratinjau
                preview.appendChild(fileInputClone);
            };
            reader.readAsDataURL(file);

        }
        // Kosongkan elemen input file utama setelah memproses file
        input.value = '';
    }
    // Fungsi untuk menghapus elemen thumbnail
    function removeElement(element) {
        const thumbnail = element.parentElement;
        const fileName = thumbnail.getAttribute('data-name');

        // Hapus elemen input file yang sesuai
        const inputFile = document.querySelector(`input[data-name="${fileName}"]`);
        if (inputFile) {
            inputFile.remove();
        }
        // Hapus thumbnail
        thumbnail.remove();
    }
</script>

<?php echo $this->endSection(); ?>