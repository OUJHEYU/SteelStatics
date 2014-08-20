#import "OrderTableViewCell.h"
#import "AppInterface.h"

@implementation OrderTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.textFields = [[NSMutableDictionary alloc] init];
        
        [self createText:@"1" frame:CanvasRect(3, 0, 46, 30) key:@"NO."];
        
        [self createText:@"2" frame:CanvasRect(49, 0, 169, 30) key:@"PROJECT_NAME"];
        
        [self createText:@"3" frame:CanvasRect(218, 0, 170, 30) key:@"PROJECT_MODELNAME"];
        
        [self createText:@"4" frame:CanvasRect(388, 0, 45, 30) key: @"UINIT"];
        
        [self createText:@"5" frame:CanvasRect(433, 0, 66, 30) key:@"QUANTITY"];
        
        [self createText:@"6" frame:CanvasRect(499, 0, 120, 30) key:@"UNIT"];
        
        [self createText:@"7" frame:CanvasRect(619, 0, 145, 30) key:@"TOTAL"];

    }
    return self;
}

-(void)setDatas:(NSDictionary *)values index:(NSUInteger)index
{
    for (NSString* key in self.textFields) {
        UITextField* tx = self.textFields[key];
        
        if ([key isEqualToString:@"NO."]) {
            tx.text = [NSString stringWithFormat: @"%ld", index + 1];
            tx.enabled = NO;
        } else {
            NSString* value = values[key];
            tx.text = value;
        }
    }

}

-(UITextField*) createText: (NSString*)title frame:(CGRect)frame key:(NSString*)key
{
    
    UITextField *text = [[UITextField alloc]initWithFrame:frame];
    text.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(15)];
    text.text = title;
    [text.layer setBorderWidth:0.5];
    text.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview: text];
    [self.textFields setObject: text forKey:key];
    return text;
}

@end
