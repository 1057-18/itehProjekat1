<!DOCTYPE html>
<html>
<head>
	<title>Simple Shop</title>
	<!-- Latest compiled and minified CSS -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
	<link rel="stylesheet" href="style.css">
</head>
<body>
  <?php include "inc/nav.php"; ?>
  <div class="container">
    
    <div class="row">
      <div class="col-lg-12">
        <div class="page-header">
          <h1>Prodati proizvodi po danima: </h1>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12">
            <div id="chart_div"></div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12">
      <h3><small>IP: <span id="ip_adresa"></span></small></h3>
      </div>
    </div>
    

  </div>
  
  <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

  <script>
    google.charts.load('current', {packages: ['corechart', 'bar']});
    setTimeout(function(){ 
      $.get( "controller.php?akcija=prodatBrojProizvodaPoDanima", function( json ) {
        var data = JSON.parse(json);
        var json = '{"cols":[{"label":"Datum","type":"string"},{"label":"Vrednost","type":"number"} , {"type":"number", "role":"interval"} , {"type":"number", "role":"interval"}],"rows":[';
        $.each( data, function( key, value ) {
          if(key==data.length-1) {
            json+= '{"c":[{"v":' + "\""+value.date+"\""+ '},{"v":'+value.num + '}]}';
          } else {
            json+= '{"c":[{"v":' + "\""+value.date+"\""+ '},{"v":'+value.num + '}]},';
          }
          
        });
         json+=']}';
              // Create our data table out of JSON data loaded from server.
        var data = new google.visualization.DataTable(json);
        var view = new google.visualization.DataView(data);

        var chart = new google.visualization.ColumnChart(
        document.getElementById('chart_div'));
        chart.draw(view);
      });




     }, 1000);
    
      $.getJSON( "http://ip.jsontest.com", function( json ) {
       $("#ip_adresa").html(json.ip);
     });

  </script>
</body>
</html>