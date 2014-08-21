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
        
        [self createText:@"1" frame:CanvasRect(3, 0, 46, 30) key:@"NO." enable:NO];
        
        [self createText:@"2" frame:CanvasRect(49, 0, 169, 30) key:@"PROJECT_NAME" enable:YES];
        
        [self createText:@"3" frame:CanvasRect(218, 0, 170, 30) key:@"PROJECT_MODELNAME" enable:YES];
        
        [self createText:@"4" frame:CanvasRect(388, 0, 45, 30) key: @"UINIT" enable:YES];
        
        [self createText:@"5" frame:CanvasRect(433, 0, 66, 30) key:@"QUANTITY" enable:YES];
        
        [self createText:@"6" frame:CanvasRect(499, 0, 120, 30) key:@"UNIT" enable:YES];
        
        [self createText:@"7" frame:CanvasRect(619, 0, 145, 30) key:@"TOTAL" enable:NO];
        
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

-(BaseTextField*) createText: (NSString*)title frame:(CGRect)frame key:(NSString*)key enable:(BOOL)enabled
{
    BaseTextField *textTextField = [[BaseTextField alloc]initWithFrame:frame];
    textTextField.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(15)];
    textTextField.text = title;
    [textTextField.layer setBorderWidth:0.5];
    textTextField.textAlignment = NSTextAlignmentCenter;
    textTextField.attributeKey = key;
    textTextField.enabled = enabled;
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
