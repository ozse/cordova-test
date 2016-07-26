#import "LaurastarPlugin.h"

@implementation LaurastarPlugin

- (void) say:(CDVInvokedUrlCommand*)command
{

    // get arguments from Javascript
    //id arg = [command.arguments objectAtIndex:0];
    BOOL arg = YES;
    
    CDVPluginResult* result;
 
    if (arg)
    {
        // Success Callback
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Hello from Laurastar Plugin!"];
        [self writeJavascript:[result toSuccessCallbackString:command.callbackId]];
    }
    else
    {
        // Error Callback
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self writeJavascript:[result toErrorCallbackString:command.callbackId]];
    }

}

@end

