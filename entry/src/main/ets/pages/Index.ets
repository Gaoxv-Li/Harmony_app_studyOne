/*
 * main 页面
 */
import CommonConstants from './CommonConstants'
import Home from './Home'
import MySettings from './MySettings'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  private tabsController: TabsController = new TabsController()

  @State currentTabIndex:number = CommonConstants.HOME_TAB_INDEX  // 默认索引为 ：首页

  @State account:number = 111
  onPageShow(): void {  // 接受路由参数
    let acc = router.getParams() as Record<string, number>
    if (acc) {
      this.account = acc['sendMsg']
    }
  }

  @Builder
  TabBuilder(title:string,index:number,selectedImg:Resource,normalImg:Resource){
    Column(){
      Image(this.currentTabIndex == index ? selectedImg : normalImg)
        .width($r('app.float.mainPage_baseTab_size'))
        .height($r('app.float.mainPage_baseTab_size'))
      Text(title)
        .margin({top:$r('app.float.mainPage_baseTab_top')})
        .fontSize($r('app.float.mainPage_baseTab_fontSize'))
        .fontColor(this.currentTabIndex == index ? $r('app.color.mainPage_selected') : $r('app.color.mainPage_normal'))
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.mainPage_barHeight'))
    .width(CommonConstants.Full_PARENT)
    .onClick(() => {
      this.currentTabIndex = index
      this.tabsController.changeIndex(this.currentTabIndex)  // 修改页签索引，从而切换页面
    })
  }

  build() {

    Tabs({
      barPosition: BarPosition.End, // 底部展示
      controller: this.tabsController  // 页签容器的控制器
    }) { // 标签容器

      // 第一个页签 ： 首页
      TabContent() {
        Home()
      }
      .padding({ left: $r('app.float.mainPage_padding'), right: $r('app.float.mainPage_padding') })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder(CommonConstants.HOME_TITLE,CommonConstants.HOME_TAB_INDEX,
        $r('app.media.mainTab'),$r('app.media.mainTabNor')))
      // 第二个页签 ： 我的设置
      TabContent() {
        MySettings({account:this.account})
      }
      .padding({ left: $r('app.float.mainPage_padding'), right: $r('app.float.mainPage_padding') })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder(CommonConstants.MINE_TITLE,CommonConstants.MY_TAB_INDEX,
        $r('app.media.myTab'),$r('app.media.myTabNor')))
    }
    .width(CommonConstants.Full_PARENT)
    .barBackgroundColor(Color.White)
    .barHeight($r('app.float.mainPage_barHeight'))
    .barMode(BarMode.Fixed)
  }
}