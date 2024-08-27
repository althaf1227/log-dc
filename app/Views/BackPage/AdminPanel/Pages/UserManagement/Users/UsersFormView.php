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

                        <div class="form-validation">
                            <?php if (isset($operation) && $operation == "add") { ?>
                                <form id="form_users" method="post" action="<?php echo site_url($Url_Ini . '/add'); ?>" class="needs-validation" novalidate>
                                <?php } else if (isset($operation) && isset($user) && $operation == "edit") { ?>
                                    <form id="form_users" method="post" action="<?php echo site_url($Url_Ini . '/edit'); ?>" class="needs-validation" novalidate>
                                        <input type="hidden" name="id" value="<?php echo esc($user->id); ?>" required />
                                    <?php } ?>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="txt_nama">Nama <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="txt_nama" name="txt_nama" value="<?php if (is_null(old('txt_nama')) == false) {
                                                                                                                                echo old('txt_nama');
                                                                                                                            } else {
                                                                                                                                if (isset($operation) && isset($user_identity) && $operation == "edit") echo esc($user_identity->name);
                                                                                                                            } ?>" placeholder="Masukan Nama.." required />
                                            <div class="invalid-feedback">Masukan Nama.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="slc_group">Group <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <select class="multi-select" id="slc_group" name="slc_group[]" multiple="multiple" required onchange="loadPermissions()">
                                                <?php
                                                if (isset($datagroup)) {
                                                    foreach ($datagroup as $row) {
                                                ?>
                                                        <option value="<?php echo esc($row); ?>" <?php if (isset($operation) && isset($user) && $operation == "edit" && in_array($row, $user_group)) echo "selected"; ?>>
                                                            <?php echo esc($row); ?>
                                                        </option>
                                                <?php
                                                    }
                                                }
                                                ?>
                                            </select>
                                            <div class="invalid-feedback">Pilih Group.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <div class="col-sm-9 ms-auto">
                                            <div class="form-check">
                                                <input id="chk_allgroup" class="form-check-input" type="checkbox" />
                                                <label class="form-check-label" for="chk_allgroup"><small>Pilih Semua Group</small></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="txt_email">Email <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="txt_email" name="txt_email" value="<?php if (is_null(old('txt_email')) == false) {
                                                                                                                                echo old('txt_email');
                                                                                                                            } else {
                                                                                                                                if (isset($operation) && isset($user_identity) && $operation == "edit") echo esc($user_identity->secret);
                                                                                                                            } ?>" placeholder="Masukan Email.." required />
                                            <div class="invalid-feedback">Masukan Email.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="txt_username">Username <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="txt_username" name="txt_username" value="<?php if (is_null(old('txt_username')) == false) {
                                                                                                                                        echo old('txt_username');
                                                                                                                                    } else {
                                                                                                                                        if (isset($operation) && isset($user) && $operation == "edit") echo esc($user->username);
                                                                                                                                    } ?>" placeholder="Masukan Username.." required />
                                            <div class="invalid-feedback">Masukan Username.</div>
                                        </div>
                                    </div>
                                  
                                    <?php if (isset($users_detail) &&  $users_detail->inGroup('admin')) { ?>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label" for="txt_password">Password <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="password" class="form-control" id="txt_password" name="txt_password" placeholder="Masukan Password.." required />
                                                <div class="invalid-feedback">Masukan Password.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label" for="txt_password_konfirmasi">Konfirmasi Password <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="password" class="form-control" id="txt_password_konfirmasi" name="txt_password_konfirmasi" placeholder="Masukan Konfirmasi Password.." required />
                                                <div class="invalid-feedback">Masukan Konfirmasi Password.</div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                    <div class="mb-3 row">
                                        <label class="col-sm-3 col-form-label" for="slc_permission">Permission <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <select class="multi-select slc_permission" id="slc_permission" name="slc_permission[]" multiple="multiple" required onchange="toggleCheckbox()">
                                                <?php if (isset($datapermission) && isset($user_permission)) : ?>
                                                    <?php foreach ($datapermission as $permission) : ?>
                                                        <option value="<?php echo esc($permission); ?>" <?php if (in_array($permission, $user_permission)) echo 'selected'; ?>>
                                                            <?php echo esc($permission); ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                <?php endif; ?>
                                            </select>
                                            <div class="invalid-feedback">Pilih Permission.</div>
                                        </div>

                                    </div>
                                    <div class="mb-3 row">
                                        <div class="col-sm-9 ms-auto">
                                            <div class="form-check">
                                                <input id="chk_allpermission" class="form-check-input" type="checkbox" />
                                                <label class="form-check-label" for="chk_allpermission"><small>Pilih Semua Permission</small></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <div class="col-sm-9 ms-auto">
                                            <div class="form-check">
                                                <input type="hidden" name="apply_user" value="0"> <!-- Input hidden untuk nilai default -->
                                                <input id="chk_applyalluser" name="apply_user" class="form-check-input" type="checkbox" value="1" />
                                                <label class="form-check-label" for="chk_applyalluser"><small>Terapkan Permission Group Ke Semua User Group</small></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <div class="col-sm-9 ms-auto">
                                            <input type="hidden" name="hid_url" value="<?php echo current_url(); ?>" />
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
<link rel="stylesheet" href="<?php echo base_url('assets/theme/davur/assets/vendor/select2/css/select2.min.css'); ?>">

<!-- Datatable -->
<!-- <link href="<?php //echo base_url('assets/theme/davur/assets/vendor/datatables/css/jquery.dataTables.min.css'); 
                    ?>" rel="stylesheet"> -->
<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js'); ?>
<script src="<?php echo base_url('assets/theme/davur/assets/vendor/select2/js/select2.full.min.js'); ?>"></script>

<!-- Datatable -->
<!-- <script src="<?php //echo base_url('assets/theme/davur/assets/vendor/datatables/js/jquery.dataTables.min.js'); 
                    ?>"></script> -->

<!-- Form validate init -->
<script src="<?php echo base_url('assets/theme/davur/assets/js/plugins-init/jquery.validate-init.js'); ?>"></script>
<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js_custom'); ?>

<script>
    $(document).ready(function() {
        var $slc_group = $("#slc_group").select2();
        var $slc_permission = $("#slc_permission").select2();
        $("#slc_permission").change(function() {
            $(":selected", this).length == this.length ? $("#chk_allpermission").prop("checked", true) : $("#chk_allpermission").prop("checked", false);
        });
        $("#chk_allpermission").click(function() {
            if ($("#chk_allpermission").is(':checked')) {
                $("#slc_permission > option").prop("selected", "selected");
                $("#slc_permission").trigger("change");
            } else {
                $slc_permission.val(null).trigger("change");
            }
        });
        $("#slc_group").change(function() {
            $(":selected", this).length == this.length ? $("#chk_allgroup").prop("checked", true) : $("#chk_allgroup").prop("checked", false);
        });
        $("#chk_allgroup").click(function() {
            if ($("#chk_allgroup").is(':checked')) {
                $("#slc_group > option").prop("selected", "selected");
                $("#slc_group").trigger("change");
            } else {
                $slc_group.val(null).trigger("change");
            }
        });


        // $("#slc_group").select2();
        // $("#slc_permission").select2();
        // $('#tbl_permission').DataTable({
        //     paging:false
        // });
        $("#btn_simpan").on("click", function(e) {
            var form = $("#form_users")[0];
            if (form.checkValidity()) {
                $("#btn_simpan").prop("disabled", true);
                form.submit();
            }
        });
    });

    function loadPermissions() {
        var selectedGroups = $('#slc_group').val(); // Mengambil nilai dari select multiple

        if (selectedGroups.length > 0) {
            $.ajax({
                url: '<?php echo site_url($Url_Ini); ?>', // Ganti dengan URL controller yang sesuai
                method: 'POST',
                data: {
                    groups: selectedGroups,
                    key: 'getAjaxPermissionUsers' // Tambahkan key getPermissionUsers
                },
                success: function(response) {
                    // Kosongkan opsi sebelumnya
                    $('#slc_permission').empty();

                    // Tambahkan opsi baru dari respons JSON
                    response.forEach(function(item) {
                        $('#slc_permission').append('<option value="' + item.value + '">' + item.label + '</option>');
                    });

                    // Tampilkan div chk_allpermission jika ada opsi yang dimuat
                    if (response.length > 0) {
                        $('#chk_allpermission_div').show();
                    } else {
                        $('#chk_allpermission_div').hide();
                    }
                },
                error: function() {
                    alert('Terjadi kesalahan saat memuat data permission.');
                    $('#chk_allpermission_div').hide();
                }
            });
        }
    }

    // Event handler untuk checkbox "Pilih Semua Permission"
    $('#chk_allpermission').on('change', function() {
        var isChecked = $(this).is(':checked');
        $('#slc_permission option').prop('selected', isChecked);
    });

    //disabled all user permission
    function toggleCheckbox() {
        const slcPermission = document.getElementById('slc_permission');
        const chkApplyAllUser = document.getElementById('chk_applyalluser');

        // Check if there are any selected options
        if (slcPermission.selectedOptions.length > 0) {
            chkApplyAllUser.disabled = false; // Enable checkbox if options are selected
        } else {
            chkApplyAllUser.disabled = true; // Disable checkbox if no options are selected
        }
    }

    // Initial check on page load
    document.addEventListener('DOMContentLoaded', function() {
        toggleCheckbox();
    });
</script>

<?php echo $this->endSection(); ?>