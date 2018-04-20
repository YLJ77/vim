#!/bin/bash
config="$(pwd)/.vimrc"
secret='debugger;'
cat $config > ~/.vimrc

package=(curl vim-gtk)
for k in ${package[@]};do
    if [ $(dpkg-query -W -f='${Status}' $k 2>/dev/null | grep -c "ok installed") -eq 0 ];then
        echo $secret | sudo -S apt install $k -y
    fi
done;

vimDir=~/.vim

#添加文件夹依赖
dir=($vimDir "$vimDir/autoload" "$vimDir/bundle")
for j in ${dir[@]};do
    if [[ !(-e $j) ]]; then
        mkdir -v $j
    fi
done;

if [[ !(-e $vimDir/autoload/pathogen.vim) ]];then
    curl -LSso  $vimDir/autoload/pathogen.vim https://tpo.pe/pathogen.vim 
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
            if [[ $dir == syntastic ]];then
                echo $secret | sudo -S npm install -g jshint
                echo $secret | sudo -S npm install -g csslint
            fi
        fi
    done;
fi
cd $currentPath
