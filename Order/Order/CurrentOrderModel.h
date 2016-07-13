//
//  CurrentOrderModel.h
//  Order
//
//  Created by Etong on 16/7/13.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentOrderModel : NSObject

@property (copy, nonatomic) NSString *headImage;

@property (copy, nonatomic) NSString *nickname;

@property (copy, nonatomic) NSString *commodityImage;

@property (copy, nonatomic) NSString *commodityName;

@property (copy, nonatomic) NSString *commodityMsg;

@property (copy, nonatomic) NSString *price;

@property (copy, nonatomic) NSString *quantity;

@end
