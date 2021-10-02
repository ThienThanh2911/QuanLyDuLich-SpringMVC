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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title><tiles:insertAttribute name="title" /></title>
        
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <!-- CSS Files -->
        <link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="../resources/assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="../resources/assets/css/demo.css" rel="stylesheet" />
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
    <script src="../resources/assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="../resources/assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="../resources/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="../resources/assets/js/plugins/bootstrap-switch.js"></script>
    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
    <!--  Chartist Plugin  -->
    <script src="../resources/assets/js/plugins/chartist.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="../resources/assets/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
    <script src="../resources/assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
    <!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
    <script src="../resources/assets/js/demo.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            // Javascript method's body can be found in assets/js/demos.js
            demo.initDashboardPageCharts();

            demo.showNotification();

        });
    </script>
</html>
