//
//  Coverflow2ViewController.m
//  TCoverFlowView
//
//  Created by ways on 16/5/25.
//  Copyright © 2016年 tikeyc. All rights reserved.
//

#import "Coverflow2ViewController.h"

#import "CBetterCollectionViewCell.h"
#import "CCoverflowCollectionViewLayout.h"

@interface Coverflow2ViewController ()<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation Coverflow2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    [self.collectionView registerClass:[CBetterCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
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


#pragma mark - DataSource CoverFlow
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CBetterCollectionViewCell *cell = (CBetterCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                                            forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Delegate CoverFlow
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CCoverflowCollectionViewLayout *layout = (CCoverflowCollectionViewLayout *)[collectionView collectionViewLayout];
    [collectionView scrollToItemAtIndexPath:indexPath
                           atScrollPosition:UICollectionViewScrollPositionNone
                                   animated:YES];
    
    if ([indexPath row]==[[layout currentIndexPath] row])
    {
        
    }
    else
    {
        [collectionView setContentOffset:CGPointMake([layout cellSpacing]*[indexPath row], 0)
                                animated:YES];
    }
}


@end
