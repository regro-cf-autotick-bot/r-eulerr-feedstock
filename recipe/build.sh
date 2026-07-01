#!/bin/bash
export DISABLE_AUTOBREW=1
# shellcheck disable=SC2086
${R} CMD INSTALL --build . ${R_ARGS}

# Bundle third party licenses from statically linked crates
pushd src/rust
cargo-bundle-licenses --format yaml --output "${SRC_DIR}/THIRDPARTY.yml"
popd
