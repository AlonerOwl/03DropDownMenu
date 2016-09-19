//
//  ViewController.m
//  04下拉菜单
//
//  Created by 张非 on 16/9/19.
//  Copyright © 2016年 张非. All rights reserved.
//

#import "ViewController.h"
#import "ZFMenu.h"

@interface ViewController ()<ZFMenuDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnSelect;
@property (nonatomic, strong) ZFMenu *menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.btnSelect.layer.borderWidth = 1;
    self.btnSelect.layer.cornerRadius = 5;
}

// 实现单击按钮显示和隐藏下拉菜单
- (IBAction)selectAction:(UIButton *)sender {
    NSArray *arr = @[@"cell1", @"cell2", @"cell3", @"cell4", @"cell5"];
    // 判断下拉菜单是否为nil
    if (self.menu == nil) {
        // 菜单的高度
        CGFloat height = 200;
        self.menu = [[ZFMenu alloc] showDropDwon:sender height:&height listArray:arr direction:@"down"];
        self.menu.delegate = self;
    } else {
        [self.menu hideDropDwon:sender];
        self.menu = nil;
    }
}

- (void)niDropDownDelegateMethod:(ZFMenu *)sender {
    self.menu = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
