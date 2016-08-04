/*
var LaurastarPlugin = function() { console.log('Plugin Laurastar started!')};

LaurastarPlugin.prototype.say = function(success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","say", []);
};

var laurastarPlugin = new LaurastarPlugin();
module.exports = laurastarPlugin;
*/

"use strict";

module.exports = {
  iron_disconnect: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_disconnect", []);
  },
  iron_connect: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_connect", []);
  },
  iron_isConnected: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_isConnected", []);
  }
};
