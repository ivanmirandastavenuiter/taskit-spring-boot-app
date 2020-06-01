<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="dv-lvl-3 content-body">

    <c:if test="${not empty list}">
    
    <div class="dv-lvl-4 selector-div">
	    <p>Please, select an order for notes: </p>
	    <select class="date-selector" name="order" form="order">
	        <option value="none" selected>Select an option</option> 
	        <option value="olders">Olders first</option>
	        <option value="latests">Latest first</option>
	     </select>
	</div>
	
	<form action="/taskit/note/sorted" method="get" id="order"></form>

	   <c:forEach items = "${list}" var = "note">
	   
	      <div class="dv-lvl-4 note-item">
		       <div class="con-lvl-5 note-title-container">
		           <div class="dv-lvl-6 note-title">
		              ${note.title}
		           </div>
		       </div>
		       <div class="con-lvl-5 note-text-container">
		           <div class="dv-lvl-6 note-status">
		               <c:if test="${note.status}">
			           	<div class="dv-lvl-7 note-done-indicator">DONE</div>
			           	<div class="dv-lvl-7 note-status-indicator done"></div>
			           </c:if>
			           <c:if test="${not note.status}">
			           	<div class="dv-lvl-7 note-undone-indicator">UNDONE</div>
			           	<div class="dv-lvl-7 note-status-indicator undone"></div>
			           </c:if>
		           </div>
		           <div class="dv-lvl-6 text-content">
		           		${note.text}
		           </div>
		           <div class="con-lvl-6 date-container">
		               <div class="dv-lvl-7 date-content">${note.note_date}</div>
		           </div>
		       </div>
	   	  </div>
	   
	   </c:forEach>
   
   </c:if>
   
   <c:if test="${empty list}">
   		<div class="con-lvl-4 headers-container">
	    <div class="dv-lvl-5 create-note-header create no-notes">
	        <p>There aren't notes <b>yet</b></p>
	    </div>
	</div>
   </c:if>
   
</div>