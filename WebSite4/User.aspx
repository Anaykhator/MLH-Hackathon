<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Debug="True" Inherits="_Default" %>
<configuration>
   <system.web>
       <compilation debug="true"/>
   </system.web>
</configuration>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
<title>HTML5 Geolocation</title>


</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:HiddenField ID="hdn" runat="server" />
    <asp:HiddenField ID="hdn2" runat="server" />
    <script type="text/javascript">
        function showPosition() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    var hdn = document.getElementById('hdn');
                    hdn.value = position.coords.latitude;

                    var hdn2 = document.getElementById('hdn2');
                        hdn2.value = position.coords.longitude;
                    var positionInfo = "Your current position is (" + "Latitude: " + hdn2.value + ", " + "Longitude: " + position.coords.longitude + ")";
                    document.getElementById("result").innerHTML = positionInfo;
                    
                });
            } else {
                alert("Sorry, your browser does not support HTML5 geolocation.");
            }
        }
</script>
<script type="text/javascript"
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZUzE6FSpdGkntaWxx1xFsIqoII0Dfalc&sensor=false">
</script>
<script type="text/javascript">
    function showPosition1() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showMap, showError);
        } else {
            alert("Sorry, your browser does not support HTML5 geolocation.");
        }
    }

    // Define callback function for successful attempt
    function showMap(position) {
        // Get location data
        lat = position.coords.latitude;
        long = position.coords.longitude;
        var latlong = new google.maps.LatLng(lat, long);

        var myOptions = {
            center: latlong,
            zoom: 16,
            mapTypeControl: true,
            navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL }
        }

        var map = new google.maps.Map(document.getElementById("embedMap"), myOptions);
        var marker = new google.maps.Marker({ position: latlong, map: map, title: "You are here!" });
    }

    // Define callback function for failed attempt
    function showError(error) {
        if (error.code == 1) {
            result.innerHTML = "You've decided not to share your position, but it's OK. We won't ask you again.";
        } else if (error.code == 2) {
            result.innerHTML = "The network is down or the positioning service can't be reached.";
        } else if (error.code == 3) {
            result.innerHTML = "The attempt timed out before it could get the location data.";
        } else {
            result.innerHTML = "Geolocation failed due to unknown error.";
        }
    }
</script>
        


    </div>
    <asp:DropDownList ID="DDL1" runat="server">
     <asp:ListItem Value="">Please Select</asp:ListItem>  
            <asp:ListItem Value="0">Pot Holes</asp:ListItem>  
            <asp:ListItem Value="1">Garbage</asp:ListItem>
            <asp:ListItem Value="2">Stagnant Water</asp:ListItem>    
    </asp:DropDownList>

    <br />
    <br />
    <br />
    <asp:Image ID="Img1" runat="server" Width="60px" Height="60px" Visible=false />
    
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    
    <br />
    <asp:textbox ID="txtPhotoImg" runat="server" ValidationGroup="Save" Text="" style="display:none"></asp:textbox>
    <br />
    <asp:Button ID="btnUpload3" runat="server" Text="Upload" onclick="btnUpload_Click3"  />
    <br />
    <div id="result">
        <!--Position information will be inserted here-->
    </div>
    <button type="button" onclick="showPosition();">Show Position</button>

	<button type="button" onclick="showPosition1();">Show My Position on Google Map</button>
    <div id="embedMap" style="width: 400px; height: 300px;">
        <!--Google map will be embedded here-->
    </div>
    <br />

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="btn1" />
    </form>
</body>
</html>
