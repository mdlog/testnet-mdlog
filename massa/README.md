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

> Gunakan perintah dibawah ini.

```
wget -O massa-testnet.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/massa/massa-testnet.sh && chmod +x massa-testnet.sh && ./massa-testnet.sh
```

Setelah proses instalasi binary dari massa selesai, anda bisa menekan ```CTRL + C``` di keyboard anda. Selanjutnya masuk kedalam folder ```massa-client``` letaknya ada di ```cd massa/massa-client``` setelah berada di folder ```massa-client``` jalankan perintah berikut ```./massa-client```. Selanjutnya jika sudah berada di terminal client massa silahkan jalankan perintah berikut di command line, perintah ini untuk melihat data Wallet Address anda.

```
wallet_info
```

Setelah informasi wallet address anda muncul salin alamat address anda dan kirimkan kechannel #testnet-faucet yang ada di discord Massa, untuk mendapatkan balance.


Cek Node yang sedang berjalan
```
sudo tail -f /root/massa/massa-node/logs.txt
```

Untuk mengetahui step by step secara jelas silahkan nonton video berikut

>- [Run Dengan Satu Command Line] https://www.youtube.com/watch?v=lRdD0gVraoo
