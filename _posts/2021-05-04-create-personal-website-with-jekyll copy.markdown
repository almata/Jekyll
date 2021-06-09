---
layout: post
title:  "Create script that can be run from Finder"
date:   2021-05-04
---
1. Create a new file with *.command* extension.

2. Make it executable:

    ```bash
    $ chmod +x myscript.command
    ```

3. Open the file with any text editor, add all necessary commands, and save it:

    ```bash
    export PATH="..."
    rvm use ruby-2.6.0
    cd ~/Developer/some-project
    ...
    ```

Then we can double click on this file in Finder. A new Terminal window will open and the script will run in it.
