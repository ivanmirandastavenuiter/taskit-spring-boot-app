<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="dv-lvl-3 content-body">

    <div class="con-lvl-4 headers-container">
        <div class="dv-lvl-5 create-note-header create">
            <p><b>Your</b> overview</p>
        </div>
    </div>

    <c:if test="${not empty notes}">

	   <c:forEach items = "${notes}" var = "note">
	   
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
   
   <c:if test="${empty notes}">
   		<div class="con-lvl-4 headers-container">
	    <div class="dv-lvl-5 create-note-header create no-notes">
	        <p>There aren't notes <b>yet</b></p>
	    </div>
	</div>
   </c:if>
   
</div>