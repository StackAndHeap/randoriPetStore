package chartJs.data.models {

[JavaScript(export="true", name="Point")]
public class Point {
    public var value:Number;
    public var color:String;

    public function Point( value:Number, color:String = "#000000" ) {
        this.value = value;
        this.color = color;
    }
}
}