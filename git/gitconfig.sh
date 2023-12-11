#!/usr/bin/env sh

set -eux

git config --global credential.helper "store"
git config --global core.excludesfile "$HOME/.gitignore"
git config --global init.defaultBranch "main"
git config --global commit.gpgsign true
git config --global core.ignorecase false
git config --global rerere.enabled true
git config --global push.autoSetupRemote true
git config --global alias.rpo "remote prune origin"
git config --global alias.bd "branch -D"
git config --global alias.ba "branch -a"
git config --global alias.com '!git checkout "$(git symbolic-ref refs/remotes/origin/HEAD | sed s@^refs/remotes/origin/@@)"'
git config --global alias.cob "checkout -b"
git config --global alias.co "checkout"
git config --global alias.prdone \
	'!git checkout "$(git symbolic-ref refs/remotes/origin/HEAD | sed s@^refs/remotes/origin/@@)"; git pull;
		for branch in $(git remote prune origin | grep "\\[pruned\\]" | sed "s/.*origin\\///g");
			do git branch --format="%(refname:short)" | grep -w "${branch}" | xargs git branch -D;
		done;'
git config --global alias.hub \
    '!open "$(git ls-remote --get-url | sed "s|git@github.com:\(.*\)$|https://github.com/\1|" | sed "s|\.git$||")";'
