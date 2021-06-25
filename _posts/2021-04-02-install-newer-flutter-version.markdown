---
layout: post
title:  "Install newer Flutter version"
date:   2021-04-02
---
This is what I currently have on my computer. I don't want to change this setup, as I'm teaching a class on Flutter and we are using this version:

```bash
$ which flutter; flutter --version
/Applications/Flutter/bin/flutter
Flutter 1.22.6 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 9b2d32b605 (2 months ago) • 2021-01-22 14:36:39 -0800
Engine • revision 2f0af37152
Tools • Dart 2.10.5
```

But I also want to install Flutter 2 to start using it in new projects. So these are the steps I've followed:

1. Download *flutter_macos_2.0.4-stable.zip* file and uncompress it into *Flutter2* directory. 

2. Do not update environment variables in *~/.bash_profile*, so that default Flutter version remains 1.22.6.

3. When I want to use Flutter 2, I open a new Terminal window and run this:

    ```bash
    $ export PATH="/Applications/Flutter2/bin:$PATH"
    $ which flutter dart; flutter --version
    /Applications/Flutter2/bin/flutter  # bin directory must be the same
    /Applications/Flutter2/bin/dart     # bin directory must be the same
    Flutter 2.0.4 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision b1395592de (32 hours ago) • 2021-04-01 14:25:01 -0700
    Engine • revision 2dce47073a
    Tools • Dart 2.12.2    
    ```
