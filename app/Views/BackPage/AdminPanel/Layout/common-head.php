<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	<meta name="robots" content="" />
	<meta name="description" content="" />

    <title><?php if (uri_string() == 'login') echo "Login"; ?><?php if (isset($SysVar['situs']->SitusNama)) echo esc($SysVar['situs']->SitusNama.' - '); ?><?php echo isset($title) ? $title : ""; ?></title>

	<link rel="icon" type="image/png" href="<?php echo base_url('uploads/logo/favicon.png'); ?>">

<?php echo $this->renderSection('content_css') ?>

<?php echo $this->include('BackPage/AdminPanel/Layout/common-css'); ?>

</head>
