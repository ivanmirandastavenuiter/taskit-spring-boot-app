<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Titillium+Web:wght@300&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/465dd91009.js" crossorigin="anonymous"></script>
    <script
		  src="https://code.jquery.com/jquery-3.5.1.js"
		  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		  crossorigin="anonymous"></script>
    <link href="../assets/css/common.css" rel="stylesheet">
    <c:if test = "${view == 'overview'}">
    	<link href="../assets/css/overview.css" rel="stylesheet">
    </c:if>
    <c:if test = "${view == 'create'}">
    	<link href="../assets/css/create.css" rel="stylesheet">
    </c:if>
    <c:if test = "${view == 'done'}">
    	<link href="../assets/css/done.css" rel="stylesheet">
    </c:if>
    <c:if test = "${view == 'undone'}">
    	<link href="../assets/css/undone.css" rel="stylesheet">
    </c:if>
    <c:if test = "${view == 'sorted'}">
    	<link href="../assets/css/sorted.css" rel="stylesheet">
    </c:if>
<title>TasKit</title>
<style>
       
           
    </style>
</head>
<body>

    <div class="con-lvl-0 main-container">

        <div class="dv-lvl-1 upper-block">
            <div class="con-lvl-2 logo-container">
                <div class="dv-lvl-3 logo-item">
                    [ LOGO HERE ]
                </div>
            </div>
            <div class="con-lvl-2 header-container">
                <div class="dv-lvl-3 greeting-header">
                    <p><b>Hi</b> <%=request.getRemoteUser()%>. Ready for work today?</p>
                </div>
                <div class="dv-lvl-3 logout-box">
                    <div class="dv-lvl-4 yes-no-box">
                        <div class="dv-lvl-5 yes">Yes</div>
                        <div class="dv-lvl-5 no">No</div>
                    </div>
                    <div class="dv-lvl-4 logout-text-box">
                        <div class="dv-lvl-5 logout-text">Logout</div>
                    </div>
                </div>

            </div>
        </div>

        <div class="dv-lvl-1 lower-block">
            <div class="con-lvl-2 left-toolbar-container">

            </div>
            <div class="con-lvl-2 main-body-container">

                <!-- Reminder: Overview, create, done, undone, ordered -->
                <div class="dv-lvl-3 sections">
                    <div class="dv-lvl-4 section-item"><a href="overview">Overview</a></div>
                    <div class="dv-lvl-4 section-item"><a href="create">Create</a></div>
                    <div class="dv-lvl-4 section-item"><a href="done">Done</a></div>
                    <div class="dv-lvl-4 section-item"><a href="undone">Undone</a></div>
                    <div class="dv-lvl-4 section-item"><a href="sorted">Sorted</a></div>
                </div>
                
                <c:if test = "${view == 'overview'}">
                	<c:import url = "sections/overview.jsp"/>
                </c:if>
                
                <c:if test = "${view == 'create'}">
                	<c:import url = "sections/create.jsp"/>
                </c:if>
                
                <c:if test = "${view == 'done'}">
                	<c:import url = "sections/done.jsp"/>
                </c:if>
                
                <c:if test = "${view == 'undone'}">
                	<c:import url = "sections/undone.jsp"/>
                </c:if>
                
                <c:if test = "${view == 'sorted'}">
                	<c:import url = "sections/sorted.jsp"/>
                </c:if>

                

            </div>
        </div>

    </div>

    <script>
    
        $(document).ready(function() {

            $('div.dv-lvl-4.logout-text-box').click(function() {
                let yesNoBox = $('div.dv-lvl-4.yes-no-box');
                let noBox = $('div.dv-lvl-5.no');
                let yesBox = $('div.dv-lvl-5.yes');

                noBox.click(function() {
                    yesNoBox.css('width', 0);
                });

                yesBox.click(function() {
                    window.location.href = '/taskit/logout';
                })
                
                yesNoBox.css({
                    'width' : '100px'
                });
               
            })
            
            $('select.date-selector').change(function() {
    	    	
    	        let order = this.value;
    	        
    	        if (order == 'olders' || order == 'latests') {
    	        	$("form#order").submit();
    	   	 	}
    	
    	    });
        })
        
        
    </script>
    
</body>
</html>