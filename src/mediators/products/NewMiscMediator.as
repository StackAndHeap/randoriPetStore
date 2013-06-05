package mediators.products {
import eventBus.AppEventBus;

import models.Misc;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;

import services.MockMiscService;

public class NewMiscMediator extends AbstractMediator {

    [View] public var nameTxt:JQuery;
    [View] public var animalTxt:JQuery;
    [View] public var quantityTxt:JQuery;
    [View] public var aboutTxt:JQuery;

    [Inject] public var miscService:MockMiscService;
    [Inject] public var appBus:AppEventBus;

    override protected function onRegister():void {

    }

    override protected function onDeregister():void {

    }

    public function save():void {
        var misc:Misc = new Misc();
        misc.name = nameTxt.val();
        misc.animal = animalTxt.val();
        misc.quantity = quantityTxt.val();
        misc.about = aboutTxt.val();

        miscService.addNew(misc).then(sendReloadEvent);
    }

    private function sendReloadEvent():void {
        appBus.reloadData.dispatch();
    }


}
}