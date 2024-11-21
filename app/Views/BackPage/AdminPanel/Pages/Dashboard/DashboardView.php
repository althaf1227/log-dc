<?php echo $this->extend('BackPage/AdminPanel/Layout/template'); ?>

<?php echo $this->section('content'); ?>
''
<div class="content-body">
    <div class="container-fluid">
        <div class="mb-3">      
            <div class="me-auto d-none d-lg-block text-center">
                <h2 class="text-primary font-w600 mb-0">Dashboard</h2>
                <p class="mb-0">Selamat datang Penjaga Server</p>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6 col-xxl-6 col-lg-5 col-md-12">
                <div class="card">
                    <div class="card-header border-0 pb-0 d-sm-flex d-block">
                        <div class="mb-3">
                            <h3 class="card-title mb-1">Status Kegiatan</h3>
                            <small class="mb-o">Status ruang dan status orang di server</small>
                        </div>
                    </div>
                    <div class="card-body tab-content orders-summary pt-3">
                        <div class="col-xl-9 col-lg-10 col-xxl-8 col-sm-9 col-md-9">
                            <div class="d-flex align-items-center mb-3">
                                <p class="mb-0 fs-14 font-w600 me-2 col-4 col-xxl-8 px-0">Status Ruang Server:</p>
                                    <?php 
                                    $ruang = '';
                                    switch($status_ruang){
                                        case 'Digunakan':
                                            $ruang = 'status-digunakan';
                                            break;
                                        case 'Kosong':
                                            $ruang = 'status-kosong';
                                            break;
                                        }
                                        ?>
                                <p class="mb-0 fs-14 <?php echo $ruang; ?> "><?= $status_ruang; ?></p>
                            </div>
                        </div>
                        <div class="tap-pane fade show active">
                            <div class="d-flex rounded overflow-hidden">
                                <div class="flex-fill text-center px-3 py-3">
                                    <h2 class="fs-32 fw-bold counter"><?php echo ($status_request); ?></h2>
                                    <p class="fs-16 mb-0">Request</p>
                                </div>
                                <div class="flex-fill text-center px-3 py-3">
                                    <h2 class="fs-32 fw-bold counter"><?php echo ($status_proses); ?></h2>
                                    <p class="fs-16 mb-0">In process</p>
                                </div>
                                <div class="flex-fill text-center px-3 py-3">
                                    <h2 class="fs-32 fw-bold counter"><?php echo ($status_completed); ?></h2>
                                    <p class="fs-16 mb-0">Completed</p>
                                </div>
                            </div>
                        </div>
                        <hr style="height: 2px; background-color: black; border: none;">
                        <div class="mb-3">
                            <small class="mb-o">Infografis kegiatan dalam satu bulan</small>
                        </div>
                        <div class="card-body revenue-chart px-3 mt-3">
						    <canvas id="kegiatan" class="chartjs"></canvas>
					    </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-6 col-xxl-6 col-lg-12 col-md-12">
				<div class="card">
					<div class="card-header border-0 pb-0 d-sm-flex d-block">
                        <div class="mb-3">
                            <h3 class="card-title mb-1">Pengunjung terbaru</h3>
                            <small class="mb-o">Bebebrapa daftar pengunjung baru yang melakukan kegiatan di server</small>
                        </div>
					</div>
                    <?php $no = 1; foreach($pengunjung as $riwayat): ?><?php 
                            $statusClass = '';
                            switch ($riwayat['LogStatus']) {
                                case 'request':
                                    $statusClass = 'status-request';
                                    break;
                                case 'in process':
                                    $statusClass = 'status-in-process';
                                    break;
                                case 'completed':
                                    $statusClass = 'status-completed';
                                    break;
                            } ?>
                    <div class="card-body tab-content orders-summary pt-3">
                        <div class="tap-pane fade show active mb-1">
                            <div class="d-flex border border-2 rounded overflow-hidden">
                                <div class="flex-fill text-center px-3 py-3">
                                    <p class="fs-20 font-w600 counter"><?php echo $no++ ?>.</p>
                                </div>
                                <div class="flex-fill px-3 py-3">
                                    <h3 class="fs-20 font-w600 counter">Name : <?= esc ($riwayat['LogNama']) ?></h3>
                                    <p class="fs-16 mb-0">Jam : <?= date("H:i", strtotime($riwayat['LogJamMasuk'])); ?> - <?php
                                            if (!empty($riwayat['LogJamKeluar'])) {
                                                echo date("H:i", strtotime($riwayat['LogJamKeluar']));
                                            } else {
                                                echo 'blm keluar';
                                            }
                                            ?></p>
                                    <p class="fs-16 mb-0">Tanggal : <?= esc ($riwayat['LogTanggal']); ?></p>
                                </div>
                                <div class="flex-fill text-center px-3 py-3">
                                    <p class="fs-16 fw-bold counter <?php echo $statusClass; ?>"><?= esc ($riwayat['LogStatus']); ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php endforeach; ?>
				</div>
			</div>
        </div>
    </div>
</div>

<?php echo $this->endSection(); ?>

<?php echo $this->section('content_css'); ?>
<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js'); ?>

<script src="<?php echo base_url('assets/theme/davur/assets/vendor/chart.js/Chart.bundle.min.js')?>"></script>

<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js_custom'); ?>

<style>
    .status-request {
        color: #f97026;
        font-weight: bold;
    }

    .status-in-process {
        color: #4578ff;
        font-weight: bold;
    }
    .status-completed {
        color: #42bc83;
        font-weight: bold;
    }
    .status-digunakan{
        color: #4578ff;
        font-weight: bold;
    }
    .status-kosong{
        color: #42bc83;
        font-weight: bold;
    }
</style>

<script>
	$(document).ready(function() {
        const ctx = document.getElementById('kegiatan').getContext('2d');

        const myLineChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'October', 'November', 'Desember'], 
                datasets: [
                    {
                        label: 'kegiatan Ruang Server',
                        data: <?php echo json_encode($server) ?>,
                        borderColor: 'rgba(75, 192, 192, 1)',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderWidth: 2,
                        tension: 0.4, 
                    }
                ]
            },
            options: {
                responsive: true, 
                plugins: {
                    legend: {
                        display: true, 
                        position: 'top', 
                    }
                },
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Bulan',
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Jumlah Penjualan', 
                        },
                        beginAtZero: true 
                    }
                }
            }
        });
        
	});
</script>

<?php echo $this->endSection(); ?>
