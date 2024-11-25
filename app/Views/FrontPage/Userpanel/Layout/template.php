<?php echo $this->include('FrontPage/Userpanel/Layout/top'); ?>


		<!--**********************************
            Content body start
        ***********************************-->

<?php echo $this->renderSection('content') ?>

        <!--**********************************
            Content body end
        ***********************************-->

<?php echo $this->include('FrontPage/Userpanel/Layout/footer'); ?>

    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

<?php echo $this->include('FrontPage/Userpanel/Layout/common-js'); ?>

<?php echo $this->renderSection('content_js') ?>

<?php echo $this->include('FrontPage/Userpanel/Layout/common-js-2'); ?>

<?php echo $this->renderSection('content_js_custom') ?>

</body>
</html>