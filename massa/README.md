<p style="font-size:14px" align="right">
<a href="https://t.me/massa_indonesia" target="_blank">Join our telegram <img src="https://user-images.githubusercontent.com/50621007/168689534-796f181e-3e4c-43a5-8183-9888fc92cfa7.png" width="30"/></a>
<a href="https://massa.net" target="_blank">Visit our website <img src="https://user-images.githubusercontent.com/17427126/175755888-1a279a45-4b3d-4fa5-be6b-ebab93346af4.png" width="30"/></a>
</p>

# Persyaratan Minimum Perangkat Keras

 - 4CORE
 - 8GB RAM
 - 200GB Disk

 # Set Up Massa Node Secara Manual (OPSI 1)
Dokumentasi Ofisial:
>-[Instruksi Set Up Node](https://massa.readthedocs.io/en/latest/testnet/install.html)

Dokumentasi Komunitas (Versi Binary)
>-[Instruksi Set Up Node](https://medium.com/@massacaptain/tutorial-massa-testnet-binary-version-d7e10847e4c0)

Explorer:
>-[Explorer from Massa.Net](https://massa.net/testnet/)

# Set Up Massa Node Secara Otomatis (OPSI 2)

Anda dapat mengatur node Anda dalam beberapa menit dengan menggunakan skrip otomatis di bawah ini. Ini akan meminta Anda untuk memasukan IP Server yang anda gunakan sehingga anda tidak perlu lagi membuat file ```config.toml``` di ```~/massa/massa-node/config``` ! 

> ## Gunakan perintah dibawah ini jika anda belum memiliki ```Wallet Address``` Massa.

```
wget -O massa-testnet.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/massa/massa-testnet.sh && chmod +x massa-testnet.sh && ./massa-testnet.sh
```
> ## Gunakan perintah dibawah ini jika anda sudah memiliki ```Wallet Address``` Massa dan ingin mengimport ```Secret Key```.

```
wget -O massa-import.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/massa/massa-import.sh && chmod +x massa-import.sh && ./massa-import.sh
```

Setelah proses instalasi binary dari massa selesai, dan di terminal anda muncul ```sleep......``` anda bisa menekan ```CTRL + A + D``` di keyboard anda. Selanjutnya masuk kedalam folder ```massa-client``` letaknya ada di ```cd massa/massa-client``` setelah berada di folder ```massa-client``` jalankan perintah berikut ```./massa-client -p <passsword>```, ganti ```<password>``` dengan password massa-client yang sudah anda buat saat tahap instalasi. Selanjutnya jika sudah berada di terminal client massa silahkan jalankan perintah berikut di command line, perintah ini untuk melihat data Wallet Address anda.

```
wallet_info
```

Setelah informasi wallet address anda muncul salin ```alamat address``` anda dan kirimkan kechannel #testnet-faucet yang ada di discord Massa, untuk mendapatkan balance.


Cek Node yang sedang berjalan
```
sudo tail -f /root/massa/massa-node/logs.txt
```


# Update Node

Jika anda menjalankan Node secara Otomatis seperti diatas (OPSI 2) saat run node ```Episode 12``` anda bisa menggunakan command dibawah ini. silahkan jalan perintah dibawah ini untuk melakukan update terhadap Node anda

``` 
wget -O update-node.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/massa/update-node.sh && chmod +x update-node.sh && ./update-node.sh
```
Dengan menjalankan perintah update anda telah memperbaharui versi node anda dari versi 12 ke versi 13 sekaligus memindahkan wallet dan Node yang ada di versi 12 ke versi 13

Setelah muncul tulisan ```Sleep.....``` di terminal, silahkan ```CTRL + A + D``` di keyboard anda



