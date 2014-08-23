//
//  FormulaView.m
//  SteelStatics
//
//  Created by develop on 2014/8/23.
//  Copyright (c) 2014年 isaacs. All rights reserved.
//

#import "FormulaView.h"
#import "AppInterface.h"

@implementation FormulaView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        
        [self createTextFields];
        
        
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
    NSLog(@"");
}



-(void) hide
{
    
}


-(void) show
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
