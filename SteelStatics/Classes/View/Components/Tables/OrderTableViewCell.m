#import "OrderTableViewCell.h"
#import "AppInterface.h"

@implementation OrderTableViewCell
{
    BOOL isTextFieldsHaveSetDelegate;
    
    FormulaView* formulaView;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        CGFloat height = 50;
        
        [self createTextAndAddToContentView:@"1" frame:CanvasRect(3, 0, 51, height) key:@"NO." enable:NO];
        
        [self createTextAndAddToContentView:@"2" frame:CanvasRect(54, 0, 175, height) key:@"PROJECT_NAME" enable:YES];
        
        [self createTextAndAddToContentView:@"3" frame:CanvasRect(229, 0, 175, height) key:@"PROJECT_MODELNAME" enable:YES];
        
        [self createFormulaView:CanvasRect(404, 0, 90, height)];
        
        [self createTextAndAddToContentView:@"5" frame:CanvasRect(494, 0, 50, height) key: @"UINIT" enable:YES];
        
        [self createTextAndAddToContentView:@"6" frame:CanvasRect(544, 0, 70, height) key:@"QUANTITY" enable:YES];
        
        [self createTextAndAddToContentView:@"7" frame:CanvasRect(614, 0, 70, height) key:@"UNIT" enable:YES];
        
        [self createTextAndAddToContentView:@"8" frame:CanvasRect(684, 0, 80, height) key:@"TOTAL" enable:NO];
        
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
    
    
    // FORMULA
    NSMutableDictionary* caluateDictionary = [values objectForKey:@"FORMULA"];
    
    [formulaView clearDatas];
    [formulaView setDatas: caluateDictionary];
    
    
    
    
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

-(UIView*) createFormulaView:(CGRect)frame
{
    formulaView = [[FormulaView alloc]initWithFrame:frame];
    [self.contentView addSubview:formulaView];
    return formulaView;
}


-(BaseTextField*) createTextAndAddToContentView: (NSString*)title frame:(CGRect)frame key:(NSString*)key enable:(BOOL)enabled
{
    BaseTextField* textTextField = [SSViewHelper createText:title frame:frame key:key enable:enabled];
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
