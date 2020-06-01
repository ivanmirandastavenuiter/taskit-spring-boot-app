<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel&family=Monoton&family=Open+Sans+Condensed:wght@300&family=Righteous&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Titillium+Web:wght@300&display=swap" rel="stylesheet">
    
    <title>Register</title>
    <style>
       	body {
            margin: 0;
            padding: 0;
            font-family: 'Titillium Web', sans-serif;
            background: #f8f8f8;
        }
        div.con-lvl-0.main-container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        div.con-lvl-1.form-container {
            width: 45%;
           
        }
        div.dv-lvl-2.logo-container {
            width: 45%;
        }
            div.dv-lvl-3.logo-box {
                height: 71px;
                width: 228px;   
                background: url('logo-2.png');
                margin: 10px auto;
            }
        div.dv-lvl-2.inputs-box {
            padding: 3%;
            border: 1px solid #bdbdbd;
            border-radius: 3%;
            width: 45%;
            background: #f4db70;
            color: #585858;
        }
        button.btn.btn-primary.submit-btn {
            margin-right: 3%;
        }
        div.form-input-box-error {
	        padding: 5px;
	        color: #ff0000;
	        font-weight: bold;
	        margin: -5% 0 2% 0;
	    }
	    .error {
	    	color: #ff0000;
	    	font-size: .8em;
	    }
        .form-control:focus {
            color: #495057;
            background-color: #fff;
            border-color: #ecd054;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(155, 129, 17, .25);
        }
        .btn-primary {
            color: #fff;
            background-color: #495057;
            border-color: #495057;
        }
        .btn-primary:not(:disabled):not(.disabled).active:focus, .btn-primary:not(:disabled):not(.disabled):active:focus, .show>.btn-primary.dropdown-toggle:focus {
            box-shadow: 0 0 0 0.2rem rgba(40, 44, 49, .5);
        }
        .btn-primary:not(:disabled):not(.disabled).active:focus, .btn-primary:not(:disabled):not(.disabled):active:focus, .show>.btn-primary.dropdown-toggle:focus {
            box-shadow: 0 0 0 0.2rem rgba(67, 71, 75, 0.5);
        }
        .btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show>.btn-primary.dropdown-toggle {
            color: #fff;
            background-color: #2f343a;
            border-color: #2f343a;
        }
        .btn-primary.focus, .btn-primary:focus {
            color: #fff;
            background-color: #1f2329;
            border-color: #1f2329;
            box-shadow: 0 0 0 0.2rem rgba(31, 35, 41, .5);
        }

        .btn-primary:hover {
            color: #fff;
            background-color: #1f2329;
            border-color: #1f2329;
        }
        .btn.focus, .btn:focus {
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(40, 44, 49, .5);
        }
    </style>
</head>
<body>

    <div class="con-lvl-0 main-container">
    
	    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
		<c:set var="success" value="${success}"/>

        <div class="con-lvl-1 form-container">
        	
            <h2 class="he-lvl-2 form-header">Register</h2>

            <div class="dv-lvl-2 inputs-box">
                <form:form modelAttribute="user">
                
                    <div class="form-group">
                      <label for="username">Username</label>
                      <form:input type="text" path="username" class="form-control" id="username" aria-describedby="Username" />
                    </div>
                    <div class="form-input-box-error">
		                <form:errors path="username" cssClass="error" />
		            </div>
                    <div class="form-group">
                      <label for="password">Password</label>
                      <form:input type="password" path="password" class="form-control" id="password" />
                    </div>
                     <div class="form-input-box-error">
		                <form:errors path="password" cssClass="error" />
		            </div>
                    <div class="form-group">
                      <label for="confirm">Confirm password</label>
                      <form:input type="password" path="confirm" class="form-control" id="confirm" />
                    </div>
                    <div class="form-input-box-error">
		                <form:errors path="confirm" cssClass="error" />
		            </div>
		            <div class="form-input-box-error">
		                <form:errors name="confirm" cssClass="error" />
		            </div>
                    <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                    <a href="<%=request.getContextPath()%>/login" class="btn btn-light register-btn">Back</a>
                </form:form>
            </div>
        </div>
    </div>

    
    
</body>
</html>