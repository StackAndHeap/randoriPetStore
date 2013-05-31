package services.parsers {
import core.JSON;

import models.Misc;

public class MiscParser {
    public function MiscParser() {
    }

    public function parseResult(result:Object):Array {
        var json:Array = JSON.parse( result as String ) as Array;

        for ( var i:int=0; i<json.length; i++ ) {
            var misc:Misc = json[ i ];
            misc.picture =  "<img src='" + json[ i ][ "picture" ] + "'/>";

        }

        return json;
    }
}
}