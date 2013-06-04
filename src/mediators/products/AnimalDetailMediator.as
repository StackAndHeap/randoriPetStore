package mediators.products {
import behaviors.components.TextInput;
import behaviors.tabbar.TabBarItem;

import models.Animal;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;
import randori.template.TemplateBuilder;

import services.MockAnimalService;

[JavaScript(export="true", name="AnimalDetailMediator")]
public class AnimalDetailMediator extends AbstractMediator {

    [Inject] public var templateBuilder:TemplateBuilder;
    [View(required = "false")] public var template:JQuery;

    [View] public var nameTxt:TextInput;

    [Inject] public var animalService:MockAnimalService;

    private var _data:Animal;

    public function AnimalDetailMediator():void{}

    public function render():void{
        nameTxt.value = _data.name;
        nameTxt.dataField = "name";
    }

    override protected function onRegister():void {
        nameTxt.valueCommit.add(saveValue);
    }

    override protected function onDeregister():void {
        nameTxt.valueCommit.remove(saveValue);
    }

    private function saveValue(value:String, dataField:String):void {
        animalService.save(_data.id, value, dataField);
    }

    public function setData(value:TabBarItem):void {
        animalService.getById(value.id).then(dataReceivedHandler);
    }

    private function dataReceivedHandler(data:Animal):void {
        _data = data;
        render();
    }
}
}