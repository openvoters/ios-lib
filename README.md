OpenVoters - iOS library
===========

An iOS tool that will make you connect to an OpenVoters-powered server.

Please refer to http://www.openvoters.org for more detailed information.


Installation
------------

The tool requires you to use [CocoaPods][cocoapods]. To install it just add this line to your project's `Podspec` file:

```ruby
pod 'iOpenVoters'
```

Usage
-----

The tool must be configured when your application launches (eg. at the beginning of the `applicationDidFinishLaunching:` method in the app delegate) by setting the base URL where your OpenVoters-powered server resides:

```objc

#import "OVConfiguration.h"

...

[OVConfiguration sharedInstance].baseURL = [NSURL URLFromString:@"http://openvoters.myprivateserver.com/api/"];

```

[cocoapods]: http://cocoapods.org/