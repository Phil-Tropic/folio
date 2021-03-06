<?php
class AuthenticationController extends BaseController {
    
    public function __CONSTRUCT (){}
    
    public function Index () {
        parent::RenderPage(
            'Authentication', 
            'view/shared/login/layout.php', 
            'view/authentication/authentication.php'
        );
    }

    public function Login () {
        $model = new User($_REQUEST['USERNAME'], $_REQUEST['PASSWORD']);
        $result = $model->Login();
        if ($result) {
            Security::CreateSessionForUser(User::GetUserById($result));
            parent::RedirectToController('Users');
        } else {
            $model->setMessage('Invalid username / password combination');
            parent::RenderPage(
                'Authentication', 
                'view/shared/login/layout.php', 
                'view/authentication/authentication.php',
                $model
            );
        }
    }

    public function Logout () {
        Security::DeleteSession();
        parent::RedirectToController('Authentication');
    }
    
}

?>