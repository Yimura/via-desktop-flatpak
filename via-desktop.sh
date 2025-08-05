#!/bin/env /bin/bash

EXTRA_ARGS=()

declare -r PASSWORD_STORE="${PASSWORD_STORE:-basic}"
case "${PASSWORD_STORE}" in
basic | gnome-libsecret | kwallet | kwallet5 | kwallet6)
    echo "Debug: Using password store: ${PASSWORD_STORE}"
    EXTRA_ARGS=(
        "--password-store=${PASSWORD_STORE}"
    )
    ;;
*)
    echo "Error: PASSWORD_STORE (${PASSWORD_STORE}) must be one of the following: basic, gnome-libsecret, kwallet, kwallet5, kwallet6"
    exit 1
    ;;
esac

if [[ "${ELECTRON_OZONE_PLATFORM_HINT}" == "auto" || "${ELECTRON_OZONE_PLATFORM_HINT}" == "wayland" ]]; then
    EXTRA_ARGS+=("--enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL" "--ozone-platform=wayland")
fi

if [[ "${DISABLE_GPU}" -eq 1 ]]; then
    EXTRA_ARGS+=(
        "--disable-gpu"
    )
fi

if [[ "${DISABLE_GPU_SANDBOX}" -eq 1 ]]; then
    EXTRA_ARGS+=(
        "--disable-gpu-sandbox"
    )
fi

export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
exec zypak-wrapper /app/lib/via-desktop/via-desktop "${EXTRA_ARGS[@]}" "$@"
