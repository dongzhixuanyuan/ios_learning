//
//  GTVideoController.m
//  SampleApp
//
//  Created by liudong on 2020/3/16.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTVideoController.h"

@implementation GTVideoController

+ (instancetype)initWithParams:(NSString *)title unselectedImage:(UIImage *)unselectedImage selectedImage:(UIImage *)selectedImage{
    
    GTVideoController* instance = [[GTVideoController alloc]init];
    if (instance) {
        instance.tabBarItem.title = title;
        instance.tabBarItem.image =unselectedImage;
        instance.tabBarItem.selectedImage =selectedImage;
    }
    return instance;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor =[UIColor redColor];
    return cell;
}
@end
