curl https://foosoft.net/projects/homemaker/dl/homemaker_linux_amd64.tar.gz --output /tmp/homemaker.tar.gz
tar -xzf /tmp/homemaker.tar.gz -C /tmp
sudo cp /tmp/homemaker_linux_amd64/homemaker /bin/homemaker
git clone https://github.com/Enigmatrix/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && git checkout stow && cd ..
$(homemaker --verbose --task=linux_ns ~/.dotfiles/homemaker.toml ~/.dotfiles)

