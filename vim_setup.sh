mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#git clone --depth=1 https://github.com/josuegaleas/jay.git $HOME/.vim/bundle/jay/
cp -r ./lib/assets/jay_colorscheme $HOME/.vim/bundle/jay
cp ./vimrc $HOME/.vimrc
