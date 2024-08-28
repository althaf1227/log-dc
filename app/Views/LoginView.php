<!DOCTYPE html>
<html lang="en" class="h-100">

<?php echo $this->include('BackPage/AdminPanel/Layout/common-head'); ?>

<body class="h-100">
    <div class="authincation h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-xl-12">
					<div class="row align-items-center ">
						<div class="card login-card">
							<div class="card-body">
								<div class="row">
									<div class="col-xl-6">
										<div class="text-center mt-3">
										</div>
										<div class="text-center media-login">
											<img src="<?php echo base_url('uploads/logo/logo_kabupaten_pati.svg'); ?>" style="width: 50% !important; }" alt="">
										</div>
									</div>
									<div class="col-xl-6">
										<div class="auth-form">
											<h3 class="text-start mb-4 font-w600">Login ke <?php echo setting('App.siteName'); ?></h3>
											
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

											<?php if (session('message') !== null) : ?>
											<div class="alert alert-success" role="alert"><?= session('message') ?></div>
											<?php endif ?>

											<form id="form_login" method="post" class="needs-validation" action="<?= url_to('login') ?>" novalidate>
												<?= csrf_field() ?>
												<div class="form-group">
													<label class="mb-1 text-black">Email <span class="text-danger">*</span></label>
													<input type="email" class="form-control" name="email" inputmode="email" autocomplete="email" placeholder="Masukan email.." value="<?= old('email') ?>" required />
													<div class="invalid-feedback">Masukan email.</div>
												</div>
												<div class="form-group">
													<label class="mb-1 text-black">Password <span class="text-danger">*</span></label>
													<input type="password" class="form-control" name="password" inputmode="text" autocomplete="current-password" placeholder="Masukan password.." required />
													<div class="invalid-feedback">Masukan password.</div>
												</div>
												<?php if (setting('Auth.sessionConfig')['allowRemembering']): ?>
												<div class="form-row d-flex justify-content-between mt-4 mb-2">
													<div class="form-group">
														<div class=" form-check ms-1">
															<input type="checkbox" class="form-check-input" id="basic_checkbox_2">
															<label class="custom-control-label ms-1" for="basic_checkbox_2">Ingat saya</label>
														</div>
													</div>
												</div>
												<?php endif; ?>
												<div class="text-center">
													<button type="submit" id="btn_login" name="btn_login" class="btn btn-primary btn-block">Masuk</button>
												</div>
											</form>
											<div class="new-account mt-3 d-flex align-items-center justify-content-between flex-wrap">
												<?php if (setting('Auth.allowRegistration')) : ?>
												<small class="mb-0">Belum mempunyai akun? <a class="text-primary" href="<?= url_to('register') ?>">Daftar</a></small>
												<?php endif ?>
												<?php if (setting('Auth.allowMagicLinkLogins')) : ?>
												<small href="<?= url_to('magic-link') ?>">Lupa password?</small>
												<?php endif ?>
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

    <!--**********************************
        Scripts
    ***********************************-->

	<?php echo $this->include('BackPage/AdminPanel/Layout/common-js'); ?>

    <!-- Form validate init -->
    <script src="<?php echo base_url('assets/theme/davur/assets/js/plugins-init/jquery.validate-init.js'); ?>"></script>

	<?php echo $this->include('BackPage/AdminPanel/Layout/common-js-2'); ?>

	<script>
        $(document).ready(function() {
            $("#btn_login").on("click", function (e) {
                var form = $("#form_login")[0];
                if (form.checkValidity()) {
					$("#btn_login").prop("disabled", true);
					form.submit()
                }
            });
        });
    </script>

</body>

</html>