package mediators {
import eventBus.AppEventBus;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;
import randori.webkit.page.Window;

public class LoginMediator extends AbstractMediator {

    [View] public var button_login:JQuery;
    [Inject] public var appBus:AppEventBus;

    override protected function onRegister():void {
        button_login.click1( loginHandler );
    }

    private function loginHandler():void{
        appBus.login.dispatch("e");
        Window.console.log("klik");
    }

    override protected function onDeregister():void {

    }

}
}