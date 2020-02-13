#!/usr/bin/env bash
set -euf -o pipefail

# install packages
npm i -g bash-language-server dockerfile-language-server-nodejs
python3 -m pip install python-language-server bandit pylint isort black

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
    coc-python \
    coc-word \
    coc-css \
    coc-eslint \
    coc-xml \
    coc-pairs \
    --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

popd > /dev/null
