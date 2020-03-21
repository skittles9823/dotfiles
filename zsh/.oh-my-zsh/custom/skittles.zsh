SHELL=$(which zsh)
HOSTNAME=FedoraBox

alias neofetch='neofetch --config ~/neofetch.conf'

toaac(){
  find -name "*.$1" -exec ffmpeg -i {} -c:a aac -c:v copy -b:a "$2"k {}.m4a \;
  find -name "*.$1.m4a" -exec rename ".$1" "" {} \;
  find -name "*.$1" -exec rm -rf {} \;
}
