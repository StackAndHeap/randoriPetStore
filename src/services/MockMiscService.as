package services {
import randori.async.Promise;
import randori.timer.Timer;

import services.json.JsonService;
import services.json.parsers.MiscParser;

public class MockMiscService {
    private var source:String = "assets/data/things.json";
    private var _data:Array;
    private var _filter:String;

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

    public function get( filter:String ):Promise {
        var promise:Promise,
                filteredData:Array;

        promise = new Promise();
        _filter = filter;

        filteredData = _filter.replace(" ","") == "" ? _data : _data.filter( filterFunction );

        var timer:Timer = new Timer(20, 1);
        timer.timerTick.add(function ():void {
            promise.resolve( filteredData );
        });
        timer.start();
        return promise;
    }

    private function filterFunction( element:Object, index:int, array:Array):Boolean{
        var returnVal:Boolean;
        returnVal= element["name"].toLowerCase().indexOf( _filter.toLowerCase() ) >= 0 ? true :  false;
        if(!returnVal) returnVal= element["animal"].toLowerCase().indexOf( _filter.toLowerCase() ) >= 0 ? true :  false;

        return returnVal;
    }
}
}