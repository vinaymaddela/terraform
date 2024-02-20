#! /bin/bash
sudo apt-get update
echo "**  Installing apach2  **"
sudo apt install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1> Apache installed with the help of user_data by Vinay Maddela </h1>| sudo tee /var/www/html/index.html"