<?php

namespace App\Controllers;

use CodeIgniter\Controller;
use CodeIgniter\HTTP\CLIRequest;
use CodeIgniter\HTTP\IncomingRequest;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;

/**
 * Class BaseController
 *
 * BaseController provides a convenient place for loading components
 * and performing functions that are needed by all your controllers.
 * Extend this class in any new controllers:
 *     class Home extends BaseController
 *
 * For security be sure to declare any new methods as protected or private.
 */
abstract class AdminController extends Controller
{
    /**
     * Instance of the main Request object.
     *
     * @var CLIRequest|IncomingRequest
     */
    protected $request;

    /**
     * An array of helpers to be loaded automatically upon
     * class instantiation. These helpers will be available
     * to all other controllers that extend BaseController.
     *
     * @var array
     */
    protected $helpers = ['fungsi'];

    /**
     * Be sure to declare properties for any property fetch you initialized.
     * The creation of dynamic property is deprecated in PHP 8.2.
     */
    // protected $session;

    /**
     * @return void
     */

    public $MyAdminMenuModel;
    public $MyAdminUsersMenuModel;
    public $SysVar;

    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
    {
        // Do Not Edit This Line
        parent::initController($request, $response, $logger);

        // Preload any models, libraries, etc, here.

        // E.g.: $this->session = \Config\Services::session();

        $this->MyAdminMenuModel = new \App\Models\MyAdminMenuModel();
        $this->MyAdminUsersMenuModel = new \App\Models\MyAdminUsersMenuModel();

        $this->ShieldAuthGroupUsersModel = new \App\Models\ShieldAuthGroupUsersModel();
        $this->ShieldAuthPermissionUsersModel = new \App\Models\ShieldAuthPermissionUsersModel();
        
        $this->logmodel = new \App\Models\LogModel();

        $user = auth()->user();
        $user_id = $user->id;

        $UserIdentityModel = model('UserIdentityModel');
        $identities = $UserIdentityModel->where('auth_identities.user_id', $user_id)->first();
        if (is_null($identities)) {
            auth()->logout();
            return redirect()->to(config('Auth')->logoutRedirect())->with('error', '<strong>Otorisasi gagal</strong>! identitas tidak ditemukan');
        }

        $this->SysVar = [
            'user' => $user,
            'identities' => $identities
        ];
    }
}
