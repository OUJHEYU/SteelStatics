#import "AppScrollView.h"

@implementation AppScrollView
{
    UITapGestureRecognizer* doubleTapRecognizer;
}


-(void)awakeFromNib
{
    self.delegate = self;
    self.minimumZoomScale = 1.0f;
    self.maximumZoomScale = 2.0f;
    
//    if (! doubleTapRecognizer) {
//        doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(zoomAction:)];
//        doubleTapRecognizer.numberOfTapsRequired = 3;
//        [self addGestureRecognizer: doubleTapRecognizer];
//    }
}


#pragma mark - Action

-(void) zoomAction:(UITapGestureRecognizer*)sender
{
    
    // zoom
    if (self.zoomScale != 1.0f) {
        [self setZoomScale: 1.0f animated:YES];
    } else {
//        [self setZoomScale: 2.0f animated:YES];
        CGRect zoomRect = [self zoomRectForScale:4 withCenter:[sender locationInView:sender.view]];
        [self zoomToRect:zoomRect animated:YES];
    }
}


- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    zoomRect.size.height = [[self.subviews firstObject] frame].size.height / scale;
    zoomRect.size.width  = [[self.subviews firstObject] frame].size.width  / scale;
    
    center = [[self.subviews firstObject] convertPoint:center fromView:self];
    
    zoomRect.origin.x    = center.x - ((zoomRect.size.width / 2.0));
    zoomRect.origin.y    = center.y - ((zoomRect.size.height / 2.0));
    
    return zoomRect;
}


#pragma mark - Delegage Methods
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView.subviews firstObject];
}


@end
