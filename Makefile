
install: vundle
	cp -r bin        $(HOME)/bin
	cp    profile    $(HOME)/.profile
	cp    bashrc     $(HOME)/.bashrc
	cp    aliases    $(HOME)/.aliases
	cp    gitconfig  $(HOME)/.gitconfig
	cp    gitignore  $(HOME)/.gitignore
	cp    screenrc   $(HOME)/.screenrc
	cp    vimrc      $(HOME)/.vimrc
	vim +BundleInstall +qall

.PHONY: vundle
vundle:
	if [ ! -d $(HOME)/.vim/bundle ]; then mkdir -r "$(HOME)/.vim/bundle"; git clone https://github.com/gmarik/vundle.git $(HOME)/.vim/bundle/vundle; fi;
