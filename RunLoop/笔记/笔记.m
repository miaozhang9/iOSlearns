Runloop -- 运行循环
- iOS开中几乎不用!但是有些特殊的地方!用普通的方式无法解决的时候!! 高薪代码!就会用到Runloop


Runloop 干几件事情

- 保证程序不退出!!
- 负责监听事件: 触摸(UI界面的交互),时钟,网络事件.
- 负责渲染屏幕上的所有UI!!(一次RunLoop循环需要渲染屏幕上所有UI变化的点!)



TableView ==>  半年!!!
cell的加载 -- cell上的内容加载 优化!!!
网络加载图片 -- 子线程 (因为耗时 所以丢在子线程)

更新UI  放在那里?? -- 主线程
如果更新UI 也是一个耗时操作!! 怎么办??



在开发中,属性懒加载用过吗??
请问除了属性可以懒加载.方法能够懒加载吗?? 1能 / 2不能
怎么做懒加载?   






