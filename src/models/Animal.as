/*
 http://www.json-generator.com/

     var animallist = ["cat","dog","mouse","snake","rabbit","bird","fish","monkey","pig"];
     [
     '{{repeat(5000)}}',
     {
     id: '{{index}}',
     animal:  function(idx) {
     return animallist[this.numeric(0,8)];
     },
     picture: 'http://placehold.it/32x32',
     picture_large: 'http://placehold.it/128x128',
     age: '{{numeric(1,15)}}',
     name: '{{lastName}}',
     gender: function(idx) {
     return this.bool() ? 'male' : 'female';
     },
     about: '{{lorem(50,100)}}',
     registered: '{{date(YYYY-MM-ddThh:mm:ss Z)}}'
     }
     ]

 */
package models {

[JavaScript(export="false",name="Object",mode="json")]
public class Animal {

    public var id:int;
    public var name:String;
    public var age:int;
    public var specie:String;
    public var animal:String;
    public var picture:String;
    public var picture_large:String;
    public var gender:String;
    public var about:String;
    public var registered:String;

    public function Animal() {
    }
}
}


