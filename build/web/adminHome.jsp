
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>


<jsp:include page="landing_header.jsp" />

<link href="css/form_design.css" rel="stylesheet" type="text/css" />


<center><nav>
				
        <h2><b>Admin Page</b></h2>
        <h4 >
        <div class="mng">
            <button ><a href="user_form.jsp">ADD  User</a></button>  
        <br><br>
            <button ><a href="branch_form.jsp">ADD  Branch</a></button>  
        <br><br>
            <button ><a href="driver_form.jsp">ADD  Driver</a></button>  
        <br><br>
            <button ><a href="bike_info_form.jsp">ADD  Bike</a></button>   
        <br><br>
            <button ><a href="car_info_form.jsp">ADD  Car</a></button>  
        <br><br>
            <button ><a href="training_info_form.jsp">ADD  Training</a></button> 
        <br><br>
            <button ><a href="bike_rent_form.jsp">Manage  Bike</a></button> 
        <br><br>
            <button ><a href="car_rent_form.jsp">Manage  Car</a></button> 
        <br><br>
            <button ><a href="training_rent_form.jsp">Manage  Training</a></button> 
        <br><br>
        
        </div>
            </h4>
        </nav></center>


<jsp:include page="landing_footer.jsp" />
