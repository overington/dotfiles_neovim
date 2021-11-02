# My NeoVim confifuration files

Install instructions

1. clone this repo into your ~/.config/nvim/

```
git clone https://github.com/oh-/dotfiles_neovim ~/.config/nvim
```

2. Create a virtualenv for neovim, and install requirements:

```
cd ~/.config/nvim
python -m venv venv
source venv/bin/activate
pip install -U pip && pip install -r requirements.txt
deactivate
```
