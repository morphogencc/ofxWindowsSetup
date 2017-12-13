# Windows Setup Script

## Requirements
* Windows 8 or newer (doesn't work in Windows 7 :( )

### Usage
Create the desired settings in `scripts/settings/config.ps1`.

Run either `./setup_development.ps1` for a develpoment computer (lots of software useful for writing, compiling, and testing code) or `./setup_production.ps1` for a production computer (much more minimal).

## OLD README (not useful anymore)

### Computer Configuration
In the `scripts` folder, there are a variety of scripts that can be used to change your computer settings.  Ones I recommend using:

* `disable_edge_ui.ps1` to disable Windows 8/10 Edge UI features.
* `disable_firewall.ps1` to disable the default Windows Firewall.
* `disable_screensaver.ps1` does the obvious.
* `disable_windows_update.ps1` disables prompts to update Windows.
* `enable_autologin.ps1` enables automatic login if `config.ps1` contains the proper username / password combination.
* `set_ip.ps1` configures the IP based off of settings in `config.ps1`.
* `set_power_settings.ps1` loads a power settings configuration file I exported that disables all power saving features.
* `set_scheduled_reboot.ps1` configures the computer for a daily reboot at a specific time, defined in `config.ps1`.

There are also a few other utilites that are less useful, but may be useful in certain situations regardless.

## Executable Maintenance
I also wrote a few utilities that are meant to make maintaining installations a bit easier.  The main one that's useful is `publish_release.ps1` and `download_release.ps1`.  These require cURL, which is included in both of the computer setup builds above.

You can use these scripts by placing the entirety of the `scripts/` folder in your project's root directory.

NOTE: you'll want to check `config.ps1` to make sure it has the right paths before running this.

### Publishing a Release
Running `publish_release.ps1` from the powershell will:

* Grab the executable from your root directory,
* Place it in your `bin/` folder, and archive it into a dated folder (with a copy of your `CHANGELOG.md`, if you have one),
* Creates a `.tar.gz` archive and sends it to Bitbucket's Download page.

### Downloading a Release
Running `download_release.ps1` from the powershell will:

* Download a folder named with today's date from Bitbucket's Download page (optionally, you can provide a name for the file).
* Unzip the tar archive,
* Place the dated archive folder in your `bin/` folder,
* Copy the executable to your `bin/` folder,
* And create a shortcut for it, and place that shortcut in your startup folder.

This is designed to make the process of adding a new version of software to a project much less painful.

### Publishing / Downloading other files
You can also publish / download other files using Bitbucket's Download page by calling the scripts `publish_to_bitbucket.ps1` and `download_from_bitbucket.ps1` with a specific file as an argument.