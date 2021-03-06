#!/usr/bin/env bash
set -euf -o pipefail

# install packages
npm i -g bash-language-server dockerfile-language-server-nodejs

python3 -m pip install -U pipx

for package in poetry pipenv mypy flake8 pep8 black bandit pylint python-language-server isort; do python3 -m pipx install ${package}; done

python3 -m pipx inject pylint pylint_venv

# Install extensions
mkdir -p ~/.config/nvim/
ln -sf $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json

mkdir -p ~/.config/coc/extensions
pushd ~/.config/coc/extensions > /dev/null

if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi

npm install \
    coc-tsserver \
    coc-highlight \
    coc-prettier \
    coc-lists \
    coc-html \
    coc-yaml \
    coc-json \
    coc-rls \
    coc-elixir \
    coc-pyright \
    coc-css \
    coc-eslint \
    coc-xml \
    coc-pairs \
    --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

popd > /dev/null
