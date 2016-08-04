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
  iron_pluginAvailable: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_pluginAvailable", []);
  },
  iron_disconnect: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_disconnect", []);
  },
  iron_connect: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_connect", []);
  },
  iron_isConnected: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_isConnected", []);
  },
  iron_refreshMachine: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_refreshMachine", []);
  },
  iron_refreshCounters: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_refreshCounters", []);
  },
  iron_refreshMachineStates: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_refreshMachineStates", []);
  },
  iron_incrementFanLevel: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_incrementFanLevel", []);
  },
  iron_changeSteamState: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_changeSteamState", []);
  },
  iron_resetFilter: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_resetFilter", []);
  },
  iron_resetCover: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_resetCover", []);
  },
  iron_resetRinse: function (success, fail) {
    cordova.exec(success, fail, "LaurastarPlugin","iron_resetRinse", []);
  }
};
