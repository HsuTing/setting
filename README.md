# Setting
My setting of the terminal.

## Start

- You should install `git`, first.

  #### Ubuntu
  ```sh
  apt install -y git
  ```

  #### Mac OS X
  ```sh
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install git
  ```

- Then, you can install all settings.

  ```sh
  git clone https://github.com/HsuTing/setting.git ~/setting
  ~/setting/install.sh
  ```

## Environment

- Ubuntu 16.04 LTS
- Mac OS X 10.12

## List

#### upgrade
Use to upgrade package.

#### git
- Install `ghi`.
- Set `gitconfig`.

#### vim
- Install `vim` and `cmake`.
- Add `.vimrc`.
- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
  - Default: `Ctrl + G`.
- [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
  - The version of your `vim` is needed at least `7.4.0`.
- [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
- [tpope/vim-surround](https://github.com/tpope/vim-surround)
- [bronson/vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)
- [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align)
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [powerline/powerline](https://github.com/powerline/powerline)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)
- [mxw/vim-jsx](https://github.com/mxw/vim-jsx)
- [elzr/vim-json](https://github.com/elzr/vim-json)
- [ramitos/jsctags](https://github.com/ramitos/jsctags)
- [maksimr/vim-jsbeautify](https://github.com/maksimr/vim-jsbeautify)
- [flazz/vim-colorschemes](https://github.com/flazz/vim-colorschemes)

#### nodejs
- Install `npm`, `yarn` and `watchman`.
- Install packages:
 - yo
 - create-react-native-app
 - react-vr-cli
 - nsp
 - commitizen
 - cz-conventional-changelog
 - conventional-changelog
 - generator-cat
 - git-open
 - git+ssh://git@github.com:HsuTing/cat-bin.git

#### bash
- Add `work`, `server` and `env` folder.
- New commands:
  - `count`: count the code line of the project.
  - `cdwork`: command about work folder.
  - `cdloacl`: command about local folder which is used to build local server.
  - `run-server`: command about server folder whose files are used to run `ssh`. 
  - `run-env`: command about env folder whose files are used to set `env`.
  - `docker-editor`: help to use `docker`.
  - `setting`: command about this project.
  - `check`: check project.
  - `make-log`: make CHANGELOG.md.
  - `note`: add notes.

#### python
- Install `python`, `python3`, `pip`, `virtualenv`, and `glances`.

#### docker
- Install `docker`.

#### mac
- Install `tree`.
- Copy `.tern-project` to `web server`.

#### linux
- Install `apache2` and `tree`.
- Change owner of `/var/www/html` to user.
- Copy `.tern-project` to `apache server`.

## Problem

- If `vim-airline` has font problem, you need to set the powerline font of the terminal.
