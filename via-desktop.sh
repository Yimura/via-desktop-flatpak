#!/bin/env /bin/bash

# APPDIR=/app
# export LD_LIBRARY_PATH="${APPDIR}/lib/via-desktop:${LD_LIBRARY_PATH}"
# export ELEXTRON_IS_DEV=0
# export ELECTRON_FORCE_IS_PACKAGED=true
# export ELECTRON_DISABLE_SECURITY_WARNINGS=true
# export NODE_ENV=production

exec zypak-wrapper via-desktop "$@"
