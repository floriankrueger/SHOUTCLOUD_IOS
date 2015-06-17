
# SHOUTCLOUD FOR IOS

A LIGHTWEIGHT, FEATURE-COMPLETE AND TESTED CLIENT FRAMEWORK FOR THE
[SHOUTCLOUD](http://shoutcloud.io) NANOSERVICE.

## INSTALLATION

AS FOR NOW, YOU CAN USE [CARTHAGE](https://github.com/Carthage/Carthage) TO INSTALL SHOUTCLOUD
USING A DEPENDENCY MANAGER OR DO IT MANUALLY.

### CARTHAGE

TO INTEGRATE SHOUTCLOUD INTO YOUR XCODE PROJECT USING CARTHAGE, SPECIFY IT IN YOUR `Cartfile`:

```ogdl
github "floriankrueger/SHOUTCLOUD_IOS"
```

## USAGE

STEP 0: IMPORT THE FRAMEWORK

```swift
import SHOUTCLOUD
```

STEP 1: SHOUT

```swift
let someString = "hello world"

let client = SHOUTCLOUD.Client.sharedClient
client.shout(someString,
  success: { message in
    // message == "HELLO WORLD"
  },
  failure: { error in
    // SOMETHING WENT WRONG
  }
)
```

STEP 2: PROFIT

```swift
// TODO: implement profit
```

## LICENSE

SHOUTCLOUD IS RELEASED UNDER THE [MIT LICENSE](LICENSE.md).
