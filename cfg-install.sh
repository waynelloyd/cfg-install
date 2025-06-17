git clone --bare git@github.com:waynelloyd/cfg.git $HOME/.cfg
function cfg {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .cfg-bak
cfg checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    cfg checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .cfg-bak/{}
fi;
cfg checkout
cfg config status.showUntrackedFiles no
