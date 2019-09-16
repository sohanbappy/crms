
<jsp:include page="landing_header.jsp" />

<link href="css/form_design.css" rel="stylesheet" type="text/css" />


<center><nav><form id="form_444844" class="appnitro"  method="POST" action="">
				
        <h2><b>Driver Info</b></h2>
        <h4>
        <div class="fl">    
        <label>Name</label><br>
        <input name="name" type="text" >
        <br>
        <br>
        <label>Phone</label><br>
        <input name="phone" type="text">
        <br>
        <br>
        <label>Driver License No</label><br>
        <input name="d_lic_no" type="text">
        <br>
        <br>
        
        </div>
        <div  class="fc">
     
        <label>Photo</label><br>
        <input name="picture" type="file">
        <br>
        <br>
        <label>Status</label><br>
        <select name="status" required="" class="st">
            <option selected value="Available">Available</option>
            <option>On leave</option>
        </select>
        <br>
        <br>
        
        </div>
        </h4>
        <input type="submit" name="Submit" value="Submit">
        <br><br>
        </form></nav></center>


<jsp:include page="landing_footer.jsp" />
