<?php echo $this->extend('BackPage/AdminPanel/Layout/template'); ?>

<?php echo $this->section('content'); ?>

        <div class="content-body">
			<div class="container-fluid">
					<div class="me-auto d-none d-lg-block text-center">
						<h2 class="text-primary font-w600 mb-0">Dashboard</h2>
						<p class="mb-0">Selamat datang di Penjaga Server </p>
					</div>
                <div class="row">
					<div class="mb-3">
						<div class="col-xl-12 col-xxl-12 col-ls-12 col-md-12">
							<div class="card">
								<div class="card-header border-0 pb-0 d-sm-flex d-block">
									<div>
										<h3 class="card-title mb-1">Log Pengunjung</h3>
										<small class="mb-o">infografi Pengunjung server di setiap bulan</small>
									</div>
								</div>
								<div class="card-body">
									<div class="tab-content" id="myTabContent">
										<div class="tap-pane fade show active" id="pengunjung" role="tabpanel">
											<canvas class="chartjs" id="pengunjung"></canvas>
										</div>
									</div>
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
<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js_script'); ?>



    <script>
	$(document).ready(function() {
		const pengunjung = document.getElementById('pengunjung').getContext('2d');
		new chart(pengunjung ,{
			type: 'line',
			data: {
				label: 'pengunjung server',
				dataset: [
					{
						label: 'total pengujung server',
						data: '',
						fill: true,
						borderColor: 'rgb(75, 192, 192)',
					}
				]
			}
		})
	
	});



    </script>

<?php echo $this->endSection(); ?>

