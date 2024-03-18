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
cd ~/.config/eww
# git checkout eww
# git pull
# git add .
# git commit -m "[SCRIPT] Updated dot files! 🚀"
# git push

# # Copy README to eww
# cp /etc/nixos/README.md ./
# git add README.md
# git commit -m "[SCRIPT] Updated \`eww\` README! 🚀"
# git push

# # Update hyprland git
# cd ~/.config/hypr
# git pull
# git checkout hyprland
# git add .
# git commit -m "[SCRIPT] Updated dot files! 🚀"
# git push

# # Copy README to hyprland
# cp /etc/nixos/README.md ./
# git add README.md
# git commit -m "[SCRIPT] Updated \`hyprland\` README! 🚀"
# git push

# Go back
cd $PAST
