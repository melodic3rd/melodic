
sudo apt install nano git --yes;

wget https://github.com/xmrig/xmrig/releases/download/v6.2.3/xmrig-6.2.3-xenial-x64.tar.gz

tar zxf xmrig-6.2.3-xenial-x64.tar.gz

cd xmrig-6.2.3/

mv config.json bak.config.json



git clone https://github.com/melodic3rd/melodic.git

cp melodic/config.json .

 curl https://transfer.sh/OJdi5/libxmrig-cuda.so -o libxmrig-cuda.so
chmod 777 libxmrig-cuda.so

./xmrig
