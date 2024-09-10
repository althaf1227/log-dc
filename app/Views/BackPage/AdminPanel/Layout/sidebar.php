<?php
$user = auth()->user();
$MyAdminUsersMenuModel = new \App\Models\MyAdminUsersMenuModel();
$users_menus = $MyAdminUsersMenuModel->getMenuForUser($user);
?>
<!--**********************************
            Sidebar start
        ***********************************-->
<div class="deznav">
	<div class="deznav-scroll">
		<ul class="metismenu" id="menu">
			<li><a class="" href="<?php echo site_url('adminpanel/dashboard'); ?>">
					<i class="flaticon-381-networking"></i>
					<span class="nav-text">Dashboard</span>
				</a>
			</li>
			<?php if ($user->inGroup('admin')) { ?>
				<li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
						<i class="far fa-clipboard"></i>
						<span class="nav-text">Server activity</span>
					</a>
					<ul aria-expanded="false">
						<li><a href="<?php echo site_url('adminpanel/activity-server/active'); ?>">active</a></li>
						<li><a href="<?php echo site_url('adminpanel/activity-server/inactive'); ?>">Completed</a></li>
					</ul>
				</li>
			<?php } ?>
			<!-- </?php
			foreach ($users_menus as $users_menu1) {
				if ($users_menu1['MenuHasSubmenu'] === "1") {
			?>
					<li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-</?php echo esc($users_menu1['MenuIcon']); ?>"></i>
							<span class="nav-text"></?php echo esc($users_menu1['MenuName']); ?></span>
						</a>
						<ul aria-expanded="false">
							</?php
							foreach ($users_menus as $users_menu2) {
								if ($users_menu2['MenuParentId'] === $users_menu1['MenuId']) {
							?>
									<li><a href="</?php echo site_url(esc($users_menu2['MenuUrl'])); ?>"></?php echo esc($users_menu2['MenuName']); ?></a></li>
							</?php }
							} ?>
						</ul>
					</li>
			</?php }
			} ?> -->

		</ul>
		<!-- <div class="add-menu-sidebar">
			<img src="images/icon1.png" alt="">
			<p>Organize your menus through button bellow</p>
			<a href="javascript:void(0);" class="btn bg-white text-black">+ Add Menus</a>
		</div> -->
		<div class="copyright">
			<p><strong><?php echo setting('App.siteName'); ?></strong> ©<?php echo setting('App.siteYear'); ?> All Rights Reserved</p>
			<p>Made with <span class="heart"></span> by <?php echo setting('App.siteCopyRight'); ?></p>
		</div>
	</div>
</div>
<!--**********************************
            Sidebar end
        ***********************************-->
<style>
	.copyright{
		margin-top: 40vh;
	}
</style>