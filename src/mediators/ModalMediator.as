package mediators {
import eventBus.AppEventBus;

import interop.bootstrapJS.Modal;

import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;
import randori.jquery.JQuery;

public class ModalMediator extends AbstractMediator {

    [View] public var modal:Modal;
    [View] public var title:JQuery;
    [View] public var body:ViewStack;
    [View] public var saveBtn:JQuery;

    [Inject] public var appBus:AppEventBus;

    override protected function onRegister():void {
        appBus.showModal.add(openModal);
    }

    override protected function onDeregister():void {
        appBus.showModal.remove(openModal);
    }

    private function openModal(url:String, title:String):void {
        this.title.html(title);
        modal.modal();
    }
}
}