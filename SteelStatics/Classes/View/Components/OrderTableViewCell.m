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
            UITextField* tx = [[UITextField alloc] initWithFrame: CanvasRect(i * 80, 0, 80, 50)];
            [self.textFields addObject: tx];
            [self.contentView addSubview: tx];
        }
        
    }
    return self;
}

@end
