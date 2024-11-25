<!DOCTYPE html>
<html lang="en" class="h-50">
<?php echo $this->section('content'); ?>
<?php echo $this->include('FrontPage/UserPanel/Layout/common-head'); ?>

<body class="h-80">
    <div class="content-body">
        <div class="container-body">
            <div class="row me-auto">
                <div class="container mt-lg-5 d-flex justify-content-center">
                    <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12">
                        <div class="card-body">
                            <div class="row">
                                <div class="text-center"></div>
                            </div>
                            <div class="col-xl-9">
                                <div class="auth-form">
                                    <h2 class="text-start mb-4 font-w600">Silahkan isi Data</h2>

                                    <!-- Pesan Flashdata -->
                                    <?php if (session()->getFlashdata('notif')): ?>
                                        <div><?= session()->getFlashdata('notif') ?></div>
                                    <?php endif; ?>

                                    <?php if (session('error') !== null): ?>
                                        <div class="alert alert-danger" role="alert"><?= session('error') ?></div>
                                    <?php elseif (session('errors') !== null): ?>
                                        <div class="alert alert-danger" role="alert">
                                            <?php if (is_array(session('errors'))): ?>
                                                <?php foreach (session('errors') as $error): ?>
                                                    <?= $error ?><br>
                                                <?php endforeach ?>
                                            <?php else: ?>
                                                <?= session('errors') ?>
                                            <?php endif ?>
                                        </div>
                                    <?php endif ?>
                                    
                                    <form id="form_input" method="post" action="<?php echo base_url('pages/home/add'); ?>" class="needs-validation" enctype="multipart/form-data" novalidate>
                                        <!-- Input Nama -->
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label text-black" for="SetNama">Nama <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="SetNama" name="SetNama" 
                                                    value="<?= old('SetNama') ?? (isset($operation) && $operation == 'edit' ? esc($activity['LogNama']) : '') ?>" 
                                                    placeholder="Masukan Nama.." required />
                                                <div class="invalid-feedback">Masukan Nama.</div>
                                            </div>
                                        </div>

                                        <!-- Input Nomor HP -->
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label text-black" for="SetNomorHp">Nomor Hp <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="SetNomorHp" name="SetNomorHp" 
                                                    value="<?= old('SetNomorHp') ?? (isset($operation) && $operation == 'edit' ? esc($activity['LogNomorHp']) : '') ?>" 
                                                    placeholder="Masukan Nomor Handphone.." required />
                                                <div class="invalid-feedback">Masukan Nomor Handphone.</div>
                                            </div>
                                        </div>

                                        <!-- Input Email -->
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label text-black" for="SetEmail">Email <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="email" class="form-control" name="SetEmail" inputmode="email" autocomplete="email" 
                                                    placeholder="Masukan email.." value="<?= old('email') ?>" required />
                                                <div class="invalid-feedback">Masukan email yang valid.</div>
                                            </div>
                                        </div>

                                        <!-- Input Instansi -->
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label text-black" for="SetInstansi">Instansi <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="SetInstansi" name="SetInstansi" 
                                                    value="<?= old('SetInstansi') ?? (isset($operation) && $operation == 'edit' ? esc($activity['LogInstansi']) : '') ?>" 
                                                    placeholder="Masukan Instansi.." required />
                                                <div class="invalid-feedback">Masukan Instansi.</div>
                                            </div>
                                        </div>

                                        <!-- Input Keperluan -->
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label text-black" for="SetKeperluan">Keperluan <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <textarea id="mytextarea" name="SetKeperluan" required>
                                                    <?= old('SetKeperluan') ?? (isset($operation) && $operation == 'edit' ? esc($activity['LogKeperluan']) : '') ?>
                                                </textarea>
                                                <div class="invalid-feedback">Masukan Keperluan anda.</div>
                                            </div>
                                        </div>

                                        <!-- Tombol Simpan -->
                                        <div class="mb-3 row">
                                            <div class="col-sm-9 ms-auto">
                                                <input type="hidden" name="hid_url" value="<?php echo current_url(); ?>" />
                                                <button type="submit" id="btn_simpan" class="btn btn-primary btn-block">Simpan</button>
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

    <?php echo $this->include('BackPage/AdminPanel/Layout/common-js'); ?>

    <!-- Validasi Form -->
    <script>
        $(document).ready(function() {
            $("#form_input").on("submit", function(e) {
                if (!this.checkValidity()) {
                    e.preventDefault();
                    e.stopPropagation();
                }
                this.classList.add('was-validated');
            });
        });

        // Validasi TinyMCE
        tinymce.init({
            selector: 'textarea#mytextarea',
            plugins: 'advlist autolink lists link image charmap preview anchor searchreplace visualblocks code fullscreen insertdatetime media table code',
            toolbar: 'undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
            menubar: 'file edit view insert format tools table help',
            height: 300,
            setup: function(editor) {
                editor.on('change', function() {
                    editor.save();
                });
            }
        });
    </script>
</body>
</html>
