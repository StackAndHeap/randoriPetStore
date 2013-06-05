package mediators.products {
import eventBus.AppEventBus;

import models.Animal;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;

import services.MockAnimalService;

public class NewAnimalMediator extends AbstractMediator {

    [View] public var nameTxt:JQuery;
    [View] public var animalTxt:JQuery;
    [View] public var ageTxt:JQuery;
    [View] public var genderDropdown:JQuery;
    [View] public var aboutTxt:JQuery;

    [Inject] public var animalService:MockAnimalService;
    [Inject] public var appBus:AppEventBus;

    override protected function onRegister():void {

    }

    override protected function onDeregister():void {

    }

    public function save():void {
        var animal:Animal = new Animal();
        animal.name = nameTxt.val();
        animal.animal = animalTxt.val();
        animal.age  = ageTxt.val();
        animal.gender = genderDropdown.val();
        animal.about = aboutTxt.val();

        animalService.addNew(animal).then(sendReloadEvent);
    }

    private function sendReloadEvent():void {
        appBus.reloadData.dispatch();
    }


}
}