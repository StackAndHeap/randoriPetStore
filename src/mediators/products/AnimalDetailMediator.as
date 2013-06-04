package mediators.products {
import behaviors.components.DropDown;
import behaviors.components.Image;
import behaviors.components.TextArea;
import behaviors.components.TextInput;
import behaviors.tabbar.TabBarItem;

import models.Animal;

import randori.behaviors.AbstractMediator;

import services.MockAnimalService;

[JavaScript(export="true", name="AnimalDetailMediator")]
public class AnimalDetailMediator extends AbstractMediator {

    [View] public var nameTxt:TextInput;
    [View] public var ageTxt:TextInput;
    [View] public var animalTxt:TextInput;
    [View] public var genderDropDown:DropDown;
    [View] public var aboutTxt:TextArea;
    [View] public var pictureImg:Image;

    [Inject] public var animalService:MockAnimalService;

    private var _data:Animal;

    public function AnimalDetailMediator():void{}

    public function render():void{
        nameTxt.value = _data.name;
        nameTxt.dataField = "name";
        ageTxt.value = "" + _data.age;
        ageTxt.dataField = "age";
        ageTxt.type = "number";
        animalTxt.value = _data.animal;
        animalTxt.dataField = "animal";
        genderDropDown.value = _data.gender;
        genderDropDown.dataField = "gender";
        genderDropDown.dataProvider = ["male", "female"];
        aboutTxt.value = _data.about;
        aboutTxt.dataField = "about";
        pictureImg.url = _data.picture_large;

    }

    override protected function onRegister():void {
        nameTxt.valueCommit.add(saveValue);
        ageTxt.valueCommit.add(saveValue);
        animalTxt.valueCommit.add(saveValue);
        genderDropDown.valueCommit.add(saveValue);
        aboutTxt.valueCommit.add(saveValue);
    }

    override protected function onDeregister():void {
        nameTxt.valueCommit.remove(saveValue);
        ageTxt.valueCommit.remove(saveValue);
        animalTxt.valueCommit.remove(saveValue);
        genderDropDown.valueCommit.remove(saveValue);
        aboutTxt.valueCommit.remove(saveValue);
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