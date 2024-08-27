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
<?php if (isset($operation) && $operation == "add") { ?>
                                    <form id="form_menu" method="post" action="<?php echo site_url($Url_Ini.'/add'); ?>" class="needs-validation" novalidate >
<?php } else if (isset($operation) && isset($menu) && $operation == "edit") { ?>
                                    <form id="form_menu" method="post" action="<?php echo site_url($Url_Ini.'/edit'); ?>" class="needs-validation" novalidate >
                                        <input type="hidden" name="hid_menuid" value="<?php echo esc($menu->MenuId); ?>" required />
<?php } ?>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label" for="txt_namamenu">Nama Menu <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="txt_namamenu" name="txt_namamenu" value="<?php if (is_null(old('txt_namamenu')) == false) { echo old('txt_namamenu'); } else { if (isset($operation) && isset($menu) && $operation == "edit") echo esc($menu->MenuName); } ?>" placeholder="Masukan Nama Menu.." required />
                                                <div class="invalid-feedback">Masukan Nama Menu.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label" for="txt_url">URL Menu <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="txt_url" name="txt_url" value="<?php if (is_null(old('txt_url')) == false) { echo old('txt_url'); } else { if (isset($operation) && isset($menu) && $operation == "edit") echo esc($menu->MenuUrl); } ?>" placeholder="Masukan URL Menu.." required />
                                                <div class="invalid-feedback">Masukan URL Menu.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label" for="slc_jenis">Jenis Menu <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <select class="form-control" id="slc_jenis" name="slc_jenis" required>
                                                    <option value="menu_utama" <?php if (is_null(old('slc_jenis')) == false) { if (old('slc_jenis') == "menu_utama") echo 'selected'; } else { if (isset($operation) && isset($menu) && $operation == "edit") if (is_null($menu->MenuParentId) || $menu->MenuParentId == '0') echo 'selected'; } ?>>Menu Utama</option>
                                                    <option value="sub_menu" <?php if (is_null(old('slc_jenis')) == false) { if (old('slc_jenis') == "sub_menu") echo 'selected'; } else { if (isset($operation) && isset($menu) && $operation == "edit") if (is_null($menu->MenuParentId) == false && $menu->MenuParentId != '0') echo 'selected'; } ?>>Sub Menu</option>
                                                </select>
                                                <div class="invalid-feedback">Pilih Jenis Menu.</div>
                                            </div>
                                        </div>
<?php
$style = '';
if (isset($operation) && $operation == "add") $style = 'display: none;';
if (isset($operation) && isset($menu) && $operation == "edit") if (is_null($menu->MenuParentId) || $menu->MenuParentId == '0') $style = 'display: none;';
?>
                                        <div id="menu_parent" class="mb-3 row menu_parent" style="<?php echo $style; ?>">
                                            <label class="col-sm-3 col-form-label" for="slc_menuparent">Menu Parent <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <select class="form-control" id="slc_menuparent" name="slc_menuparent">
<?php
if (isset($datamenuparent)) {
    foreach ($datamenuparent as $row) {
?>
                                                    <option value="<?php echo esc($row->MenuId); ?>" <?php if (isset($operation) && isset($menu) && $operation == "edit") if ($row->MenuId == $menu->MenuParentId) echo 'selected'; ?>><?php echo esc($row->MenuName); ?></option>
<?php
}}
?>
                                                </select>
                                                <div class="invalid-feedback">Pilih Menu Parent.</div>
                                            </div>
                                        </div>
                                        <div class="row menu_parent" style="<?php echo $style; ?>">
                                            <label class="col-sm-3 col-form-label" for="txa_permission">Permission</label>
                                            <div class="col-sm-9">
                                                <textarea id="txa_permission" name="txa_permission" class="form-control" style="height: 8rem !important;" placeholder="Contoh : create, read, update, delete"><?php if (is_null(old('txa_permission')) == false) { echo old('txa_permission'); } else { if (isset($operation) && isset($permissions_aksi) && $operation == "edit") echo implode("\n", $permissions_aksi); } ?></textarea>
                                                <div class="invalid-feedback">Masukan Permission.</div>
                                            </div>
                                        </div>
                                        <div class="mb-1 row menu_parent" style="<?php echo $style; ?>">
                                            <div class="col-sm-9 ms-auto">
                                                <label class="form-check-label"><small><i>Tambahkan permission dengan pemisah enter</i></small></label>
                                            </div>
                                        </div>
                                        <div class="mb-3 row menu_parent" style="<?php echo $style; ?>">
                                            <div class="col-sm-9 ms-auto">
                                                <div class="form-check">
                                                    <input id="chk_allpermission" class="form-check-input" type="checkbox" />
                                                    <label class="form-check-label" for="chk_allpermission"><small>Default Permission</small></label>
                                                    <div class="invalid-feedback">Masukan Permission.</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label" for="txt_icon">Icon</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="txt_icon" name="txt_icon" value="<?php if (is_null(old('txt_icon')) == false) { echo old('txt_icon'); } else { if (isset($operation) && isset($menu) && $operation == "edit") echo esc($menu->MenuIcon); } ?>" placeholder="Masukan Icon Menu.." />
                                                <div class="invalid-feedback">Masukan Icon Menu.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label" for="txt_urutan">Urutan <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" id="txt_urutan" name="txt_urutan" value="<?php if (is_null(old('txt_urutan')) == false) { echo old('txt_urutan'); } else { if (isset($operation) && isset($menu) && $operation == "edit") echo esc($menu->MenuOrder); } ?>" placeholder="Masukan Urutan Menu.." required />
                                                <div class="invalid-feedback">Masukan Urutan Menu.</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-form-label col-sm-3 pt-0">Tampilkan <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" id="rad_tampilkan_ya" name="rad_tampilkan" value="1" <?php if (is_null(old('rad_tampilkan')) == false) { if (old('rad_tampilkan') == "1") echo 'checked'; } else { if (isset($operation) && isset($menu) && $operation == "edit") if ($menu->MenuIsShow == '1') echo 'checked'; } ?> required>
                                                    <label class="form-check-label" for="rad_tampilkan_ya">Ya</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" id="rad_tampilkan_tidak" name="rad_tampilkan" value="0" <?php if (is_null(old('rad_tampilkan')) == false) { if (old('rad_tampilkan') == "0") echo 'checked'; } else { if (isset($operation) && isset($menu) && $operation == "edit") if ($menu->MenuIsShow == '0') echo 'checked'; } ?> required>
                                                    <label class="form-check-label" for="rad_tampilkan_tidak">Tidak</label>
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
        $("#chk_allpermission").click(function() {
            if ($("#chk_allpermission").is(':checked')) {
                var teks = 'create\r\nread\r\nupdate\r\ndelete';
                $('#txa_permission').val(teks);
            } else {
                $('#txa_permission').val('');
            }
        });
        $("#slc_jenis").change(function() {
            if ($(this).val() === 'menu_utama') {
                $(".menu_parent").hide();
                $("#slc_menuparent").prop('required', false);
            } else if ($(this).val() === 'sub_menu') {
                $(".menu_parent").show();
                $("#slc_menuparent").prop('required', true);
            }
        });
        $("#btn_simpan").on("click", function (e) {
            var form = $("#form_menu")[0];
            if (form.checkValidity()) {
                $("#btn_simpan").prop("disabled", true);
                form.submit();
            }
        });
    });
    </script>

<?php echo $this->endSection(); ?>
