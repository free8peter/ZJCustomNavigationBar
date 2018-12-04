//
//  UIViewController+zj_customNavigationBar.h
//
//  Created by peter on 2018/11/19.
//
/**
 https://github.com/free8peter
USE demo:
#import "UIViewController+zj_customNavigationBar.h"
In ViewDidAppear
[self zj_loadCustomNaviagationBar];
Attention: Not working If app is just start up. Because safeareatotop is wrong .
 */

#import <UIKit/UIKit.h>

/// customized NavigationBar
@interface zj_customNavigationBar : UINavigationBar

@property(nonatomic, strong) UINavigationItem *navigationItem;
@property(nonatomic, weak) UIView *barBackgroundView;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/// Use this catetory to make a customized Bar
@interface UIViewController (zj_customNavigationBar)

@property(nonatomic, strong, readonly)UIView *zj_customizedBarBackgroundView;
@property(nonatomic, strong, readonly)zj_customNavigationBar *zj_customizedBar;

/// ! initalization function
-(void)zj_loadCustomNaviagationBar;
/// set titleView
-(void)zj_setCustomTitleView:(UIView *)view;
/// setleftBarButtonItem
-(void)zj_setMNPLeftBarButtonItem:(UIBarButtonItem *)item;
/// setRightBarButtonItem
-(void)zj_setMNPRightBarButtonItem:(UIBarButtonItem *)item;
/// setLeftBarButtonItems
-(void)zj_setMNPLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items;
/// setRightBarButtonItems
-(void)zj_setMNPRightBarButtonItems:(NSArray<UIBarButtonItem *> *)items;


@end

