# Makefile

# Variables
GITUP             = automation.sh

# Install list
INSTALL_DOTFILES  = dotfilesLink.sh
INSTALL_COMMANDS  = install_commands.sh 
INSTALL_POWERLINE = install_powerline.sh
INSTALL_PACMAN    = install_pacmanimproved.sh
INSTALL_VIMPLUG   = install_vimplug.sh
INSTALL_CHEATSHEET= cheasheat.sh

# Commands

git:
	bash $(GITUP)

initial:
	bash $(INSTALL_DOTFILES)
	bash $(INSTALL_COMMANDS)
	bash $(INSTALL_POWERLINE)
	bash $(INSTALL_PACMAN)
	bash $(INSTALL_VIMPLUG)
	bash $(INSTALL_CHEATSHEET)
