﻿<%@ Page Title="Map" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MapProject.aspx.vb" Inherits="CFMISNew.MapProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src='http://code.jquery.com/jquery.min.js' type='text/javascript'></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 

    <asp:Label ID="lblTest" runat="server" Text="Test" ></asp:Label>

<script type="text/javascript">
    var infowindow = null;
    var map;
    $(document).ready(function () { initialize(); });
    function initialize() {
        var centerMap = new google.maps.LatLng(39.828175, -98.5795);
        var myOptions = {
            zoom: 5,
            center: centerMap,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        //setMarkers(map, sites);
        infowindow = new google.maps.InfoWindow({
            content: "loading..."
        });

        var bikeLayer = new google.maps.BicyclingLayer();
        bikeLayer.setMap(map);
    }

    </script>
    <div style="padding-left:15px">
    <div id="map_canvas" style="width: 95%; height: 900px;"></div></div>
<script language="javascript" type="text/javascript">
    function PlotMap() {
        var url = 'MapProject.aspx/GetCities';
        $.ajax({
            type: "POST",
            url: url,
            data: "{}",
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            success: function (msg) {
                setMarkersforStates(msg);
            },
            error: function (xmlHttpRequest, textStatus, errorThrown) {
                if (xmlHttpRequest.readyState == 0 || xmlHttpRequest.status == 0) {

                    return;
                }
                else {
                    //alert("AddClickTrackingReport " + textStatus);
                }

            }
        });
    }


    function setMarkersforStates(markers) {

        for (var i = 0; i < markers.d.length; i++) {
            var iconBase = 'Images/';
            var siteLatLng = new google.maps.LatLng(markers.d[i].latitude, markers.d[i].longitude);

            var marker = new google.maps.Marker({
                position: siteLatLng,
                map: map,
                icon: iconBase + 'Pin.PNG',
                title: markers.d[i].City,
                zIndex: i,
                html: markers.d[i].City
            });

            google.maps.event.addListener(marker, "click", function () {
                infowindow.setContent(this.html);
                //infowindow.open(map, this);
                window.location = "MapCities.aspx?statename=" + this.title;
            });
        }
    }
    $(document).ready(function () {
        PlotMap();
    });
    </script> 
    

</asp:Content>