# Get current path
set PAST $PWD
cd /etc/nixos

# Update Git Main Branch
git checkout refactorv2
git pull
git add .
git commit -m "[SCRIPT] Updated dot files! 🚀"
git push

# Update eww git
git pull
cd ~/.config/eww
git checkout eww
git add .
git commit -m "[SCRIPT] Updated dot files! 🚀"
git push

# Copy README to eww
cp /etc/nixos/README.md ./
git add README.md
git commit -m "[SCRIPT] Updated \`eww\` README! 🚀"
git push

# Update hyprland git
git pull
cd ~/.config/hypr
git checkout hyprland
git add .
git commit -m "[SCRIPT] Updated dot files! 🚀"
git push

# Copy README to hyprland
cp /etc/nixos/README.md ./
git add README.md
git commit -m "[SCRIPT] Updated \`hyprland\` README! 🚀"
git push

cd /etc/nixos
git checkout refactorv2

# Go back
cd $PAST
