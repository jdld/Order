//
//  Utilities.m
//  Utility
//
//  Created by ZIYAO YANG on 15/8/20.
//  Copyright (c) 2015年 Zhong Rui. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+ (id)getUserDefaults:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)setUserDefaults:(NSString *)key content:(id)value
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)removeUserDefaults:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)uniqueVendor
{
    NSString *uniqueIdentifier = [Utilities getUserDefaults:@"kKeyVendor"];
    if (!uniqueIdentifier || uniqueIdentifier.length == 0) {
        NSUUID *uuid = [[UIDevice currentDevice] identifierForVendor];
        uniqueIdentifier = [uuid UUIDString];
        [Utilities setUserDefaults:@"kKeyVendor" content:uniqueIdentifier];
    }
    return uniqueIdentifier;
}

+ (id)getStoryboardInstanceByIdentity:(NSString*)identity
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    return [storyboard instantiateViewControllerWithIdentifier:identity];
}

+ (id)getStoryboardInstanceByIdentity:(NSString*)storyboard byIdentity:(NSString*)identity {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:storyboard bundle:[NSBundle mainBundle]];
    return [sb instantiateViewControllerWithIdentifier:identity];
}

+ (void)popUpAlertViewWithMsg:(NSString *)msg andTitle:(NSString* )title onView:(UIViewController *)vc
{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title == nil ? @"提示" : title message:msg == nil ? @"操作失败" : msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
    [alertView addAction:cancelAction];
    [vc presentViewController:alertView animated:YES completion:nil];
}

+ (UIActivityIndicatorView *)getCoverOnView:(UIView *)view
{
    UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    aiv.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.4];
    aiv.frame = view.bounds;
    [view addSubview:aiv];
    [aiv startAnimating];
    return aiv;
}

+ (NSString *)notRounding:(float)price afterPoint:(int)position
{
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:price];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [NSString stringWithFormat:@"%@",roundedOunces];
}

+ (UIImage *)imageUrl:(NSString *)url {
    if ([url isKindOfClass:[NSNull class]] || url == nil) {
        return nil;
    }
    static dispatch_queue_t backgroundQueue;
    if (backgroundQueue == nil) {
        backgroundQueue = dispatch_queue_create("com.beilyton.queue", NULL);
    }
    
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [directories objectAtIndex:0];
    __block NSString *filePath = nil;
    filePath = [documentDirectory stringByAppendingPathComponent:[url lastPathComponent]];
    UIImage *imageInFile = [UIImage imageWithContentsOfFile:filePath];
    if (imageInFile) {
        return imageInFile;
    }
    
    __block NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    if (!data) {
        NSLog(@"Error retrieving %@", url);
        return nil;
    }
    UIImage *imageDownloaded = [[UIImage alloc] initWithData:data];
    dispatch_async(backgroundQueue, ^(void) {
        [data writeToFile:filePath atomically:YES];
        //NSLog(@"Wrote to: %@", filePath);
    });
    return imageDownloaded;
}

+ (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame
{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = frame;
    return effectView;
}

+ (void)setTextFieldLeftPadding:(UITextField *)textField forWidth:(CGFloat)leftWidth
{
    CGRect frame = textField.frame;
    frame.size.width = leftWidth;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftview;
}

+ (float)stringHeight:(NSString *)str width:(float)width forfontSize:(CGFloat)fontSize{
    NSDictionary * dic2 = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:fontSize]};
    CGRect stringSize = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic2 context:nil];
    return stringSize.size.height;
}


+ (void)navigationRedDotSetTabBarToSelected:(UIViewController *)vc TabBar:(NSInteger)selectedIndex num:(int)num{
    NSInteger i = 2*selectedIndex + 1;
    UILabel *view = [[UILabel alloc]initWithFrame:CGRectMake(UI_SCREEN_W/10*i + 10, 5, 16, 16)];
    view.tag = selectedIndex + 888;
    view.backgroundColor = [UIColor blackColor];
    view.layer.borderWidth = 1;
    view.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor redColor]);
    view.layer.cornerRadius = 8;
    view.text = [NSString stringWithFormat:@"%d",num];
    view.font = [UIFont systemFontOfSize:10];
    view.textColor = [UIColor whiteColor];
    view.textAlignment = NSTextAlignmentCenter;
    [view setClipsToBounds:YES];
    
    
    [vc.navigationController.tabBarController.tabBar addSubview:view];
}

+ (void)removeRedDotGetTabBarToSelected:(NSInteger)selectedIndex onView:(UIViewController *)vc {
    for (UILabel *subView in [vc.navigationController.tabBarController.tabBar subviews]) {
        if (subView.tag == selectedIndex + 888) {
            [subView removeFromSuperview];
        }
    }
}


@end
