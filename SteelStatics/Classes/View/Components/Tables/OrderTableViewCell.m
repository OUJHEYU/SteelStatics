#import "OrderTableViewCell.h"
#import "AppInterface.h"

@implementation OrderTableViewCell
{
    BOOL isTextFieldsHaveSetDelegate;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self createTextAndAddToContentView:@"1" frame:CanvasRect(3, 0, 51, 30) key:@"NO." enable:NO];
        
        [self createTextAndAddToContentView:@"2" frame:CanvasRect(54, 0, 175, 30) key:@"PROJECT_NAME" enable:YES];
        
        [self createTextAndAddToContentView:@"3" frame:CanvasRect(229, 0, 175, 30) key:@"PROJECT_MODELNAME" enable:YES];
        
        [self createView:CanvasRect(404, 0, 90, 30)];
        
        [self createTextAndAddToContentView:@"5" frame:CanvasRect(494, 0, 50, 30) key: @"UINIT" enable:YES];
        
        [self createTextAndAddToContentView:@"6" frame:CanvasRect(544, 0, 70, 30) key:@"QUANTITY" enable:YES];
        
        [self createTextAndAddToContentView:@"7" frame:CanvasRect(614, 0, 70, 30) key:@"UNIT" enable:YES];
        
        [self createTextAndAddToContentView:@"8" frame:CanvasRect(684, 0, 80, 30) key:@"TOTAL" enable:NO];
        
    }
    return self;
}

-(void)setDatas:(NSDictionary *)values index:(NSUInteger)index
{
    [SSViewHelper iterateSubViewRecursively: self.contentView subViewClazz:[BaseTextField class] handler:^BOOL(UIView *view) {
        if ([view isKindOfClass:[BaseTextField class]]) {
            BaseTextField* textField = (BaseTextField*)view;
            NSString* key = textField.attributeKey;
            
            if ([key isEqualToString:@"NO."]) {
                textField.text = [NSString stringWithFormat: @"%ld", index + 1];
            } else {
                textField.text = values[key];
            }
        }
        return NO;
    }];
}

-(NSDictionary*) getDatas
{
    NSMutableDictionary* result = [NSMutableDictionary dictionary];
    
    [SSViewHelper iterateSubViewRecursively: self.contentView subViewClazz:[BaseTextField class] handler:^BOOL(UIView *view) {
        if ([view isKindOfClass:[BaseTextField class]]) {
            BaseTextField* textField = (BaseTextField*)view;
            NSString* key = textField.attributeKey;

            if ([key isEqualToString:@""]) {
                
            } else {
                NSString* value = textField.text;
                [result setObject: value forKey:key];
            }
        }
        return NO;
    }];
    
    return result;
}

-(UIView*) createView:(CGRect)frame
{
    UIView* view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor clearColor];
    BaseTextField* text1 = [self createText:@"捏合" frame:CanvasRect(404, 0, 90, 30) key:@"" enable:YES];
    BaseTextField* text2 = [self createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text3 = [self createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text4 = [self createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text5 = [self createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text6 = [self createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text7 = [self createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"" enable:YES];
    BaseTextField* text8 = [self createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"LENGTH" enable:YES];
    BaseTextField* text9 = [self createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"QUANTITY" enable:YES];
    BaseTextField* text10 = [self createText:@"" frame:CanvasRect(0, 0, 0, 0) key:@"LOSS" enable:YES];

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
    [self.contentView addSubview:view];
    return view;
}

-(BaseTextField*) createText: (NSString*)title frame:(CGRect)frame key:(NSString*)key enable:(BOOL)enabled
{
    BaseTextField *textTextField = [[BaseTextField alloc]initWithFrame:frame];
    textTextField.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(15)];
    textTextField.text = title;
    [textTextField.layer setBorderWidth:0.5];
    textTextField.textAlignment = NSTextAlignmentCenter;
    textTextField.attributeKey = key;
    textTextField.enabled = enabled;
    return textTextField;
}

-(BaseTextField*) createTextAndAddToContentView: (NSString*)title frame:(CGRect)frame key:(NSString*)key enable:(BOOL)enabled
{
    BaseTextField* textTextField = [self createText:title frame:frame key:key enable:enabled];
    [self.contentView addSubview: textTextField];
    return textTextField;
}

-(void) setTextFieldsDelegate: (id<UITextFieldDelegate>)delegate
{
    if (isTextFieldsHaveSetDelegate) {
        return;
    }

    [SSViewHelper iterateSubViewRecursively: self.contentView subViewClazz:[BaseTextField class] handler:^BOOL(UIView *view) {
        if ([view isKindOfClass:[BaseTextField class]]) {
            BaseTextField* textField = (BaseTextField*)view;
            textField.delegate = delegate;
        }
        return NO;
    }];
    
    isTextFieldsHaveSetDelegate = YES;
}

@end
