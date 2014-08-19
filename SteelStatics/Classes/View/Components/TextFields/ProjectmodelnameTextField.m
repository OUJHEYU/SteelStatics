#import "ProjectmodelnameTextField.h"

@implementation ProjectmodelnameTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    self.attributeKey = @"PROJECT_MODELNAME";
}

@end
