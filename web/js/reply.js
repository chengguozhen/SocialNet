/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function sendReq(id1, id2) {
    $.ajax({
     url : "sendRequest.jsp",
     type : "post",
     data : {"id1":id1, "id2":id2}
    })
    .done(function(){
        window.location.reload();
    })
    .fail(function() { 
        alert('Server Error!'); 
    });
}

function cancelReq(id1, id2) {
    $.ajax({
     url : "cancelRequest.jsp",
     type : "post",
     data : {"id1":id1, "id2":id2}
    })
    .done(function(){
        window.location.reload();
    })
    .fail(function() { 
        alert('Server Error!'); 
    });
}

function check() {
    $.ajax({
        url : "checkNewMessage.jsp",
        type : "get"        
    }).done(function(e) {
//        alert("content: "+e+"end length: "+e.trim().length);        
        if(e.trim() == "ok") {
//            alert("ok");
//            window.location.reload();
            $("#new_message")[0].innerHTML = '<a onclick="window.location.reload();" href="javascript:void(0)">You have new messages.</a>';
        }
        else {
//            alert("no new message");
            $("#new_message")[0].innerHTML = '';
        }
    }).fail(function(){
        alert('Server Error!');
    });
}

function joinGroup(userID, groupID) {
    $.ajax({
            url : "joinGroup.jsp",
            type : "post",
            data : {"userID":userID, "groupID":groupID}
        })
       .done(function() {
           window.location.reload(); 
       })
       .fail(function() {
           alert('Server Error!');
       });
}

function createGroup() {
    var name = $('#createGroup').val();
    $.ajax({
        url : "createGroup.jsp",
        type : "post",
        data : {"groupName" : name}
    }).done(function() { 
        window.location.reload();
    }).fail(function() {
        alert("Server Error!");
    });
}

function register() {
    window.location = "register.jsp";
}

function setTextArea(replyUserName, messageID) {
    $("#"+messageID).val("to " + replyUserName + ": ");        
    var t=$("#"+messageID).val();
    $("#"+messageID).val("").focus().val(t);
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
                strInput=encodeURI(strInput);		
		xmlhttp.open("GET",strInput,true);
		xmlhttp.send();		
	} // end if clause
} // end function submitMessage
