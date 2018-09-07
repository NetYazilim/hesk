# Hesk - Help Desk Software

~~~~
docker run -d -p 80:80 -v hesk_vol:/shared -e "MODE=install"  netyazilim/hesk
docker run -d -p 80:80 -v hesk_vol:/shared -e "MODE=run"      netyazilim/hesk
docker run -d -p 80:80 -v hesk_vol:/shared -e "MODE=install" -e "ADD_MODS_URL=https://github.com/mike-koch/Mods-for-HESK/archive/2018.2.0.tar.gz" -e "ADD_LANG_URL=https://github.com/LSagiroglu/Mods-for-HESK-TR/releases/download/2018.2.0/tr.tar.gz" hasholding/hesk
~~~~
