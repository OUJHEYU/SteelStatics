#import "DropDown1.h"

@implementation DropDown1

@synthesize tv,tableArray,textField;

-(id)initWithFrame:(CGRect)frame
{
    if (frame.size.height<145)
    {
        frameHeight = 140;
    }else
    {
        frameHeight = frame.size.height;
    }
    tabheight = frameHeight-30;
    
    frame.size.height = 30.0f;
    
    self=[super initWithFrame:frame];
    
    if(self)
    {   //預設不顯示下拉清單
        showList = NO;
        tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 27, frame.size.width, 0)];
        tv.delegate = self;
        tv.dataSource = self;
        tv.backgroundColor = [UIColor whiteColor];
        tv.separatorColor = [UIColor lightGrayColor];
        tv.hidden = YES;
        tv.layer.borderWidth = 0.6;
        tv.layer.borderColor = [[UIColor grayColor] CGColor];
        [self addSubview:tv];
        
        textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 31)];
        textField.borderStyle=UITextBorderStyleRoundedRect;//設置文字方塊的邊框風格
        [textField addTarget:self action:@selector(dropdown:) forControlEvents:UIControlEventTouchDown];
        textField.font = [UIFont fontWithName:@"Arial" size:14.0f];
        textField.textAlignment = UITextAlignmentCenter;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 1;
        [self addSubview:textField];
    }
    return self;
}

-(void)dropdown: (UITextField*)textFieldObj{
    //隱藏鍵盤
    [self.window endEditing:YES];
    [textFieldObj becomeFirstResponder];
    [textFieldObj resignFirstResponder];
    
    if (tv.tag == 1) {
        showList = NO;
        tv.tag = 0;
    }
    
    if (showList)
    {   //如果下拉清單已顯示
        showList = NO;
        tv.hidden = YES;

        CGRect sf = self.frame;
        sf.size.height = 30;
        self.frame = sf;
        CGRect frame = tv.frame;
        frame.size.height = 0;
        tv.frame = frame;
    }
    else
    {   //如果下拉清單尚未顯示，則進行顯示
        CGRect sf = self.frame;
        sf.size.height = frameHeight;
        
        //把dropdownList放到前面，防止下拉清單被別的控制項遮住
        [self.superview bringSubviewToFront:self];
        tv.hidden = NO;
        showList = YES;
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
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"count=%d",[tableArray count]);
    return [tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [tableArray objectAtIndex:[indexPath row]];
    cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell; 

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    textField.text = [tableArray objectAtIndex:[indexPath row]];
    showList = NO;
    tv.hidden = YES;
   
    CGRect sf = self.frame;
    sf.size.height = 30;
    self.frame = sf;
    CGRect frame = tv.frame;
    frame.size.height = 0;
    tv.frame = frame;
    
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