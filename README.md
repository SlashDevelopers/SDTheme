# SDTheme

[![Build Status](https://travis-ci.org/SlashDevelopers/SDTheme.svg?branch=master)](https://travis-ci.org/SlashDevelopers/SDTheme)
![](https://img.shields.io/cocoapods/v/SDTheme.svg?style=flat)
![](https://img.shields.io/cocoapods/p/SDTheme.svg?style=flat)
![https://github.com/SlashDevelopers/SDTheme/blob/master/LICENSE](https://img.shields.io/badge/license-MIT-green.svg)
![](https://img.shields.io/badge/language-ObjectiveC-orange.svg)
[![codebeat badge](https://codebeat.co/badges/52bf47a7-3438-4a1a-bc0a-99f713b0ed59)](https://codebeat.co/projects/github-com-slashdevelopers-sdtheme-master)
![](https://img.shields.io/cocoapods/dt/SDTheme.svg)

## 效果图
![Demo运行效果图](https://upload-images.jianshu.io/upload_images/1457495-c0bfe2bf1302ec9f.gif?imageMogr2/auto-orient/strip)

Demo做的有点丑，大家多忍耐一下😅

## 使用方法非常简单：
### 初始化：
```
[[SDThemeManager sharedInstance] setupThemeNameArray:@[@"SDTheme-White", @"SDTheme-Black"]];
```
`SDTheme-White`和`SDTheme-Black`是资源主题Bundle的名称，下面会说到资源Bundle的引入方法。
### 切换主题：
```
[[SDThemeManager sharedInstance] changeTheme:@"SDTheme-Black"];
```
### 具体设置皮肤：

具体调用非常简单，比如需要换肤的视图控件原本是调用`backgroundColor`设置颜色，只需要换成调用扩展方法`theme_backgroundColor`即可，例如：
```
self.view.theme_backgroundColor = @"block_bg";
self.textField.theme_textColor = @"text_h1";
self.image.theme_image = @"icon_face";
```
富文本需要用`SDThemeForegroundColorAttributeName`替换`NSForegroundColorAttributeName`，例如：
```
navBar.theme_titleTextAttributes = @{SDThemeForegroundColorAttributeName:@"text_h1"};
```

另外有些常用的属性在XIB等可视化视图也可以直接设置，例如：
![](https://upload-images.jianshu.io/upload_images/1457495-babdc4785500a901.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


如果直接设置属性的方式不满足需求，还可以自己监听通知`SDThemeChangedNotification`，收到通知之后自行做颜色图标等切换。

## 资源管理
颜色字符串和图片是放在单独的Bundle里面进行管理的，所以刚开始要新建自己的主题Bundle.
Bundle中 新建`ColorsMap.plist`和`Images.xcassets`
* 图片：就放在相应的主题bundle中的Images.xcassets管理，图片在不同主题下名字要保证一致。
* 颜色字符串：颜色字符串可以参考一下Demo中的文件，首先要有一个大分类，例如Demo中的`block、text、line`(跟随自己需要分类就好，这里的分类我是扒竞品`富途牛牛`的🤠)，如果你有一个分类叫`SomeThing`，那分类下内容命名要带上相应的前缀`SomeThing_`，不然会报找不到，`color string`是HEX 或者AHEX格式。 


## Bundle 创建注意事项：

资源bundle**不要**直接新建文件夹之后改扩展名或者用Settings Bundle
![](https://upload-images.jianshu.io/upload_images/1457495-f8bde2cbea28cdfa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 推荐Bundle创建方式：
![](https://upload-images.jianshu.io/upload_images/1457495-502f75d3939458b3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
`file`->`New`->`Target`->`macOS`->`Bundle`

创建完成之后，对
Base SDK 设置为 iOS 
Build Active Architecture Only 设置为 "YES"
Installation Directory    删除掉后面的路径
Code Signing Identity   选择 Don't Code Sign  
iOS Deployment Target 设置为 合适的版本
Skip Install 设置为 "NO"
Strip Debug Symbols During Copy 设置为 "YES"
COMBINE_HIDPI_IMAGES 设置为 "NO"
再设置一下依赖
![](https://upload-images.jianshu.io/upload_images/1457495-23f9b0db6eece301.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) 
好，到现在Bundle就完成了

## 主要实现原理：
其实实现原理也是非常简单的，我这里拿`UIView`举例子：

```
@interface UIView (SDTheme)

@property (nonatomic, copy) NSString *theme_backgroundColor;
@property (nonatomic, copy) IBInspectable NSString *sd_background;
@property (nonatomic, copy) NSString *theme_tintColor;

@en
```

这是针对UIView提供的扩展，大家可以看到其中有换肤属性`theme_backgroundColor `，如下图，我们在属性`theme_backgroundColor `的`Setter`方法中有根据主题配置调用系统的相应方法，然后对控件注册监听，等切换主题之后就会收到通知，然后执行`theme_didChanged`方法，为控件设置正确的主题UI，That’s all~ 
![](https://upload-images.jianshu.io/upload_images/1457495-be5e9bcef42b2b14.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## Mac工具
另外同事写了[一个Mac小工具](https://github.com/SlashDevelopers/HSThemeColorMap/releases/download/v1.0.0/HSThemeColorMap.zip)也顺便分享一下，找一些颜色的时候会提高一些效率。
![工具图](https://upload-images.jianshu.io/upload_images/1457495-c5f4d92678befdbe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

使用的时候只要把对应的ColorMaps拖进框即可，可能第一次需要输入密码，是因为对文件执行了一个`chmod 777`的命令，目前只支持两个，[代码在这里](https://github.com/SlashDevelopers/HSThemeColorMap)，有大佬有兴趣的欢迎扩展，欢迎RP。
* 双击Cell 可以快速拿到对应颜色的key到剪贴板，直接`Ctrl+V`到项目代码中即可。
* 在菜单栏-Eidt->Add Color 可以快捷添加颜色

[成品可以在这里直接下载到](https://github.com/SlashDevelopers/HSThemeColorMap/releases/download/v1.0.0/HSThemeColorMap.zip)



