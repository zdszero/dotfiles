### 部署脚本

确保`python3`已经安装，然后终端执行

```
./deploy_dotfiles
```

### 一些其他的相关配置

#### fcitx5拼音输入法框架

+ install packages
```shell
sudo pacman -S fcitx5-im             # fcitx应用组
sudo pacman -S fcitx5-chinese-addons # 中文输入法支持
sudo pacman -S fcitx5-pinyin-zhwiki  # 中文字库
sudo pacman -S fcitx5-material-color # 主题样式
```

+ edit enviroment variables to enable input method to be used in apps
edit ~/.xprofile
```shell
export INPUT_METHOD=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"
```

+ 修改配置文件
如果是kde的话，用fcitx5-configtool进行配置，在输入法选项中添加拼音，并对插件进行配置。

#### fonts

+ install new fonts
```shell
mkdir /usr/share/fonts/myfonts
mkfontscale
mkfontdir
fc-cache
```
