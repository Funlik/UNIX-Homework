#!/bin/bash
case "$1" in
  "add")
    sh $(dirname "$0")/add.sh ${@:2}
    ;;
  "checkout")
    sh $(dirname "$0")/checkout.sh ${@:2}
    ;;
  "commit")
    sh $(dirname "$0")/commit.sh ${@:2}
    ;;
  "diff")
    sh $(dirname "$0")/diff.sh ${@:2}
    ;;
  "init")
    sh $(dirname "$0")/init.sh ${@:2}
    ;;
  "push")
    sh $(dirname "$0")/push.sh ${@:2}
    ;;
  "status")
    sh $(dirname "$0")/status.sh ${@:2}
    ;;
  
  *)
    echo "Commands available: add checkout commit diff init push status"
    exit 1
    ;;
esac