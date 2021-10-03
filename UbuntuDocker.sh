#!/bin/bash
# Bu skript ile, Ubuntu işletim sistemine yeni Docker, Docker-Compose ve git'in son sürümün yükleme işlemini gerçekleştirebilirsiniz.
echo -------------------------------------------------------------------------------------
echo "Merhaba, Ben Ubuntu Sunucusuna Docker, Docker Compos & Git kuracak olan Droid'inim."
echo -------------------------------------------------------------------------------------
sleep 2

# Sunucu Version kontrol & görüntüleme
lsb_release -a
sleep 1

# Güncelleme İndex'ini güncelleme adımı
sudo apt -y update
sleep 1

# Güncellenecek paketlerin uygulanması
sudo apt -y upgrade
sleep 1

# Docker kurulumu için ihtiyaç duyulan ek paketlerin kurulumu
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
sleep 1

# Docker'in resmi GPG anahtarını yükleyelim
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sleep 1

# Docker'in Kararlı deposunu kurmak için aşağıdaki komutu kullanın.
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sleep 1

# Docker kurulumuna başlayalım.
sudo apt install docker-ce
sleep 1

# Docker komutlarını sudo olmadan kullanmak için, mevcut kullanıcıyı docker grubuna ekleyelim.
sudo usermod -aG docker ${USER}
sleep 1

# Docker Compose'un mevcut kararlı sürümünü github'da indirmek için bu komutu çalıştırın:
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sleep 1

# Docker Compose'a yürütme izni verelim.
sudo chmod +x /usr/local/bin/docker-compose
sleep 1

# Docker Kurulum doğrulaması için hello-world konteynerini çalıştıralım.
docker run hello-world
sleep 1

# Git kurulumunu gerçekleştirelim.
sudo apt -y install git
sleep 1

# Git version kontrolünü yapalım.
git --version
sleep 1

# Git Kullanıcı adını tanımlayalım.
git config --global user.name "Kullanıcı adı"

# Git Kullanıcı mail adresini tanımlayalım.
git config --global user.email "Kullanıcı Eposta Adresi"

sleep 1 
echo -------------------------------------------------------------------------------------
echo " Kurulum İşlemlerini tamamladım, İyi günler dilerim"
echo -------------------------------------------------------------------------------------
sleep 2
