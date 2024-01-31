#!/bin/zsh

# Check if at least one argument is provided

if [ $# -ne 1 ]; then
    echo "Usage: $0 project_name"
    echo "Creates directory project_name w/ project_name.c and makefile in it"
    exit 1
fi

#create new directory for the project
mkdir $1

#extract the dirpath where c_init.sh is, so we can find c_template and mf_template
script_dir="$(dirname "$0")"

#create an empty .c file from template
c_template="./template.c"

c_new="./$1/$1.c"
cp $script_dir/$c_template $c_new

#create a makefile for it from template
mf_template="./makefile_template"
mf_new="./$1/makefile"
cp $script_dir/$mf_template $mf_new

#modify new makefile so it works with $1.c

# Check if the Makefile exists
if [ -f "$mf_new" ]; then
    # Use sed to replace the SOURCE line in the Makefile
    sed -i "s/SOURCE = .*/SOURCE = $1.c/" $mf_new
    sed -i "s/EXECUTABLE = .*/EXECUTABLE = $1/" $mf_new

else
    echo "Makefile not found at $mf_new"
fi
