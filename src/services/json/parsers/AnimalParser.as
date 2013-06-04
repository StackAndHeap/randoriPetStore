package services.json.parsers {
import core.JSON;

import models.Animal;

public class AnimalParser {
    public function AnimalParser() {
    }
    public function parseResult(result:Object):Array {
        var json:Array = JSON.parse( result as String ) as Array;

        for ( var i:int=0; i<json.length; i++ ) {
            var animal:Animal = json[ i ];
            animal.picture =  json[ i ][ "picture" ];
            animal.picture_large =  json[ i ][ "picture_large" ] ;

        }

        return json;
    }
}
}