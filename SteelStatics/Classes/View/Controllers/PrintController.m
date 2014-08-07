#import "AppInterface.h"
#import "PrintController.h"

@interface PrintController ()

@end

@implementation PrintController
//鋼板 caculate field
@synthesize boardl;
@synthesize boardw;
@synthesize boardh;
@synthesize boardpcs;
@synthesize boardpaintprice;
@synthesize boardpaintarea;
@synthesize boardpercentage;
@synthesize boardpaintface;
//圓管 caculate field
@synthesize circlepipediamter;
@synthesize circlepipethick;
@synthesize circlepipem;
@synthesize circlepipepcs;
@synthesize circlepipepaintprice;
@synthesize circlepipepaintface;
@synthesize circlepipepercentage;
//圓鋼 caculate field
@synthesize circlesteeldiamter;
@synthesize circlesteelm;
@synthesize circlesteelpcs;
@synthesize circlesteelpaintprice;
@synthesize circlesteelpaintface;
@synthesize circlesteelpercentage;
//H型鋼 caculate field
@synthesize hseelh2;
@synthesize hseelb;
@synthesize hseelt1;
@synthesize hseelt2;
@synthesize hseelm;
@synthesize hseelpcs;
@synthesize hseelpaintprice;
@synthesize hseelpaintface;
@synthesize hseelpercentage;

//Base field
@synthesize hsteelneedl;
@synthesize hsteelneedkg;
@synthesize hsteelton;
@synthesize hsteelprice;
@synthesize circlepipeneedl;
@synthesize circlepipeeedkg;
@synthesize circlepipeton;
@synthesize circlepipeprice;
@synthesize circlesteelneedl;
@synthesize circlesteelneedkg;
@synthesize circlesteelton;
@synthesize circlesteelprice;
@synthesize boardneedl;
@synthesize boardneedkg;
@synthesize boardton;
@synthesize boardprice;
#pragma mark - Override Methods
-(void) autoUpdateResuls
{
    circlepipeprice.value = circlepipepaintprice.value * 1.0567;
    circlepipeeedkg.value = ((3.1415926 * circlepipediamter.value / 10 * circlepipem.value * 100 * circlepipepcs.value) / 10000) * ((100 + circlepipepercentage.value)/100)/circlepipepaintface.value;
    circlepipeneedl.value = circlepipeeedkg.value * 0.9463325;
    circlepipeton.value = circlepipeeedkg.value/((0.02466 * circlepipethick.value * (circlepipediamter.value - circlepipethick.value)) * circlepipem.value * circlepipepcs.value)*1000*circlepipepaintprice.value;
    boardprice.value = boardpaintprice.value * 1.0567;
    boardneedkg.value = ((boardl.value*boardw.value)/100*boardpaintface.value)/10000*((100 + boardpercentage.value)/100)/boardpaintarea.value;;
    boardneedl.value = boardneedkg.value * 0.9463325;
    boardton.value = boardneedkg.value / ((boardl.value * boardw.value * boardh.value * 0.00000785) * boardpcs.value)*1000*boardpaintprice.value;
    circlesteelprice.value = circlesteelpaintprice.value * 1.0567;
    circlesteelneedkg.value = ((3.1415926*circlesteeldiamter.value/10*100*circlesteelm.value*circlesteelpcs.value)/10000)/circlesteelpaintface.value*((100+circlesteelpercentage.value)/100);
    circlesteelneedl.value = circlesteelneedkg.value * 0.9463325;
    circlesteelton.value = circlesteelneedkg.value / ((0.00617 * circlesteeldiamter.value * circlesteeldiamter.value) * circlesteelm.value * circlesteelpcs.value)*circlesteelpaintprice.value*1000;
    hsteelprice.value = hseelpaintprice.value * 1.0567;
    hsteelneedkg.value = (((hseelh2.value*2+hseelb.value*4)*10*hseelm.value*hseelpcs.value)/10000)/hseelpaintface.value*((100+hseelpercentage.value)/100);
    hsteelneedl.value = hsteelneedkg.value * 0.9463325;
    hsteelton.value = hsteelneedkg.value / ((hseelh2.value*hseelt1.value+hseelb.value*hseelt2.value*2)*0.00785* hseelm.value * hseelpcs.value)*1000*hseelpaintprice.value;
}

- (void)viewDidLoad
{   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)boardpaint {
    boardl.text = nil;
    boardw.text = nil;
    boardh.text = nil;
    boardpcs.text = nil;
    boardpaintprice.text = nil;
    boardpaintarea.text = nil;
    boardpercentage.text = nil;
    boardpaintface.text = nil;
    boardneedl.text = nil;
    boardneedkg.text = nil;
    boardton.text = nil;
    boardprice.text = nil;
    
    [boardw becomeFirstResponder];
    [boardw resignFirstResponder];
}
- (IBAction)circlepipepaint {
    circlepipediamter.text = nil;
    circlepipethick.text = nil;
    circlepipem.text = nil;
    circlepipepcs.text = nil;
    circlepipepaintprice.text = nil;
    circlepipepaintface.text = nil;
    circlepipepercentage.text = nil;
    circlepipeneedl.text = nil;
    circlepipeeedkg.text = nil;
    circlepipeton.text = nil;
    circlepipeprice.text = nil;
    
    [boardw becomeFirstResponder];
    [boardw resignFirstResponder];
}
- (IBAction)circlesteelpaint {
    circlesteeldiamter.text = nil;
    circlesteelm.text = nil;
    circlesteelpcs.text = nil;
    circlesteelpaintprice.text = nil;
    circlesteelpaintface.text = nil;
    circlesteelpercentage.text = nil;
    circlesteelneedl.text = nil;
    circlesteelneedkg.text = nil;
    circlesteelton.text = nil;
    circlesteelprice.text = nil;
    
    [boardw becomeFirstResponder];
    [boardw resignFirstResponder];
}
- (IBAction)hsteelpaint {
    hseelh2.text = nil;
    hseelb.text = nil;
    hseelt1.text = nil;
    hseelt2.text = nil;
    hseelm.text = nil;
    hseelpcs.text = nil;
    hseelpaintprice.text = nil;
    hseelpaintface.text = nil;
    hseelpercentage.text = nil;
    hsteelneedl.text = nil;
    hsteelneedkg.text = nil;
    hsteelton.text = nil;
    hsteelprice.text = nil;
    
    [boardw becomeFirstResponder];
    [boardw resignFirstResponder];
}


@end
