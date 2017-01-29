Debian (.deb) package for C application automate example
====

# About
.deb package "Chapter 4. Simple Example" automation 
[Chapter 4. Simple Example](https://www.debian.org/doc/manuals/debmake-doc/ch04.en.html)  

# Usage
```
sudo apt-get install debmake -y
bash package/packaging_deb.sh
```

# Detail
packaging automation. 
 * make linux application source package of .tar.gz
 * default debian package setting files and overwrite
 * make .deb package

# Output
.tar.gz : `object/deb_object/debhello-0.0.tar.gz`  
            (show: `tar -tzf debhello-0.0.tar.gz`)  
.deb    : `object/deb_object/debhello_0.0-1_amd64.deb`  
            (show: `dpkg -c debhello_0.0-1_amd64.deb`)  

# Reference
[Chapter 4. Simple Example](https://www.debian.org/doc/manuals/debmake-doc/ch04.en.html)  
[(ja)第4章 debian/ ディレクトリー以下に無くてはならないファイル](https://www.debian.org/doc/manuals/maint-guide/dreq.ja.html)  

# Contact
mail: [michinari.nukazawa@gmail.com](mailto:michinari.nukazawa@gmail.com)  
twitter: [@MNukazawa](https://twitter.com/MNukazawa)  

