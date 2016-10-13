# 知乎专栏

##### 知乎专栏iOS版（swift）

#### 已完成

1. 用户专栏列表
2. 用户专栏详情
3. 启动图
4. 用户详情
5. 文章列表

####接口：

前缀： https://zhuanlan.zhihu.com/api/recommendations/

专栏发现： columns?limit=16&offset=0&seed=74

文章发现： posts?limit=12&offset=0&seed=74

启动图: http://news-at.zhihu.com/api/4/start-image/375*675

个人专栏: https://zhuanlan.zhihu.com/api/columns/jixin

专栏文章信息: https://zhuanlan.zhihu.com/api/columns/jixin/posts?limit=16&offset=0

用户专栏入口: http://www.zhihu.com/people/jixin/posts

#### 效果图

<img src="https://github.com/dyljqq/ZhihuColumn/raw/master/ScreenShot/1.png" width="190" height="335"/>
<img src="https://github.com/dyljqq/ZhihuColumn/raw/master/ScreenShot/2.png" width="190" height="335"/>
<img src="https://github.com/dyljqq/ZhihuColumn/raw/master/ScreenShot/3.png" width="190" height="335"/>
<img src="https://github.com/dyljqq/ZhihuColumn/raw/master/ScreenShot/4.png" width="190" height="335"/>

####用到的第三方库

swift:

[Alamofire](https://github.com/Alamofire/Alamofire) 

[SnapKit](https://github.com/SnapKit/SnapKit)

[Kingfisher](https://github.com/onevcat/Kingfisher)

[SwiftDate](https://github.com/malcommac/SwiftDate)

Object-C

[UITableView+FDTemplateLayoutCell](https://github.com/forkingdog/UITableView-FDTemplateLayoutCell)


#### 其他

尝试使用面向协议编程