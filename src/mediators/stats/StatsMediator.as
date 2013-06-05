package mediators.stats {
import chartJs.Chart;
import chartJs.data.ChartData;
import chartJs.data.models.Point;
import chartJs.data.models.Trend;
import chartJs.easing.Easing;
import chartJs.options.LineOptions;
import chartJs.options.PieOptions;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;
import randori.webkit.html.canvas.CanvasRenderingContext2D;

public class StatsMediator extends AbstractMediator {

    [View] public var line:JQuery;
    [View] public var pie:JQuery;

    override protected function onRegister():void {
        createLineChart( line );
        createPieChart( pie );
    }

    override protected function onDeregister():void {

    }

    private function createLineChart( canvas:JQuery ):void {

        var line1:Trend = new Trend()
        line1.data = [65,59,90,81,56,55,40];

        var line2:Trend = new Trend();
        line2.fillColor = "rgba(151,187,205,0.5)";
        line2.strokeColor = "rgba(151,187,205,1)";
        line2.pointColor = "rgba(151,187,205,1)";
        line2.pointStrokeColor = "#fff";
        line2.data = [28,48,40,51,49,41,60];

        var chartData:ChartData = new ChartData();
        chartData.datasets = [line1,line2];
        chartData.labels = ["January","February","March","April","May","June","July"];

        var lineOptions:LineOptions = new LineOptions();
        lineOptions.scaleLineColor = "rgba(0,0,0,.2)";
        lineOptions.scaleLineWidth = 3;
        lineOptions.animationEasing = Easing.EASE_IN_EXPO;

        var chart:Chart = createChart( canvas );
        chart.Line( chartData, lineOptions );
    }

    private function createPieChart( canvas:JQuery ):void{
        var data:Array = [
            new Point( 30, "#D97041" ),
            new Point( 50, "#E0E4CC" ),
            new Point( 100, "#69D2E7" ),
        ];

        var pieOptions:PieOptions = new PieOptions();
        var chart:Chart = createChart( canvas );
        chart.Pie( data, pieOptions );
    }


    private function createChart( canvas:JQuery ):Chart{
        var ctx:CanvasRenderingContext2D = canvas["context"].getContext("2d");
        return new Chart( ctx );
    }

}
}