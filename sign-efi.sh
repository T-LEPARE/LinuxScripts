#!/bin/bash
SIGN_DIR="/boot/EFI/refind/keys"

# Sign and replace the original .efi files
sbsign --key "$SIGN_DIR/db.key" --cert "$SIGN_DIR/db.crt" --output /boot/EFI/refind/mmx64.efi /boot/EFI/refind/mmx64.efi
sbsign --key "$SIGN_DIR/db.key" --cert "$SIGN_DIR/db.crt" --output /boot/EFI/refind/grubx64.efi /boot/EFI/refind/grubx64.efi
sbsign --key "$SIGN_DIR/db.key" --cert "$SIGN_DIR/db.crt" --output /boot/EFI/refind/refind_x64.efi /boot/EFI/refind/refind_x64.efi

# Sign the kernel and create a separate signed version
sbsign --key "$SIGN_DIR/db.key" --cert "$SIGN_DIR/db.crt" --output /boot/vmlinuz-linux.signed /boot/vmlinuz-linux
sbsign --key "$SIGN_DIR/db.key" --cert "$SIGN_DIR/db.crt" --output /boot/vmlinuz-linux /boot/vmlinuz-linux