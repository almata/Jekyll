---
layout: post
title:  "Manage various Python versions with Anaconda"
date:   2018-02-22
---
By default, on macOS Sierra (10.12.6) we have different versions of Python available:

```bash
$ ls -lha /System/Library/Frameworks/Python.framework/Versions
total 24
drwxr-xr-x   7 root  wheel   238B Nov  8  2016 .
drwxr-xr-x   6 root  wheel   204B Nov  8  2016 ..
lrwxr-xr-x   1 root  wheel     3B Nov  8  2016 2.3 -> 2.6
lrwxr-xr-x   1 root  wheel     3B Nov  8  2016 2.5 -> 2.6
drwxr-xr-x  11 root  wheel   374B Aug 13 08:57 2.6
drwxr-xr-x  11 root  wheel   374B Aug 13 08:57 2.7
lrwxr-xr-x   1 root  wheel     3B Nov  8  2016 Current -> 2.7
```

So if we navigate to one of those directories and run `python`, we will be using one of the versions that come with macOS:

```bash
$ cd /System/Library/Frameworks/Python.framework/Versions/2.7/bin
$ ./python
Python 2.7.10 (default, Feb  7 2017, 00:08:15) 
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.34)] on darwin
...
```

Exactly the same as if we run system's default `python`:

```bash
$ cd /usr/bin
$ ./python
Python 2.7.10 (default, Feb  7 2017, 00:08:15) 
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.34)] on darwin
```

## Anaconda

However, as `/Users/albertmata/anaconda/bin` preceeds `/usr/bin` in my `$PATH` environment variable, if I just run `python` I will not be using system's default version but the one managed by Anaconda:

```bash
$ python
Python 2.7.13 |Anaconda 4.4.0 (x86_64)| (default, Dec 20 2016, 23:05:08) 
[GCC 4.2.1 Compatible Apple LLVM 6.0 (clang-600.0.57)] on darwin
```

Same thing as if we navigate to where that binary actually is and run it directly:

```bash
$ cd /Users/albertmata/anaconda/bin
$ ./python
Python 2.7.13 |Anaconda 4.4.0 (x86_64)| (default, Dec 20 2016, 23:05:08) 
[GCC 4.2.1 Compatible Apple LLVM 6.0 (clang-600.0.57)] on darwin
```

## Anaconda environments

But we can create another Anaconda environment so we can use i.e. Python 3.6. If we name it `python36` we'll be able to use it this way:

```bash
$ cd /Users/albertmata/anaconda/envs/python36/bin
$ ./python
Python 3.6.2 |Continuum Analytics, Inc.| (default, Jul 20 2017, 13:14:59) 
[GCC 4.2.1 Compatible Apple LLVM 6.0 (clang-600.0.57)] on darwin
```

Although if we just want to use Python 3.6 by default, all we need to do is `source activate` that environment and the prompt will change to show we are using an Anaconda environment from now on (we can deactivate it with `source deactivate` if required):

```bash
$ source activate python36
(python36) $ 
```

It's easy to check that Python version in use varies depending on whether we are using an Anaconda environment or not:

```bash
$ python -V
Python 2.7.13 :: Anaconda 4.4.0 (x86_64)
$ which python
/Users/albertmata/anaconda/bin/python
```

-vs-

```bash
(python36) $ python -V
Python 3.6.2 :: Continuum Analytics, Inc.
(python36) $ which python
/Users/albertmata/anaconda/envs/python36/bin/python
```

This `source activate` mechanism works because `activate` (and also `deactivate`) is a binary located in `/Users/albertmata/anaconda/bin` -which is the first entry in my `$PATH` variable- and `source` is a Unix command that evaluates the file following the command -in this case a script- which `source` will run in a subshell instead of in the current context.

## Running scripts

With all this said, if we want to run a Python script i.e. `myscript.py` written in Python 3.6 we have different options to achieve the same result.

**Option 1:**

Hardcode the path to the `python` binary to be used at the beginning of `myscript.py`:

```python
#!/Users/albertmata/anaconda/envs/python36/bin/python
import ...
```

Provided our script has execution permission (`chmod +x myscript.py` otherwise) we can run it like this:

```bash
$ ./myscript.py
```

**Option 2:**

Forget about that shebang at the beginning of `myscript.py` and just activate the right environment and run the script using `python` as follows:

```bash
$ source activate python36
(python36) $ python myscript.py
```

**Option 3:**

Create a simple shell script i.e. `myscript.sh` to encapsulate those two commands: 

```bash
#!/bin/bash

# Use Python 3.6
source activate python36
# Run Python script
python myscript.py
```

And then just execute the shell script instead of the Python script:

```bash
$ ./myscript.sh 
```
