
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<jsp:include page="landing_header.jsp" />


<script type="text/javascript">
    
    function showHide(){
    var a=document.getElementById("nat").value;
    
//    alert("Nat: "+a);
    
    if(a==="Foriegner"){
        document.getElementById("passport").required = true;
//        alert("true: ");
     }
     else{
         document.getElementById("passport").required=false;
     }
   
    }
    
 </script> 
 
 <script> 
function checkValidation()                                    
{ 
    var nat=document.forms["RegForm"]["nat"]; 
    var name = document.forms["RegForm"]["name"];               
    var mail = document.forms["RegForm"]["mail"];    
    var phone = document.forms["RegForm"]["phone"];  
    var nid =  document.forms["RegForm"]["nid_no"];  
    var passport =  document.forms["RegForm"]["passport_no"];   
    var password = document.forms["RegForm"]["pass"];  
    
   
    if (name.value.length < 3 )                                  
    { 
        window.alert("Please enter minimum 3 characters"); 
        name.focus(); 
        return false; 
    } 
   
    if (mail.value.indexOf("@", 0) < 0)                 
    { 
        window.alert("Please enter a valid e-mail address."); 
        mail.focus(); 
        return false; 
    } 
   
    if (mail.value.indexOf(".", 0) < 0)                 
    { 
        window.alert("Please enter a valid e-mail address."); 
        mail.focus(); 
        return false; 
    } 
   
    if ((phone.value.length < 11) || (phone.value.length > 11) )                           
    { 
        window.alert("Please enter 11 digit's phone number."); 
        phone.focus(); 
        return false; 
    } 
   
    if (password.value.length < 8)                        
    { 
        window.alert("Please enter minimum 8 length's password  "); 
        password.focus(); 
        return flase; 
    } 
   
     if (nid.value.length < 5 )                           
    { 
        window.alert("Please enter miminmum 5 alphabets for NID!! "); 
        nid.focus(); 
        return false; 
    } 
    if(nat==="Foriegner"){
     if (passport.value.length < 5)                           
    { 
        window.alert("Please enter miminmum 5 alphabets for Passport!! "); 
        passport.focus(); 
        return false; 
      } 
   }

   
    return true;
    
}</script> 
 
 

 <center style=""><nav>
         
         <h2><b>User Info</b></h2>
         
         
         <div class="container">
             <div class="row">
                 <div class="col-sm-4">
         
         
         
         <form  name="RegForm" method="POST" action="addUser" enctype="multipart/form-data" onsubmit="return checkValidation()" >
				 
        <label>Name</label><br>
        <input name="name" type="text" class="form-control" maxlength="50" required="">
      
        <label>Mobile No.</label><br>
        <input name="phone" type="text" class="form-control" pattern="[0-9]{11}" placeholder="ex-01766334885 " required="">
    
        <label>Mail</label><br>
        <input name="mail" type="email" class="form-control" required="">
      
        <label>Address</label><br>
        <textarea rows="5" wrap="off" name="address" maxlength="150" class="form-control" required=""></textarea>
      
        <label>Nationality</label><br>
        <select name="nat"   id="nat" class="form-control" onchange="showHide()" required="" >
            <option  value="Bangladeshi">Bangladeshi</option>
            <option value="Foriegner">Foriegner</option>
        </select>
       </div>
           
        <div class="col-sm-4">   
        <label >NID Number</label><br>
        <input  name="nid_no" type="text" class="form-control" maxlength="50" required="">
        
        <label >Passport Number</label><br>
        <input type="text"  id="passport"  name="passport_no" maxlength="50" class="form-control" >
               <%
                Random rnd=new Random();
                int tempRnd=rnd.nextInt(100);
                SimpleDateFormat df,frmt;
                df= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Date date = new Date();
                df.format(date); 
                String id="us-"+date.getDate()+date.getSeconds()+date.getMinutes()+tempRnd;//ID Generator

                %> 
        <label>User ID</label><br>
        <input name="uid" type="text" value="<%=id%>" class="form-control" readonly="">
        
        <script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });
        </script>
        <label>Password</label><br>
        <input name="pass" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" maxlength="20" placeholder="minimum 8 letters" data-toggle="tooltip" data-placement="top" title="at least one Capital,one small and one number" class="form-control" required="">
      
        <label>Photo</label><br>
        <input name="picture" type="file" class="form-control" required="">
    
        
        <input type="hidden" name="status" value="pending" >
        <br>
        <input type="submit" name="submit" value="Submit" class="btn btn-success">
        <br><br>
        </div>
     </form>
     
                 
             </div>
         </div>
     
     </nav></center>


<jsp:include page="landing_footer.jsp" />
