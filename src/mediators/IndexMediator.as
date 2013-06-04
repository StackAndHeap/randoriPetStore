package mediators {
import eventBus.AppEventBus;

import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.webkit.page.Window;

import router.URLRouter;

public class IndexMediator extends AbstractMediator {

    [View] public var mainViewStack:ViewStack;
    [View] public var txt_username:JQuery;
    [View] public var header:JQuery;
    [View] public  var button_logout:JQuery;

    [Inject] public var appBus:AppEventBus;
    [Inject] public var urlRouter:URLRouter;

    override protected function onRegister():void {
        button_logout.click(logoutClickHandler);
        appBus.login.add( loginHandler );
        appBus.logout.add( logoutHandler );

        if(Window.localStorage.getItem("loggedin") == "true"){
            login(Window.localStorage.getItem("username"));
        }else{
            mainViewStack.pushView( "views/login/login.html" )
        }

    }

    private function loginHandler( user:Object ):void{
        Window.localStorage.setItem("loggedin","true");
        Window.localStorage.setItem("username",user.username);
        login(user.username);
    }

    private function login( userName:Object ):void{
        txt_username.html( userName );
        header.css3("display","");
        mainViewStack.pushView( "views/content/content.html" );
    }
    private function logoutClickHandler(e:Event):void{
        Window.localStorage.setItem("loggedin","false");
        appBus.logout.dispatch();
    }
    private function logoutHandler():void{
        mainViewStack.pushView( "views/login/login.html" )
    }

    override protected function onDeregister():void {

    }


}
}