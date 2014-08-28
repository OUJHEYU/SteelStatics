#import "FormulaView.h"
#import "AppInterface.h"

@implementation FormulaView

- (id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        [self.layer setBorderWidth:0.5];
//        [ColorHelper setBorder: self];
    }
    return self;
}

-(void) createTextFields
{
    BaseTextField* text1 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"LENGTH" enable:YES];
    BaseTextField* text2 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"QUANTITY" enable:YES];
    BaseTextField* text3 = [SSViewHelper createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"LOSS" enable:YES];

    [self addSubview:text1];
    [self addSubview:text2];
    [self addSubview:text3];
}

-(void) clearDatas
{
    
}

-(void) setDatas:(NSDictionary*) dictionary
{

}

-(void) hide
{
    self.frame = CanvasRect(404, 0, 90, 50);
    NSLog(@"-----hide-----");
}

-(void) show
{
    self.frame = CanvasRect(229, 0, 535, 50);
    NSLog(@"-----show-----");
    //show data
    
    
}

@end
