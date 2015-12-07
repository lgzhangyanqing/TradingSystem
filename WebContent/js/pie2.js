jQuery(document).ready(function() {
	getMarketData();
});

function getMarketData() {
	$.ajax({
		url: "getOwnInfo",
		success: function(data) {
			var chart = AmCharts.makeChart( "chartdiv", {
				  "type": "pie",
				  "theme": "light",
				  "dataProvider": data,
				  "valueField": "quantity",
				  "titleField": "stockName",
				  "outlineAlpha": 0.4,
				  "depth3D": 15,
				  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
				  "angle": 30,
				  "export": {
				    "enabled": true
				  }
				} );
				jQuery( '.chart-input' ).off().on( 'input change', function() {
				  var property = jQuery( this ).data( 'property' );
				  var target = chart;
				  var value = Number( this.value );
				  chart.startDuration = 0;

				  if ( property == 'innerRadius' ) {
				    value += "%";
				  }

				  target[ property ] = value;
				  chart.validateNow();
				} );
		},
		error: function (e) {
	        alert(e);
	    }
	});
}

//var chart = AmCharts.makeChart( "chartdiv", {
//  "type": "pie",
//  "theme": "light",
//  "dataProvider": 
//	  [ {
//    "coun": "Lithuania",
//    "value2": 260,
//    "a" : "asdf"
//  }, {
//    "coun": "Ireland",
//    "value2": 201,
//    "a" : "asdf"
//  }, {
//    "coun": "Germany",
//    "value2": 65,
//    "a" : "asdf"
//  }, {
//    "coun": "Australia",
//    "value2": 39,
//    "a" : "asdf"
//  }, {
//    "coun": "UK",
//    "value2": 19,
//    "a" : "asdf"
//  }, {
//    "coun": "Latvia",
//    "value2": 10,
//    "a" : "asdf"
//  } ],
//  "valueField": "value2",
//  "titleField": "coun",
//  "outlineAlpha": 0.4,
//  "depth3D": 15,
//  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
//  "angle": 30,
//  "export": {
//    "enabled": true
//  }
//} );
//jQuery( '.chart-input' ).off().on( 'input change', function() {
//  var property = jQuery( this ).data( 'property' );
//  var target = chart;
//  var value = Number( this.value );
//  chart.startDuration = 0;
//
//  if ( property == 'innerRadius' ) {
//    value += "%";
//  }
//
//  target[ property ] = value;
//  chart.validateNow();
//} );