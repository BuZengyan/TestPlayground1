//
//  ViewController.m
//  SegementDemo
//
//  Created by zengyan.bu on 9/24/19.
//  Copyright © 2019 zengyan.bu. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kBtnWidth 240
#define kBtnHeight 94.0f

#import "ViewController.h"
#import "TestVCViewController.h"

@interface ViewController ()
@property (nonatomic, assign)   NSInteger   firstPageIndex;
@property (nonatomic, assign)   NSInteger   firstModuleIndex;
@property (nonatomic, strong)   UISegmentedControl *segmentedControl;   /// 分组
@property (nonatomic, strong)   UIView *naviBarView;
@property (nonatomic, strong)   UIView *naviBarView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"分段测试";
    
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    self.navigationController.navigationBar.hidden = NO;
    
    [self.view addSubview:self.naviBarView];
    [self.view addSubview:self.naviBarView1];
    [self.view addSubview:self.segmentedControl];
}

- (UIView *)naviBarView{
    if (!_naviBarView) {
        _naviBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 94)];
        _naviBarView.backgroundColor = [UIColor blueColor];
        
        
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.frame = CGRectMake((kScreenWidth - kBtnWidth)/2, 0, kBtnWidth, kBtnHeight);
        [titleBtn setTitle:@"push?" forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(titleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_naviBarView addSubview:titleBtn];
    }
    return _naviBarView;
}

- (UIView *)naviBarView1{
    if (!_naviBarView1) {
        _naviBarView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 94)];
        _naviBarView1.backgroundColor = [UIColor blueColor];
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.frame = CGRectMake((kScreenWidth - kBtnWidth)/2, 0, kBtnWidth, kBtnHeight);
        [titleBtn setTitle:@"pop?" forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(titleBtnClick1) forControlEvents:UIControlEventTouchUpInside];
        [_naviBarView1 addSubview:titleBtn];
    }
    return _naviBarView1;
}

- (void)titleBtnClick{
    TestVCViewController *vc = [[TestVCViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:^{
//
//    }];
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
} 

- (void)titleBtnClick1{
    
    TestVCViewController *vc = [[TestVCViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:^{

    }];
}

#pragma mark - 分段选择器
- (UISegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [ [ UISegmentedControl alloc ] initWithItems: nil ];
        [ _segmentedControl insertSegmentWithTitle: @"门店转货" atIndex: 0 animated: NO ];
        [ _segmentedControl insertSegmentWithTitle:@"下单列表" atIndex: 1 animated: NO ];
        [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateNormal];
//        [_segmentedControl setTintColor:[UIColor whiteColor]];
//        [_segmentedControl selectedSegmentTintColor:[UIColor redColor]];
        NSString *version = [[UIDevice currentDevice] systemVersion];
        if ([version floatValue] >= 13) {
             _segmentedControl.selectedSegmentTintColor = [UIColor whiteColor];
        }else{
            [_segmentedControl setTintColor:[UIColor whiteColor]];
        }
       
        _segmentedControl.selectedSegmentIndex = 0;
        [ _segmentedControl addTarget: self action: @selector(controlPressed:) forControlEvents: UIControlEventValueChanged];
        _segmentedControl.frame = CGRectMake(.0, .0, 400, 44);
        _segmentedControl.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame)+100);
        CGFloat width = _segmentedControl.frame.size.width;
        _segmentedControl.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - width) / 2, [UIScreen mainScreen].bounds.size.height / 2 - 44 / 2 + 10, width, 44);
        _segmentedControl.backgroundColor = [UIColor redColor];
        _segmentedControl.layer.masksToBounds = YES;
        _segmentedControl.layer.borderWidth = 1;
        _segmentedControl.layer.borderColor = [UIColor whiteColor].CGColor;
        
    }
    return _segmentedControl;
}

#pragma mark - 分段选择事件
- (void) controlPressed:(id)sender {
    
    UISegmentedControl *sc = (UISegmentedControl*)sender;
    NSInteger selectedIndex = [ sc selectedSegmentIndex ];
    if (selectedIndex == 0) {
      
    }else{
        
        // 请求数据
        //        [self.rightVC firstComeInRequest];
    }
}
@end
