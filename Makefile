# Makefile

# PATH List
INSTALLER_PATH = $(PWD)/installer

# Variables
GITUP             = $(INSTALLER_PATH)/automation.sh

# Install list
INSTALL_DOTFILES  = $(INSTALLER_PATH)/dotfilesLink.sh
INSTALL_COMMANDS  = $(INSTALLER_PATH)/install_commands.sh 
INSTALL_POWERLINE = $(INSTALLER_PATH)/install_powerline.sh
INSTALL_PACMAN    = $(INSTALLER_PATH)/install_pacmanimproved.sh
INSTALL_VIMPLUG   = $(INSTALLER_PATH)/install_vimplug.sh
INSTALL_CHEATSHEET= $(INSTALLER_PATH)/cheasheat.sh

# Commands

github:
	bash $(GITUP)

# Initial install
install:
	bash $(INSTALL_DOTFILES) -r 
	bash $(INSTALL_COMMANDS)
	bash $(INSTALL_POWERLINE)
	bash $(INSTALL_PACMAN)
	bash $(INSTALL_VIMPLUG)
	bash $(INSTALL_CHEATSHEET)

update:
	bash $(INSTALL_DOTFILES) -r
