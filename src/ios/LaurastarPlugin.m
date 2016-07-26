#import "LaurastarPlugin.h"
#import <Cordova/CDV.h>

@implementation LaurastarPlugin

- (void) say:(CDVInvokedUrlCommand*)command
{

    // get arguments from Javascript
    //id arg = [command.arguments objectAtIndex:0];
    BOOL arg = YES;
    
    CDVPluginResult* pluginResult;
 
    if (arg)
    {
        UIAlertView *toast = [
        [UIAlertView alloc] initWithTitle:@""
            message:@"Hey !"
            delegate:nil
            cancelButtonTitle:nil
            otherButtonTitles:nil, nil];
        [toast show];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), 
        dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });

        // Success Callback
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Hello from Laurastar Plugin!"];
        // deprecated 
        // [self writeJavascript:[result toSuccessCallbackString:command.callbackId]];
        // [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    else
    {
        // Error Callback
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        // deprecated 
        // [self writeJavascript:[result toErrorCallbackString:command.callbackId]];
        // [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end

