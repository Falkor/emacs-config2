---------------

**`/!\ IMPORTANT`: This repository holds OBSOLETE configuration which are kept for archiving purposes!**

**If you are interested in my [LATEST](https://github.com/Falkor/spacemacs-config) up-to-date Emacs configuration, kindly refer to the following repository:**

<p align="center">
<b><a href="https://github.com/Falkor/spacemacs-config"><code>Falkor/spacemacs-config</code></a></b>
</p>

---- 

` README.md `
Copyright (c) 2014 [Sebastien Varrette](mailto:<Sebastien.Varrette@uni.lu>) [www](http://varrette.gforge.uni.lu)

        Time-stamp: <Lun 2014-11-10 13:24 svarrette>
                        _____     _ _              _
                       |  ___|_ _| | | _____  _ __( )___
                       | |_ / _` | | |/ / _ \| '__|// __|
                       |  _| (_| | |   < (_) | |    \__ \
                       |_|  \__,_|_|_|\_\___/|_|    |___/
         _____                             ____             __ _
        | ____|_ __ ___   __ _  ___ ___   / ___|___  _ __  / _(_) __ _
        |  _| | '_ ` _ \ / _` |/ __/ __| | |   / _ \| '_ \| |_| |/ _` |
        | |___| | | | | | (_| | (__\__ \ | |__| (_) | | | |  _| | (_| |
        |_____|_| |_| |_|\__,_|\___|___/  \____\___/|_| |_|_| |_|\__, |
                                                                 |___/

-------------------
# emacs-config2

## Synopsis

This repository host my new personal emacs configuration.


## Local repository setup

This repository is hosted on out [Github]().
Once cloned, initiate the potential git submodules etc. by running:

    $> cd emacs-config2
    $> make setup
    
## Quick Start

* install Emacs (instructions: [Mac OS](http://www.emacswiki.org/emacs/EmacsForMacOS))
  * On mac, use [Homebrew](http://brew.sh/)
  
        $> brew install --cocoa --srgb emacs
        $> brew linkapps
            
    The next step is probably to setup a new alias `emacs` to open the Cocoa version (by default it runs with the `-nw` option), typically as:
    
        alias emacs='/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs'
                
            

## Pre-requisites

### Git

You should become familiar (if not yet) with [Git](http://git-scm.com/).
Consider these resources:

* [Git book](http://book.git-scm.com/index.html)
* [Github:help](http://help.github.com/mac-set-up-git/)
* [Git reference](http://gitref.org/)

At least, you shall configure the following exported variables within your favorite shell (adapt accordingly):

    # Bash configuration
    # Set your git user info
    export GIT_AUTHOR_NAME='<firstname> <name>'
    export GIT_AUTHOR_EMAIL='<email>'
    export GIT_COMMITTER_NAME="${GIT_AUTHOR_NAME}"
    export GIT_COMMITTER_EMAIL="${GIT_AUTHOR_EMAIL}"

You can also use the following commands:

    $> git config --global user.name "Your Name Comes Here"
    $> git config --global user.email you@yourdomain.example.com
    # configure colors
    $> git config --global color.diff auto
    $> git config --global color.status auto
    $> git config --global color.branch auto

### git-flow

The Git branching model for this repository follows the guidelines of
[gitflow](http://nvie.com/posts/a-successful-git-branching-model/).
In particular, the central repository holds two main branches with an infinite lifetime:

* `  production`: the *production-ready* branch
* `devel`: the main branch where the latest developments interviene. This is
  the *default* branch you get when you clone the repo

# Advanced information

## Releasing mechanism

The operation consisting of releasing a new version of this repository is automated by a set of tasks within the `Makefile`.

In this context, a version number have the following format:

      <major>.<minor>.<patch>-b<build>

where:

* `< major >` corresponds to the major version number
* `< minor >` corresponds to the minor version number
* `< patch >` corresponds to the patching version number
* `< build >` states the build number _i.e._ the total number of commits within the `devel` branch.

Example: `1.0.0-b28`

The current version number is stored in the file `VERSION`. __/!\  NEVER MAKE ANY MANUAL CHANGES TO THIS FILE__

For more information on the version, run:

     $> make versioninfo

If a new  version number such be bumped, you simply have to run:

      $> make start_bump_{major,minor,patch}

This will start the release process for you using `git-flow`.
Probably after that, the first things to do is to change within the main LaTeX document the version number and commit this change.
Then, to make the release effective, just run:

      $> make release

it will finish the release using `git-flow`, create the appropriate tag in the `  production` branch and merge all things the way they should be.

