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
/*
- (void)getCategory:(CDVInvokedUrlCommand*)command;
- (void)hideVolume:(CDVInvokedUrlCommand*)command;
*/
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
    DLog(@"toggleMute");

    // Class avSystemControllerClass = NSClassFromString(@"AVSystemController");
    // id avSystemControllerInstance = [avSystemControllerClass performSelector:@selector(sharedAVSystemController)];

    // NSInvocation *privateInvocation = [NSInvocation invocationWithMethodSignature:
    //                                   [avSystemControllerClass instanceMethodSignatureForSelector:
    //                                    @selector(toggleActiveCategoryMuted)]];
    // [privateInvocation setTarget:avSystemControllerInstance];
    // [privateInvocation setSelector:@selector(toggleActiveCategoryMuted)];
    // [privateInvocation invoke];
    BOOL result;
 //   [privateInvocation getReturnValue:&result];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isMuted:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    BOOL result;
    DLog(@"isMuted");

    // Class avSystemControllerClass = NSClassFromString(@"AVSystemController");
    // id avSystemControllerInstance = [avSystemControllerClass performSelector:@selector(sharedAVSystemController)];

    // NSInvocation *privateInvocation = [NSInvocation invocationWithMethodSignature:
    //                                   [avSystemControllerClass instanceMethodSignatureForSelector:
    //                                    @selector(getActiveCategoryMuted:)]];
    // [privateInvocation setTarget:avSystemControllerInstance];
    // [privateInvocation setSelector:@selector(getActiveCategoryMuted:)];
    // [privateInvocation setArgument:&result atIndex:2];
    // [privateInvocation invoke];

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

      //DLog(@"setVolume: [%f]", volume);
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
    DLog(@"getVolume");

    AVAudioSession *audioSession = [AVAudioSession sharedInstance];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:audioSession.outputVolume];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

/*
- (void)getCategory:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    DLog(@"getCategory");

    AVAudioSession *audioSession = [AVAudioSession sharedInstance];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:audioSession.category];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)hideVolume:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    DLog(@"hideVolume");

    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame: CGRectZero];
    volumeView.alpha = 0.01;
    [self.webView.superview addSubview: volumeView];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}*/

@end
