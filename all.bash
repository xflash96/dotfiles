git clone https://github.com/xflash96/dotfiles

cp dotfiles/vimrc ~/.vimrc
cp dotfiles/bash_profile ~/.bash_profile
cp dotfiles/inputrc ~/.inputrc
cp dotfiles/gdbinit ~/.gdbinit
cp dotfiles/gitconfig ~/.gitconfig
cp dotfiles/tmux.conf ~/.tmux.conf
# exit 1

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

# vim
mkdir -p ~/.vim/undo
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# pbcopy
mkdir ~/bin
curl -o ~/bin/pbcopy https://raw.githubusercontent.com/skaji/remote-pbcopy-iterm2/master/pbcopy
chmod +x ~/bin/pbcopy
