# ZJCustomNavigationBar
ZJCustomNavigationBar is owned by the controller's view, but not by it's navigation controller. In other words, ZJCustomNavigationBar's super view is the controller's view.
In iOS, there is always one navigation Bar in one navigation stack. Some times it is not convenient if you want very customized navigation bar.So you can just use ZJCustomNavigationBar.


1.download the .h and .m to your project.
2.#import "UIViewController+ZJCustomNavigationBar.h"
3.inViewDidAppear Function add:
   [self zj_loadCustomNaviagationBar];
   self.zj_customizedBar.backgroundColor = [UIColor redColor];
   self.zj_customizedBar.navigationItem.title = @"Good";
 
Done!
Attention:
It's not working when app is just launched, becuase the safeareainset totop is wrong.

MIT
Copyright peter.
