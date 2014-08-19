#import "ProjectnameTextField.h"

@implementation ProjectnameTextField

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
    self.attributeKey = @"PROJECT_NAME";
}

@end
