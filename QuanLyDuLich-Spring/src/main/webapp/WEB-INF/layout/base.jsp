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
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment-with-locales.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title><tiles:insertAttribute name="title" /></title>
        

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
       
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/search.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/star-rating.css" rel="stylesheet" />
        <!-- jQuery -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>

        <!-- Bootstrap -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/commenttour.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/commentblog.js"></script>
        <!-- Plugins -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/scrollreveal.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.counterup.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/imgfix.min.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mixitup.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/accordions.js"></script>

        <!-- Global Init -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
        
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
        
        <div class='top'></div>
        
        <tiles:insertAttribute name="header" /> 
        
        <tiles:insertAttribute name="content" /> 
        
        <tiles:insertAttribute name="footer" />
        
        <script>
            $(window).scroll(function () {
            if ($(this).scrollTop() > 50) {
              $(".scrolltop:hidden").stop(true, true).fadeIn();
            } else {
              $(".scrolltop").stop(true, true).fadeOut();
            }
          });
          $(function () {
            $(".scroll").click(function () {
              $("html,body").animate({ scrollTop: $(".top").offset().top }, 1000);
              return false;
            });
          });
        </script>
        <script>
        $('.btn-number').click(function(e){
        e.preventDefault();

        fieldName = $(this).attr('data-field');
        type      = $(this).attr('data-type');
        var input = $("input[name='"+fieldName+"']");
        var currentVal = parseInt(input.val());
        if (!isNaN(currentVal)) {
            if(type === 'minus') {

                if(currentVal > input.attr('min')) {
                    input.val(currentVal - 1).change();
                } 
                if(parseInt(input.val()) === input.attr('min')) {
                    $(this).attr('disabled', true);
                }

            } else if(type === 'plus') {

                if(currentVal < input.attr('max')) {
                    input.val(currentVal + 1).change();
                }
                if(parseInt(input.val()) === input.attr('max')) {
                    $(this).attr('disabled', true);
                }

            }
        } else {
            input.val(0);
        }
    });
    $('.input-number').focusin(function(){
       $(this).data('oldValue', $(this).val());
    });
    $('.input-number').change(function() {

        minValue =  parseInt($(this).attr('min'));
        maxValue =  parseInt($(this).attr('max'));
        valueCurrent = parseInt($(this).val());

        name = $(this).attr('name');
        if(valueCurrent >= minValue) {
            $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled');
        } else {
            alert('Sorry, the minimum value was reached');
            $(this).val($(this).data('oldValue'));
        }
        if(valueCurrent <= maxValue) {
            $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled');
        } else {
            alert('Sorry, the maximum value was reached');
            $(this).val($(this).data('oldValue'));
        }


    });
    $(".input-number").keydown(function (e) {
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
                 // Allow: Ctrl+A
                (e.keyCode === 65 && e.ctrlKey === true) || 
                 // Allow: home, end, left, right
                (e.keyCode >= 35 && e.keyCode <= 39)) {
                     // let it happen, don't do anything
                     return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });
    </script>
        
        <div class='scrolltop'>
            <div class='scroll icon1'><i class="fa fa-rocket" aria-hidden="true"></i></div>
        </div>
        
        <style>
            /*  scroll css section here*/
            .scrolltop .icon1 {
                font-size: 30px;
                text-align: center;
                transform: rotate(-45deg);
                margin-top: 5px;
                color: #fff;
            }

            .scrolltop {
                position: fixed;
                bottom: 70px;
                right: 40px;
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background-color: #ed563b;
                display: none;
                z-index: 1000;
            }
        </style>
        
        
    </body>
</html>
