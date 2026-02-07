#!/bin/bash

# Check if lspci is installed
if ! command -v lspci &>/dev/null; then
  echo "Error: lspci command not found. Please install pcutils or pciutils package."
  exit 1
fi

# Search for AMD or Nvidia in the list of PCI devices
if lspci | grep -i 'nvidia' &>/dev/null; then
  echo "Nvidia GPU detected."
  # You can add further Nvidia-specific commands here
  sudo pacman -S nvidia-dkms nvidia-utils nvidia-settings linux-headers --needed --noconfirm
elif lspci | grep -i 'amd' &>/dev/null || lspci | grep -i 'ati' &>/dev/null; then
  echo "AMD GPU detected."
  # You can add further AMD-specific commands here
  sudo pacman -S rocm-hip-sdk rocm-opencl-runtime --needed --noconfirm
else
  echo "No AMD or Nvidia GPU detected, or an unsupported GPU is present."
fi
