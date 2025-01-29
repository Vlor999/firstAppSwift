#! /bin/sh

creat_dir(){
    if [ ! -d "$1" ]
    then
        mkdir "$1"
        echo "$1 created"
    else
        echo "$1 already exists"
    fi
}

creat_dir log
creat_dir bin
