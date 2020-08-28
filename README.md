# [Cordova Volume Control for ios]
This plugin provides a simple way to interact with the volume of your `UIWebView`.

* This plugin uses private `AVSystemController.h` APIs and can't be used for AppStore apps.

* This plugin is built for `cordova@^3.6`.

* This plugin currently supports Android and iOS.


## Plugin setup

Using this plugin requires [Cordova iOS](https://github.com/apache/cordova-ios) and [Cordova Android](https://github.com/apache/cordova-android).

1. `cordova plugin add https://github.com/maintell/cordova-plugin-volume-control-ios`--save


## Javascript interface

    // After device ready, create a local alias
    var VolumeControl = cordova.plugins.VolumeControl;

    VolumeControl.getVolume(console.log.bind(console));
    VolumeControl.toggleMute();
    VolumeControl.isMuted(console.log.bind(console));
    VolumeControl.setVolume(1.0); //Float between 0.0 and 1.0
    VolumeControl.setMediaVolume(1.0); //Float between 0.0 and 1.0

* Check [source](https://github.com/maintell/cordova-plugin-volume-control-ios/tree/master/www/VolumeControl.js) for additional configuration.

