


<%@ Page Language="C#" AutoEventWireup="false" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head id="Head1" runat="server">
    <title></title>

<script type="text/javascript"
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZUzE6FSpdGkntaWxx1xFsIqoII0Dfalc&sensor=false">
</script>

<script type="text/javascript">
 function intialize(lat,lon)
 {
 var myLatlng=new google.maps.Lating(lat,lon)
  var mapOptions={
   center:myLating,
   zoom:20,
   mapTypeId:google.maps.MapType.ROADMAP,
   marker:true};
   var map=new google.maps.Map(document.getElementById("map_canvas"),mapOptions);
   var marker=new google.maps.Marker({position:myLatlng});marker.setMap(map0;
   }
   window.onload=function(){intialize('25.333663','74.6403287')};
   </script>

 
</head>
<body>
  
    <form id="form1" runat="server">
<div id="map_canvas" style="width: 500px; height: 400px"></div>
</form>
</body>
</html>