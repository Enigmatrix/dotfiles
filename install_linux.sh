curl https://foosoft.net/projects/homemaker/dl/homemaker_linux_amd64.tar.gz --output /tmp/homemaker.tar.gz
tar -xzf /tmp/homemaker.tar.gz -C /tmp
git clone https://github.com/Enigmatrix/dotfiles.git ~/.dotfiles
sudo cp /tmp/homemaker_linux_amd64/homemaker /bin/homemaker
homemaker --verbose --task=$TARGET ~/.dotfiles/homemaker.toml ~/.dotfiles

