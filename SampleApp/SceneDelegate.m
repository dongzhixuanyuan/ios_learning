#import "SceneDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoController.h"
#import "RecommandViewController.h"
#import "GTSplashView.h"
#import "staticLib/GTStaticLibTest.h"
#import "GTLocationManager.h"
@interface SceneDelegate ()<UITableViewDelegate>

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    UITabBarController *tabController = [[UITabBarController alloc]init];
    tabController.delegate = self;
    GTNewsViewController *viewController1 = [[GTNewsViewController alloc]init];
    viewController1.tabBarItem.title = @"新闻";
    viewController1.tabBarItem.image = [UIImage imageNamed:@"page"];
    viewController1.tabBarItem.selectedImage = [UIImage imageNamed:@"page_selected"];
    GTVideoController *videoController = [GTVideoController initWithParams:@"视频" unselectedImage:[UIImage imageNamed:@"video"] selectedImage:[UIImage imageNamed:@"video_selected"]];

    RecommandViewController *viewController3 = [[RecommandViewController alloc]init];

    UIViewController *viewController4 = [[UIViewController alloc]init];
    viewController4.view.backgroundColor = [UIColor lightGrayColor];
    viewController4.tabBarItem.title = @"我的";
    viewController4.tabBarItem.image = [UIImage imageNamed:@"home"];
    viewController4.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];

    [tabController setViewControllers:@[viewController1, videoController, viewController3, viewController4]];

//    以navigationcontroller作为rootcontroller，tabcontroller作为navigationcontroller的rootviewcontroller。
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabController];

    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
//    GTSplashView* splashView = [[GTSplashView alloc]initWithFrame:self.window.bounds];
//    [self.window addSubview:splashView];
    
    [GTStaticLibTest justTest];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(selectPosition:) name:@"selectPosition" object:nil];
    [GTLocationManager getInstance];
    NSUserDefaults* userDefault = [[NSUserDefaults alloc]initWithSuiteName:@"com.liudong"];
    [userDefault setInteger:200 forKey:@"extensionTest"];
    [userDefault synchronize];
    
}

-(void)selectPosition:(NSNotification*) notification {
    NSString* code = [notification.userInfo objectForKey:@"code"];
    NSLog(code);
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

- (void)   tabBarController:(UITabBarController *)tabBarController
    didSelectViewController:(UIViewController *)viewController {
    NSLog(@"didSelectViewController");
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

@end
