#import <UIKit/UIKit.h>

@interface BaseController : UIViewController <UITextFieldDelegate>

#pragma mark - Override Methods

-(void) autoUpdateResuls;

#pragma mark - IB Action

- (IBAction)refresh:(id)sender;
- (IBAction)view:(id)sender;
- (IBAction)profile1:(id)sender;
- (IBAction)profile2:(id)sender;
- (IBAction)paint:(id)sender;
- (IBAction)rolled:(id)sender;
- (IBAction)tools:(id)sender;
- (IBAction)circlemore:(id)sender;
- (IBAction)rectangmore:(id)sender;
- (IBAction)hmore:(id)sender;




@end
