package mediators {
import eventBus.AppEventBus;

import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;

import router.URLRouter;

public class IndexMediator extends AbstractMediator {

    [View] public var mainViewStack:ViewStack;

    [Inject] public var appBus:AppEventBus;
    [Inject] public var urlRouter:URLRouter;

    override protected function onRegister():void {
        appBus.login.add( loginHandler );
        mainViewStack.pushView( "views/login/login.html" )
    }

    private function loginHandler():void{
        mainViewStack.pushView( "views/content/content.html" )
    }

    override protected function onDeregister():void {

    }


}
}