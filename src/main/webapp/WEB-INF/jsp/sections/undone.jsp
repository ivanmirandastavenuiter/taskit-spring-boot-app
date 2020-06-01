<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="dv-lvl-3 content-body">

	<div class="con-lvl-4 headers-container">
	    <div class="dv-lvl-5 create-note-header create">
	        <p><b>Your undone</b> tasks
	        	<c:if test="${delete}" ><span class="span-delete">Note deleted!</span></c:if>
	        	<c:if test="${toggled}" ><span class="span-toggled">Status changed!</span></c:if>
	        </p>
	    </div>
	</div>

	<c:if test="${not empty notes}">
	
			<div class="con-lvl-4 notes-container">
			
			    <!-- Notes row -->
			    <div class="con-lvl-5 notes-row">
			    
				    <c:set var = "counter" value = "1"/>
				
					<c:forEach items = "${notes}" var = "note">
			
				        <!-- Note block -->
				        <div class="con-lvl-6 note-container">
				            <div class="dv-lvl-7 note-header">
				                <div class="dv-lvl-8 note-header">
				                    ${note.title}
				                </div>
				            </div>
				
				            <div class="dv-lvl-7 note-body">
				            	${note.text}
				                <div class="con-lvl-8 date-container">
				                    <div class="dv-lvl-9 date-content">${note.note_date}</div>
				                </div>
				            </div>
				            <div class="dv-lvl-7 note-actions">
				                <div class="dv-lvl-8 action-icon toggle">
				                	<i class="fas fa-exchange-alt"></i>
				                </div>
				                <div class="dv-lvl-8 action-icon delete">
				                	<i class="far fa-trash-alt"></i>
				                </div>
				            </div>
				        </div>
				        
				        <form method="post" class="delete-form" name="delete-form" action="/taskit/note/delete/${note.id}"></form>
				        <form method="post" class="toggle-form" name="toggle-form" action="/taskit/note/toggle/${note.id}"></form>
				        
				        <c:if test="${counter % 3 == 0}">
				        	</div>
				        	<div class="con-lvl-5 notes-row">
				        </c:if>
				        
				        <c:set var = "counter" value = "${counter + 1}"/>
			        
			        </c:forEach>
			        
			    </div>
			    
			</div>
	
	</c:if>
	
	<c:if test="${empty notes}">
	   	<div class="con-lvl-4 headers-container">
		    <div class="dv-lvl-5 create-note-header create no-notes">
		        <p>There aren't notes <b>yet</b></p>
		    </div>
		</div>
   </c:if>
   
      <script>
   
   $(document).ready(function() {
	   
	   let deleteFormIcon = $('div.dv-lvl-8.action-icon.delete');
	   let toggleFormIcon = $('div.dv-lvl-8.action-icon.toggle');
	   
	   let deleteForm = $('form.delete-form');
	   let toggleForm = $('form.toggle-form');
	   
	   deleteFormIcon.click(function(){ deleteForm.submit(); });
	   toggleFormIcon.click(function(){ toggleForm.submit(); });
   })
   
   
   </script>
   
</div>