#!/bin/zsh

# Check if at least one argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 project_name"
    echo "Creates directory project_name w/ project_name.c and makefile in it"
    exit 1
fi

#create new directory, cd into it
mkdir $1
cd $1

#create an empty .c file from template
c_template="/~/Scripts/template.c"
cp $c_template ./$1.c

#create a makefile for it from template
mf_template="~/Scripts/makefile_template"
cp $mf_template ./makefile

#modify new makefile so it works with $1.c

makefile_path = "./makefile"

#change the name of the executable target to $1
sed -i "/^EXECUTABLE = / s/myprogram/$1/"

# Check if the Makefile exists
if [ -f "$makefile_path" ]; then
    # Use sed to replace the SOURCE line in the Makefile
    sed -i "s/SOURCE = .*/SOURCE = $1/" "$makefile_path"
    echo "Changed SOURCE to $1 in $makefile_path"
else
    echo "Makefile not found at $makefile_path"
fi
