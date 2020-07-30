//
//  ModifyViewController.h
//  student
//
//  Created by 房彤 on 2020/7/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

//声明协议方法
@protocol ModifyDelegate <NSObject>

- (void)modifyContent:(NSMutableArray *)nameArr andClass:(NSMutableArray *)classArr andNum:(NSMutableArray *)numArr andScore:(NSMutableArray *)scoreArr;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ModifyViewController : UIViewController

@property NSString *nameStr;
@property NSString *numstr;
@property int t;
@property NSMutableArray *nameArr;
@property NSMutableArray *classArr;
@property NSMutableArray *numArr;
@property NSMutableArray *scoreArr;

@property UITextField *nameTextField;
@property UITextField *classTextField;
@property UITextField *numTextField;
@property UITextField *scoreTextField;

@property UIButton *sureButton;


//声明代理人属性
@property id<ModifyDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
