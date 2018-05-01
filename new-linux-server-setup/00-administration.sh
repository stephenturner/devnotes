# Create a new group:
sudo groupadd -g 18697 uvabx

# Add users to that group:
sudo usermod -a -G uvabx sdt5z
sudo usermod -a -G uvabx afk2s

# Mount project dir
sudo mkdir -p /project/uvabx
sudo vim /etc/fstab # add line see email
sudo mount /project/uvabx

# Home dirs
sudo mkdir /tiny/sdt5z
sudo mkdir /tiny/afk2s


# project storage
mkdir /project/g_bme-janeslab
mount /project/g_bme-janeslab
useradd -u 281689 -g 15685 kaj5f
groupadd -g  15685 g_bme-janeslab
usermod -a -G  g_bme-janeslab sdt5z
usermod -a -G  g_bme-janeslab afk2s