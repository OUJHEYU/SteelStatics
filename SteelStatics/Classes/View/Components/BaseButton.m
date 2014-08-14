#import "BaseButton.h"

@implementation BaseButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self addTarget: self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}


-(void) clickAction: (UIButton*)button
{
    if (self.didClickButtonAction) {
        self.didClickButtonAction(self);
    }
}


@end
