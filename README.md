# lego native migration guide

## Android
### 1. download store_metadata
[download](https://github.com/melodysdreamj/lego/files/15383095/store_metadata.zip) and unzip 
the file to the root of the project.

### 2. create `key.properties` file in the root of the android project and add the following code
```properties
storePassword=legoflutter
keyPassword=legoflutter
keyAlias=key
storeFile=../../store_metadata/android/key.jks
```

### 3. find `android {` in `android/app/src/build.gradle` and add the following code
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}
```

### 4. find ` minSdk = flutter.minSdkVersion` in `android/app/build.gradle` and add the following code
```gradle
minSdk = 24
```

### 5. find `buildType {` block in `android/app/build.gradle` and add the following code
```gradle
signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile file(keystoreProperties['storeFile'])
            storePassword keystoreProperties['storePassword']
        }
    }

buildTypes {
    release {
        // TODO: Add your own signing config for the release build.
        // Signing with the debug keys for now, so `flutter run --release` works.
        // signingConfig signingConfigs.debug
        signingConfig signingConfigs.release
    }
}
```

### 6. find `MainActivity` activity in `android/app/src/main/AndroidManifest.xml` and add the following options
```xml
android:showWhenLocked="true"
android:turnScreenOn="true"
```

### 7. same file, replace the following code 
```
`android:launchMode="singleTop"` to `android:launchMode="singleInstance"`
```

### 8. add the following option in application tag in `android/app/src/main/AndroidManifest.xml`
```xml
android:fullBackupContent="false"
android:allowBackup="false"
android:requestLegacyExternalStorage="true"
```

### 9. add the following code in `android/app/src/main/AndroidManifest.xml` before the application tag
```xml
    <uses-feature
        android:name="android.hardware.camera"
        android:required="false" />
    <uses-permission android:name="android.permission.INTERNET" />

    <!-- Permissions options for the `contacts` group -->
    <!--    <uses-permission android:name="android.permission.READ_CONTACTS" />-->
    <!--    <uses-permission android:name="android.permission.WRITE_CONTACTS" />-->
    <!--    <uses-permission android:name="android.permission.GET_ACCOUNTS" />-->

    <!-- Permissions options for the `storage` group -->
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />

    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />
    <uses-permission android:name="android.permission.READ_MEDIA_VIDEO" />
    <uses-permission android:name="android.permission.READ_MEDIA_AUDIO" />

    <!-- Permissions options for the `camera` group -->
    <!--    <uses-permission android:name="android.permission.CAMERA" />-->

    <!-- Permissions options for the `sms` group -->
    <!--    <uses-permission android:name="android.permission.SEND_SMS"/>-->
    <!--    <uses-permission android:name="android.permission.RECEIVE_SMS"/>-->
    <!--    <uses-permission android:name="android.permission.READ_SMS"/>-->
    <!--    <uses-permission android:name="android.permission.RECEIVE_WAP_PUSH"/>-->
    <!--    <uses-permission android:name="android.permission.RECEIVE_MMS"/>-->

    <!-- Permissions options for the `phone` group -->
    <!--    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>-->
    <!--    <uses-permission android:name="android.permission.CALL_PHONE"/>-->
    <!--    <uses-permission android:name="android.permission.ADD_VOICEMAIL"/>-->
    <!--    <uses-permission android:name="android.permission.USE_SIP"/>-->
    <!--    <uses-permission android:name="android.permission.READ_CALL_LOG"/>-->
    <!--    <uses-permission android:name="android.permission.WRITE_CALL_LOG"/>-->
    <!--    <uses-permission android:name="android.permission.BIND_CALL_REDIRECTION_SERVICE"/>-->

    <!-- Permissions options for the `calendar` group -->
    <uses-permission android:name="android.permission.READ_CALENDAR" />
    <uses-permission android:name="android.permission.WRITE_CALENDAR" />

    <!-- Permissions options for the `location` group -->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <!--    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />-->

    <!-- Permissions options for the `microphone` or `speech` group -->
    <!--    <uses-permission android:name="android.permission.RECORD_AUDIO" />-->

    <!-- Permissions options for the `sensors` group -->
    <uses-permission android:name="android.permission.BODY_SENSORS" />

    <!-- Permissions options for the `accessMediaLocation` group -->
    <uses-permission android:name="android.permission.ACCESS_MEDIA_LOCATION" />

    <!-- Permissions options for the `activityRecognition` group -->
    <uses-permission android:name="android.permission.ACTIVITY_RECOGNITION" />

    <!-- Permissions options for the `ignoreBatteryOptimizations` group -->
    <uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS" />

    <!-- Permissions options for the `bluetooth` group -->
    <uses-permission android:name="android.permission.BLUETOOTH" />
    <uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />

    <!-- Permissions options for the `manage external storage` group -->
    <!--    <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />-->

    <!-- Permissions options for the `system alert windows` group -->
    <uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />

    <!-- Permissions options for the `request install packages` group -->
    <!--    <uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />-->

    <!-- Permissions options for the `access notification policy` group -->
    <uses-permission android:name="android.permission.ACCESS_NOTIFICATION_POLICY" />

    <uses-permission android:name="com.google.android.gms.permission.AD_ID" />

    <uses-permission android:name="android.permission.WAKE_LOCK" />
```

## Ios
1. find `platform :ios,` in `ios/Podfile` and add the following code
```ruby
platform :ios, '17.0'
```
2. open xcode and go to project - info tab and change iOS Deployment Target to 17.0 and Target - General Minimum Deployments to 17.0
3. go to terminal and run the following command
```shell
pod install
```
4. close xcode and open the project again
5. go to info.plist and add the following options inside <dict> tag
```xml
<key>UIBackgroundModes</key>
<array>
<string>fetch</string>
    <string>processing</string>
</array>
<!-- Permission options for the `location` group -->
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>Location is required to find out where you are</string>
    <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
    <string>Location is required to find out where you are in Background.</string>
    <key>NSLocationUsageDescription</key>
    <string>Location is required to find out where you are</string>
    <key>NSLocationAlwaysUsageDescription</key>
    <string>Location is required to find out where you are in Background.</string>

    <!-- Permission options for the `mediaLibrary` group -->
    <key>NSAppleMusicUsageDescription</key>
    <string>Music!</string>
    <key>kTCCServiceMediaLibrary</key>
    <string>media</string>

    <!-- Permission options for the `calendar` group -->
    <key>NSCalendarsUsageDescription</key>
    <string>Calendars</string>

    <!-- Permission options for the `camera` group -->
    <key>NSCameraUsageDescription</key>
    <string>camera</string>

    <!-- Permission options for the `contacts` group -->
    <key>NSContactsUsageDescription</key>
    <string>Contact permission is required to provide information of friends registered in the contact list based on the phone number.</string>

    <!-- Permission options for the `microphone` group -->
    <key>NSMicrophoneUsageDescription</key>
    <string>microphone</string>

    <!-- Permission options for the `speech` group -->
    <key>NSSpeechRecognitionUsageDescription</key>
    <string>speech</string>

    <!-- Permission options for the `sensors` group -->
    <key>NSMotionUsageDescription</key>
    <string>motion</string>

    <!-- Permission options for the `photos` group -->
    <key>NSPhotoLibraryUsageDescription</key>
    <string>photos</string>

    <!-- Permission options for the `reminder` group -->
    <key>NSRemindersUsageDescription</key>
    <string>reminders</string>

    <!-- Permission options for the `bluetooth` -->
    <key>NSBluetoothAlwaysUsageDescription</key>
    <string>bluetooth</string>
    <key>NSBluetoothPeripheralUsageDescription</key>
    <string>bluetooth</string>

    <!-- Permission options for the `appTrackingTransparency` -->
    <key>NSUserTrackingUsageDescription</key>
    <string>This identifier will be used to deliver personalized ads to you.</string>
    <key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~1458002511</string>
<key>SKAdNetworkItems</key>
  <array>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>cstr6suwn9.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>4fzdc2evr5.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>2fnua5tdw4.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>ydx93a7ass.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>5a6flpkh64.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>p78axxw29g.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>v72qych5uu.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>c6k4g5qg8m.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>s39g8k73mm.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>3qy4746246.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>3sh42y64q3.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>f38h382jlk.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>hs6bdukanm.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>prcb7njmu6.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>v4nxqhlyqp.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>wzmmz9fp6w.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>yclnxrl5pm.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>t38b2kh725.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>7ug5zh24hu.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>9rd848q2bz.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>n6fk4nfna4.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>kbd757ywx3.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>9t245vhmpl.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>4468km3ulz.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>2u9pt9hc89.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>8s468mfl3y.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>av6w8kgt66.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>klf5c3l5u5.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>ppxm28t8ap.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>424m5254lk.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>uw77j35x4d.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>578prtvx9j.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>4dzt52r2t5.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>e5fvkxwrpn.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>8c4e2ghe7u.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>zq492l623r.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>3qcr597p9d.skadnetwork</string>
    </dict>
  </array>
  <key>LSApplicationQueriesSchemes</key>
<array>
  <string>https</string>
  <string>http</string>
</array>
<key>BGTaskSchedulerPermittedIdentifiers</key>
    <array>
        <string>com.transistorsoft.customtask</string>
        <string>com.transistorsoft.fetch</string>
    </array>
    <key>ITSAppUsesNonExemptEncryption</key>
    <false/>
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>googlegmail</string>
    <string>x-dispatch</string>
    <string>readdle-spark</string>
    <string>airmail</string>
    <string>ms-outlook</string>
    <string>ymail</string>
    <string>fastmail</string>
    <string>superhuman</string>
    <string>protonmail</string>
</array>
```
6. go to Podfile and add the following code
```ruby
# Uncomment this line to define a global platform for your project
platform :ios, '17.0'

# CocoaPods analytics sends network stats synchronously affecting flutter build latency.
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

project 'Runner', {
  'Debug' => :debug,
  'Profile' => :release,
  'Release' => :release,
}

def flutter_root
  generated_xcode_build_settings_path = File.expand_path(File.join('..', 'Flutter', 'Generated.xcconfig'), __FILE__)
  unless File.exist?(generated_xcode_build_settings_path)
    raise "#{generated_xcode_build_settings_path} must exist. If you're running pod install manually, make sure flutter pub get is executed first"
  end

  File.foreach(generated_xcode_build_settings_path) do |line|
    matches = line.match(/FLUTTER_ROOT\=(.*)/)
    return matches[1].strip if matches
  end
  raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}. Try deleting Generated.xcconfig, then run flutter pub get"
end

require File.expand_path(File.join('packages', 'flutter_tools', 'bin', 'podhelper'), flutter_root)

flutter_ios_podfile_setup

target 'Runner' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
  target 'RunnerTests' do
    inherit! :search_paths
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)

    target.build_configurations.each do |config|

          if config.base_configuration_reference.is_a? Xcodeproj::Project::Object::PBXFileReference
            xcconfig_path = config.base_configuration_reference.real_path
            IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
          end

          # ... # Here are some configurations automatically generated by flutter
          config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'NO'
          # m1 맥일경우 다음추가(폐쇄)
          # config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
          # config.build_settings["EXCLUDED_ARCHS[sdk=*]"] = "armv7" # 구글 ML 킷 을 위해서 사용
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'

          # You can enable the permissions needed here. For example to enable camera
          # permission, just remove the `#` character in front so it looks like this:
          #
          # ## dart: PermissionGroup.camera
          # 'PERMISSION_CAMERA=1'
          #
          # Preprocessor definitions can be found in: <https://github.com/Baseflow/flutter-permission-handler/blob/master/permission_handler/ios/Classes/PermissionHandlerEnums.h>
          config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
            '$(inherited)',

            ## dart: PermissionGroup.calendar
            # 'PERMISSION_EVENTS=1',

            ## dart: PermissionGroup.reminders
            # 'PERMISSION_REMINDERS=1',

            ## dart: PermissionGroup.contacts
            # 'PERMISSION_CONTACTS=1',

            ## dart: PermissionGroup.camera
            # 'PERMISSION_CAMERA=1',

            ## dart: PermissionGroup.microphone
            # 'PERMISSION_MICROPHONE=1',

            ## dart: PermissionGroup.speech
            # 'PERMISSION_SPEECH_RECOGNIZER=1',

            ## dart: PermissionGroup.photos
            'PERMISSION_PHOTOS=1',

            ## dart: [PermissionGroup.location, PermissionGroup.locationAlways, PermissionGroup.locationWhenInUse]
            # 'PERMISSION_LOCATION=1',

            ## dart: PermissionGroup.notification
            'PERMISSION_NOTIFICATIONS=1',

            ## dart: PermissionGroup.mediaLibrary
            # 'PERMISSION_MEDIA_LIBRARY=1',

            ## dart: PermissionGroup.sensors
            # 'PERMISSION_SENSORS=1',

            ## dart: PermissionGroup.bluetooth
            # 'PERMISSION_BLUETOOTH=1',

            ## dart: PermissionGroup.appTrackingTransparency
            'PERMISSION_APP_TRACKING_TRANSPARENCY=1',

            ## dart: PermissionGroup.criticalAlerts
            # 'PERMISSION_CRITICAL_ALERTS=1'
          ]
        end
  end
end

```
7. open terminal and run the following command
```shell
flutter clean && flutter pub get && pod install
```
