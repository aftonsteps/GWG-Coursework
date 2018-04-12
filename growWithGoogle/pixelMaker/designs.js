// Select color input
// Select size input

// When size is submitted by the user, call makeGrid()
function makeGrid() {
	// $("#pixelCanvas").append($("<tbody><tr><td></td></tr></tbody>"));
	//var gridWidth = $("#sizePicker").val;
	$("#pixelCanvas").children().remove();
	var gridWidth = $("#inputWeight").val();
	var gridHeight = $("#inputHeight").val();
	// var rowElements = "";
	var rowVal = 0;
	var idVal = 0;
	for (rIndex=0; rIndex<gridWidth; rIndex++){
		$("#pixelCanvas").append("<tr id=row" + rowVal +"></tr>");
		var rowElements = "";
		for (cIndex=0; cIndex < gridHeight; cIndex++){
			rowElements = rowElements + "<td id=cell" + idVal + " bgcolor=#ffffff style='width:40px; height:40px;'><img " + "id=parrotImg" + idVal + "/></td>";
			idVal ++;
		}
		$("#row"+rowVal).append(rowElements);
		rowVal ++;
	}
		//$("#pixelCanvas").append("<div class=tableRow><tr></tr></div>");
	
}

$("#sizePicker").submit(function( event ){
	makeGrid();
	event.preventDefault();
})

$("#partyMode").click(function( event ){
	if ($("#partyMode").text() == "Leave Party Mode"){
		window.alert("You can't leave party mode!!")
	}
	$(".parrot").attr("src", "http://cultofthepartyparrot.com/parrots/hd/parrot.gif");
	$("#labTitle").text("Parrot pARTy Maker");
	$("#partyMode").html("Leave Party Mode");
	$("body").attr("font-family", "Comic Sans MS");
	$("body").css("color", "#ffffff");
	$("body").attr("bgcolor", "#000000");
})


var color = $("#colorPicker").val();

$( "#pixelCanvas" ).click(function( event ) {
	var clickedCell = event.target.id;
	var colorPicked = $("#colorPicker").val();
	$("#" + clickedCell).attr("bgcolor", colorPicked);
	if ($("#partyMode").text() === "Leave Party Mode"){
		$("#" + clickedCell).append("<img src='http://cultofthepartyparrot.com/parrots/hd/parrot.gif' width=30px height=30px/>");
	} else {
		$("#" + clickedCell).attr("bgcolor", colorPicked);
	}
});

$("#colorPicker").on("change", function( event ){
	var color = $("#colorPicker").val();
})