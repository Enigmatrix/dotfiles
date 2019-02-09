curl https://foosoft.net/projects/homemaker/dl/homemaker_linux_amd64.tar.gz /tmp/homemaker.tar.gz
tar -xzf /tmp/homemaker.tar.gz -C /tmp
git clone https://github.com/Enigmatrix/dotfiles.git ~/.dotfiles
/tmp/homemaker -task $TARGET ~/.dotfiles/homemaker.toml ~/.dotfiles

