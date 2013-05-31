package Slick {

[JavaScript(export="false",name="Object",mode="json")]
public class Event {
    public var handlers:Array;

    public function subscribe( fn:Function ) :void{}
    public function unsubscribe( fn:Function ) :void{}
    public function Event() {}
}
}