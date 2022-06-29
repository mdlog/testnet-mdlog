# Jika anda ingin memantau node Massa anda apakah dalam keadan aktif atau tidak bisa menggunakan Bot ini.

>- # Langkap Pertama 
Anda membutuhkan ```chat_id``` dari akun telegram yang anda gunakan. Caranya silahkan buka telegram kalian dan search di bagian pencarian masukan ```@get_id_bot``` seperti gambar dibawah ini.

![get_id_bot](https://user-images.githubusercontent.com/17427126/176402596-667db5d8-c714-4076-925f-3736bab53098.png)

Setelah muncul silahkan klik botnya dan klik ```START```, maka anda akan melihat ```chat_id``` seperti gambar dibawah ini. Salin ```chat_id``` tersebut untuk digunakan pada langkah berikutnya.

![id_chat](https://user-images.githubusercontent.com/17427126/176402853-dfcc7acb-422f-4704-b53b-22fd35f345f8.png)

> # Langkah Ke-Dua
Tambahkan bot @MDNodes_bot, search di bagian pencarian masukan ```@get_id_bot``` seperti gambar dibawah ini.

![md_node_bot](https://user-images.githubusercontent.com/17427126/176405409-a3a6e0a3-70cc-4898-9fe6-9060ec330880.png)

Setelah muncul silahkan klik botnya dan klik ```START```. Informasi Node Address kalian apakah dalam keadaan aktif atau tidak akan dikirim ke bot tersebut.

>- # Langkah Ke-Tiga

Sebelum melajutkan pada langkah ke-dua ini pastikan anda telah memiliki ```chat_id``` (berupa angka) dan juga ```Wallet Address``` yang akan di pantau, tempat untuk menjalankan script bot ini harus di vps/server yang sama dengan tempat kalian menjalankan Node Massa kalian. Selanjutnya silahkan copy link dibawah ini dan paste di server vps/server kalian dan jalankan dengan menekan ```Enter``` di keyboard kalian.

```
wget -O mdnodebot.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/bot/mdnodebot.sh && chmod +x mdnodebot.sh && ./mdnodebot.sh
```

Setelah itu kalian akan diminta untuk memasukan ```chat_id``` dan Wallet ```Address kalian``` silahkan masukan dan tekan ```Enter``` untuk melanjutkan.
