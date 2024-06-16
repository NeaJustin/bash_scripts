#!/bin/bash
#removing files script

#tree
arrDir=(~/Documents/testing-directory/*/)
# read -p "please specify the file path: " -r d1;
# arrDir=$(dirname $d1);
printf "this is the arrDir path: ${arrDir}\n";

find_file() {
    read -p "please enter a file name: " file_input;
    printf "this is the file: ${file_input}\n";
    # read -p "please specify the file path: " d1;
    # arrDir=$(dirname "${d1}");
    # printf "this is the arrDir path: ${arrDir}\n";
    cd "$arrDir";
    for ((i=0; i < ${#arrDir[@]}; ++i)); do
        printf "${arrDir[i]}";
        cd "${arrDir[i]}";
        tree;
        if [[ -f ${file_input} ]]; then
            printf "file does exist\n";
            ls -la | grep ${file_input};
            rm -f ${file_input};
            printf "${file_input} has been removed\n";
            ls -l;
            printf "\n";
        else
            printf "file does not exist\n";
        fi

    done
}

find_file;

