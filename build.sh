#!/usr/bin/env bash

GREEN="\033[1;32m"
RED="\033[1;31m"
ILC="\033[3m"
ORG="\033[1;33m"
RST="\033[0m"

function _info()
{
    echo -e "${ORG}[💡] INFO:\t${RST} ${ILC}$1${RST}"
}

function _success()
{
    echo -e "${GREEN}[✅] SUCCESS:\t${RST} ${ILC}$1${RST}"
}

function _error()
{
    echo -e "${RED}[❌] ERROR:\t${RST} ${ILC}$1${RST}"
    exit 84
}

NAME="lumen_test"
TARGET="src/lumen_test.cr"
CRYSTAL=crystal
NPROC=$(nproc)

_info "generating build.ninja file..."
cat <<EOF > build.ninja
name = $NAME
src = $TARGET
crystal = $CRYSTAL
flags = --threads ${NPROC} --time --verbose

rule build
  command = \$crystal build \$src -o \$name \$flags --single-module
  description = Building \$name (DEBUG)

rule release
  command = \$crystal build \$src -o \$name \$flags --release
  description = Building \$name (RELEASE)

build \$name: build
build release: release
EOF

_success "generated build.ninja file!"
_info "building $NAME in release mode..."

if ! command -v ninja &> /dev/null; then
    _error "ninja is not installed. Please install it to build the project."
fi

if ! ninja -f build.ninja; then
    _error "failed to build $NAME in release mode."
fi

_success "built $NAME in release mode!"
