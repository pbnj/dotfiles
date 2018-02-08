#!/usr/bin/env fish

mkdir -p ~/.config/fish/completions/

# kubectl fish completions
git clone https://github.com/evanlucas/fish-kubectl-completions ~/.config/fish/fish-kubectl-completions/

cp ~/.config/fish/fish-kubectl-completions/kubectl.fish ~/.config/fish/completions/kubectl.fish

rm -rf fish-kubectl-completions
