# ZJCustomNavigationBar
ZJCustomNavigationBar is owned by the controller's view, but not by it's navigation controller. In other words, ZJCustomNavigationBar's super view is the controller's view.
In iOS, there is always one navigation Bar in one navigation stack. Some times it is not convenient if you want very customized navigation bar.So you can just use ZJCustomNavigationBar.

<h1>USE, manually</h1>
1.download the .h and .m to your project.<br>
2.#import "UIViewController+ZJCustomNavigationBar.h"<br>
3.inViewDidAppear Function add:<br>
   [self zj_loadCustomNaviagationBar];<br>
   self.zj_customizedBar.backgroundColor = [UIColor redColor];<br>
   self.zj_customizedBar.navigationItem.title = @"Good";<br>
 
Done!
Attention:
It's not working when app is just launched, becuase the safeareainset totop is wrong.

MIT
Copyright peter.
