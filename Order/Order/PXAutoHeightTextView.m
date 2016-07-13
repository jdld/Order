//
//  PXAutoHeightTextView.m
//  Order
//
//  Created by Etong on 16/7/13.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "PXAutoHeightTextView.h"

@implementation PXAutoHeightTextView

- (void)setContentSize:(CGSize )contentSize {
    CGSize oriSize = self.contentSize;
    [super setContentSize:contentSize];
    if(oriSize.height != self.contentSize.height)
    {
        CGRect newFrame = self.frame;
        newFrame.size.height = self.contentSize.height;
        self.frame = newFrame;
        if([self.delegate respondsToSelector:@selector(textView:heightChanged:)])
        {
            [self.delegate textView:self heightChanged:self.contentSize.height - oriSize.height];
        }
    }
}

@end
