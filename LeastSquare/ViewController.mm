//
//  ViewController.m
//  test2
//
//  Created by apple on 17/3/9.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "Line.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {

    [super viewDidLoad];
    
//    // 模拟数据
//    CGFloat x = 1;
//    NSMutableArray *tempArr = [NSMutableArray array];
//    for (int i = 1; i < 10;) {
//        CGPoint point = CGPointMake(x, i);
//        NSString *str = NSStringFromCGPoint(point);
//        [tempArr addObject:str];
//        x += 10;
//        i += 2;
//    }
    
    MyView *view = [[MyView alloc] initWithFrame:CGRectMake(20, 100, 300, 100)];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    
    NSMutableArray *tempArr = [NSMutableArray array];
    NSMutableArray<NSNumber*> *arry1 = [NSMutableArray array];
    NSMutableArray<NSNumber*> *arry2 = [NSMutableArray array];

    CGFloat x,y;
    for (int i = 0; i < 50; i++) {
        x = i;
//        y = x*x*x*0.0001 - x*x*0.06 + 10*x + 10;
        y = -0.5614*x*x+0.8287*x+1.15560;
        NSLog(@"y = %f", y);
        [arry2 addObject:@(y)];
        [arry1 addObject:@(x)];
    }
  
    
    for (int i = 0; i < 18; i++) {
        CGFloat y = 100 - arry2[i].doubleValue;
        CGPoint point = CGPointMake(arry1[i].doubleValue * 6, y);
        NSString *str = NSStringFromCGPoint(point);
        [tempArr addObject:str];
    }
    
//    NSArray *point = @[];
    

    
    Line *line = [[Line alloc] initWithFrame:view.bounds];
    line.points = tempArr;
    [view addSubview:line];
    
}


@end
