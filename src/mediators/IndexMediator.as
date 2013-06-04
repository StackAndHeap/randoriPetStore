package mediators {
import eventBus.AppEventBus;

import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;
import randori.webkit.page.Window;

import router.URLRouter;

public class IndexMediator extends AbstractMediator {


    [View] public var mainViewStack:ViewStack;
    [Inject] public var appBus:AppEventBus;
    [Inject] public var urlRouter:URLRouter;
    private var views:Array;

    override protected function onRegister():void {

        mainViewStack.pushView( "views/login/login.html");
        appBus.login.add( loginHandler );

    }

    private function loginHandler():void{
        Window.console.log("bal");
        mainViewStack.pushView( "views/content/content.html");
    }
    override protected function onDeregister():void {

    }
}
}