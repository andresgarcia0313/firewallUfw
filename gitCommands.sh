sudo apt install git gh -y
git config --global user.name "Andrés Eduardo García Márquez"
git config --global user.email "andresgarcia0313@gmail.com"
git config --global credential.helper store
gh auth login
gh repo create firewallUfw --public --confirm
git init
git add .
git commit -m "Primer commit"
git remote add origin https://github.com/andresgarcia0313/firewallUfw.git
git push -u origin master
