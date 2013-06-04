package services {
import models.Animal;

import randori.async.Promise;
import randori.timer.Timer;
import randori.webkit.page.Window;

import services.json.JsonService;
import services.json.parsers.AnimalParser;

public class MockAnimalService {
    private var source:String = "assets/data/animals50.json";
    private var _data:Array;

    [Inject]
    public var jsonService:JsonService;

    public function MockAnimalService() {
    }

    private function loadJSON():Promise {
        var promise:Promise = jsonService.get(source, new AnimalParser());
        promise.then(handleResult);
        return promise;
    }

    private function handleResult(data:Array):void {
        _data = data;
    }

    public function getAll():Promise {
        var promise:Promise = new Promise();
        if (_data) {
            var data:Array = _data;
            var timer:Timer = new Timer(20, 1);
            timer.timerTick.add(function ():void {
                promise.resolve(data);
            });
            timer.start();
        } else {
            promise = loadJSON();
        }
        return promise;
    }

    public function getById(id:int):Promise {
        Window.console.log("getById");
        var promise:Promise = new Promise();

        var selectedItem:Animal;

        for (var i:int = 0; i < _data.length; i++) {
            var item:Animal = _data[i];
            if (item.id == id) {
                selectedItem = item;
            }
        }

        var timer:Timer = new Timer(20, 1);

        timer.timerTick.add(function ():void {
            promise.resolve(selectedItem);
        });

        timer.start();

        return promise;
    }
}
}