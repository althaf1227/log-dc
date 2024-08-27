<?php echo $this->extend('BackPage/AdminPanel/Layout/template'); ?>

<?php echo $this->section('content'); ?>

        <div class="content-body">
			<div class="container-fluid">
				<div class="form-head d-flex mb-3 align-items-start">
					<div class="me-auto d-none d-lg-block">
						<h2 class="text-primary font-w600 mb-0">Dashboard</h2>
						<p class="mb-0">Selamat datang di </p>
					</div>
				</div>
                <div class="row">
					<div class="col-lg-12">
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
	});
    </script>

<?php echo $this->endSection(); ?>

