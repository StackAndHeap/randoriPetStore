package services {
import randori.async.Promise;
import randori.timer.Timer;

import services.json.JsonService;
import services.json.parsers.MiscParser;

public class MockMiscService {
    private var source:String = "assets/data/things.json";
    private var _data:Array;

    [Inject] public var jsonService:JsonService;

    private function loadJSON():Promise {
        var promise:Promise = jsonService.get(source ,new MiscParser() );
        promise.then( handleResult );
        return promise;
    }

    private function handleResult(data:Array):void {
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
}
}