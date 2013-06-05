/*
var animallist = ["cat","dog","mouse","snake","rabbit","bird","fish","monkey","pig"];
var list = ["cage","toy","ball","clothes","snacks","hive","pillow","accessories"];
[
    '{{repeat(50)}}',
    {
        id: '{{index}}',
        animal:  function(idx) {
            return animallist[this.numeric(0,8)];
        },
        picture: 'http://placehold.it/32x32',
        quantity: '{{numeric(1,150)}}',
        name: '{{lastName}}',
        about: '{{lorem(50,100)}}',
        added: '{{date(YYYY-MM-ddThh:mm:ss Z)}}'
    }
]
*/

package models {

[JavaScript(export="false",name="Object",mode="json")]
public class Misc {
    public var id:int;
    public var name:String;
    public var animal:String;
    public var picture:String;
    public var picture_large:String;
    public var quantity:int;
    public var about:String;
    public var added:String;

    public function Misc() {
    }
}
}