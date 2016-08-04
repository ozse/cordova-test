#import <Cordova/CDVPlugin.h>
#import <Cordova/CDV.h>

@interface LaurastarPlugin : CDVPlugin

- (void) iron_disconnect:(CDVInvokedUrlCommand*)command;
- (void) iron_connect:(CDVInvokedUrlCommand*)command;
- (void) iron_isConnected:(CDVInvokedUrlCommand*)command;

@end