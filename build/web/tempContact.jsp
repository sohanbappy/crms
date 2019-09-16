 
<jsp:include page="landing_header.jsp" />


<div class="class-center" id="contact" style="background:  black ">
      <h4 class="text-uppercase" style="">
              Contact Us
            </h4>
          <div class="form">
            <div id="sendmessage" style="color: red;" >Your message has been sent. Thank you!</div>
            <div id="errormessage" style="color: red;"></div>
            
            <form method="GET" action="contactMail"  role="form" class="contactForm">
              <div class="form-group">
                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required=""/>
                <div class="validation"></div>
              </div>
              <div class="form-group">
                <input type="email" class="form-control" name="sender" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" required=""/>
                <div class="validation"></div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" required=""/>
                <div class="validation"></div>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validation"></div>
              </div>
                <div class="text-center"><button type="submit" name="submit">Send Message</button></div>
            </form>
          </div>
       </div>

        <footer>
            <p></p>
        </footer>