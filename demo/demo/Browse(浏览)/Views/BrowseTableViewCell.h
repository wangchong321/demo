//
//  BrowseTableViewCell.h
//  demo
//
//  Created by 王充 on 2018/4/12.
//  Copyright © 2018年 王充. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_HEIGHT     100

@interface BrowseTableViewCell : UITableViewCell

@property (nonatomic, weak) UIViewController *superVC;

/**
 初始化
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 设置数据
 */
- (void)setDataList:(NSArray *)dataList;
@end
