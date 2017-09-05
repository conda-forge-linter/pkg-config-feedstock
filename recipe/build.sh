#!/bin/sh

./configure --prefix=${PREFIX}    \
            --host=${HOST}        \
            --with-internal-glib

make -j${CPU_COUNT} ${VERBOSE_AT}
make install

# conda customization for CDT packages, emitted for other OSes too incase of cross-compilation
mv ${PREFIX}/bin/pkg-config ${PREFIX}/bin/pkg-config.bin
cp "${RECIPE_DIR}"/pkg-config ${PREFIX}/bin
chmod +x ${PREFIX}/bin/pkg-config
