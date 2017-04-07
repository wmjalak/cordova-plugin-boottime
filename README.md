# cordova-plugin-boottime

Plugin provides a steady, monotonic elapsed time (in milliseconds) since the system was booted - including time spent in sleep.
Plugin is for general purpose interval timing, such as creating synchronized clock with server's clock.

## Installation

This requires cordova 5.0+

```xml		
	cordova plugin add cordova-plugin-boottime
```

## Supported Platforms

  - Android
  - iOS

## Usage

```javascript
bootTime.get(
    function(result) {  // Success callback
        console.log('Milliseconds from boot: ' + result);
    },
    function(error) {  // Error callback
        console.log(error);
    }
);
```

## Release notes

Apr 7, 2017
Initial release
