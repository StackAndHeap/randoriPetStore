package mediators {
import eventBus.AppEventBus;

import interop.bootstrapJS.Modal;

import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;
import randori.jquery.Event;
import randori.jquery.JQuery;

public class ModalMediator extends AbstractMediator {

    [View] public var modal:Modal;
    [View] public var title:JQuery;
    [View] public var body:ViewStack;
    [View] public var saveBtn:JQuery;
    [View] public var closeBtn:JQuery;

    [Inject] public var appBus:AppEventBus;

    private var _loadedMedatior:*;

    override protected function onRegister():void {
        appBus.showModal.add(openModal);

        saveBtn.click(saveBtnClickedHandler);
        closeBtn.click(closeBtnClickedHandler);
    }

    override protected function onDeregister():void {
        appBus.showModal.remove(openModal);
    }

    private function closeBtnClickedHandler(e:Event):void {
        closeModal();
    }

    private function closeModal():void {
        modal.modal('hide');
        body.popView();
    }

    private function saveBtnClickedHandler(e:Event):void {
        _loadedMedatior.save();
        closeModal();
    }

    private function openModal(url:String, titleString:String):void {
        title.html(titleString);
        loadView(url);
    }

    private function loadView(url:String):void {
        body.pushView(url).then(viewPushedHandler);
    }

    private function viewPushedHandler(mediator:*):void {
        _loadedMedatior = mediator;
        modal.modal();
    }

}
}