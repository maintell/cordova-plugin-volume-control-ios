/********* VolumeControl.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#ifdef DEBUG
    #define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
    #define DLog(...)
#endif

@interface VolumeControl : CDVPlugin {
  // Member variables go here.
}

- (void)toggleMute:(CDVInvokedUrlCommand*)command;
- (void)isMuted:(CDVInvokedUrlCommand*)command;
- (void)setVolume:(CDVInvokedUrlCommand*)command;
- (void)setMediaVolume:(CDVInvokedUrlCommand*)command;
- (void)getVolume:(CDVInvokedUrlCommand*)command;

@end

@implementation VolumeControl

- (NSString*)decrypt:(NSString*)encryptedBase64String
{
    NSData *AVdecodedData = [[NSData alloc] initWithBase64EncodedString:encryptedBase64String options:0];
    return [[NSString alloc] initWithData:AVdecodedData encoding:NSUTF8StringEncoding];
}

- (void)toggleMute:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    BOOL result;

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isMuted:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    BOOL result;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setVolume:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    float volume = [[command argumentAtIndex:0] floatValue];
    NSString *soundCategory = ([self decrypt:(@"UmluZ3RvbmU=")]);
    Class systemClass = NSClassFromString([self decrypt:(@"QVZTeXN0ZW1Db250cm9sbGVy")]);
    id target = [systemClass performSelector:NSSelectorFromString([self decrypt:@"c2hhcmVkQVZTeXN0ZW1Db250cm9sbGVy"]) withObject:soundCategory];
    NSInvocation *volumeInvocation = [NSInvocation invocationWithMethodSignature:
                                      [systemClass instanceMethodSignatureForSelector:
                                      NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])]];
    [volumeInvocation setTarget:target];
    [volumeInvocation setSelector:NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])];
    [volumeInvocation setArgument:&volume atIndex:2];
    [volumeInvocation setArgument:&soundCategory atIndex:3];
    [volumeInvocation invoke];
    BOOL result;
    [volumeInvocation getReturnValue:&result];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)setMediaVolume:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
      float volume = [[command argumentAtIndex:0] floatValue];

      NSString *soundCategory = ([self decrypt:(@"QXVkaW8vVmlkZW8=")]);
      Class systemClass = NSClassFromString([self decrypt:(@"QVZTeXN0ZW1Db250cm9sbGVy")]);
    
      id target = [systemClass performSelector:NSSelectorFromString([self decrypt:@"c2hhcmVkQVZTeXN0ZW1Db250cm9sbGVy"]) withObject:soundCategory];

      NSInvocation *volumeInvocation = [NSInvocation invocationWithMethodSignature:
                                        [systemClass instanceMethodSignatureForSelector:
                                        NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])]];
      [volumeInvocation setTarget:target];
      [volumeInvocation setSelector:NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])];
      [volumeInvocation setArgument:&volume atIndex:2];
      [volumeInvocation setArgument:&soundCategory atIndex:3];
      [volumeInvocation invoke];
      BOOL result;
      [volumeInvocation getReturnValue:&result];

      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
      [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)getVolume:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;   

    AVAudioSession *audioSession = [AVAudioSession sharedInstance];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:audioSession.outputVolume];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
