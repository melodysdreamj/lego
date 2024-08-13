# Environment

## Android Studio

You can find detailed installation instructions [here](https://developer.android.com/studio).

After installation android Studio, add the following emulator. At this time, set it to cold start, allocate more than 4GB of RAM, and provide ample storage space of more than 10GB.

* DeviceManager → Create Device → New Hardware Profile
  1. Samsung Galaxy S10 → `3040 x 1440`
  2. nexus\_9 → `2048 x 1536`
  3. Nexus\_5X → `1920 x 1080`



## Xcode

You can find detailed installation instructions [here](https://developer.apple.com/xcode/).

After installation, add the following simulator.

1. xcode → Help → Device and Simulator
   1. iPhone 8 Plus → os version → Download more simulator runtime.. → ios 16 download
   2. iPhone 15 Pro Max
   3. iPad Pro (12.9-inch) (6th generation)



## java

To obtain the SHA1/SHA256 values, you must first have Java installed.

1. Download and install the Java machine from the following [link](https://www.oracle.com/java/technologies/downloads/#jdk17-mac) on Oracle's website.



## other

Open the terminal and enter the following.

1. To authorize a test drive later, proceed with the following installation.

```bash
arch -arm64 brew tap wix/brew
arch -arm64 brew install applesimutils
```



2. For asset generation, enter the following:

```bash
arch -arm64 brew install FlutterGen/tap/fluttergen
dart pub global activate flutter_gen
```
