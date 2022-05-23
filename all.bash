git clone https://github.com/xflash96/dotfiles

cp dotfiles/vimrc ~/.vimrc
cp dotfiles/bash_profile ~/.bash_profile
cp dotfiles/inputrc ~/.inputrc
cp dotfiles/gdbinit ~/.gdbinit
cp dotfiles/gitconfig ~/.gitconfig
cp dotfiles/tmux.conf ~/.tmux.conf
cp dotfiles/arc-completion.bash ~/.arc-completion.bash
# exit 1

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# vim
mkdir -p ~/.vim/undo
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# it2copy
mkdir ~/bin
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

# font
curl -O https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf

# apple
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write -g ApplePressAndHoldEnabled -bool false

# nvim
mkdir -p ~/.config/nvim
ln -s "$PWD/nvim/init.vim" ~/.config/nvim/init.vim
ln -s nvim ~/.nvim
ln -s nvimrc ~/.nvimrc
