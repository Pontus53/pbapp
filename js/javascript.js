$(document).ready(function() {
	status_check();
});

function diablo() {
	$.get("http://94.254.5.171:2345/play");
	status_check();
}

function skola() {
	$.get("http://94.254.5.171:2345/pause");
	status_check();
}

function shut_down() {
	$.get("http://94.254.5.171:2345/shutdown");
	setTimeout(status_check(), 3000);
}

function status_check() {
	//Check if server is online
	$.get("http://94.254.5.171:2345", function(){
		$('#status_text').html("Online");
		$('#status_text').css("color", "green");
	})
	.fail(function(){
		$('#status_text').html("Offline");
		$('#status_text').css("color", "red");
	});
}