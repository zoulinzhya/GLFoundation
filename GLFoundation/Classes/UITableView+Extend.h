//
//  UITableView+Extend.h
//  learnMasonry
//
//  Created by zoulin on 2017/11/2.
//  Copyright © 2017年 zoulin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extend)
    
/**
 *  @author zoulin
 *
 *  @brief 去掉底部FooterView
 */
- (void)takeOutTableViewFooterView;
    
/**
 *  @author zoulin
 *
 *  @brief 去掉顶部HeaderView
 */
- (void)takeOutTableViewHeaderView;

@end
