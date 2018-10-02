#!/bin/sh

ARGS=$1

if [ $# -lt 1 ]; then
    ARGS="help"
fi

BASEPATH=$(cd `dirname $0`; pwd)

case $ARGS in
    prepare)
        cd ..; git submodule update --init --recursive
        ;;
    all)
	    cd $BASEPATH;  cmake ..;  make -j `grep processor /proc/cpuinfo | wc -l`
        ;;
    cleanall)
        cd $BASEPATH; make clean; ls | grep -v build.sh | grep -v README.md | xargs rm -rf
        ;;
    install)
        cd $BASEPATH; make install
        ;;
    help|*)
        echo "Usage:"
        echo "$0 help:     view help info."
        echo "$0 all:      build all target"
        echo "$0 install:  install framework"
        echo "$0 cleanall: remove all temp file"
        ;;
esac


