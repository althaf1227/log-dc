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
                                <?php } else if (isset($operation) && isset($Log) && $operation == "edit") { ?>
                                    <form id="form_edit" method="post"
                                        action="<?php echo site_url($Url_Ini . '/edit'); ?>" class="needs-validation"
                                        enctype="multipart/form-data" novalidate>
                                        <input type="hidden" name="Log_Id"
                                            value="<?php echo esc($Log['LogId']); ?>" required />
                                    <?php } ?>
                                    <!-- <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetNama">Nama Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="SetNama"
                                                name="SetNama" value="</?php if (is_null(old('SetNama')) == false) {
                                                                            echo old('SetNama');
                                                                        } else {
                                                                            if (isset($operation) && isset($Log) && $operation == "edit")
                                                                                echo esc($Log['LogNama']);
                                                                        } ?>" placeholder="Masukan Nama.." required />
                                            <div class="invalid-feedback">Masukan Nama.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetNomorHp">Nomor Hp Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="SetNomorHp"
                                                name="SetNomorHp" value="</?php if (is_null(old('SetNomorHp')) == false) {
                                                                                echo old('SetNomorHp');
                                                                            } else {
                                                                                if (isset($operation) && isset($Log) && $operation == "edit")
                                                                                    echo esc($Log['LogNomorHp']);
                                                                            } ?>" placeholder="Masukan Nomor Handphone.." required />
                                            <div class="invalid-feedback">Masukan Nomor Handphone.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetEmail">Email Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="SetEmail"
                                                name="SetEmail" value="</?php if (is_null(old('SetEmail')) == false) {
                                                                            echo old('SetEmail');
                                                                        } else {
                                                                            if (isset($operation) && isset($Log) && $operation == "edit")
                                                                                echo esc($Log['LogEmail']);
                                                                        } ?>" placeholder="Masukan Email.." required />
                                            <div class="invalid-feedback">Masukan Email.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetInstansi">Instansi Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="SetInstansi"
                                                name="SetInstansi" value="</?php if (is_null(old('SetInstansi')) == false) {
                                                                                echo old('SetInstansi');
                                                                            } else {
                                                                                if (isset($operation) && isset($Log) && $operation == "edit")
                                                                                    echo esc($Log['LogInstansi']);
                                                                            } ?>" placeholder="Masukan Instansi.." required />
                                            <div class="invalid-feedback">Masukan Instansi.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetJamMasuk">Jam Masuk Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="time" class="form-control" id="SetJamMasuk"
                                                name="SetJamMasuk" value="</?php if (is_null(old('SetJamMasuk')) == false) {
                                                                                echo old('SetJamMasuk');
                                                                            } else {
                                                                                if (isset($operation) && isset($Log) && $operation == "edit")
                                                                                    echo esc($Log['LogJamMasuk']);
                                                                            } ?>" placeholder="Masukan Jam masuk .." required />
                                            <div class="invalid-feedback">Masukan Jam masuk.</div>
                                        </div>
                                    </div> -->
                                    <!-- <div class="mb-3 row">
                                        <label for="SetGambar" class="col-sm-3 col-form-label">Silahkan Ambil Foto<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <div class="form-group">
                                                <div>
                                                    <video id="video" name="SetGambar" width="300" height="140" autoplay></video>
                                                    <div class="mb-3">
                                                        <button id="capture" type="button" class="btn btn-primary">Ambil foto</button>
                                                    </div>
                                                    <div class="header-section">
                                                        <span id="error-message-gambar"
                                                        class="error-message text-danger"></span>
                                                    </div>
                                                    <div id="preview-gambar">
                                                        </?php if (!empty($Log)): ?>
                                                            <div class="thumbnail" data-name="</?= $Log['LogGambar'] ?>">
                                                                <canvas id="canvas" class="d-none" width="300" height="140"></canvas>
                                                                <img class="mb-4" alt="tangkapan foto" id="photo" width="180" height="140">
                                                            </div>
                                                        </?php endif; ?>
                                                    </div>
                                                    <input type="hidden" id="imageData" name="imageData">
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetPersetujuan">Berikan Persetujuan<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="checkbox" class="form-check-input" id="SetPersetujuan" name="SetPersetujuan"
                                                <?= isset($Log['LogPersetujuan']) && $Log['LogPersetujuan'] == 1 ? 'checked' : '' ?> />
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetJamkeluar">Jam keluar Pengunjung<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="time" class="form-control" id="SetJamkeluar"
                                                name="SetJamkeluar" value="<?php if (is_null(old('SetJamkeluar')) == false) {
                                                                                echo old('SetJamkeluar');
                                                                            } else {
                                                                                if (isset($operation) && isset($Log) && $operation == "edit")
                                                                                    echo esc($Log['LogJamKeluar']);
                                                                            } ?>" placeholder="Masukan Jam keluar .." />
                                        </div>
                                    </div>
                                    <!-- <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetKeperluan">Keperluan Pengunjung<span
                                                class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <textarea id="mytextarea"
                                                name="SetKeperluan"></?php if (is_null(old('SetKeperluan')) == false) {
                                                                        echo old('SetKeperluan');
                                                                    } else {
                                                                        if (isset($operation) && isset($Log) && $operation == "edit")
                                                                            echo esc($Log['LogKeperluan']);
                                                                    } ?></textarea>
                                            <div class="invalid-feedback">Masukan Keperluan anda.</div>
                                        </div>
                                    </div> -->
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetCatatan">Catatan untuk pengunjung<span
                                                class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <textarea id="mytextarea2"
                                                name="SetCatatan"><?php if (is_null(old('SetCatatan')) == false) {
                                                                        echo old('SetCatatan');
                                                                    } else {
                                                                        if (isset($operation) && isset($Log) && $operation == "edit")
                                                                            echo esc($Log['LogCatatan']);
                                                                    } ?></textarea>
                                            <div class="invalid-feedback">Masukan Catatan anda.</div>
                                        </div>
                                    </div>
                                    <!-- <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetPersetujuan">Berikan Persetujuan<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="checkbox" class="form-check-input" id="SetPersetujuan" name="SetPersetujuan"
                                                </?= isset($Log['LogPersetujuan']) && $Log['LogPersetujuan'] == 1 ? 'checked' : '' ?> />
                                        </div>
                                    </div> -->
                                    <!-- <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="SetTanggal">Tanggal Pengunjungan<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="SetTanggal"
                                                name="SetTanggal" value="</?php if (is_null(old('SetTanggal')) == false) {
                                                                                echo old('SetTanggal');
                                                                            } else {
                                                                                if (isset($operation) && isset($Log) && $operation == "edit")
                                                                                    echo esc($Log['LogTanggal']);
                                                                            } ?>" placeholder="Masukan Tanggal Pengunjungan .." required />
                                            <div class="invalid-feedback">Masukan Tanggal Pengunjungan.</div>
                                        </div>
                                    </div> -->
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

    tinymce.init({
        selector: 'textarea#mytextarea',
        plugins: 'advlist autolink lists link image charmap preview anchor searchreplace visualblocks code fullscreen insertdatetime media table code',
        toolbar: 'undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
        menubar: 'file edit view insert format tools table help',
        height: 300,
        license_key: 'gpl'
    });
    tinymce.init({
        selector: 'textarea#mytextarea2',
        plugins: 'advlist autolink lists link image charmap preview anchor searchreplace visualblocks code fullscreen insertdatetime media table code',
        toolbar: 'undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
        menubar: 'file edit view insert format tools table help',
        height: 300,
        license_key: 'gpl'
    });


</script>

<?php echo $this->endSection(); ?>