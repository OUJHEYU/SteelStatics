#import "AppTabBarController.h"
#import "AppInterface.h"


@implementation AppTabBarController


@synthesize customTabsView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    
    customTabsView = [[UIView alloc] initWithFrame: CanvasRect(10, 990, 750, 50)];
    
    UIButton* button = [self createButton:@"表面未處理鋼材計算" frame:CanvasRect(0, 0, 150, 40) image:@"blue" selector:@selector(buttonAction:) tag:0];
    [customTabsView addSubview: button];
    
    button = [self createButton:@"表面已處理鋼材計算" frame:CanvasRect(150, 0, 150, 40) image:@"red" selector:@selector(buttonAction:) tag:1];
    [customTabsView addSubview: button];
    
    button = [self createButton:@"其它" frame:CanvasRect(300, 0, 150, 40) image:@"ori" selector:@selector(buttonAction:) tag:2];
    [customTabsView addSubview: button];
    
    button = [self createButton:@"報價單" frame:CanvasRect(450, 0, 150, 40) image:@"yellow" selector:@selector(buttonAction:) tag:3];
    [customTabsView addSubview: button];
    
    button = [self createButton:@"油漆計算" frame:CanvasRect(600, 0, 150, 40) image:@"green" selector:@selector(buttonAction:) tag:4];
    [customTabsView addSubview: button];
    
    
    [self.view addSubview: customTabsView];
}


#pragma mark - Public Methods

-(void) hideTabsViewAction
{
    [UIView animateWithDuration: 0.5 animations:^{
        [customTabsView setOriginY: CanvasHeight(1100)];
    } completion:nil];
}

-(void) showTabsViewAction
{
    [UIView animateWithDuration: 0.5 animations:^{
        [customTabsView setOriginY: CanvasHeight(990)];
    } completion:nil];
}


#pragma mark - Private Methods

-(void) buttonAction:(UIButton*)button
{
    NSInteger index = button.tag;
    [self transitionToIndex: index];
}

-(UIButton*) createButton: (NSString*)title frame:(CGRect)frame image:(NSString*)image selector:(SEL)selector tag:(int)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents: UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal] ;
    button.titleLabel.font = [UIFont boldSystemFontOfSize:CanvasFontSize(12)];
    [button setBackgroundImage:[UIImage imageNamed: image] forState:UIControlStateNormal];
    button.tag = tag;
    return button;
}

-(void) transitionToIndex:(NSInteger)index
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType: @"pageUnCurl"];
//    UIViewController* toController = self.selectedViewController; //[self.viewControllers objectAtIndex: index];
//    [toController.view.layer addAnimation:transition forKey:nil];
    [self.view.layer addAnimation:transition forKey:nil];
    [self setSelectedIndex:index];
}


@end
