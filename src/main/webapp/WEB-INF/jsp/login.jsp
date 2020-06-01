<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Titillium+Web:wght@300&display=swap" rel="stylesheet">
    <title>Login</title>
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
        h2.he-lvl-2.form-header {
            margin-bottom: 1.5%;
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
        div.form-input-box-error {
	        padding: 5px;
	        color: #ff0000;
	        margin: -5% 0 2% 0;
	        font-size: .9em;
	    }
	    .success-logout,
	    .success-register {
	    	color: #24b72c;
	    }
        button.btn.btn-primary.submit-btn {
            margin-right: 3%;
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

        <div class="con-lvl-1 form-container">
        
        	<c:if test="${not empty logout}">
        		<div class="success-logout">
        			Hope to see you soon!
        		</div>
        	</c:if>
        	
        	<c:if test="${not empty success}">
        		<div class="success-register">
        			User added!
        		</div>
        	</c:if>

            <h2 class="he-lvl-2 form-header">Login</h2>

            <div class="dv-lvl-2 inputs-box">
                <form action="j_spring_security_check" name="f" method="post">
                    <div class="form-group">
                      <label for="username">Email address</label>
                      <input type="text" class="form-control" id="username" aria-describedby="Username" name="j_username">
                    </div>
                    
                    <c:if test="${not empty error}">
		        		<div class="form-input-box-error">
		        			Login error: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }
		        		</div>
        			</c:if>
		            
                    <div class="form-group">
                      <label for="password">Password</label>
                      <input type="password" class="form-control" id="password" name="j_password">
                    </div>
                    <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                    <a href="<%=request.getContextPath()%>/register" class="btn btn-light register-btn">Register</a>
                  </form>
            </div>
        </div>
    </div>
    
    
</body>
</html>