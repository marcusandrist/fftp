mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#git clone --depth=1 https://github.com/josuegaleas/jay.git $HOME/.vim/bundle/jay/
git clone -b release https://github.com/neoclide/coc.nvim $HOME/.vim/bundle/coc.nvim
cp -r ./lib/assets/jay_colorscheme $HOME/.vim/bundle/jay
cp ./vimrc $HOME/.vimrc
