//
//  StartViewController.h
//  student
//
//  Created by 房彤 on 2020/7/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ModifyViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface StartViewController : UIViewController

<UITableViewDelegate, UITableViewDataSource, AddDelegate, DeleteDelegate, ModifyDelegate>

@property UITableView *tableView;
@property UIButton *addButton;
@property UIButton *deleteButton;
@property UIButton *modifyButton;
@property UIButton *searchButton;
@property UIButton *quitButton;

@property NSMutableArray *nameArr;
@property NSMutableArray *classArr;
@property NSMutableArray *numArr;
@property NSMutableArray *scoreArr;



@end

NS_ASSUME_NONNULL_END
