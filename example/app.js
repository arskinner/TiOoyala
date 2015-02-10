// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});

// Create test view
var ooyala = require('com.ooyala');

var player = ooyala.createView({
	//apiKey: 'kwcGEyOheRtMQWquoNZE8oDyGUM7',
	//playerDomain: 'http://www.ooyala.com/',
	//embedCode: 'RhdTQ5czo4prj0Fje_pmNf2-UWK9QGbj',
	top: 0,
	left: 0,
	right: 0,
	height: 220
});

var play = Ti.UI.createButton({
    bottom: 20,
    title: 'Start Video'
});

play.addEventListener('click', function() {
	player.setEmbedCode('RhdTQ5czo4prj0Fje_pmNf2-UWK9QGbj');
});

win.add(player);
win.add(play);

win.open();