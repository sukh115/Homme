<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      
 
        <!-- footer 입니다 -->
        
        <div class="module-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <div class="widget">
                  <h5 class="widget-title font-alt">About Team_Six</h5>
                  <p>김찬수 Email.kimfk567@gmail.com</p>
                  <p>김우종 Email.dsadwca@gmail.com</p>
                  <p>정석현 Email.32tbtn@gmail.com</p>
                  <p>이해찬 Email.ftbdve@gmail.com</p>
                  <p>이학영 Email.sdhv54@gmail.com</p>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="widget">
       <!-- Button trigger modal -->
<button type="button" class="btn btn-lg btn-block btn-round btn-g" data-toggle="modal" data-target="#myModal">
 실시간 문의
</button>
                </div>
              </div>
           
           
           
            </div>
          </div>
        </div>
        <hr class="divider-d">
        <footer class="footer bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <p class="copyright font-alt">&copy; 2021&nbsp;Homme&nbsp;Team Project</p>
              </div>
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
<script>

var socket = null;


//소켓


function connectWs(){
var ws = new SockJS("/alram");
socket = ws;

	ws.onopen = function() {
 console.log('open');
 
 };

	ws.onmessage = function(event) {
		console.log("onmessage"+event.data);
		let $socketAlert = $('div#messagebox');
		$socketAlert.append(event.data);
		$socketAlert.css('display', 'block');
		
};

	ws.onclose = function() {
	    console.log('close');
 };
 
 
 

}

//소켓끝

	function sendMessage(){
		var message =  document.getElementById('sendInput').value; 
		var id = ${member.MEM_ID}
		if(id != '1234'){
			let socketMsg = "customer,"+id+","+message;
			console.log(socketMsg);
			socket.send(socketMsg);
			$('#sendInput').val('');
			}else{
			let socketMsg = "master,"+id+","+message;
			console.log(socketMsg);
			socket.send(socketMsg);
			$('#sendInput').val('');
			}


}
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">1:1 실시간 문의</h4>
      </div>
      <div class="modal-body" id="messagebox" style="height:300px">
     
      </div>
      <div class="modal-footer">
      <input type="text" id="sendInput" class="form-control mb-10">
        <button type="button" class="btn btn-g" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-d" id="send" onclick="sendMessage();">send</button>
      </div>
    </div>
  </div>
</div>
    
    
    <!--  
    JavaScripts
    =============================================
    -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    
    <script src="/resources/assets/lib/jquery/dist/jquery.js"></script>
    <script src="/resources/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/resources/assets/lib/wow/dist/wow.js"></script>
    <script src="/resources/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="/resources/assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="/resources/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="/resources/assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="/resources/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="/resources/assets/lib/smoothscroll.js"></script>
    <script src="/resources/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="/resources/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="/resources/assets/js/plugins.js"></script>
    <script src="/resources/assets/js/main.js"></script>
  </body>
</html>