<form id="form_menu" method="post">
    <?php
    if (isset($datamenu) && count($datamenu) > 0) {
    ?>
        <h4>Menu For Users</h4>
        <ul>
            <li><label><input class="form-check-input" type="checkbox" <?php if (count($datamenu) == count($datausersmenu)) echo 'checked'; ?> /> All</label>
                <ul>
                    <?php
                    foreach ($datamenu as $menu1) {
                        if (is_null($menu1->MenuParentId) || $menu1->MenuParentId == 0) {
                    ?>
                            <li class="menu_child"><label><input class="form-check-input" type="checkbox" name="chk_menu[]" value="<?php echo esc($menu1->MenuId); ?>" <?php if (in_array($menu1->MenuId, $datausersmenu)) echo 'checked'; ?> /> <?php echo esc($menu1->MenuName); ?></label>
                                <?php if ($menu1->MenuHasSubmenu == 1) { ?>
                                    <ul>
                                        <?php
                                        foreach ($datamenu as $menu2) {
                                            if ($menu2->MenuParentId === $menu1->MenuId) {
                                        ?>
                                                <li class="menu_child"><label><input class="form-check-input" type="checkbox" name="chk_menu[]" value="<?php echo esc($menu2->MenuId); ?>" <?php if (in_array($menu2->MenuId, $datausersmenu)) echo 'checked'; ?> /> <?php echo esc($menu2->MenuName); ?></label>
                                                    <?php if ($menu2->MenuHasSubmenu == 1) { ?>
                                                        <ul>
                                                            <?php
                                                            foreach ($datamenu as $menu3) {
                                                                if ($menu3->MenuParentId === $menu2->MenuId) {
                                                            ?>
                                                                    <li class="menu_child"><label><input class="form-check-input" type="checkbox" name="chk_menu[]" value="<?php echo esc($menu3->MenuId); ?>" <?php if (in_array($menu3->MenuId, $datausersmenu)) echo 'checked'; ?> /> <?php echo esc($menu3->MenuName); ?></label></li>
                                                            <?php }
                                                            } ?>
                                                        </ul>
                                                    <?php } ?>
                                                </li>
                                        <?php }
                                        } ?>
                                    </ul>
                                <?php } ?>
                            </li>
                    <?php }
                    } ?>
                </ul>
            </li>
        </ul>
    <?php } ?>

    <div class="mt-3">
        <div id="ajax_act_saveusersmenu_result"></div>
        <input type="hidden" name="id" value="<?php echo rand(); ?>">
        <input type="hidden" name="key" value="ajax_act_saveusersmenu">
        <input type="hidden" name="users_id" value="<?php echo esc($users_id); ?>">
        <button type="submit" id="btn_simpan" class="btn btn-primary">Simpan</button>
    </div>

</form>

<!-- Form validate init -->
<script src="<?php echo base_url('assets/theme/davur/assets/js/plugins-init/jquery.validate-init.js'); ?>"></script>

<script>
    $(document).ready(function() {
        function checkParents($li, state) {
            var $siblings = $li.siblings();
            var $parent = $li.parent().closest('li');
            state = state && $siblings.children('label').find('input[type="checkbox"]').prop('checked');
            $parent.children('label').find('input[type="checkbox"]').prop('checked', state);
            if ($parent.parents('li').length) checkParents($parent, state);
        }
        $('input[type="checkbox"]').change(function() {
            var $cb = $(this);
            var $li = $cb.closest('li');
            var state = $cb.prop('checked');

            // check all children
            $li.find('input[type="checkbox"]').prop('checked', state);

            // check all parents, as applicable
            if ($li.parents('li').length) checkParents($li, state);
        });
        $("#btn_simpan").on("click", function(e) {
            var form = $("#form_menu")[0];
            if (form.checkValidity()) {
                Swal.fire({
                    title: 'Konfirmasi Kebenaran Data',
                    text: "Anda yakin semua isian sudah benar?",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ya, Lanjutkan!',
                    cancelButtonText: 'Batal'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "<?php echo site_url($Url_Ini); ?>",
                            cache: false,
                            method: "POST",
                            data: $("#form_menu").serialize(),
                            dataType: 'json',
                            beforeSend: function() {
                                $("#btn_simpan").prop("disabled", true);
                                $('#ajax_act_saveusersmenu_result').html(' <div class="spinner-border" role="status"> <span class="visually-hidden">Loading...</span> </div>');
                            },
                            success: function(response) {
                                if (response.success == true) {
                                    $('#ajax_act_saveusersmenu_result').html('<div class="alert alert-success solid"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg><strong>Berhasil!</strong> ' + response.message + '</div>');
                                    Swal.fire('Berhasil!', '' + response.message + '', 'success');
                                } else {
                                    $('#ajax_act_saveusersmenu_result').html('<div class="alert alert-danger solid"><svg viewBox="0 0 24 24" width="24 " height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg><strong>Gagal!</strong> ' + response.message + '</div>');
                                    Swal.fire('Gagal!', '' + response.message + '', 'error');
                                }
                                $("#btn_simpan").prop("disabled", false);
                            },
                            error: function(xhr, status, error) {
                                var msg = 'Error - ' + xhr.status + ': ' + xhr.statusText;
                                $('#ajax_act_saveusersmenu_result').html('<div class="col-12"> <div class="alert alert-danger left-icon-big alert-dismissible fade show"> <div class="media"> <div class="alert-left-icon-big"> <span><i class="mdi mdi-alert"></i></span> </div> <div class="media-body"> <h5 class="mt-1 mb-2">Loading failed!</h5> <p class="mb-0"> ' + msg + ' </p> </div> </div> </div> </div>');
                                $("#btn_simpan").prop("disabled", false);
                            }
                        });
                    }
                });
                e.preventDefault();
            }
        });
    });
</script>