#import <Cordova/CDVPlugin.h>
#import <Cordova/CDV.h>

@interface LaurastarPlugin : CDVPlugin

- (void) iron_pluginAvailable:(CDVInvokedUrlCommand*)command;

- (void) iron_disconnect:(CDVInvokedUrlCommand*)command;
- (void) iron_connect:(CDVInvokedUrlCommand*)command;

- (void) iron_isConnected:(CDVInvokedUrlCommand*)command;

- (void) iron_refreshMachine:(CDVInvokedUrlCommand*)command;
- (void) iron_refreshCounters:(CDVInvokedUrlCommand*)command;
- (void) iron_refreshMachineStates:(CDVInvokedUrlCommand*)command;

- (void) iron_incrementFanLevel:(CDVInvokedUrlCommand*)command;
- (void) iron_changeSteamState:(CDVInvokedUrlCommand*)command;
- (void) iron_resetFilter:(CDVInvokedUrlCommand*)command;
- (void) iron_resetCover:(CDVInvokedUrlCommand*)command;
- (void) iron_resetRinse:(CDVInvokedUrlCommand*)command;


@end