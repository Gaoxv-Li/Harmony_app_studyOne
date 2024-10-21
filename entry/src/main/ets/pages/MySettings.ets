/*
 * 设置页面
 */

import CommonConstants from './CommonConstants'
import ItemData from './ItemData'
import DataModel from './DataModel'
import router from '@ohos.router'

@Entry
@Component
struct MySettings {

  @State account:number = 111111

  onPageShow(): void {
    let acc = router.getParams() as Record<string,number>
    if(acc){
      this.account = acc['sendMsg']
    }
  }

  build() {
    Scroll(){
      Column({space:CommonConstants.COMMON_SPACE}){
        Column(){ // 创建一个内嵌的列布局
          Text($r('app.string.settings_tabTitles_mine'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.page_title_text_size'))
            .margin({top:$r('app.float.mainPage_tabTitle_margin')})
            .padding({left:$r('app.float.mainPage_tabTitle_padding')})
        }
        .width(CommonConstants.Full_PARENT)
        .alignItems(HorizontalAlign.Start)

      //   账户信息
        Row(){
          Image($r('app.media.my'))
            .width($r('app.float.settings_account_size'))
            .height($r('app.float.settings_account_size'))

          Column(){
            Text(this.account.toString())
              .fontSize($r('app.float.settings_account_fontSize'))
            Text($r('app.string.settings_account_email'))
              .fontSize($r('app.float.little_text_size'))
              .margin({top:$r('app.float.settings_name_margin')})
          }
          .alignItems(HorizontalAlign.Start)
          .margin({left:$r('app.float.settings_account_margin')})
        }
        .margin({top:$r('app.float.settings_account_margin')})
        .alignItems(VerticalAlign.Center)
        .width(CommonConstants.Full_PARENT)
        .height($r('app.float.settings_account_height'))
        .backgroundColor(Color.White)
        .padding({left:$r('app.float.settings_account_padding')})
        .borderRadius($r('app.float.settings_account_borderRadius'))

      }
    }
  }
}