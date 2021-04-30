#!/bin/bash

python -m pip install --no-deps --ignore-installed .

mkdir -p $PREFIX/share/$PKG_NAME-$PKG_VERSION/
cp -r models/ $PREFIX/share/$PKG_NAME-$PKG_VERSION/
cp -r tools/ $PREFIX/share/$PKG_NAME-$PKG_VERSION/

# add de/activation scripts to set the DEEPSIG_ROOT env var
for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done
