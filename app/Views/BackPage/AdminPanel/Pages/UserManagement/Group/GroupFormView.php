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
if (session()->getFlashdata('notif')) echo session()->getFlashdata('notif');
?>
                                <div class="alert alert-primary left-icon-big">
                                    <div class="media">
                                        <div class="alert-left-icon-big">
                                            <span><i class="mdi mdi-information"></i></span>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mt-1 mb-2">Informasi Penting</h6>
                                            <p class="mb-0">Anda bisa menambahkan lebih dari 1 data dengan menambahkan pemisah enter</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-validation">
<?php if (isset($operation) && $operation === "add") { ?>
                                    <form id="form_group" method="post" action="<?php echo site_url($Url_Ini.'/add'); ?>" class="needs-validation" novalidate >
<?php } else if (isset($operation) && $operation === "edit") { ?>
                                    <form id="form_group"  method="post" action="<?php echo site_url($Url_Ini.'/edit'); ?>" class="needs-validation" novalidate >
<?php } ?>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label" for="txt_nama_group">Nama Group <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <textarea id="txa_nama_group" name="txa_nama_group" class="form-control" style="height: 20rem !important;" required><?php if (is_null(old('txa_nama_group')) == false) { echo old('txa_nama_group'); } else { if (isset($operation) && isset($groups) && $operation == "edit") echo implode("\n", $groups); } ?></textarea>
                                                <div class="invalid-feedback">Masukan Nama Group.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <div class="col-sm-9 ms-auto">
                                                <input type="hidden" name="hid_url" value="<?php echo current_url(); ?>"/>
                                                <button type="submit" id="btn_simpan" class="btn btn-primary">Simpan</button>
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

<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js'); ?>

    <!-- Form validate init -->
    <script src="<?php echo base_url('assets/theme/davur/assets/js/plugins-init/jquery.validate-init.js'); ?>"></script>

<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js_custom'); ?>

    <script>
    $(document).ready(function() {
        $("#btn_simpan").on("click", function (e) {
            var form = $("#form_group")[0];
            if (form.checkValidity()) {
                $("#btn_simpan").prop("disabled", true);
                form.submit();
            }
        });
    });
    </script>

<?php echo $this->endSection(); ?>
