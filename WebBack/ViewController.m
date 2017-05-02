//
//  ViewController.m
//  WebBack
//
//  Created by Sundear on 2017/5/2.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import "ViewController.h"

#import "HtmlC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    HtmlC *vc=[HtmlC new];
    vc.HtmlUrl=[NSURL URLWithString:@"http://www.163.com"];
    UINavigationController *Nav=[[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:Nav animated:YES completion:nil];
}






@end
