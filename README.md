# base_project

# code push

# shorebird

A new Flutter project with feature codepush.

Run the following command to generate code and necessary resources:

- Run to generated code with build_runner and freezed, autoroute You setup build environment for the
  first time. You modified any code with the annotation `@freezed`.

```
dart run build_runner build --delete-conflicting-outputs
```

- Run to generate file path image, svg,...

```
fluttergen -c pubspec.yaml
```

***** Steps to configure Shorebird for Flutter *****

```
1. flutter pub get shorebird_code_push
2. Install Shorebird CLI
    With MacOS/Linux, open Terminal: 
        curl --proto '=https' --tlsv1.2 https://raw.githubusercontent.com/shorebirdtech/install/main/install.sh -sSf | bash
    With Windows, open PowerShell:
        Set-ExecutionPolicy RemoteSigned -scope CurrentUser # Needed to execute remote scripts iwr -UseBasicParsing 'https://raw.githubusercontent.com/shorebirdtech/install/main/install.ps1'|iex
3. In Terminal of Flutter project:
    shorebird login (login with account shorebird)
    shorebird init
    shorebird release android
    shorebird release ios-alpha
```

- After create release, to preview new release, run command:

```
shorebird preview
```

- Run to publish new patch for android

```
shorebird patch android
```

- Run to publish new patch for ios

```
shorebird patch ios-alpha
```
