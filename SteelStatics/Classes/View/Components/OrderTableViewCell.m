#import "OrderTableViewCell.h"
#import "AppInterface.h"

@implementation OrderTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.textFields = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 7; i++) {
            UITextField* tx = [[UITextField alloc] initWithFrame: CanvasRect((i * 95)+40, 0, 100, 30)];
            tx.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(20)];
            tx.enabled = NO;
            [self.textFields addObject: tx];
            [self.contentView addSubview: tx];
        }
        
    }
    return self;
}
@end
