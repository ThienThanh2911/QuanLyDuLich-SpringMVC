<%-- 
    Document   : newjsp
    Created on : Aug 6, 2021, 3:59:10 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
<link defer rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment-with-locales.min.js"></script>

        <title><tiles:insertAttribute name="title" /></title>
        
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <!-- CSS Files -->
        <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="${pageContext.request.contextPath}/resources/assets/css/demo.css" rel="stylesheet" />
        <script>
                var arr = [];
                var chart;
                fetch(`/QuanLyDuLich-Spring/piechart`,{
                    method: 'post',
                    body: JSON.stringify({
                        "year": "2021"
                    }),
                    headers:{
                        'Content-Type': 'application/json'
                    }
                }).then(function(res){
                    return res.json();
                }).then(function(data){
                    for (var i = 1; i < Object.keys(data).length -1; i++) {
                        if(data[i][Object.keys(data[i])]/data[0]["totalPrice"]*100 !== 0)
                            arr.push({
                                y: data[i][Object.keys(data[i])]/data[0]["totalPrice"]*100, label: Object.keys(data[i])[0]
                            });
                    }
                    document.getElementById("yearTitle").innerHTML = "Số liệu thống kê năm " + document.getElementById("selectYear").value
                    document.getElementById("yearTicket").innerHTML = data[-1]["totalTicket"]
                    document.getElementById("yearPrice").innerHTML = data[0]["totalPrice"] + " VNÐ"
                    chart = new CanvasJS.Chart("chartContainer", {
                        animationEnabled: true,
                        data: [{
                                type: "pie",
                                startAngle: 240,
                                yValueFormatString: "##0.00\"%\"",
                                indexLabel: "{label} {y}",
                                dataPoints: arr
                        }]
                    });
                    chart.render();
                }).catch(function(err){
                    console.error(err);
                });
        var arrAdult = [];
        var arrChildren = [];
        var chart2
        fetch(`/QuanLyDuLich-Spring/columnchart`,{
            method: 'post',
            body: JSON.stringify({
                "year": "2021"
            }),
            headers:{
                'Content-Type': 'application/json'
            }
        }).then(function(res){
            return res.json();
        }).then(function(data){
            for (var i = 1; i <= 12; i++) {
                arrAdult.push({
                    label: "Tháng " + i, y: data[i]["adult"]/1000000
                });
                arrChildren.push({
                    label: "Tháng " + i, y: data[i]["children"]/1000000
                });
            }
            var m = document.getElementById("selectMonth").value
            document.getElementById("monthTitle").innerHTML = "Số liệu thống kê tháng " + m
            document.getElementById("monthTicket").innerHTML = data[m]["totalTicket"]
            document.getElementById("monthPrice").innerHTML = parseInt(data[m]["adult"]) + parseInt(data[m]["children"]) + " VNÐ"
            chart2 = new CanvasJS.Chart("chartContainer2", {
                animationEnabled: true,
                axisY: {
                        title: "Đơn vị: triệu",
                        titleFontColor: "#4F81BC",
                        lineColor: "#4F81BC",
                        labelFontColor: "#4F81BC",
                        tickColor: "#4F81BC"
                },
                toolTip: {
                        shared: true
                },
                legend: {
                        cursor:"pointer",
                        itemclick: toggleDataSeries
                },
                data: [{
                        type: "column",
                        name: "Vé người lớn",
                        legendText: "Vé người lớn",
                        showInLegend: true, 
                        dataPoints: arrAdult
                },
                {
                        type: "column",	
                        name: "Vé trẻ em",
                        legendText: "Vé trẻ em",
                        axisYType: "secondary",
                        showInLegend: true,
                        dataPoints: arrChildren
                }]
        });
        chart2.render();
        }).catch(function(err){
            console.error(err);
        });

        function toggleDataSeries(e) {
                if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                        e.dataSeries.visible = false;
                }
                else {
                        e.dataSeries.visible = true;
                }
                chart2.render();
        }
            function updateChart() {
                arr = []
                var year = document.getElementById("selectYear").value;
                fetch(`/QuanLyDuLich-Spring/piechart`,{
                    method: 'post',
                    body: JSON.stringify({
                        "year": year
                    }),
                    headers:{
                        'Content-Type': 'application/json'
                    }
                }).then(function(res){
                    return res.json();
                }).then(function(data){
                    for (var i = 1; i < Object.keys(data).length -1; i++) {
                        if(data[i][Object.keys(data[i])]/data[0]["totalPrice"]*100 !== 0 && data[i][Object.keys(data[i])] !== 0)
                            arr.push({
                                y: data[i][Object.keys(data[i])]/data[0]["totalPrice"]*100, label: Object.keys(data[i])[0]
                            });
                    }
                    document.getElementById("yearTitle").innerHTML = "Số liệu thống kê năm " + document.getElementById("selectYear").value
                    document.getElementById("yearTicket").innerHTML = data[-1]["totalTicket"]
                    document.getElementById("yearPrice").innerHTML = data[0]["totalPrice"] + " VNÐ"
                    chart = new CanvasJS.Chart("chartContainer", {
                        animationEnabled: true,
                        data: [{
                                type: "pie",
                                startAngle: 240,
                                yValueFormatString: "##0.00\"%\"",
                                indexLabel: "{label} {y}",
                                dataPoints: arr
                        }]
                    });
                    chart.render();
                }).catch(function(err){
                    console.error(err);
                });
                arrAdult = [];
            arrChildren = [];
            fetch(`/QuanLyDuLich-Spring/columnchart`,{
                method: 'post',
                body: JSON.stringify({
                    "year": year
                }),
                headers:{
                    'Content-Type': 'application/json'
                }
            }).then(function(res){
                return res.json();
            }).then(function(data){
                for (var i = 1; i <= 12; i++) {
                    arrAdult.push({
                        label: "Tháng " + i, y: data[i]["adult"]/1000000
                    });
                    arrChildren.push({
                        label: "Tháng " + i, y: data[i]["children"]/1000000
                    });
                }
                var m = document.getElementById("selectMonth").value
                document.getElementById("monthTitle").innerHTML = "Số liệu thống kê tháng " + m
                document.getElementById("monthTicket").innerHTML = data[m]["totalTicket"]
                document.getElementById("monthPrice").innerHTML = parseInt(data[m]["adult"]) + parseInt(data[m]["children"]) + " VNÐ"
                chart2 = new CanvasJS.Chart("chartContainer2", {
                    animationEnabled: true,
                    axisY: {
                            title: "Đơn vị: triệu",
                            titleFontColor: "#4F81BC",
                            lineColor: "#4F81BC",
                            labelFontColor: "#4F81BC",
                            tickColor: "#4F81BC"
                    },
                    toolTip: {
                            shared: true
                    },
                    legend: {
                            cursor:"pointer",
                            itemclick: toggleDataSeries
                    },
                    data: [{
                            type: "column",
                            name: "Vé người lớn",
                            legendText: "Vé người lớn",
                            showInLegend: true, 
                            dataPoints: arrAdult
                    },
                    {
                            type: "column",	
                            name: "Vé trẻ em",
                            legendText: "Vé trẻ em",
                            axisYType: "secondary",
                            showInLegend: true,
                            dataPoints: arrChildren
                    }]
            });
            chart2.render();
            }).catch(function(err){
                console.error(err);
            });
            };
            </script>
    </head>
    <body>
        
        <!-- ***** Preloader Start ***** -->
        <div id="js-preloader" class="js-preloader">
          <div class="preloader-inner">
            <span class="dot"></span>
            <div class="dots">
              <span></span>
              <span></span>
              <span></span>
            </div>
          </div>
        </div>
        <!-- ***** Preloader End ***** -->
        
        <script>
        $(window).on('load', function() {

        $('#js-preloader').addClass('loaded');

        });
        </script>
        <div class="wrapper">

            <tiles:insertAttribute name="content" /> 

        </div>

    </body>
    
    <!--   Core JS Files   -->
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/bootstrap-switch.js"></script>
    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
    <!--  Chartist Plugin  -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/chartist.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
    <!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            // Javascript method's body can be found in assets/js/demos.js
            demo.initDashboardPageCharts();

            //demo.showNotification("fa-info-circle", "Bạn đã vào trang quannr lý User", 1);

        });
        $('#bologna-list a').on('click', function (e) {
            e.preventDefault()
            $(this).tab('show')
        })
    </script>
</html>
