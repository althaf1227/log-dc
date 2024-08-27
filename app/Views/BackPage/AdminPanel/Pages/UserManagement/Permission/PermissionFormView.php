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
                                <div class="form-validation">
                                    <form id="form_permission" method="post" action="<?php echo site_url($Url_Ini.'/add'); ?>" class="needs-validation" novalidate >
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label" for="txt_url">URL <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="txt_url" name="txt_url" value="<?php if (is_null(old('txt_url')) == false) { echo old('txt_alasan'); } else { if (isset($operation) && isset($cuti) && $operation == "edit") echo esc($cuti->CutiAlasan); } ?>" placeholder="Masukan URL.." required />
                                                <div class="invalid-feedback">Masukan URL.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label">Action <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <div class="form-check">
                                                    <input class="form-check-input" id="chk_action_create" name="chk_action[]" type="checkbox" value="create">
                                                    <label class="form-check-label" for="chk_action_create"> Create/Add</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" id="chk_action_read" name="chk_action[]" type="checkbox" value="read">
                                                    <label class="form-check-label" for="chk_action_read"> Read/Index</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" id="chk_action_update" name="chk_action[]" type="checkbox" value="update">
                                                    <label class="form-check-label" for="chk_action_update"> Update/Edit</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" id="chk_action_delete" name="chk_action[]" type="checkbox" value="delete">
                                                    <label class="form-check-label" for="chk_action_delete"> Delete</label>
                                                </div>
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
            var form = $("#form_permission")[0];
            if (form.checkValidity()) {
                $("#btn_simpan").prop("disabled", true);
                form.submit();
            }
        });
    });
    </script>

<?php echo $this->endSection(); ?>
