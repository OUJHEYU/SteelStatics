#import "AppTabBarController.h"
#import "AppInterface.h"

@interface AppTabBarController ()

@end

@implementation AppTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    UITabBar* tabBar = self.tabBar;
    NSArray* tabItems = tabBar.items;
    
    for (int i = 0; i < tabItems.count; i++) {
        UITabBarItem* item = tabItems[i];
        NSLog(@"-- %@", item.title);
    }
    
    //    清除TabBar背景顏色
    UIImage *bgImg = [[UIImage alloc] init];
    [self.tabBar setBackgroundImage:bgImg];
    [self.tabBar setShadowImage:bgImg];
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] == NSOrderedAscending) {
        [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorWithRed:127.0/255.0 green:186.0/255.0 blue:235.0/255.0 alpha:1.0]];
        [[UITabBar appearance] setSelectionIndicatorImage:bgImg];
    }
}

@end
