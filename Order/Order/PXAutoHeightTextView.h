//
//  PXAutoHeightTextView.h
//  Order
//
//  Created by Etong on 16/7/13.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PXAutoHeightTextView;

@protocol PxAutoHeightTextViewDelegate <NSObject>

@optional
//TextView高度自适应
- (void)textView:(PXAutoHeightTextView *)textView heightChanged:(NSInteger)height;

@end

@interface PXAutoHeightTextView : UITextView

@property (assign, nonatomic) id<UITextViewDelegate, PxAutoHeightTextViewDelegate> delegate;

@end
