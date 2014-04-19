/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function setTextArea(replyUserName, messageID) {
    document.getElementById(messageID).textContent = "Reply to " + replyUserName + ":";
    document.getElementById(messageID).focus();    
}

// handle event of submitting reply messages
function submitReply(messageID) {
    	var statementDoc=document.getElementById(messageID);
	var strInput = statementDoc.value;	
	var xmlhttp=null;
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else{
		// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlhttp!==null){
		xmlhttp.onreadystatechange=function(){
                     if (xmlhttp.readyState===4 && xmlhttp.status===200){					
			window.location.reload();
                     }
                };
		strInput="submitReply.jsp?words="+strInput+"&messageID="+messageID;
		strInput=encodeURI(strInput);		
		xmlhttp.open("GET",strInput,true);
		xmlhttp.send();		
	} // end if clause
} // end function submitReply

// handle event of publishing message
function submitMessage() {
    	var statementDoc=document.getElementById('message');
	var strInput = statementDoc.value;	
	var xmlhttp=null;
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else{
		// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlhttp!==null){
		xmlhttp.onreadystatechange=function(){
                     if (xmlhttp.readyState===4 && xmlhttp.status===200){					
			window.location.reload();
                     }
                };
		strInput="submitMessage.jsp?words="+strInput;
		strInput=encodeURI(strInput);		
		xmlhttp.open("GET",strInput,true);
		xmlhttp.send();		
	} // end if clause
} // end function submitMessage
