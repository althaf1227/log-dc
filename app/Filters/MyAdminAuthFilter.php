<?php

namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

use App\Libraries\PageForbiddenException;

class MyAdminAuthFilter implements FilterInterface {

    /**
     * --------------------------------------------------------------------------
     * Middleware Shield Custom
     * --------------------------------------------------------------------------
     *
     * @developer       DevSeventeen
     * @instansi        Dinas Komunikasi dan Informatika Kabupaten Pati
     * @version         1.2
     */

    public function before(RequestInterface $request, $arguments = null) {
        if (session()->has('user') === false || is_null(session('user'))) {
            auth()->logout();
            return redirect()->to(config('Auth')->logoutRedirect())->with('error', '<strong>Autentikasi diperlukan</strong>! Silakan login dulu');
        }

        $user = auth()->user();
        $user_id = $user->id;

        $UserModel = model('UserModel');
        $users = $UserModel->findById($user_id);
        if ($users->active === false || $users->active === 0) {
            auth()->logout();
            return redirect()->to(config('Auth')->logoutRedirect())->with('error', '<strong>Akun tidak aktif</strong>! Silakan menghubungi admin');
        }

        $UserIdentityModel = model('UserIdentityModel');
        $identities = $UserIdentityModel->where('auth_identities.user_id', $user_id)->first();
        if (is_null($identities)) {
            auth()->logout();
            return redirect()->to(config('Auth')->logoutRedirect())->with('error', '<strong>Otorisasi gagal</strong>! identitas tidak ditemukan');
        }

        $url_ignore = [
            'adminpanel/dashboard',
            'adminpanel/profile',
        ];

        if ($user->inGroup('admin') === false) {
            if (in_array(uri_string(), $url_ignore) === false) {
                $MyAdminLib =  new \App\Libraries\MyAdminLib();

                $permissions = $user->getPermissions();

                $ar_permission = array();
                foreach ($permissions as $permission) {
                    array_push($ar_permission, str_replace('.', '/', $permission));
                }

                $url_result = $MyAdminLib->explodeUrlWithNoAction(uri_string()).'.'.$MyAdminLib->explodeUrlOnlyAction(uri_string());

                if (in_array($url_result, $permissions) === false) {
                    throw PageForbiddenException::forPageForbidden();
                }
            }
        }

        if (isset(session('ses_account')['user_id']) === false || isset(session('ses_account')['name']) === false) {
            $SesUser = [
                'ses_account' => [
                    'user_id' => $user_id,
                    'name' => $identities->name,
                ]
            ];
            session()->set($SesUser);
        } else {
            if (session('ses_account')['user_id'] != $user_id || session('ses_account')['name'] != $identities->name) {
                $SesUser = [
                    'ses_account' => [
                        'user_id' => $user_id,
                        'name' => $identities->name,
                    ]
                ];
                session()->set($SesUser);
            }
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null) {
        // Do something here
    }
}