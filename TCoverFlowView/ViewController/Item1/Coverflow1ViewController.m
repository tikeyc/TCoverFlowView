//
//  Coverflow1ViewController.m
//  TCoverFlowView
//
//  Created by ways on 16/5/25.
//  Copyright © 2016年 tikeyc. All rights reserved.
//

#import "Coverflow1ViewController.h"

#import "XLPhotoCell.h"

@interface Coverflow1ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation Coverflow1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 创建布局
    XLLayout *layout = [[XLLayout alloc] init];
    //    layout.itemSize = CGSizeMake(160, 160);
    layout.itemSize = CGSizeMake(300, 300);
    
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = 400;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, collectionW, collectionH) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XLPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XLPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.item + 1]];
    
    
    return cell;
    
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击的item---%zd",indexPath.item);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
