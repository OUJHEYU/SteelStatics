#import "FormulaView.h"
#import "AppInterface.h"

@implementation FormulaView
{
    int count;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor grayColor];
        [self.layer setBorderWidth:0.5];
//        [ColorHelper setBorder: self];
    }
    return self;
}

-(void) createTextFields
{
    BaseTextField* text1 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text2 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text3 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text4 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text5 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text6 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text7 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text8 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"LENGTH" enable:YES];
    BaseTextField* text9 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"QUANTITY" enable:YES];
    BaseTextField* text10 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"LOSS" enable:YES];
    
    [self addSubview:text1];
    [self addSubview:text2];
    [self addSubview:text3];
    [self addSubview:text4];
    [self addSubview:text5];
    [self addSubview:text6];
    [self addSubview:text7];
    [self addSubview:text8];
    [self addSubview:text9];
    [self addSubview:text10];
}

-(void) clearDatas
{

}

-(void) setDatas:(NSDictionary*) dictionary
{
    NSLog(@"%@",dictionary);
}


-(void) hide
{
    self.frame = CanvasRect(404, 0, 90, 50);
}

-(void) show
{
    self.frame = CanvasRect(229, 0, 535, 50);
}
@end