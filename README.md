# Via Desktop Flatpak

## Important! Read first!

This does not work without modifying your UDEV rules!

You will not be prompted to select your device as you would on Google Chrome, Brave or other Chromium based broswers.

## Debugging

- Use `chrome://device-log/?refresh=5`.

- Did you load your JSON design file?

## Development

### Build
```bash
flatpak-builder --force-clean --user --install-deps-from=flathub --repo=repo --install builddir sh.damon.flatpak.viadesktop.yml
```

### Run
```bash
flatpak run sh.damon.flatpak.viadesktop
```
