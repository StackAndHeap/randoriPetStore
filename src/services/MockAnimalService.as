package services {
import randori.async.Promise;
import randori.timer.Timer;

import services.json.JsonService;
import services.json.parsers.AnimalParser;

public class MockAnimalService {
    private var source:String = "assets/data/animals50.json";
    private var _data:Array;
    private var _filter:String;

    [Inject] public var jsonService:JsonService;

    public function MockAnimalService() {
    }

    private function loadJSON():Promise {
        var promise:Promise = jsonService.get(source ,new AnimalParser() );
        promise.then( handleResult );
        return promise;
    }

    private function handleResult( data:Array ):void {
        _data = data;
    }

    public function getAll():Promise {
        var promise:Promise = new Promise();
        if(_data) {
            var data:Array = _data;
            var timer:Timer = new Timer(20,1);
            timer.timerTick.add(function():void {
                promise.resolve(data);
            });
            timer.start();
        } else {
            promise = loadJSON();
        }
        return promise;
    }

    private function filterFunction( element:Object, index:int, array:Array):Boolean{
        var returnVal:Boolean;
        returnVal= element["name"].indexOf( _filter ) > 0 ? true :  false;
        return returnVal;
    }
}
}