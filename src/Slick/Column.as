package Slick {

[JavaScript(export="false",name="Object",mode="json")]
public class Column {
    public var id:String;
    public var name:String;
    public var field:String;
    public var sortable:Boolean;
    public var formatter:*;

    public function Column( id:String, name:String, field:String, sortable = true, formatter:* = null ) {
    }
}
}