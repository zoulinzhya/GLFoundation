//
//  UITableView+Extend.m
//  learnMasonry
//
//  Created by zoulin on 2017/11/2.
//  Copyright © 2017年 zoulin. All rights reserved.
//

#import "UITableView+Extend.h"

@implementation UITableView (Extend)
    
/**
 *  @author zoulin
 *
 *  @brief 去掉底部FooterView
 */
- (void)takeOutTableViewFooterView
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}
    
/**
 *  @author zoulin
 *
 *  @brief 去掉顶部HeaderView
 */
- (void)takeOutTableViewHeaderView
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [self setTableHeaderView:view];
}

@end
