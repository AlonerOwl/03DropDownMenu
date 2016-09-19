//
//  ZFMenu.h
//  04下拉菜单
//
//  Created by 张非 on 16/9/19.
//  Copyright © 2016年 张非. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZFMenu;
// 协议
@protocol ZFMenuDelegate <NSObject>

- (void)niDropDownDelegateMethod:(ZFMenu *)sender;

@end

@interface ZFMenu : UIView <UITableViewDelegate, UITableViewDataSource>
//{
//    NSString *animationDirection;
//    UIImageView *myImageView;
//}

// 属性
/// 下拉列表
@property (nonatomic, strong) UITableView *dropDownTable;
/// 点击按钮
@property (nonatomic, strong) UIButton *btnSender;
/// 动画
@property (nonatomic, copy) NSString *animationDirection;

@property (nonatomic, strong) NSArray *listArray;

@property (nonatomic, weak) id<ZFMenuDelegate> delegate;

// 收回下拉菜单
- (void)hideDropDwon:(UIButton *)sender;
// 展示下拉菜单
- (instancetype)showDropDwon:(UIButton *)sender height:(CGFloat *)height listArray:(NSArray *)listArray direction:(NSString *)direction;

@end
