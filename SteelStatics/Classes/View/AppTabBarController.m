#import "AppTabBarController.h"
#import "AppInterface.h"


@implementation AppTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createButton:@"表面未處理鋼材計算" frame:CanvasRect(25, 990, 150, 40) image:@"blue" selector:@selector(buttonAction:) tag:0];
    
    [self createButton:@"表面已處理鋼材計算" frame:CanvasRect(170, 990, 150, 40) image:@"red" selector:@selector(buttonAction:) tag:1];
    
    [self createButton:@"其它" frame:CanvasRect(315, 990, 150, 40) image:@"ori" selector:@selector(buttonAction:) tag:2];
    
    [self createButton:@"報價單" frame:CanvasRect(460, 990, 150, 40) image:@"yellow" selector:@selector(buttonAction:) tag:3];
    
    [self createButton:@"油漆計算" frame:CanvasRect(605, 990, 150, 40) image:@"green" selector:@selector(buttonAction:) tag:4];
    
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
    [self.view addSubview:button];
    return button;
}

-(void) transitionToIndex:(NSInteger)index
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.view.layer addAnimation:transition forKey:nil];
    [self setSelectedIndex:index];
}


@end
