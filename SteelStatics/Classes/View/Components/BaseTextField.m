#import "BaseTextField.h"

@implementation BaseTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(float) value
{
    return [self.text floatValue];
}


-(void) setValue:(float)value
{
    self.text = [[NSNumber numberWithFloat: value] stringValue];
}



@end
