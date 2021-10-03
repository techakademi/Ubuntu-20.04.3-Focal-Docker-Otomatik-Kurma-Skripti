#!/bin/bash
# Bu skript ile, Ubuntu işletim sistemine yeni Docker, Docker-Compose ve git'in son sürümün yükleme işlemini gerçekleştirebilirsiniz.
echo
echo -------------------------------------------------------------------------------------
echo "Merhaba, Ben Ubuntu Sunucusuna Docker, Docker Compos & Git kuracak olan Droid'inim."
echo -------------------------------------------------------------------------------------
sleep 2
echo
# Sunucu Version kontrol & görüntüleme
echo
echo -------------------------------------------------------------------------------------
echo "Sunucu Sürüm Kontrolünü yapıyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
lsb_release -a
sleep 1

# Güncelleme İndex'ini güncelleme adımı
echo
echo -------------------------------------------------------------------------------------
echo "Güncelleme Index'ini Güncelliyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
sudo apt -y update
sleep 1

# Güncellenecek paketlerin uygulanması
echo
echo -------------------------------------------------------------------------------------
echo "Güncel Paketleri Yükleme işlemine başlıyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
sudo apt -y upgrade
sleep 1

# Docker kurulumu için ihtiyaç duyulan ek paketlerin kurulumu
echo
echo -------------------------------------------------------------------------------------
echo "Docker Kurulumu ek paketleri yüklüyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
sleep 1

# Docker'in resmi GPG anahtarını yükleyelim
echo
echo -------------------------------------------------------------------------------------
echo "Docker'in resmi GPG anahtarini yüklüyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sleep 1

# Docker'in Kararlı deposunu kurmak için aşağıdaki komutu kullanın.
echo
echo -------------------------------------------------------------------------------------
echo "Docker'in deposunu kuruyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sleep 1

# Docker kurulumuna başlayalım.
echo
echo -------------------------------------------------------------------------------------
echo "Docker'i kurmaya başlıyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
sudo apt install docker-ce
sleep 1

# Docker komutlarını sudo olmadan kullanmak için, mevcut kullanıcıyı docker grubuna ekleyelim.
echo
echo -------------------------------------------------------------------------------------
echo "Mevcut ${USER} kullanıcısını docker grubuna ekliyorum."
echo -------------------------------------------------------------------------------------
grpekle=$(sudo usermod -aG docker ${USER})
sleep 2
echo "${USER} Kullanıcısını Docker Grubuna ekliyorum. $grpekle"
sleep 1
grep '^docker:' /etc/group
sleep 1

# Docker Compose'un mevcut kararlı sürümünü github'da indirmek için bu komutu çalıştırın:
echo
echo -------------------------------------------------------------------------------------
echo "Github'dan Docker Compose İndiriyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sleep 1

# Docker Compose'a yürütme izni verelim.
echo
echo -------------------------------------------------------------------------------------
echo "Docker Compose'a yürütme yetkisi veriyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
sudo chmod +x /usr/local/bin/docker-compose
sleep 1

# Docker Kurulum doğrulaması için hello-world konteynerini çalıştıralım.
echo
echo -------------------------------------------------------------------------------------
echo "Docekr kurulum doğrulaması için hello-world imajı ile konteyner oluşturuyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
sudo docker run hello-world
sleep 1

# Git kurulumunu gerçekleştirelim.
echo
echo -------------------------------------------------------------------------------------
echo "Git kurulumunu gerçekleştiriyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
sudo apt -y install git
sleep 1

# Git version kontrolünü yapalım.
echo
echo -------------------------------------------------------------------------------------
echo "Mevcut git sürümünü görüntülüyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
git --version
sleep 1
# Git Kullanıcı adını tanımlayalım.
echo
echo -------------------------------------------------------------------------------------
echo "Git kullanıcısını tanımlıyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
git config --global user.name "Kullanıcı adı"
# Git Kullanıcı mail adresini tanımlayalım.
echo -------------------------------------------------------------------------------------
echo "Git kullanıcı e-posta adresini tanımlıyorum."
echo -------------------------------------------------------------------------------------
sleep 2
echo
git config --global user.email "Kullanıcı Eposta Adresi"
sleep 1 
echo -------------------------------------------------------------------------------------
echo "Kurulum İşlemlerini tamamladım, İyi günler dilerim"
echo -------------------------------------------------------------------------------------
sleep 2
