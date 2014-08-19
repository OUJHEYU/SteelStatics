#import "OrderTableView.h"
#import "AppInterface.h"


#define REUSEIDENTIFIER @"reuseIdentifier"


@implementation OrderTableView


@synthesize dataContents;


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
    
    NSArray* temp = @[@[@"標準H型鋼",@"HW 100*100*6*8",@"個",@"10",@"130,000",@"1,200,000"], @[@"等邊矩形管",@"25*1.20",@"個",@"10",@"10,000",@"56,656"]];
    dataContents = [[NSMutableArray alloc] init];
    [dataContents addObjectsFromArray: temp];
    
    
    [self setExtraCellLineHidden:self];
    [self setSeparatorColor:[UIColor clearColor]];
    [self registerClass:[OrderTableViewCell class] forCellReuseIdentifier: REUSEIDENTIFIER];
    
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


#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CanvasHeight(30);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.1f];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CanvasHeight(205);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerview = [[UIView alloc]init];
    headerview.backgroundColor = [UIColor clearColor];
    tableView.tableHeaderView = headerview;
    UILabel* label1 = [TableViewHelper createLabel:@"信源鋼結構工程有限公司\n工程報價單" frame:CanvasRect(133.5,0,500,80) boldStstemFontOfSize: CanvasFontSize(30)];
    UILabel *label2 = [TableViewHelper createLabel:@"建設單位:" frame:CanvasRect(1,85,150,30) boldStstemFontOfSize:CanvasFontSize(25)];
    UILabel *label3 = [TableViewHelper createLabel:@"名稱:" frame:CanvasRect(21,115,50,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UILabel *label4 = [TableViewHelper createLabel:@"坡度:" frame:CanvasRect(280,115,50,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UILabel *label5 = [TableViewHelper createLabel:@"建築面積:" frame:CanvasRect(490,115,90,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UILabel *label6 = [TableViewHelper createLabel:@"規格:" frame:CanvasRect(21,145,50,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UILabel *label7 = [TableViewHelper createLabel:@"柱距:" frame:CanvasRect(280,145,50,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UILabel *label8 = [TableViewHelper createLabel:@"滴水高度:" frame:CanvasRect(490,145,90,30) boldStstemFontOfSize:CanvasFontSize(18)];
    UITextField *text1 = [TableViewHelper createText:@"廣東恆大電梯有限公司" frame:CanvasRect(160, 86.5,600,30) enabled:YES  size:CanvasFontSize(25) BorderWidth:0];
    UITextField *text2 = [TableViewHelper createText:@"車間一" frame:CanvasRect(90, 116.5,175,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text3 = [TableViewHelper createText:@"20%" frame:CanvasRect(349, 116.5,150,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text4 = [TableViewHelper createText:@"7200平方公尺" frame:CanvasRect(599, 116.5,160,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text5 = [TableViewHelper createText:@"48mX50m" frame:CanvasRect(90, 146.5,175,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text6 = [TableViewHelper createText:@"7.5m" frame:CanvasRect(349, 146.5,150,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text7 = [TableViewHelper createText:@"10.0m" frame:CanvasRect(599, 146.5,160,30) enabled:YES  size:CanvasFontSize(18) BorderWidth:0];
    UITextField *text8 = [TableViewHelper createText:@"" frame:CanvasRect(3, 85,761,30) enabled:NO  size:CanvasFontSize(20) BorderWidth:0.5];
    UITextField *text9 = [TableViewHelper createText:@"" frame:CanvasRect(3, 115,761,30) enabled:NO  size:CanvasFontSize(20) BorderWidth:0.5];
    UITextField *text10 = [TableViewHelper createText:@"" frame:CanvasRect(3, 145,761,30) enabled:NO  size:CanvasFontSize(20) BorderWidth:0.5];
    UITextField *text11 = [TableViewHelper createText:@"序號" frame:CanvasRect(3, 175, 46, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text12 = [TableViewHelper createText:@"項目名稱" frame:CanvasRect(49, 175, 169, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text13 = [TableViewHelper createText:@"材料規格" frame:CanvasRect(218, 175, 170, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text14 = [TableViewHelper createText:@"單位" frame:CanvasRect(388, 175, 45, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text15 = [TableViewHelper createText:@"數量" frame:CanvasRect(433, 175, 66, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text16 = [TableViewHelper createText:@"單價" frame:CanvasRect(499, 175, 120, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
    UITextField *text17 = [TableViewHelper createText:@"總價" frame:CanvasRect(619, 175, 145, 30) enabled:NO  size:CanvasFontSize(18) BorderWidth:0.5];
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
    [headerview addSubview:text11];
    [headerview addSubview:text12];
    [headerview addSubview:text13];
    [headerview addSubview:text14];
    [headerview addSubview:text15];
    [headerview addSubview:text16];
    [headerview addSubview:text17];
    [headerview addSubview:label1];
    [headerview addSubview:label2];
    [headerview addSubview:label3];
    [headerview addSubview:label4];
    [headerview addSubview:label5];
    [headerview addSubview:label6];
    [headerview addSubview:label7];
    [headerview addSubview:label8];
    return headerview;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CanvasHeight(180);
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* footerview = [[UIView alloc]init];
    footerview.backgroundColor = [UIColor clearColor];
    tableView.tableFooterView = footerview;
    UITextField *text1 = [TableViewHelper createText:@"聯繫人" frame:CanvasRect(388, 0, 111, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text2 = [TableViewHelper createText:@"林廷宇" frame:CanvasRect(499, 0, 265, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text3 = [TableViewHelper createText:@"手機" frame:CanvasRect(388, 30, 111, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text4 = [TableViewHelper createText:@"13827587758" frame:CanvasRect(499, 30, 265, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text5 = [TableViewHelper createText:@"電話" frame:CanvasRect(388, 60, 111, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text6 = [TableViewHelper createText:@"0758-36348858(838)" frame:CanvasRect(499, 60, 265, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text7 = [TableViewHelper createText:@"傳真" frame:CanvasRect(388, 90, 111, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text8 = [TableViewHelper createText:@"0758-36348858(838)" frame:CanvasRect(499, 90, 265, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text9 = [TableViewHelper createText:@"地址" frame:CanvasRect(388, 120, 111, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text10 = [TableViewHelper createText:@"肇慶市大旺高新區" frame:CanvasRect(499, 120, 265, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text11 = [TableViewHelper createText:@"報價日期" frame:CanvasRect(388, 150, 111, 30) enabled:NO size:CanvasFontSize(15) BorderWidth:0.5];
    UITextField *text12 = [TableViewHelper createText:@"2014年8月23日" frame:CanvasRect(499, 150, 265, 30) enabled:YES size:CanvasFontSize(15) BorderWidth:0.5];
    UITextView *textView1 = [TableViewHelper createTextview:@"說明:\n\n1.本報價未含報建費、總包公司配合費、材料檢測費、防火塗料費、吊車樑及安裝費\n\n2.因材料波動較大，本報價有效期為三天\n\n3.落水管為±0.00以上" frame:CanvasRect(3 , 0, 385, 180)];
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
    return footerview;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataContents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSEIDENTIFIER forIndexPath:indexPath];
    NSArray* rowContents = [dataContents objectAtIndex: indexPath.row];
    NSArray* textFields = [cell textFields];
    for (int i = 0; i < textFields.count; i++) {
        UITextField* tf = textFields[i];
        if (i == 0) {
            tf.text = [NSString stringWithFormat: @"%ld", indexPath.row + 1];
        } else {
            
            if (i < rowContents.count) {
                tf.text = rowContents[i - 1];
            }
        }
    }
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
        [dataContents removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"刪除";
}
// ----------------------- Delete Begin -----------------------


#pragma mark - Table view delegate

@end
