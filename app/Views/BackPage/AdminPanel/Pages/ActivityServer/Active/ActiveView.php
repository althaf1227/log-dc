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
                        <div class="table-responsive">
                            <table id="tbl_active" class="display" style="min-width: 845px">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nama</th>
                                        <th>Nomor Hp</th>
                                        <th>Email</th>
                                        <th>Instansi</th>
                                        <th>Jam Masuk</th>
                                        <th>Jam Keluar</th>
                                        <th>Keperluan</th>
                                        <th>Persetujuan</th>
                                        <th>Catatan</th>
                                        <th>Tanggal Aktivitas</th>
                                        <th>Status</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (isset($DataActive)) {
                                        $no = 1;
                                        foreach ($DataActive as $row):
                                    ?><?php
                                            $statusClass = '';
                                            switch ($row['LogStatus']) {
                                                case 'request':
                                                    $statusClass = 'status-request';
                                                    break;
                                                case 'in process':
                                                    $statusClass = 'status-in-process';
                                                    break;
                                            }
                                        ?>
                                    <tr>
                                        <td><?php echo $no++; ?></td>
                                        <td><?php echo esc($row['LogNama']); ?></td>
                                        <td><?php echo esc($row['LogNomorHp']); ?></td>
                                        <td><?php echo esc($row['LogEmail']); ?></td>
                                        <td><?php echo esc($row['LogInstansi']); ?></td>
                                        <td><?php echo date("H:i:s", strtotime($row['LogJamMasuk'])); ?></td>
                                        <td><?php
                                            if (!empty($row['LogJamKeluar'])) {
                                                echo date("H:i:s", strtotime($row['LogJamKeluar']));
                                            } else {
                                                echo ''; 
                                            }
                                            ?></td>
                                        <td><?php echo htmlspecialchars_decode($row['LogKeperluan']); ?></td>
                                        <td class="<?= $row['LogPersetujuan'] == 1 ? 'setuju' : 'tidak'; ?>"><?php echo esc($row['LogPersetujuan'] == 1 ? 'Disetujui' : 'Tidak Disetujui'); ?></td>
                                        <td><?php echo htmlspecialchars_decode($row['LogCatatan']); ?></td>
                                        <td><?php echo date("d-m-Y", strtotime($row['LogTanggal'])); ?></td>
                                        <td class="<?php echo $statusClass; ?>"><?php echo esc($row['LogStatus']); ?></td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="<?php echo site_url($Url_Ini . '/' . 'edit/' . esc($row['LogId'])); ?>"
                                                    class="btn btn-primary shadow btn-xs sharp me-1"><i
                                                        class="fas fa-pencil-alt"></i></a>
                                                <button data-id="<?php echo esc($row['LogId']); ?>"
                                                    data-url="<?php echo site_url($Url_Ini . '/' . 'delete/' . esc($row['LogId']) . '?redirect_url=' . urlencode(uri_string())); ?>"
                                                    class="btn btn-danger shadow btn-xs sharp btn_hapus"><i
                                                        class="fa fa-trash"></i></button>
                                            </div>
                                        </td>
                                    </tr>
                            <?php
                                        endforeach;
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

<style>
    .status-request {
        color: #f97026;
        font-weight: bold;
        /* Warna merah muda */
    }

    .status-in-process {
        color: #4578ff;
        font-weight: bold;
        /* Warna kuning muda */
    }

    .setuju {
        color: #42bc83;
        font-weight: bold;
    }

    .tidak {
        color: red;
        font-weight: bold;
    }
</style>

<script>
    $(document).ready(function() {
        $('#tbl_active').DataTable({
            paging: false
        });
        $("#tbl_active").on("click", ".btn_hapus", function(e) {
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