```
sudo mkdir -p /mnt/etc/nixos /mnt/etc/nix/store /mnt/home /mnt/boot
sudo swapon <swap>
sodo mount -o size=10g -t tmpfs none /mnt
sudo mount <btrfs> -o subvol=nixos /mnt/etc/nixos
sudo mount <btrfs> -o subvol=nix /mnt/etc/nix
sudo mount <btrfs> -o subvol=store /mnt/etc/nix/store
sudo mount <btrfs> -o subvol=home /mnt/home
sudo mount <boot> /mnt/boot
git clone https://github.com/LemonjamesD/dots.git /mnt/etc/nixos
```
