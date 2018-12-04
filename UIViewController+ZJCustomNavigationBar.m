//
//  UIViewController+zj_customNavigationBar.m
//
//  Created peter on 2018/11/19.
//

#import "UIViewController+ZJCustomNavigationBar.h"
#import <objc/runtime.h>

@implementation zj_customNavigationBar

-(void)setHidden:(BOOL)hidden{
    [super setHidden:hidden];
    self.barBackgroundView.hidden = hidden;
}
    
-(void)setBarTintColor:(UIColor *)barTintColor{
    [super setBarTintColor:barTintColor];
    self.barBackgroundView.backgroundColor = barTintColor;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];
    self.barBackgroundView.backgroundColor = backgroundColor;
}

@end

//////////////////////////////////////////////////////////////////////////////////////////////////////

const NSString * zj_customNavigationBarCustomizedBarProperty = @"zj_customNavigationBarCustomizedBarProperty";
const NSString * zj_customNavigationBarCustomizedBarBackgroundViewProperty = @"zj_customNavigationBarCustomizedBarBackgroundViewProperty";

@implementation UIViewController (zj_customNavigationBar)

- (CGFloat)statusBarIntrinsicHeight {
    if (@available(iOS 11.0, *)) {
        CGFloat toTop = [UIApplication sharedApplication].keyWindow.safeAreaInsets.top;
        if (toTop > 0) {
            return toTop;
        }
    }

    return 20;
}

-(CGFloat)navigationBarHeight{
    return 44.0f;
}

- (zj_customNavigationBar *)zj_customizedBar {
    zj_customNavigationBar *bar = objc_getAssociatedObject(self, &zj_customNavigationBarCustomizedBarProperty);
    return bar;
}

- (void)setZj_customizedBar:(zj_customNavigationBar *)zj_customizedBar{
    objc_setAssociatedObject(self, &zj_customNavigationBarCustomizedBarProperty, zj_customizedBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)zj_customizedBarBackgroundView {
    UIView *bar = objc_getAssociatedObject(self, &zj_customNavigationBarCustomizedBarBackgroundViewProperty);
    return bar;
}

- (void)setZj_customizedBarBackgroundView:(UIView *)zj_customizedBarBackgroundView {
    objc_setAssociatedObject(self, &zj_customNavigationBarCustomizedBarBackgroundViewProperty, zj_customizedBarBackgroundView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)zj_loadCustomNaviagationBar{
    if (!self.zj_customizedBar) {
        CGRect bgRect = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), [self statusBarIntrinsicHeight] + [self navigationBarHeight]);
        self.zj_customizedBarBackgroundView = [[UIView alloc] initWithFrame:bgRect];
        
        CGRect barRect = CGRectMake(0, [self statusBarIntrinsicHeight], CGRectGetWidth(self.view.frame), [self navigationBarHeight]);
        self.zj_customizedBar = [[zj_customNavigationBar alloc] initWithFrame:barRect];
        self.zj_customizedBar.translucent = YES;
        [self.zj_customizedBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        UINavigationItem *navigationItem = [[UINavigationItem alloc]init];
        self.zj_customizedBar.items = @[navigationItem];
        self.zj_customizedBar.navigationItem = navigationItem;
        
        [self.zj_customizedBarBackgroundView addSubview:self.zj_customizedBar];
        self.zj_customizedBarBackgroundView.backgroundColor = [UIColor whiteColor];
        self.zj_customizedBar.barTintColor = [UIColor whiteColor];
        self.zj_customizedBar.tintColor = [UIColor whiteColor];
        self.zj_customizedBar.barBackgroundView = self.zj_customizedBarBackgroundView;
    }
    [self.view addSubview:self.zj_customizedBarBackgroundView];
}

-(void)zj_setCustomTitleView:(UIView *)view{
    if (self.zj_customizedBar) {
        self.zj_customizedBar.navigationItem.titleView = view;
    }
}

-(void)zj_setMNPLeftBarButtonItem:(UIBarButtonItem *)item{
    if (self.zj_customizedBar) {
        self.zj_customizedBar.navigationItem.leftBarButtonItem = item;
    }
}
-(void)zj_setMNPRightBarButtonItem:(UIBarButtonItem *)item{
    if (self.zj_customizedBar) {
        self.zj_customizedBar.navigationItem.rightBarButtonItem = item;
    }
}

-(void)zj_setMNPLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items{
    if (self.zj_customizedBar) {
        self.zj_customizedBar.navigationItem.leftBarButtonItems = items;
    }
}
-(void)zj_setMNPRightBarButtonItems:(NSArray<UIBarButtonItem *> *)items{
    if (self.zj_customizedBar) {
        self.zj_customizedBar.navigationItem.rightBarButtonItems = items;
    }
}

@end
