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

Anda dapat mengatur node Anda dalam beberapa menit dengan menggunakan skrip otomatis di bawah ini. Ini akan meminta Anda untuk memasukan IP Server yang anda gunakan sehingga anda tidak perlu lagi membuat file ```config.toml``` di ```~/massa/massa-node/config``` ! Sebelum melanjutkan silahkan cek terlebih dahulu OS anda support sistem init atau systemd dengan memasukan command berikut di terminal ada ```ps -p 1 -o comm= ```

> Jika yang muncul adalah ```init``` gunakan perintah dibawah ini.

```
wget -O massa-init.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/massa/massa-init.sh && chmod +x massa-init.sh && ./massa-int.sh
```

> Jika yang muncul adalah ```systemd``` gunakan perintah dibawah ini.

```
wget -O massa-testnet.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/massa/massa-testnet.sh && chmod +x massa-testnet.sh && ./massa-testnet.sh
```

Setelah proses instalasi binary dari massa selesai, akan terbuka terminal ```massa client``` jika anda belum memiliki ```wallet address``` silahkan jalankan perintah berikut di command line.

```
wallet_generate_private_key
```

Jika anda sudah memiliki ```wallet address``` dan ingin menambahkan menggunakan ```private key``` anda bisa menjalankan perintah ini, ganti ```private_key``` dengan private key yang anda miliki.

```
wallet_add_private_keys private_key
```
Untuk mengecek informasi ```wallet address``` anda bisa menjalankan perintah berikut.
```
wallet_info
```

