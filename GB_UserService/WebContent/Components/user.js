$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
{
$("#alertSuccess").hide();
}
$("#alertError").hide();



});

//SAVE ============================================

$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	var type = ($("#hidUserIDSave").val() == "") ? "POST" : "PUT";
	$.ajax({
		url : "UserAPI",
		type : type,
		data : $("#formItem").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onItemSaveComplete(response.responseText, status);
		}
	});
});

function onItemSaveComplete(response, status) {
	if (status == "success") {
		window.location.reload();
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);

		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}

	$("#hidUserIDSave").val("");
	$("#formItem")[0].reset();
}

//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) {

	$("#hidUserIDSave").val($(this).data("itemid"));

	$("#fname").val($(this).closest("tr").find('td:eq(0)').text());
	$("#lname").val($(this).closest("tr").find('td:eq(1)').text());
	$("#nic").val($(this).closest("tr").find('td:eq(2)').text());
	$("#addr").val($(this).closest("tr").find('td:eq(3)').text());
	$("#pno").val($(this).closest("tr").find('td:eq(4)').text());
	$("#email").val($(this).closest("tr").find('td:eq(5)').text());
	$("#uname").val($(this).closest("tr").find('td:eq(6)').text());
	$("#pwd").val($(this).closest("tr").find('td:eq(7)').text());
	$("#type").val($(this).closest("tr").find('td:eq(8)').text());

});

//delete====================================================
$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "UserAPI",
		type : "DELETE",
		data : "U_id=" + $(this).data("itemid"),
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});

function onItemDeleteComplete(response, status) {
	if (status == "success") {
		window.location.reload();
		//window.location.reload();
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}
//CLIENT-MODEL================================================================
function validateItemForm() {
	if ($("#fname").val().trim() == "") {
		return "Insert Firstname.";
	}

	if ($("#lname").val().trim() == "") {
		return "Insert Lastname.";
	}

	if ($("#nic").val().trim() == "") {
		return "Insert NIC.";
	}

	var regex3="^[0-9]{9}[vVxX]$";

	if (!$("#nic").val().match(regex3)) {
		return "Invalid NIC.";
	}
	
	if ($("#addr").val().trim() == "") {
		return "Insert Address.";
	}

	if ($("#pno").val().trim() == "") {
		return "Insert Phone No.";
	}
	
/*	var regp ="^[0-9]{10}$";

	if (!$("#pno").val().match(regex3)) {
		return "Invalid Phone No.";
	}*/
	var tmpPrice = $("#pno").val().trim();
	if (!$.isNumeric(tmpPrice)) {
		return "Insert a numerical value for Phone no.";
	}
	if ($("#email").val().trim() == "") {
		return "Insert Email.";
	}

	if ($("#uname").val().trim() == "") {
		return "Insert Username.";
	}

	if ($("#pwd").val().trim() == "") {
		return "Insert Password.";
	}
	if ($("#pwd").val().length < 6) {
		return "Invalid Password.";
	}

	if ($("#type").val().trim() == "") {
		return "Insert User Type.";
	}




	return true;
}
