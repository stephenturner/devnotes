# Create a new group:
sudo groupadd -g 18697 groupname

# Add users to that group:
sudo usermod -a -G groupname user1
sudo usermod -a -G groupname user2
sudo usermod -a -G groupname user3
