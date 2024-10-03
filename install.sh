# Move current vimrc
if find $HOME/.vim &> /dev/null; then
    echo "Moved old \".vim\" to \".vimm\"..."
    mv $HOME/.vim $HOME/.vimm
        
    if find $HOME/.vimrc &> /dev/null; then
        mv $HOME/.vimrc $HOME/.vimmrc
    fi
else
    echo "Creating \".vim\""
fi

# Clone/copy dependencies
mkdir $HOME/.vim
cp ./lib/vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
cp ./lib/runtime/pathogen.vim $HOME/.vim/autoload/pathogen.vim
cp -r ./lib/coc $HOME/.vim/bundle/coc
cp -r ./lib/colorscheme $HOME/.vim/bundle/jay

# Install bash-fftp
if grep -q "fftp" "$HOME/.bashrc"; then
    echo "Found existing bash-fftp..."
else
    echo "Installing bash-fftp..."
    echo ". $HOME/.fftp/lib/ff.sh" >> $HOME/.bashrc
fi
