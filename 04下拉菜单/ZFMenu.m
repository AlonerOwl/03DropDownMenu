//
//  ZFMenu.m
//  04下拉菜单
//
//  Created by 张非 on 16/9/19.
//  Copyright © 2016年 张非. All rights reserved.
//  本案例的frame计算可根据工程的实际情况进行计算

#import "ZFMenu.h"

@implementation ZFMenu

/**
 * 
 * 该方法主要用于点击按钮后，展示菜单
 *
 * sender：点击的按钮
 * height：下拉菜单的高度，以地址传入，防止修改
 * listArray：内容数组
 * direction：菜单展开的方向
 *
 */
- (instancetype)showDropDwon:(UIButton *)sender height:(CGFloat *)height listArray:(NSArray *)listArray direction:(NSString *)direction {
    self.btnSender = sender;
    self.animationDirection = direction;
    self.dropDownTable = (UITableView *)[super init];
    if (self) {
        CGRect btn = sender.frame; // 获取框架
        self.listArray = [NSArray arrayWithArray:listArray];
        
        if ([direction isEqualToString:@"up"]) { // 判断direction是否等于up
            self.frame = CGRectMake(btn.origin.x, btn.origin.y, btn.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-5, 5);
        } else if ([direction isEqualToString:@"down"]) { // 判断direction是否等于down
            // 创建下拉菜单
            self.frame = CGRectMake(btn.origin.x, btn.origin.y + btn.size.height, btn.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-5, 5);
        }
        
//        self.layer.masksToBounds = YES;
//        self.layer.cornerRadius = 8;    // 设置圆角
//        self.layer.shadowRadius = 5;
//        self.layer.shadowOpacity = 0.5; // 设置阴影的不透明度
        
        self.dropDownTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, btn.size.width, 0)];
        self.dropDownTable.delegate = self;
        self.dropDownTable.dataSource = self;
        
//        self.dropDownTable.layer.cornerRadius = 5;
        self.dropDownTable.layer.borderWidth = 1;
        
        [UIView animateWithDuration:0.5 animations:^{
            if ([direction isEqualToString:@"up"]) { // 向上显示一个下拉
                self.frame = CGRectMake(btn.origin.x, btn.origin.y - *height, btn.size.width, *height);
            } else if ([direction isEqualToString:@"down"]) { // 向下显示一个下拉
                self.frame = CGRectMake(btn.origin.x, btn.origin.y + btn.size.height, btn.size.width, *height);
            }
            self.dropDownTable.frame = CGRectMake(0, 0, btn.size.width, *height);
        }];
        
        // 添加视图
        [sender.superview addSubview:self];
        [self addSubview:self.dropDownTable];
    }
    return self;
}

/**
 *
 * 该方法主要用于点击按钮后，展示菜单
 *
 * sender：点击的按钮
 *
 */
- (void)hideDropDwon:(UIButton *)sender {
    CGRect btn = sender.frame;
    [UIView animateWithDuration:0.5 animations:^{
        if ([self.animationDirection isEqualToString:@"up"]) { // 向上显示一个下拉
            self.frame = CGRectMake(btn.origin.x, btn.origin.y, btn.size.width, 0);
        } else if ([self.animationDirection isEqualToString:@"down"]) { // 向下显示一个下拉
            self.frame = CGRectMake(btn.origin.x, btn.origin.y + btn.size.height, btn.size.width, 0);
        }
        self.dropDownTable.frame = CGRectMake(0, 0, btn.size.width, 0);
    }];
}

#pragma mark - UITabelView Delegate Method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    if (self.listArray.count > 0) {
        cell.textLabel.text = self.listArray[indexPath.row];
    }
    
    return cell;
}

@end
