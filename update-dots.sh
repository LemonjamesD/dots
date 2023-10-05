# Get current path
set PAST $PWD
cd /etc/nixos

# Update Git Main Branch
git checkout refactorv2
git pull
git add .
git commit -m "[SCRIPT] Updated dot files! 🚀"
git push

# Copy README to eww
cd ~/.config/eww
git pull
cp /etc/nixos/README.md ./
git add README.md
git commit -m "[SCRIPT] Updated \`eww\` README! 🚀"
git push

# Update eww git
git checkout eww
git add .
git commit -m "[SCRIPT] Updated dot files! 🚀"
git push

# Copy README to eww
cd ~/.config/hypr
git pull
cp /etc/nixos/README.md ./
git add README.md
git commit -m "[SCRIPT] Updated \`hyprland\` README! 🚀"
git push

# Update eww git
git checkout hyprland
git add .
git commit -m "[SCRIPT] Updated dot files! 🚀"
git push

# Go back
cd $PAST
