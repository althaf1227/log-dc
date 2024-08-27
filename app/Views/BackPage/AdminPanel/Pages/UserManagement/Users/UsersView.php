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
                                    <button type="button" id="btn_tambah" class="btn btn-rounded btn-success" onclick="window.location='<?php echo site_url($Url_Ini.'/add'); ?>'">Tambah</button>
                                </div>
                            </div>
                            <div class="card-body">
<?php
if (session()->getFlashdata('notif')) echo session()->getFlashdata('notif');
?>
                                <div class="table-responsive">
                                    <table id="tbl_users" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Nama</th>
                                                <th>Email</th>
                                                <th>Username</th>
                                                <th>Aktif</th>
                                                <th>Last Active</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
<?php 
if (isset($datausers)) {
    $no = 1;
    foreach ($datausers as $row) {
?>
                                            <tr>
                                                <td><?php echo $no++; ?></td>
                                                <td><?php echo esc($row->name); ?></td>
                                                <td><?php echo esc($row->secret); ?></td>
                                                <td><?php echo esc($row->username); ?></td>
                                                <td><?php echo esc($row->active); ?></td>
                                                <td><?php echo esc($row->last_active); ?></td>
                                                <td>
                                                    <div class="d-flex">
                                                        <a href="<?php echo site_url($Url_Ini.'/edit/'.esc($row->UsersId)); ?>" class="btn btn-primary shadow btn-xs sharp me-1"><i class="fas fa-pencil-alt"></i></a>
                                                        <button data-id="<?php echo esc($row->UsersId); ?>" data-url="<?php echo site_url($Url_Ini.'/delete/'.esc($row->UsersId).'?redirect_url='.urlencode(uri_string())); ?>" class="btn btn-danger shadow btn-xs sharp btn_hapus"><i class="fa fa-trash"></i></button>
                                                    </div>
                                                </td>
                                            </tr>
<?php 
}}
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
        $("#btn_tambah").on("click", function (e) {
            $("#btn_tambah").prop("disabled", true);
            e.preventDefault();
        });
        $('#tbl_users').DataTable({
            paging:false
        });
        $("#tbl_users").on("click", ".btn_hapus", function(e) {
            var url = $(this).data('url');
            var id = $(this).data('id');
            Swal.fire({
                title: 'Yakin Hapus data?',
                text: "Data yang telah dihapus tidak bisa dikembalikan",
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya, Lanjutkan!',
                cancelButtonText: 'Batal'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = url;
                }
            });
            e.preventDefault();
        });
    });
    </script>

<?php echo $this->endSection(); ?>
