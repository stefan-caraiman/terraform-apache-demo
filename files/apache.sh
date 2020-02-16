#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo '<h1>Terraform is awesome!</h1><img src="https://i.pinimg.com/736x/42/e5/58/42e558004e65710ce268996ff12a8310.jpg">' | sudo tee /var/www/html/index.html
