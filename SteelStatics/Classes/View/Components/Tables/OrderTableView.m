#import "OrderTableView.h"
#import "AppInterface.h"


#define REUSEIDENTIFIER @"reuseIdentifier"


@implementation OrderTableView
{
    ValueTextField* unit;
    ValueTextField* quantity;

}

@synthesize cellsDataContents;



-(void)awakeFromNib
{
    [self setDefaultVariables];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setDefaultVariables];
    }
    return self;
}

-(void) setDefaultVariables
{
    
    self.delegate = self;
    self.dataSource = self;

    cellsDataContents = [[NSMutableArray alloc] init];
    
    [self setExtraCellLineHidden:self];
    [self setSeparatorColor:[UIColor clearColor]];
    [self registerClass:[OrderTableViewCell class] forCellReuseIdentifier: REUSEIDENTIFIER];
    
    
    [self setupTableHeaderView];
    [self setupTableFooterView];
}

-(void) setupTableFooterView
{
    UIView* footerview = [[UIView alloc] initWithFrame:CanvasRect(0, 0, 0, 180)];
    footerview.backgroundColor = [UIColor clearColor];
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY年MM月dd日"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    UITextField *text1 = [TableViewHelper createText:@"聯繫人" frame:CanvasRect(404, 0, 90, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text2 = [TableViewHelper createText:@"" frame:CanvasRect(494, 0, 270, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text3 = [TableViewHelper createText:@"手機" frame:CanvasRect(404, 30, 90, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text4 = [TableViewHelper createText:@"" frame:CanvasRect(494, 30, 270, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text5 = [TableViewHelper createText:@"電話" frame:CanvasRect(404, 60, 90, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text6 = [TableViewHelper createText:@"0758-36348858" frame:CanvasRect(494, 60, 270, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text7 = [TableViewHelper createText:@"傳真" frame:CanvasRect(404, 90, 90, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text8 = [TableViewHelper createText:@"0758-36348758" frame:CanvasRect(494, 90, 270, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text9 = [TableViewHelper createText:@"地址" frame:CanvasRect(404, 120, 90, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text10 = [TableViewHelper createText:@"肇慶市大旺高新區" frame:CanvasRect(494, 120, 270, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text11 = [TableViewHelper createText:@"報價日期" frame:CanvasRect(404, 150, 90, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text12 = [TableViewHelper createText:locationString frame:CanvasRect(494, 150, 270, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextView *textView1 = [TableViewHelper createTextview:@"說明:\n\n1.本報價未含報建費、總包公司配合費、材料檢測費、防火塗料費、吊車樑及安裝費\n\n2.因材料波動較大，本報價有效期為三天\n\n3.落水管為±0.00以上" frame:CanvasRect(3 , 0, 401, 180)];
    [footerview addSubview:text1];
    [footerview addSubview:text2];
    [footerview addSubview:text3];
    [footerview addSubview:text4];
    [footerview addSubview:text5];
    [footerview addSubview:text6];
    [footerview addSubview:text7];
    [footerview addSubview:text8];
    [footerview addSubview:text9];
    [footerview addSubview:text10];
    [footerview addSubview:text11];
    [footerview addSubview:text12];
    [footerview addSubview:textView1];
    
    self.tableFooterView = footerview;
}


-(void) setupTableHeaderView
{
    
    UIView* headerview = [[UIView alloc] initWithFrame:CanvasRect(0, 0, 0, 175)];
    headerview.backgroundColor = [UIColor clearColor];
    
    UILabel* label1 = [TableViewHelper createLabel:@"信源鋼結構工程有限公司\n工程報價單" frame:CanvasRect(133.5,0,500,80) boldStstemFontOfSize: CanvasFontSize(30)];
    UILabel *label2 = [TableViewHelper createLabel:@"建設單位:" frame:CanvasRect(1,85,150,30) boldStstemFontOfSize:CanvasFontSize(25)];
    UILabel *label3 = [TableViewHelper createLabel:@"名稱:" frame:CanvasRect(21,115,50,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UILabel *label4 = [TableViewHelper createLabel:@"坡度:" frame:CanvasRect(280,115,50,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UILabel *label5 = [TableViewHelper createLabel:@"建築面積:" frame:CanvasRect(490,115,90,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UILabel *label6 = [TableViewHelper createLabel:@"規格:" frame:CanvasRect(21,145,50,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UILabel *label7 = [TableViewHelper createLabel:@"柱距:" frame:CanvasRect(280,145,50,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UILabel *label8 = [TableViewHelper createLabel:@"滴水高度:" frame:CanvasRect(490,145,90,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UITextField *text1 = [TableViewHelper createText:@"" frame:CanvasRect(160, 86.5,600,30) enabled:YES  size:CanvasFontSize(25) BorderWidth:0];
    UITextField *text2 = [TableViewHelper createText:@"" frame:CanvasRect(90, 116.5,175,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text3 = [TableViewHelper createText:@"" frame:CanvasRect(349, 116.5,150,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text4 = [TableViewHelper createText:@"" frame:CanvasRect(599, 116.5,160,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text5 = [TableViewHelper createText:@"" frame:CanvasRect(90, 146.5,175,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text6 = [TableViewHelper createText:@"" frame:CanvasRect(349, 146.5,150,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text7 = [TableViewHelper createText:@"" frame:CanvasRect(599, 146.5,160,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text8 = [TableViewHelper createText:@"" frame:CanvasRect(3, 85,761,30) enabled:NO  size:CanvasFontSize(20) BorderWidth:0.5];
    UITextField *text9 = [TableViewHelper createText:@"" frame:CanvasRect(3, 115,761,30) enabled:NO  size:CanvasFontSize(20) BorderWidth:0.5];
    UITextField *text10 = [TableViewHelper createText:@"" frame:CanvasRect(3, 145,761,30) enabled:NO  size:CanvasFontSize(20) BorderWidth:0.5];
    text1.textAlignment = NSTextAlignmentLeft;
    text2.textAlignment = NSTextAlignmentLeft;
    text3.textAlignment = NSTextAlignmentLeft;
    text4.textAlignment = NSTextAlignmentLeft;
    text5.textAlignment = NSTextAlignmentLeft;
    text6.textAlignment = NSTextAlignmentLeft;
    text7.textAlignment = NSTextAlignmentLeft;
    
    [headerview addSubview:text1];
    [headerview addSubview:text2];
    [headerview addSubview:text3];
    [headerview addSubview:text4];
    [headerview addSubview:text5];
    [headerview addSubview:text6];
    [headerview addSubview:text7];
    [headerview addSubview:text8];
    [headerview addSubview:text9];
    [headerview addSubview:text10];
    [headerview addSubview:label1];
    [headerview addSubview:label2];
    [headerview addSubview:label3];
    [headerview addSubview:label4];
    [headerview addSubview:label5];
    [headerview addSubview:label6];
    [headerview addSubview:label7];
    [headerview addSubview:label8];
    
    self.tableHeaderView = headerview;
}

#pragma mark - Private Methods

- (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
}

- (void)deselect
{
    [self deselectRowAtIndexPath:[self indexPathForSelectedRow] animated:YES];
}


#pragma mark - UITextField Delegate Methods
- (BOOL)textFieldShouldEndEditing:(BaseTextField *)textField
{
    BOOL should = YES;

    NSString* key = textField.attributeKey;
    NSString* text = textField.text;
    
    
    if ([key isEqualToString:@"UNIT"] || [key isEqualToString:@"QUANTITY"]) {
    
       should =  [SSNumberHelper isNumericValue: text];
        
        BOOL isNumeric = should;
        if (!isNumeric) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @"錯誤"
                                                            message: @"請輸入數字"
                                                           delegate: nil
                                                  cancelButtonTitle: @"確定"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
    return should;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSIndexPath* indexPath = [TableViewHelper getIndexPath: self cellSubView:textField];
    OrderTableViewCell* cell = (OrderTableViewCell*)[TableViewHelper getTableViewCell: self cellSubView:textField];
    NSDictionary* datas = [cell getDatas];
    [cellsDataContents replaceObjectAtIndex: indexPath.row withObject:datas];

    [self updateResults];
    [self reloadData];
}

-(void) updateResults
{
    for (NSMutableDictionary* dictionary in cellsDataContents) {
        
        if (isNotEmpty(dictionary[@"UNIT"]) && isNotEmpty(dictionary[@"QUANTITY"])) {
            
            float unitPrice = [dictionary[@"UNIT"] floatValue];
            float quantityPrice = [dictionary[@"QUANTITY"] floatValue];
            
            float total = unitPrice * quantityPrice;
            NSString* totalString = [NSString stringWithFormat:@"%.0f", total];
            [dictionary setObject:totalString forKey:@"TOTAL"];
        }
    }
}


#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CanvasHeight(50);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.1f];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CanvasHeight(30);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* section0HeaderView = [[UIView alloc] init];
    UITextField *text11 = [TableViewHelper createText:@"序號" frame:CanvasRect(3, 0, 51, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text12 = [TableViewHelper createText:@"項目名稱" frame:CanvasRect(54, 0, 175, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text13 = [TableViewHelper createText:@"材料規格" frame:CanvasRect(229, 0, 175, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text14 = [TableViewHelper createText:@"公式" frame:CanvasRect(404, 0, 90, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text15 = [TableViewHelper createText:@"單位" frame:CanvasRect(494, 0, 50, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text16 = [TableViewHelper createText:@"數量" frame:CanvasRect(544, 0, 70, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text17 = [TableViewHelper createText:@"單價" frame:CanvasRect(614, 0, 70, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text18 = [TableViewHelper createText:@"總價" frame:CanvasRect(684, 0, 80, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    
    [section0HeaderView addSubview:text11];
    [section0HeaderView addSubview:text12];
    [section0HeaderView addSubview:text13];
    [section0HeaderView addSubview:text14];
    [section0HeaderView addSubview:text15];
    [section0HeaderView addSubview:text16];
    [section0HeaderView addSubview:text17];
    [section0HeaderView addSubview:text18];

    return section0HeaderView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellsDataContents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSEIDENTIFIER forIndexPath:indexPath];
    [cell setTextFieldsDelegate: self];
    
    NSDictionary* rowContents = [cellsDataContents objectAtIndex: indexPath.row];
    [cell setDatas: rowContents index:indexPath.row];
    // Configure the cell...
    return cell;
}

// ----------------------- Delete Begin -----------------------

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [cellsDataContents removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationBottom];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view

    }
    [tableView reloadData];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"刪除";
}
// ----------------------- Delete Begin -----------------------
#pragma mark - Table view delegate


@end