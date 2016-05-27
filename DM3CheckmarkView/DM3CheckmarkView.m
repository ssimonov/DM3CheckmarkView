//
// DM3CheckmarkView.m
// DM3CheckmarkView
//
// Created by Dmitry Beloborodov on 26/05/16.
// Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "DM3CheckmarkView.h"

@interface DM3CheckmarkView ()

@property BOOL shouldAnimateDrawing;

@end

@implementation DM3CheckmarkView

- (UIColor *)circleColor {
    if (!_circleColor) {
        _circleColor = [UIColor colorWithRed:46.0f / 255.0f green:204.0f / 255.0f blue:113.0f / 255.0f alpha:1.0];
    }

    return _circleColor;
}

- (UIColor *)checkmarkColor {
    if (!_checkmarkColor) {
        _checkmarkColor = [UIColor whiteColor];
    }

    return _checkmarkColor;
}

- (double)animationDuration {
    if (!_animationDuration) {
        _animationDuration = 0.8;
    }

    return _animationDuration;
}

- (void)animateCheckmark {
    self.shouldAnimateDrawing = YES;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    CGFloat diametr = 0.98 * MIN(self.bounds.size.width, self.bounds.size.height);

    // Set up the shape of the circle
    int radius = diametr / 2;
    CAShapeLayer *circle = [CAShapeLayer layer];
    // Make a circular shape
    circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0 * radius, 2.0 * radius)
                                             cornerRadius:radius].CGPath;
    // Center the shape in self.view
    circle.position = CGPointMake(CGRectGetMidX(self.bounds) - radius,
                                  CGRectGetMidY(self.bounds) - radius);

    // Configure the apperence of the circle
    circle.fillColor = self.circleColor.CGColor;
    circle.strokeColor = self.circleColor.CGColor;
    circle.lineWidth = 1;

    // Add to parent layer
    [self.layer addSublayer:circle];

    if (self.shouldAnimateDrawing) {
        UIBezierPath *path = [UIBezierPath bezierPath];

        CGPoint viewCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        CGPoint p1 = CGPointMake(viewCenter.x - (radius * 0.6), viewCenter.y);
        CGPoint p2 = CGPointMake(viewCenter.x - (radius * 0.2), viewCenter.y + (radius * 0.4));
        CGPoint p3 = CGPointMake(viewCenter.x + (radius * 0.6), viewCenter.y - (radius * 0.4));

        [path moveToPoint:p1];
        [path addLineToPoint:p2];
        [path addLineToPoint:p3];

        CAShapeLayer *pathLayer = [CAShapeLayer layer];
        pathLayer.frame = self.bounds;
        pathLayer.path = path.CGPath;
        pathLayer.strokeColor = self.checkmarkColor.CGColor;
        pathLayer.fillColor = nil;
        pathLayer.lineWidth = diametr / 10.0f;
        pathLayer.lineJoin = kCALineCapSquare;

        [self.layer addSublayer:pathLayer];

        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = self.animationDuration;
        pathAnimation.fromValue = @0;
        pathAnimation.toValue = @1;
        pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
        self.shouldAnimateDrawing = NO;
    }
}

@end
