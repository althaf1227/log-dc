<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $title; ?></title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
    <div class="content-body">
        <div class="container-body">
            <div class="row me-auto">
                <div class="container mt-lg-5 d-flex justify-content-center">
                    <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="me-auto d-lg-block text-center">
                                    <h2 class="card-title mb-1 font-w600 fw-bold"><?= $title; ?></h2>
                                    <small class="mb-0">Mohon untuk isi data diri anda sebelum memasuki ruangan</small>
                                </div>
                            </div>
                            <div class="card-body">
                                    <?php if (session()->getFlashdata('notif')): ?>
                                        <div><?= session()->getFlashdata('notif') ?></div>
                                    <?php endif; ?>

                                    <?php if (session('error') !== null) : ?>
                                        <div class="alert alert-danger" role="alert"><?= session('error') ?></div>
                                    <?php elseif (session('errors') !== null) : ?>
                                        <div class="alert alert-danger" role="alert">
                                            <?php if (is_array(session('errors'))) : ?>
                                                <?php foreach (session('errors') as $error) : ?>
                                                    <?= $error ?>
                                                    <br>
                                                <?php endforeach ?>
                                            <?php else : ?>
                                                <?= session('errors') ?>
                                            <?php endif ?>
                                        </div>
                                    <?php endif ?>
                                    <?php if (session('message') !== null) : ?>
                                        <div class="alert alert-success" role="alert"><?= session('message') ?></div>
                                    <?php endif ?>
                                    <form id="form_input" method="post" action="<?php echo base_url('pages/home/add'); ?>"
                                        class="needs-validation" enctype="multipart/form-data" novalidate>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label text-black" for="SetNama">Nama <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="SetNama" name="SetNama" value="<?= old('SetNama'); ?>" placeholder="Masukan Nama.." required />
                                                <div class="invalid-feedback">Nama wajib diisi.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label text-black" for="SetNomorHp">Nomor Hp <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="SetNomorHp" name="SetNomorHp" value="<?= old('SetNomorHp'); ?>" placeholder="Masukan Nomor Handphone.." required />
                                                <div class="invalid-feedback">Nomor handphone wajib diisi.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label text-black" for="SetEmail">Email <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="email" class="form-control" name="SetEmail" inputmode="email" autocomplete="email" placeholder="Masukan email.." value="<?= old('SetEmail'); ?>" required />
                                                <div class="invalid-feedback">Email wajib diisi.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label text-black" for="SetInstansi">Instansi <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="SetInstansi" name="SetInstansi" value="<?= old('SetInstansi'); ?>" placeholder="Masukan Instansi.." required />
                                                <div class="invalid-feedback">Instansi wajib diisi.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label text-black" for="SetKeperluan">Keperluan <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" id="mytextarea" name="SetKeperluan" placeholder="Masukan keperluan.." required><?= old('SetKeperluan'); ?></textarea>
                                                <div class="invalid-feedback">Keperluan wajib diisi.</div>
                                            </div>
                                        </div>

                                        <div class="mb-3 row">
                                            <label for="SetGambar" class="col-sm-3 col-form-label">Silahkan Ambil Foto<span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <div class="form-group">
                                                    <div>
                                                        <video id="video" width="300" height="140" autoplay></video>
                                                        <div class="mb-3">
                                                            <button id="capture" type="button" class="btn btn-primary">Capture Photo</button>
                                                        </div>
                                                        <div id="preview-gambar">
                                                            <canvas id="canvas" class="d-none" width="300" height="140"></canvas>
                                                            <img class="mb-4" alt="Captured Photo" id="photo" width="180" height="140">
                                                        </div>
                                                        <input type="hidden" id="imageData" name="imageData">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mb-3 row">
                                            <div class="col-sm-9 ms-auto">
                                                <input type="hidden" name="hid_url" value="<?php echo current_url(); ?>" />
                                                <button type="submit" id="btn_simpan"
                                                    class="btn btn-primary btn-block">Simpan</button>
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
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>    
    <script src="<?php echo base_url('assets/theme/davur/assets/vendor/tinymce/tinymce.min.js'); ?>"></script>
    <script src="<?php echo base_url('assets/theme/davur/assets/vendor/sweetalert2@11.5.1/dist/sweetalert2.min.js'); ?>"></script>
    
    
    <script>
        const video = document.getElementById('video');
        const canvas = document.getElementById('canvas');
        const photo = document.getElementById('photo');
        const imageData = document.getElementById('imageData');
        const context = canvas.getContext('2d');

        navigator.mediaDevices.getUserMedia({ video: true })
            .then(stream => {
                video.srcObject = stream;
            })
            .catch(err => {
                console.error("Error: " + err);
            });

        document.getElementById('capture').addEventListener('click', () => {
            context.drawImage(video, 0, 0, canvas.width, canvas.height);
            const data = canvas.toDataURL('image/png');
            photo.src = data;
            imageData.value = data;
        });
    </script>
    
    <script>
        // Validasi form dengan Bootstrap
        (function () {
            'use strict';
    
            document.addEventListener('DOMContentLoaded', function () {
                const forms = document.querySelectorAll('.needs-validation');
    
                // Loop semua form dengan class `needs-validation`
                Array.prototype.slice.call(forms).forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
    
                        form.classList.add('was-validated');
                    }, false);
                });
            });
        })();
    </script>
    
    <script>
        tinymce.init({
                selector: 'textarea#mytextarea',
                plugins: 'advlist autolink lists link image charmap preview anchor searchreplace visualblocks code fullscreen insertdatetime media table code',
                toolbar: 'undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
                menubar: 'file edit view insert format tools table help',
                height: 300,
                license_key: 'gpl'
        
            });
    
    </script>
</body>
</html>

