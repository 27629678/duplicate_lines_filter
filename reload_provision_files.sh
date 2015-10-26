#! /bin/bash

pro_file_path=$(pwd)+/../imail/tools/provision/provision/

echo 'start remove all old provision files in path:' "~/Library/MobileDevice/Provisioning\ Profiles/*"
cd ~/Library/MobileDevice/Provisioning\ Profiles/
echo "current directory:"
target_path=$(pwd)
echo $target_path
rm -rf ./*
echo 'has deleted all old provision files.'

cd ~/projects/imail/tools/provision/provision

open $(pwd)/*
cd ~/Library/MobileDevice/Provisioning\ Profiles/
open .
