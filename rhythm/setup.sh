if dpkg -S /bin/ls >/dev/null 2>&1
then
      sudo apt update && sudo apt install python3-dev python3-tk nano sl scrot cmatrix -y

elif rpm -q -f /bin/ls >/dev/null 2>&1
then
      sudo yum update -y && sudo yum install python3-dev python3-tk nano sl scrot cmatrix -y
else
  echo "Don't know this package system (neither RPM nor DEB)."
  exit 1
fi
sudo chmod +x ./chromedriver
sudo chmod +x ./rhythmwfh
sudo cp ./chromedriver /tmp/chromedriver
sudo cp ./rhythmwfh /usr/bin/rhythmwfh
clear
echo "Software is ready, use rhythmwfh to start"