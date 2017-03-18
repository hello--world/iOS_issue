## 使用dispatch_once 创建单列时遇到的一个问题
#### 产生原因
* 问题代码
```objc
static TestManager *_manager;
+ (instancetype)sharedManager {
    if (_manager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
//            [self sharedManager]; // 出问题
            _manager = [[self alloc] init];
//            [self sharedManager]; // 上面加if判断，不出问题
        });
    }
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 调用了该方法，内部[TestManager sharedManager]，导致sharedManager 还没有执行完
        // 相当于 [TestManager sharedManager];
        // 或者异步调用
//        dispatch_async(dispatch_get_main_queue(), ^{
        
            [TestModel fetchWith:^(BOOL issue) {
                NSLog(@"%@",@(issue));
                self.issue = issue;
            }];
//        });
    }
    return self;
}
```

* 在单列没有初始化完成时（dispatch_once还没执行完），调用了单列里的初始化方法，导致“死锁”。
* 在单列里面初始化数据的时候重写init方法，导致没有察觉到调用。

#### 解决办法
* 可dispatch_async解决。
* init 完成后，[_manager setup]方式调用。
