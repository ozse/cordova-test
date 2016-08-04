
#import "ApplicationController.h"

#import "LaurastarPlugin.h"
#import <Cordova/CDV.h>

@implementation LaurastarPlugin


#pragma mark - METHODS -
- (CDVPluginResult *) disconnect
{
    CDVPluginResult* pluginResult;

    BOOL ironDisconnect = [[[ApplicationController sharedApplication] getIronObject] disconnect];

    if (ironDisconnect)
    {
        NSMutableDictionary *returnDic = [[NSMutableDictionary alloc] init];
        [returnDic setObject:[NSNumber numberWithBool:ironDisconnect] forKey:@"value"];
        [returnDic setObject:@"Iron is connected" forKey:@"message"];
        [returnDic setObject:[NSNumber numberWithInt:0] forKey:@"errorCode"];
        [returnDic setObject:@"" forKey:@"errorDescription"];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:returnDic];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    return pluginResult;
}
- (CDVPluginResult *) isConnected
{
    CDVPluginResult* pluginResult;

    BOOL ironIsConnected = [[[ApplicationController sharedApplication] getIronObject] isIronConnected];

    NSMutableDictionary *returnDic = [[NSMutableDictionary alloc] init];
    [returnDic setObject:[NSNumber numberWithBool:ironIsConnected] forKey:@"value"];
    [returnDic setObject:@"Iron is connected" forKey:@"message"];
    [returnDic setObject:[NSNumber numberWithInt:0] forKey:@"errorCode"];
    [returnDic setObject:@"" forKey:@"errorDescription"];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:returnDic];

    return pluginResult;
}



#pragma mark - INTERFACE -
#pragma mark DISCONNECT
- (void) iron_disconnect:(CDVInvokedUrlCommand*)command
{
    // Check command.arguments here.

    // get arguments from Javascript
    //id arg = [command.arguments objectAtIndex:0];
    BOOL arg = YES;

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult;
        if (arg)
        {
            pluginResult = [self disconnect];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
        else
        {
            // Error Callback
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }

    }];
}
#pragma mark CONNECT
- (void) iron_connect:(CDVInvokedUrlCommand*)command
{
    // Check command.arguments here.

    // get arguments from Javascript
    //id arg = [command.arguments objectAtIndex:0];
    BOOL arg = YES;

    [self.commandDelegate runInBackground:^{

        CDVPluginResult* pluginResult;


        if (arg)
        {
            // Success Callback
            // pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Hello from Laurastar Plugin!"];
            // deprecated
            // [self writeJavascript:[result toSuccessCallbackString:command.callbackId]];
            // [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"PLUGIN_SAY" object:nil];
            });


        }
        else
        {
            // Error Callback
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            // deprecated
            // [self writeJavascript:[result toErrorCallbackString:command.callbackId]];
            // [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }

        [[NSNotificationCenter defaultCenter] addObserverForName:@"PLUGIN_CONNECT" object:nil queue:nil usingBlock:^(NSNotification *notif) {
            if ([[notif name] isEqualToString:@"PLUGIN_CONNECT"])
            {
                CDVPluginResult* pluginResult;

                BOOL resetRinse   = [[[ApplicationController sharedApplication] getIronObject] resetLastTimeRinse];

                int timeWorking = [[[ApplicationController sharedApplication] getIronObject] getMachineWorkingTime];
                int timeFilter  = [[[ApplicationController sharedApplication] getIronObject] getLastTimeFilterChanged];
                int timeCover   = [[[ApplicationController sharedApplication] getIronObject] getLastTimeProtectiveCoverChanged];
                int timeRinse   = [[[ApplicationController sharedApplication] getIronObject] getLastTimeRinse];



                NSString *returnData = [NSString stringWithFormat:@"Success, working: %d, filter: %d, cover: %d, rinse: %d", timeWorking, timeFilter, timeCover, timeRinse];

                NSMutableDictionary *returnDic = [[NSMutableDictionary alloc] init];
                [returnDic setObject:returnData forKey:@"message"];
                [returnDic setObject:[NSNumber numberWithInt:0] forKey:@"errorCode"];
                [returnDic setObject:@"" forKey:@"errorDescription"];

                //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Connexion succeeded !"];
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:returnDic];

                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];

        //[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

    }];
}

#pragma mark IS CONNECTED
- (void) iron_isConnected:(CDVInvokedUrlCommand*)command
{
    // Check command.arguments here.

    // get arguments from Javascript
    //id arg = [command.arguments objectAtIndex:0];
    BOOL arg = YES;

    [self.commandDelegate runInBackground:^{

        CDVPluginResult* pluginResult;

        if (arg)
        {
             pluginResult = [self isConnected];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
        else
        {
            // Error Callback
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    }];

}

@end

