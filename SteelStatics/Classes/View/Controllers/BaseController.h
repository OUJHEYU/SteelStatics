#import <UIKit/UIKit.h>

@interface BaseController : UIViewController <UITextFieldDelegate>


#pragma mark - Override Methods

-(void) autoUpdateResuls;

#pragma mark - IB Action

- (IBAction)refresh:(id)sender;

@end
