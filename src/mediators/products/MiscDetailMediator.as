package mediators.products {
import behaviors.components.Image;
import behaviors.components.TextArea;
import behaviors.components.TextInput;
import behaviors.tabbar.TabBarItem;

import eventBus.AppEventBus;

import models.Misc;

import randori.behaviors.AbstractMediator;

import services.MockMiscService;

[JavaScript(export="true", name="AnimalDetailMediator")]
public class MiscDetailMediator extends AbstractMediator {

    [View] public var nameTxt:TextInput;
    [View] public var quantityTxt:TextInput;
    [View] public var animalTxt:TextInput;
    [View] public var aboutTxt:TextArea;
    [View] public var pictureImg:Image;

    [Inject] public var miscService:MockMiscService;

    [Inject] public var appBus:AppEventBus;
    
    private var _data:Misc;

    public function AnimalDetailMediator():void{}

    public function render():void{
        nameTxt.value = _data.name;
        nameTxt.dataField = "name";
        quantityTxt.value = "" + _data.quantity;
        quantityTxt.dataField = "quantity";
        quantityTxt.type = "number";
        animalTxt.value = _data.animal;
        animalTxt.dataField = "animal";
        aboutTxt.value = _data.about;
        aboutTxt.dataField = "about";
        pictureImg.url = _data.picture_large;

    }

    override protected function onRegister():void {
        nameTxt.valueCommit.add(saveValue);
        quantityTxt.valueCommit.add(saveValue);
        animalTxt.valueCommit.add(saveValue);
        aboutTxt.valueCommit.add(saveValue);
    }

    override protected function onDeregister():void {
        nameTxt.valueCommit.remove(saveValue);
        quantityTxt.valueCommit.remove(saveValue);
        animalTxt.valueCommit.remove(saveValue);
        aboutTxt.valueCommit.remove(saveValue);
    }

    private function saveValue(value:String, dataField:String):void {
        miscService.save(_data.id, value, dataField);
        _data[dataField] = value;

        if(dataField=="name") {
            appBus.nameChanged.dispatch(_data, "misc");
        }
    }

    public function setData(value:TabBarItem):void {
        miscService.getById(value.id).then(dataReceivedHandler);
    }

    private function dataReceivedHandler(data:Misc):void {
        _data = data;
        render();
    }
}
}