<?php echo $this->include('BackPage/AdminPanel/Layout/top'); ?>

<?php echo $this->include('BackPage/AdminPanel/Layout/header'); ?>

<?php echo $this->include('BackPage/AdminPanel/Layout/sidebar'); ?>

		<!--**********************************
            Content body start
        ***********************************-->

<?php echo $this->renderSection('content') ?>

        <!--**********************************
            Content body end
        ***********************************-->

<?php echo $this->include('BackPage/AdminPanel/Layout/footer'); ?>

    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

<?php echo $this->include('BackPage/AdminPanel/Layout/common-js'); ?>

<?php echo $this->renderSection('content_js') ?>

<?php echo $this->include('BackPage/AdminPanel/Layout/common-js-2'); ?>

<?php echo $this->renderSection('content_js_custom') ?>

</body>
</html>