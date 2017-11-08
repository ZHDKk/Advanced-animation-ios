//
//  ViewController.m
//  高级动画
//
//  Created by zh dk on 2017/9/1.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"
#import "HMGLTransition.h"
#import "HMGLTransitionManager.h"
#import "ClothTransition.h"
#import "Switch3DTransition.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _parentView = [[UIView alloc]init];
    _parentView.frame = CGRectMake(40, 80, 260, 380);
    [self.view addSubview:_parentView];
    _parentView.backgroundColor = [UIColor whiteColor];
    
    
    _imageView01 = [[UIImageView alloc]init];
    _imageView01.frame = CGRectMake(0, 0, 260, 380);
    _imageView01.image = [UIImage imageNamed:@"2.jpg"];
    [_parentView addSubview:_imageView01];
    
    _imageView02 = [[UIImageView alloc]init];
    _imageView02.frame = CGRectMake(0, 0, 260, 380);
    _imageView02.image = [UIImage imageNamed:@"10.jpg"];
//    [self.view addSubview:_imageView02];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self animMove];
}

-(void)animMove
{
    //创建动画管理对象
    HMGLTransitionManager *manager = [HMGLTransitionManager sharedTransitionManager];
    //动画变换对象
    Switch3DTransition *sAnim = [[Switch3DTransition alloc] init];
    //设置动画方向类型
    [sAnim setTransitionType:Switch3DTransitionLeft];
    //设置动画类型
    [manager setTransition:sAnim];
    //设置动画视图的容器对象
    [manager beginTransition:_parentView];
    //让第一个图像视图对象消失
    static BOOL isFirst =YES ;
    if (isFirst) {
        [_imageView01 removeFromSuperview];
        _imageView02.frame = _imageView01.frame;
        [_parentView addSubview:_imageView02];
    }else{
        [_imageView02 removeFromSuperview];
        _imageView01.frame = _imageView02.frame;
        [_parentView addSubview:_imageView01];
    }
    isFirst = !isFirst;
    //提交动画运行效果
    [manager commitTransition];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
