//
//  NSDictionary+Extend.h
//  GtOilStorage
//
//  Created by zoulin on 2017/2/17.
//  Copyright © 2017年 zoulin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extend)

//类型识别:将所有的NSNull类型转化成@""
+(id)changeType:(id)myObj;

@end
