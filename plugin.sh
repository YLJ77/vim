#!/bin/bash
config="$(pwd)/.vimrc"
cat $config > ~/.vimrc

if [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 0 ];then
    sudo apt install curl -y
fi
if [ $(dpkg-query -W -f='${Status}' vim-gtk 2>/dev/null | grep -c "ok installed")  -eq 0 ];then
    sudo apt-get install vim-gtk -y
fi

vimDir="$(pwd)/test"

if [[ !(-e $vimDir) ]]; then
    mkdir -v $vimDir
fi

if [[ !(-e $vimDir/autoload) ]];then
    mkdir -v $vimDir/autoload
fi

if [[ !(-e $vimDir/autoload/pathogen.vim) ]];then
    curl -LSso  $vimDir/autoload/pathogen.vim https://tpo.pe/pathogen.vim 
fi

if [[ !(-e $vimDir/bundle) ]];then
    mkdir -v $vimDir/bundle
fi

#添加插件
pluginHub="$(pwd)/plugin-hub"
currentPath=$(pwd)
cd "$vimDir/bundle"
if [[ -r $pluginHub ]];then
    for i in $(strings $pluginHub);do
        IFS="|" read dir address <<< $i
        if [[ !(-e "$vimDir/bundle/$dir") ]];then
            git clone $address
        fi
    done;
fi
cd $currentPath
