# git clone https://github.com/neovim/neovim && cd neovim
# git branch -a
# git checkout release-0.10 # 2025-01-06 的最新 release 是 2025

sudo apt install cmake
sudo apt install gettext

cd neovim

make CMAKE_BUILD_TYPE=Release -j16
sudo make install

mkdir ~/.config
mkdir ~/.config/nvim

cp -r * ~/.config/nvim
