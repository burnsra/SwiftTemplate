# SwiftTemplate

## Overview

**SwiftTemplate** is a MacOS application written in Swift.  This template application provides the following features:

- Status menu
- About window
- Preferences window
- Launcher Application to autostart the application on login (Preference)

## Screenshots

Status Menu

<img style="max-width:100%;" src="./assets/status_menu.png" />

About Window

<img style="max-width:75%;" src="./assets/about_window.png" />

Preferences Window

<img style="max-width:75%;" src="./assets/preferences_window.png" />

## Customizing

Replace the instance of "NewSwiftProject" in the first command below with your desired project name.

```sh
$ export newProjectName="NewSwiftProject"
$ git clone https://github.com/burnsra/SwiftTemplate.git "$newProjectName"
$ cd "$newProjectName"
$ git mv SwiftTemplate "$newProjectName"
$ git mv SwiftTemplateLauncher "$newProjectName"Launcher
$ git mv SwiftTemplate.xcodeproj "$newProjectName".xcodeproj
$ find README.md "$newProjectName" "$newProjectName"Launcher "$newProjectName".xcodeproj -path '*Assets.xcassets*' -prune -o -type f -print0 | xargs -0 sed -i '' 's/SwiftTemplate/$newProjectName/g'
$ git add -A
$ git commit -m "Renamed template project to "$newProjectName
```

## Contributions

Do you want to improve the app or add any useful features? Please go ahead and create pull requests. I'm thankful for any help.

## License

[MIT](https://github.com/burnsra/SwiftTemplate/blob/master/LICENSE) © Robert Burns
