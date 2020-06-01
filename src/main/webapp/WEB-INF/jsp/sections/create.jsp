<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="dv-lvl-3 content-body">

    <div class="con-lvl-4 headers-container">
        <div class="dv-lvl-5 create-note-header create">
            <p><b>Create</b> your note <c:if test="${success}" ><span>Note added!</span></c:if></p>
        </div>
        <div class="dv-lvl-5 create-note-header title">
            <p><b>Give</b> it a title</p>
        </div>
    </div>
    
    <div class="con-lvl-4 create-form-container">
        
            <form:form modelAttribute="note">

                <div class="con-lvl-5 note-container">
                    <div class="dv-lvl-5 note-header">
                        <div class="dv-lvl-6 note-header">
                            New note
                        </div>
                    </div>

                    <div class="dv-lvl-5 note-body">
                        <div class="dv-lvl-6 note-body">
                            <div class="dv-lvl-7 form-input-container">
                                <form:textarea path="text" cssClass="tx-lvl-8 text-input-textarea"></form:textarea>
                            </div>
                            <div class="div-lvl-7 form-input-box-error text-error">
	                            <form:errors path="text" />
	                        </div>
                        </div>
                    </div>
                </div>

                <div class="con-lvl-5 title-container">
                    <div class="dv-lvl-6 form-input-container">
                        <label for="title" class="lb-lvl-7 title-input-label">The title</label></br>
                        <form:input path="title" type="text" cssClass="in-lvl-7 title-input" /></br>
                        <button type="submit" class="btn btn-primary">Save</button>
	                    <div class="div-lvl-7 form-input-box-error">
	                        <form:errors path="title" />
	                    </div>
                    </div>
                    
                </div>

            </form:form>

    </div>

</div>