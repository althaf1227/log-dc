<?php echo $this->extend('BackPage/AdminPanel/Layout/template'); ?>

<?php echo $this->section('content'); ?>

<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title"><?php echo $SysForm['title']; ?></h4>
                        <div class="btn-page">
                            <button type="button" id="btn_tambah" class="btn btn-rounded btn-success" onclick="window.location='<?php echo site_url($Url_Ini . '/add'); ?>'">Tambah</button>
                            <button type="button" id="btn_edit" class="btn btn-rounded btn-warning" onclick="window.location='<?php echo site_url($Url_Ini . '/edit'); ?>'">Edit Advance</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <?php
                        if (session()->getFlashdata('notif')) echo session()->getFlashdata('notif');
                        ?>
                        <div class="table-responsive">
                            <table id="tbl_group" class="display" style="min-width: 845px">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nama</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (isset($datagroup)) {
                                        $no = 1;
                                        foreach ($datagroup as $row) {
                                    ?>
                                            <tr>
                                                <td><?php echo $no++; ?></td>
                                                <td><?php echo esc($row); ?></td>
                                            </tr>
                                    <?php
                                        }
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php echo $this->endSection(); ?>

<?php echo $this->section('content_css'); ?>
<!-- Datatable -->
<link href="<?php echo base_url('assets/theme/davur/assets/vendor/datatables/css/jquery.dataTables.min.css'); ?>" rel="stylesheet">

<link href="<?php echo base_url('assets/theme/davur/assets/vendor/sweetalert2@11.5.1/dist/sweetalert2.min.css'); ?>" rel="stylesheet">
<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js'); ?>
<!-- Datatable -->
<script src="<?php echo base_url('assets/theme/davur/assets/vendor/datatables/js/jquery.dataTables.min.js'); ?>"></script>

<script src="<?php echo base_url('assets/theme/davur/assets/vendor/sweetalert2@11.5.1/dist/sweetalert2.min.js'); ?>"></script>
<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js_custom'); ?>

<script>
    $(document).ready(function() {
        $("#btn_tambah").on("click", function(e) {
            $("#btn_tambah").prop("disabled", true);
            e.preventDefault();
        });
        $("#btn_edit").on("click", function(e) {
            $("#btn_edit").prop("disabled", true);
            e.preventDefault();
        });
        $('#tbl_group').DataTable({
            paging: false
        });
    });
</script>

<?php echo $this->endSection(); ?>