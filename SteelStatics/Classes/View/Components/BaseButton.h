#import <UIKit/UIKit.h>

@interface BaseButton : UIButton

@property(strong) NSString* actionKey;

@property(copy) void(^didClickButtonAction)(BaseButton* button);

@end
