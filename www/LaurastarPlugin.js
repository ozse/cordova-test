var LaurastarPlugin = function() { console.log('Plugin Laurastar started!')};

LaurastarPlugin.prototype.say = function(success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","say", []);
};

var laurastarPlugin = new LaurastarPlugin();
module.exports = laurastarPlugin;