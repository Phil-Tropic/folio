<?php

include_once('./security/security.class.php');
include_once('./session/shoppingcart.session.php');
include_once('./model/user.class.php');
include_once('./model/article.class.php');
include_once('./model/sale.class.php');
include_once('./model/setting.class.php');
include_once('./model/shoppingcart.class.php');
include_once('./model/vwsale.class.php');
include_once('./database/database.class.php');
include_once('./controller/base.controller.php');

class FrontController {
    
    const kDefaultController = 'home';
    const kAuthenticationController = 'authentication';
    const kPublicControllers = [];

    private static function IsLoginRequest () {
        $isControllerSet = isset($_REQUEST['c']);
        if ($isControllerSet) {
            return strtolower($_REQUEST['c']) === FrontController::kAuthenticationController;
        } else {
            return false;
        }
    }


    private static function IsPublicRequest () {
        $isControllerSet = isset($_REQUEST['c']);
        $controller = $isControllerSet ? strtolower($_REQUEST['c']) : FrontController::kDefaultController;
        return in_array($controller, FrontController::kPublicControllers);
    }


    private static function RenderController ($default = FrontController::kDefaultController) {
        if (!isset($_REQUEST['c'])) FrontController::Render($default); else FrontController::RenderFromQueryString();
    }

 
    private static function Render ($controller) {
        require_once "controller/$controller.controller.php";
        $controller = ucwords($controller) . 'Controller';
        $controller = new $controller;
        $controller->Index();  
    }

  
    private static function RenderFromQueryString () {
       
        $controller = strtolower($_REQUEST['c']);
        $accion = isset($_REQUEST['a']) ? $_REQUEST['a'] : 'Index';
      
        require_once "controller/$controller.controller.php";
        $controller = ucwords($controller).'Controller';
        $controller = new $controller;
        call_user_func(array($controller, $accion));
    }

    public static function ProcessRequest () {
        if (Security::UserIsLoggedIn()) { FrontController::RenderController(); return; }
        if (FrontController::IsLoginRequest()) { FrontController::RenderController(); return; }
        if (FrontController::IsPublicRequest()) {  FrontController::RenderController(); return; }
        header('Location: ?c='.FrontController::kAuthenticationController);
    }

}

FrontController::ProcessRequest();

?>