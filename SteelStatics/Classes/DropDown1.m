#import "DropDown1.h"
#import "AppInterface.h"

@implementation DropDown1
{
    UITapGestureRecognizer *gestureRecognizer;
}

@synthesize tv,tableArray,textField;

-(id)initWithFrame:(CGRect)frame
{
    if (frame.size.height<CanvasHeight(145))
    {
        frameHeight = CanvasHeight(110);
    }else
    {
        frameHeight = frame.size.height;
    }
    tabheight = frameHeight-CanvasHeight(30);
    
    frame.size.height = CanvasHeight(30.0f);
    
    self=[super initWithFrame:frame];
    
    if(self)
    {
        tv = [[UITableView alloc] initWithFrame:CanvasRect(0, 27, frame.size.width, 0)];
        [tv setSizeWidth: frame.size.width];
        
        
        // UITableViewCell in ios7 now has gaps on left and right
        // http://stackoverflow.com/questions/18982347/uitableviewcell-in-ios7-now-has-gaps-on-left-and-right/19059028#19059028
        if ([tv respondsToSelector:@selector(setSeparatorInset:)]) [tv setSeparatorInset:UIEdgeInsetsZero];     // ios 7
        
        tv.delegate = self;
        tv.dataSource = self;
        tv.backgroundColor = [UIColor whiteColor];
        tv.separatorColor = [UIColor lightGrayColor];
        tv.layer.borderWidth = 0.6;
        tv.layer.borderColor = [[UIColor grayColor] CGColor];
        [self addSubview:tv];
        
        textField = [[UITextField alloc] initWithFrame:CanvasRect(0, 0, frame.size.width, 31)];
        [textField setSizeWidth: frame.size.width];
        textField.borderStyle=UITextBorderStyleRoundedRect;//設置文字方塊的邊框風格
        [textField addTarget:self action:@selector(textFieldDidClicked:) forControlEvents:UIControlEventTouchDown];
        CGFloat fontsize = CanvasFontSize(12.0f);
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            fontsize -= 0.7;
        }
        textField.font = [UIFont fontWithName:@"Arial" size:fontsize];
        textField.textAlignment = NSTextAlignmentCenter;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 1;
        [self addSubview:textField];
        [self bringSubviewToFront:textField];
    }
    return self;
}



- (void)tapRecognized:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        [self pullup];
    }
}

#pragma mark - UIGestureRecognizerDelegate

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    UIView* touchView = touch.view;
    while (touchView != nil && ![touchView isKindOfClass: [DropDown1 class]]) {
        touchView = touchView.superview;
    }
    
    if (touchView == self )
    {
        return NO;
    }
    else if([touch.view isKindOfClass:[UIControl class]]){
        [self pullup];
        return NO;
    }
    else
    {
        return YES;
    }
}

-(void) textFieldDidClicked: (UITextField*)textFieldObj
{
    [textFieldObj becomeFirstResponder];
    [textFieldObj resignFirstResponder];
    [self.window endEditing:YES];
    
    if([tv sizeHeight] != 0 ) {
        [self pullup];
    } else {
        [self dropdown];
    }
}
-(void)pullup
{
    [UIView animateWithDuration: 0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self setSizeHeight: CanvasHeight(30)];
        [tv setSizeHeight: 0];
    } completion:nil];
    
    [self.window removeGestureRecognizer:gestureRecognizer];
}

-(void)dropdown{
    
    // registry Hide tableview event
    NSArray* gestures = [self.window gestureRecognizers];
    if (! [gestures containsObject: gestureRecognizer]) {
        if (! gestureRecognizer) {
            gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognized:)];
            gestureRecognizer.delegate = self;
        }
        [self.window addGestureRecognizer:gestureRecognizer];
    }
    
    
    //隱藏鍵盤

    //如果下拉清單尚未顯示，則進行顯示
    CGRect sf = self.frame;
    sf.size.height = frameHeight;
    
    //把dropdownList放到前面，防止下拉清單被別的控制項遮住
    [self.superview bringSubviewToFront:self];
    //顯示下拉清單
    CGRect frame = tv.frame;
    frame.size.height = 0;
    tv.frame = frame;
    frame.size.height = tabheight;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.frame = sf;
    tv.frame = frame;
    [UIView commitAnimations];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"count=%lu",(unsigned long)[tableArray count]);
    return [tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    UILabel* label = (UILabel*)[cell viewWithTag: 2200];
    if (!label) {
        label = [[UILabel alloc] initWithFrame:CanvasRect(20, 5, 30, 20)];
        label.tag = 2200;
        [cell.contentView addSubview: label];
    }
    
    label.font = [UIFont systemFontOfSize: CanvasFontSize(12.0f)];
    label.text = [tableArray objectAtIndex:[indexPath row]];
    [label adjustWidthToFontText];
    //    [ColorHelper setBorderRecursive: cell];
    
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CanvasHeight(25);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    textField.text = [tableArray objectAtIndex:[indexPath row]];
    
    [self pullup];
    
    if (self.didSelectIndexAction) {
        self.didSelectIndexAction (self, indexPath);
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end