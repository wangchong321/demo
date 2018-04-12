//
//  BrowseTableViewCell.m
//  demo
//
//  Created by 王充 on 2018/4/12.
//  Copyright © 2018年 王充. All rights reserved.
//

#define SCREEN_WIDTH         ([UIScreen mainScreen].bounds.size.width)
#define MAGIN                10

#import "BrowseTableViewCell.h"
#import "KSPhotoBrowser.h"

@interface BrowseTableViewCell ()<KSPhotoBrowserDelegate>
@property (nonatomic, weak) UIImageView *leftImageView;
@property (nonatomic, weak) UIImageView *rightImageView;
@end
@implementation BrowseTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    BrowseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BrowseTableViewCell"];
    if (!cell) {
        cell = [[BrowseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BrowseTableViewCell"];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat imageW = SCREEN_WIDTH * 0.5 - MAGIN * 2;
        CGFloat imageH = CELL_HEIGHT - MAGIN * 2;
        
        UIImageView *leftImageView = [[UIImageView alloc]init];
        leftImageView.userInteractionEnabled = YES;
        leftImageView.frame = CGRectMake(MAGIN, MAGIN, imageW, imageH);
        self.leftImageView = leftImageView;
        [self.contentView addSubview:leftImageView];
        leftImageView.layer.cornerRadius = 4;
        leftImageView.clipsToBounds = YES;
        UITapGestureRecognizer *tapLeft = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgVClick:)];
        [leftImageView addGestureRecognizer:tapLeft];
        leftImageView.tag = 1;
        
        UIImageView *rightImageView = [[UIImageView alloc]init];
        rightImageView.userInteractionEnabled = YES;
        rightImageView.frame = CGRectMake(CGRectGetMaxX(leftImageView.frame) + MAGIN, MAGIN, imageW, imageH);
        self.rightImageView = rightImageView;
        [self.contentView addSubview:rightImageView];
        rightImageView.layer.cornerRadius = 4;
        rightImageView.clipsToBounds = YES;
        UITapGestureRecognizer *tapRight = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgVClick:)];
        [rightImageView addGestureRecognizer:tapRight];
        rightImageView.tag = 2;
    }
    return self;
}

- (void)setDataList:(NSArray *)dataList{
    NSString *file1 = [[NSBundle mainBundle] pathForResource:dataList.firstObject ofType:@"jpg"];
    self.leftImageView.image = [UIImage imageWithContentsOfFile:file1];

    NSString *file2 = [[NSBundle mainBundle] pathForResource:dataList.lastObject ofType:@"jpg"];
    self.rightImageView.image = [UIImage imageWithContentsOfFile:file2];
}

// 图片点击事件
-(void)imgVClick:(UITapGestureRecognizer *)sender{
    UIImageView *sourceView = (UIImageView *)sender.view;
    
    NSMutableArray *items = @[].mutableCopy;
    KSPhotoItem *item = [KSPhotoItem itemWithSourceView:sourceView image:sourceView.image];
    [items addObject:item];
    
    KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:0];
    browser.delegate = self;
    browser.dismissalStyle = KSPhotoBrowserInteractiveDismissalStyleRotation;
    browser.backgroundStyle = KSPhotoBrowserBackgroundStyleBlurPhoto;
    browser.loadingStyle = KSPhotoBrowserImageLoadingStyleDeterminate;
    browser.pageindicatorStyle = KSPhotoBrowserPageIndicatorStyleDot;
    browser.bounces = NO;
    [browser showFromViewController:self.superVC];
}
@end
