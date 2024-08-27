<?php echo $this->extend('BackPage/AdminPanel/Layout/template'); ?>

<?php echo $this->section('content'); ?>

        <div class="content-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="profile card card-body px-3 pt-3 pb-0">
                            <div class="profile-head">
                                <div class="photo-content">
                                    <!-- <div class="cover-photo rounded"></div> -->
                                </div>
                                <div class="profile-info">
									<div class="profile-photo">
										<!-- <img src="images/profile/profile.png" class="img-fluid rounded-circle" alt=""> -->
									</div>
									<div class="profile-details">
										<div class="profile-name px-3 pt-2">
											<h4 class="text-primary mb-0"><?php echo esc($SysVar['identities']->name); ?></h4>
											<p><?php echo esc($nama_group); ?></p>
										</div>
										<div class="profile-email px-2 pt-2">
											<h4 class="text-muted mb-0"><?php echo esc($SysVar['identities']->secret); ?></h4>
											<p>Email</p>
										</div>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4">
						<div class="row">
							<div class="col-xl-12">
								<div class="card">
									<div class="card-body">
										<div class="profile-statistics">
											<div class="text-center">
												<div class="row">
													<div class="col">
														<h3 class="m-b-0"><span>Data</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-12">
								<div class="card">
									<div class="card-header border-0 pb-0">
										<h5>Riwayat Login</h5>
									</div>
									<div class="card-body">
										<div class="widget-timeline-icon">
											<ul class="timeline">
<?php
if (isset($datauserlogin)) {
    foreach ($datauserlogin as $rowuserlogin) {
?>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">Login berhasil</h4>
														<p class="fs-15 mb-0 "><?php echo func_UbahTanggal11(esc($rowuserlogin->date)); ?></p>
													</a>
												</li>
<?php }} ?>
											</ul>	
										</div>
									</div>
								</div>
							</div>
						</div>
                    </div>
                    <div class="col-xl-8">
                        <div class="card h-auto">
                            <div class="card-body">
<?php
if (session()->getFlashdata('notif')) echo session()->getFlashdata('notif');
?>
                                <div class="profile-tab">
                                    <div class="custom-tab-1">
                                        <ul class="nav nav-tabs">
                                            <li class="nav-item"><a href="#data-diri" data-bs-toggle="tab" class="nav-link active show">Data Diri</a></li>
                                            <li class="nav-item"><a href="#ubah-data-diri" data-bs-toggle="tab" class="nav-link">Ubah Data Diri</a></li>
                                            <li class="nav-item"><a href="#ubah-password" data-bs-toggle="tab" class="nav-link">Ubah Password</a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div id="data-diri" class="tab-pane fade active show">
                                                <div class="profile-personal-info">
													<div class="pt-4"></div>
                                                    <h4 class="text-primary mb-4">Informasi Data Personal</h4>
                                                    <div class="row mb-2">
                                                        <div class="col-sm-4 col-5">
                                                            <h5 class="f-w-500">Nama <span class="pull-end">:</span>
                                                            </h5>
                                                        </div>
                                                        <div class="col-sm-8 col-7"><span><?php echo esc($SysVar['identities']->name); ?></span>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-sm-4 col-5">
                                                            <h5 class="f-w-500">Email <span class="pull-end">:</span>
                                                            </h5>
                                                        </div>
                                                        <div class="col-sm-8 col-7"><span><?php echo esc($SysVar['identities']->secret); ?></span>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-sm-4 col-5">
                                                            <h5 class="f-w-500">Login terakhir <span class="pull-end">:</span></h5>
                                                        </div>
                                                        <div class="col-sm-8 col-7"><span></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ubah-data-diri" class="tab-pane fade">
                                                <div class="pt-4">
                                                    <div class="settings-form">
                                                        <h4 class="text-primary">Ubah Data Diri</h4>
                                                        <form method="post" id="form_ubah_data_diri" class="needs-validation" novalidate>
                                                            <div class="mb-3">
                                                                <label class="form-label">Nama<span class="text-danger">*</span></label>
                                                                <input type="text" name="name" placeholder="Masukan Nama" class="form-control" value="<?php echo esc($SysVar['identities']->name); ?>" required />
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Email<span class="text-danger">*</span></label>
                                                                <input type="email" name="email" placeholder="Masukan Email" class="form-control" value="<?php echo esc($SysVar['identities']->secret); ?>" required />
                                                            </div>
															<input type="hidden" name="mode" value="ubah_data_diri" />
                                                            <button type="submit" id="btn_simpan_data_diri" class="btn btn-primary">Simpan</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ubah-password" class="tab-pane fade">
                                                <div class="pt-4">
                                                    <div class="settings-form">
                                                        <h4 class="text-primary">Ubah Password</h4>
                                                        <form method="post" id="form_ubah_password" class="needs-validation" novalidate>
                                                            <div class="mb-3">
                                                                <label class="form-label">Password Lama<span class="text-danger">*</span></label>
                                                                <input type="password" name="password" placeholder="Masukan Password Lama" class="form-control" />
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Password Baru<span class="text-danger">*</span></label>
																<input type="password" name="password_baru" placeholder="Masukan Password Baru" class="form-control" />
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Konfirmasi Password Baru<span class="text-danger">*</span></label>
																<input type="password" name="password_baru_konfirmasi" placeholder="Masukan Konfirmasi Password Baru" class="form-control" />
                                                            </div>
															<input type="hidden" name="mode" value="ubah_password" />
                                                            <button type="submit" id="btn_simpan_password" class="btn btn-primary">Simpan</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
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

    <!-- Form validate init -->
    <script src="<?php echo base_url('assets/theme/davur/assets/js/plugins-init/jquery.validate-init.js'); ?>"></script>
<?php echo $this->endSection(); ?>

<?php echo $this->section('content_js_custom'); ?>

    <script>
	$(document).ready(function() {
        $("#btn_simpan_data_diri").on("click", function (e) {
            var form = $("#form_ubah_data_diri")[0];
            if (form.checkValidity()) {
                $("#btn_simpan_data_diri").prop("disabled", true);
                form.submit();
            }
        });
        $("#btn_simpan_password").on("click", function (e) {
            var form = $("#form_ubah_password")[0];
            if (form.checkValidity()) {
                $("#btn_simpan_password").prop("disabled", true);
                form.submit();
            }
        });
	});
    </script>

<?php echo $this->endSection(); ?>

