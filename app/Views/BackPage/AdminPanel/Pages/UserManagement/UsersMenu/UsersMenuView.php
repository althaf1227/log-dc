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
                                    <form id="form_filter" method="post" class="needs-validation" novalidate>
                                        <div class="row">
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="slc_users">Users <span class="text-danger">*</span></label>
                                                <select class="form-select form-control wide" id="slc_users" name="slc_users" required>
<?php
if (isset($datausers)) {
    if (count($datausers) > 1) echo '<option selected disabled value="">Pilih</option>';
    foreach($datausers as $row) {
?>
                                                    <option value="<?php echo esc($row->UsersId); ?>"><?php echo esc($row->name.' - '.$row->secret); ?></option>
<?php
}}
?>
                                                </select>
                                                <div class="invalid-feedback">Pilih users.</div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="id" value="<?php echo rand(); ?>">
                                        <input type="hidden" name="key" value="ajax_getusersmenu">
                                        <button type="submit" id="btn_tampilkan" class="btn btn-primary">Tampilkan</button>
                                    </form>
                                </div>
                                <div id="ajax_getusersmenu_result" class="mt-3"></div>
                            </div>
                        </div>
                    </div>
				</div>
            </div>
        </div>

<?php echo $this->endSection(); ?>

<?php echo $this->section('content_css'); ?>
    <link href="<?php echo base_url('assets/theme/davur/assets/vendor/sweetalert2@11.5.1/dist/sweetalert2.min.css'); ?>" rel="stylesheet">
    <style>
        li .menu_child {
            margin-left: 25px;
        }

    </style>
<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js'); ?>
    <!-- Form validate init -->
    <script src="<?php echo base_url('assets/theme/davur/assets/js/plugins-init/jquery.validate-init.js'); ?>"></script>

    <script src="<?php echo base_url('assets/theme/davur/assets/vendor/sweetalert2@11.5.1/dist/sweetalert2.min.js'); ?>"></script>

<?php echo $this->endSection(); ?>
<?php echo $this->section('content_js_custom'); ?>

    <script>
    $(document).ready(function() {
        $("#btn_tampilkan").on("click", function (e) {
            var form = $("#form_filter")[0];
            if (form.checkValidity()) {
                $.ajax({
                    url: "<?php echo site_url($Url_Ini); ?>",
                    cache: false,
                    method: "POST",
                    data: $("#form_filter").serialize(),
                    beforeSend: function() {
                        $("#btn_tampilkan").prop("disabled", true);
                        $('#ajax_getusersmenu_result').html('<div class="text-center"><div class="spinner-border" style="width: 3rem; height: 3rem;" role="status"></div></div>');
                    },
                    success: function(response) {
                        $('#ajax_getusersmenu_result').html(response);
                        $("#btn_tampilkan").prop("disabled", false);
                    },
                    error: function(xhr, status, error) {
                        var msg = 'Error - ' + xhr.status + ': ' + xhr.statusText;
                        $('#ajax_getusersmenu_result').html('<div class="col-12"> <div class="alert alert-danger left-icon-big alert-dismissible fade show"> <div class="media"> <div class="alert-left-icon-big"> <span><i class="mdi mdi-alert"></i></span> </div> <div class="media-body"> <h5 class="mt-1 mb-2">Loading failed!</h5> <p class="mb-0"> '+ msg +' </p> </div> </div> </div> </div>');
                        $("#btn_tampilkan").prop("disabled", false);
                    }
                });
                e.preventDefault();
            }
        });
    });
    </script>

<?php echo $this->endSection(); ?>
