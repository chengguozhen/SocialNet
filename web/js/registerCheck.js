/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function(){
	$("#passwd1").blur(function(){
		if($(this).val() !== $("#passwd").val()){
			alert("Password is inconsistent!");
		}
	});	
});

$(function() {
    $( "#datepicker" ).datepicker();
});        
    
$(function() {
    $('.btn-group').button();
});
    


