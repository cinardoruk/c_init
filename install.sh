#!/bin/zsh
:<<COMMENT
install c_init.sh, template.c, and makefile_template to a desired dir
TODO
* task
COMMENT

#CHANGE THIS
#e.g. use a dir you use to store scripts that's included in your path
install_dir=~/Scripts/

cp -f c_init.sh template.c makefile_template "$install_dir"

chmod u+x "$install_dir"/c_init.sh
