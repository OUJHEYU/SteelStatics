#import "OrderTableViewCell.h"
#import "AppInterface.h"

@implementation OrderTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.textFields = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 8; i++) {
            if (i == 1) {
                [self createText:@"1" frame:CanvasRect(1, 0, 45, 30)];
            }
            if (i == 2) {
                [self createText:@"2" frame:CanvasRect(46, 0, 169, 30)];
            }
            if (i == 3) {
                [self createText:@"3" frame:CanvasRect(215, 0, 169, 30)];
            }
            if (i == 4) {
                [self createText:@"4" frame:CanvasRect(384, 0, 45, 30)];
            }
            if (i == 5) {
                [self createText:@"5" frame:CanvasRect(429, 0, 66, 30)];
            }
            if (i == 6) {
                [self createText:@"6" frame:CanvasRect(495, 0, 120, 30)];
            }
            if (i == 7) {
                [self createText:@"7" frame:CanvasRect(615, 0, 152, 30)];
            }
        }
    }
    return self;
}

-(UITextField*) createText: (NSString*)title frame:(CGRect)frame
{
    UITextField *text = [[UITextField alloc]initWithFrame:frame];
    text.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(15)];
    text.text = title;
    text.enabled = NO;
    text.textAlignment = UITextAlignmentCenter;
    [self.textFields addObject: text];
    [self.contentView addSubview: text];
    return text;
}



@end
