
install: vundle
	cp -Tr bin                      $(HOME)/bin
	ln -sf settings/core/profile    $(HOME)/.profile
	ln -sf settings/core/bashrc     $(HOME)/.bashrc
	ln -sf settings/core/aliases    $(HOME)/.aliases
	ln -sf settings/core/gitconfig  $(HOME)/.gitconfig
	ln -sf settings/core/gitignore  $(HOME)/.gitignore
	ln -sf settings/core/screenrc   $(HOME)/.screenrc
	ln -sf settings/core/vimrc      $(HOME)/.vimrc
	ln -sf settings/core/dircolors  $(HOME)/.dircolors
	vim +BundleClean +BundleInstall +qall

.PHONY: vundle
vundle:
	if [ ! -d $(HOME)/.vim/bundle ]; then mkdir -p "$(HOME)/.vim/bundle"; git clone https://github.com/gmarik/vundle.git $(HOME)/.vim/bundle/vundle; fi;
