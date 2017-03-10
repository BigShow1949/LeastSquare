//
//  Line.m
//  LeastSquare
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import "Line.h"

@implementation Line

-(void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();// 获取绘图上下文
    [self drawCurveLineWithContext:context];
}


- (void)drawCurveLineWithContext:(CGContextRef)context {
    CGContextSetLineWidth(context, 1);
    CGContextSetShouldAntialias(context, YES);
    CGContextSetRGBStrokeColor(context, 255/255.0f, 255/255.0f, 255/255.0f, self.alpha);
    
    for (id item in self.points) {
        CGPoint currentPoint = CGPointFromString(item);
        if ((int)currentPoint.y<(int)self.frame.size.height && currentPoint.y>0) {
            if ([self.points indexOfObject:item]==0) {
                CGContextMoveToPoint(context, currentPoint.x, currentPoint.y);
                continue;
            }
            CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
            CGContextStrokePath(context); //开始画线
            if ([self.points indexOfObject:item]<self.points.count) {
                CGContextMoveToPoint(context, currentPoint.x, currentPoint.y);
            }
        }
    }
    
}
@end
