#import <UIKit/UIKit.h>

@interface BaseController : UIViewController <UITextFieldDelegate>

#pragma mark - Override Methods

-(void) autoUpdateResuls;

#pragma mark - IB Action



- (IBAction)circlemore:(id)sender;
- (IBAction)rectangmore:(id)sender;
- (IBAction)hmore:(id)sender;




@end
