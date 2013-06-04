package services {
import models.Animal;

import randori.async.Promise;
import randori.timer.Timer;

import services.json.JsonService;
import services.json.parsers.AnimalParser;

public class MockAnimalService {
    private var source:String = "assets/data/animals50.json";
    private var _data:Array;
    private var _filter:String;

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
        if(!returnVal) returnVal= element["age"] == ( _filter );
        if(!returnVal) returnVal= element["animal"].toLowerCase().indexOf( _filter.toLowerCase() ) >= 0 ? true :  false;

        return returnVal;
    }

    public function save(id:int, value:String, dataField:String):void {
        for(var i:int=0;i<_data.length;i++) {
            var animal:Animal = _data[i] as Animal;
            if(animal.id == id) {
                animal[dataField] = value;
            }
        }
    }
}
}