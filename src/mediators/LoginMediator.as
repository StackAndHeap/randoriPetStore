package mediators {
import eventBus.AppEventBus;

import randori.behaviors.AbstractMediator;
import randori.jquery.Event;
import randori.jquery.JQuery;

public class LoginMediator extends AbstractMediator {

    [View] public var button_login:JQuery;
    [View] public var signinUsername:JQuery;
    [View] public var signinPassword:JQuery;

    [View] public var signupUsername:JQuery;
    [View] public var signupEmail:JQuery;
    [View] public var signupPassword:JQuery;
    [View] public var button_register:JQuery;

    [Inject] public var appBus:AppEventBus;

    override protected function onRegister():void {
        signinUsername.keyup1( login_inputChangeHandler );
        signinPassword.keyup1( login_inputChangeHandler );
        button_login.click1( loginClickedHandler );

        signupPassword.keyup1( signup_inputChangeHandler );
        signupEmail.keyup1( signup_inputChangeHandler );
        signupUsername.keyup1( signup_inputChangeHandler );
        button_register.click1( registerClickedHandler );

    }

    private function login_inputChangeHandler( e:Event ):void{
        if( validateInputs( [signinPassword, signinUsername] ) == true ){
            button_login.removeClass1("disabled");
            button_login.prop2("disabled","");
        }else{
            button_login.addClass1("disabled");
            button_login.prop2("disabled","disabled");
        }
    }

    private function loginClickedHandler():void{
            appBus.login.dispatch( {
                username:signinUsername.val1(),
                password:signinPassword.val1()
            });
    }

    private function signup_inputChangeHandler(e:Event):void{
        if( validateInputs( [signupEmail, signupPassword, signupUsername] ) == true ){
            button_register.removeClass1("disabled");
            button_register.prop2("disabled","");
        }else{
            button_register.addClass1("disabled");
            button_register.prop2("disabled","disabled");
        }
    }

    private function registerClickedHandler(e:Event):void{
         // handle register
    }

    private function validateInputs( inputs:Array ):Boolean {
        var valid:Boolean  = true,
            length:int = inputs.length,
            i:uint = 0;

        for(i;i<length;i++){
            var string = inputs[i].val() || "";
            if(string.replace(" ","") == "")
                valid = false;
        }
        return valid;
    }

    override protected function onDeregister():void {

    }

}
}