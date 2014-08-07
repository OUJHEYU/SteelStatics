#import <Foundation/Foundation.h>

#define VIEW     [ViewManager shareInstance]

@class NavigatorController;

@interface ViewManager : NSObject


@property (strong) NavigatorController* navigator;

+(ViewManager*) shareInstance;

@end
