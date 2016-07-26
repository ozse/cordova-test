var LaurastarPlugin = function() {};

LaurastarPlugin.prototype.say = function(success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","say", []);
};

var laurastarPlugin = new LaurastarPlugin();
module.exports = laurastarPlugin;