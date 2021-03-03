//
//  PDHitThroughView.m
//  PDHitThroughView
//
//  Created by liang on 2021/3/3.
//

#import "PDHitThroughView.h"

@implementation PDHitThroughView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInitializeConfiguration];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupInitializeConfiguration];
    }
    return self;
}

#pragma mark - Internal Methods
- (void)setupInitializeConfiguration {
    _enableHitThrough = YES;
}

#pragma mark - Override Methods
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.userInteractionEnabled
        || self.isHidden
        || self.alpha <= 0.01f
        || ![self pointInside:point withEvent:event]) {
        return nil;
    }
    
    __block UIView *responder = nil;
    NSArray<UIView *> *subviews = [self.subviews copy];
    [subviews enumerateObjectsWithOptions:NSEnumerationReverse
                               usingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGPoint convertPoint = [self convertPoint:point toView:obj];
        responder = [obj hitTest:convertPoint withEvent:event];
        if (responder) {
            *stop = YES;
        }
    }];
    
    return responder ?: (self.enableHitThrough ? nil : self);
}


@end
