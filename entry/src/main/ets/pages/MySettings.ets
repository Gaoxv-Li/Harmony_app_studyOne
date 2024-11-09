/*
 * 设置页面
 */

import CommonConstants from './CommonConstants'
import ItemData from './ItemData'
import DataModel from './DataModel'
import router from '@ohos.router'

// @Entry
@Component
export default  struct MySettings {
  private  account: number = -1


  // 构建设置单元格的函数，接收一个ItemData类型的item作为参数
  @Builder
  settingCell(item: ItemData) {
    Row() { // 构建一个行布局
      Row({ space: CommonConstants.COMMON_SPACE }) { // 创建一个有间隔的内嵌行布局
        Image(item.img)
          .width($r('app.float.settings_size'))
          .height($r('app.float.settings_size'))
        Text(item.title)
          .fontSize($r('app.float.normal_text_size'))
      }

      //   如果item的others属性为空，则显示一个图像，负责显示一个开关组件
      if (item.others === undefined) {
        Image($r('app.media.rightOpen'))
          .width($r('app.float.settings_jump_width'))
          .height($r('app.float.settings_jump_height'))
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width(CommonConstants.Full_PARENT)
    .padding({
      left: $r('app.float.settings_settingCell_left'), right: $r('app.float.settings_settingCell_right')
    })
  }

  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        Column() { // 创建一个内嵌的列布局
          Text($r('app.string.settings_tabTitles_mine'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.page_title_text_size'))
            .margin({ top: $r('app.float.mainPage_tabTitle_margin') })
            .padding({ left: $r('app.float.mainPage_tabTitle_padding') })
        }
        .width(CommonConstants.Full_PARENT)
        .alignItems(HorizontalAlign.Start)

        //   账户信息
        Row() {
          Image($r('app.media.my'))
            .width($r('app.float.settings_account_size'))
            .height($r('app.float.settings_account_size'))

          Column() {
            Text($r('app.string.settings_account_name'))
              .fontSize($r('app.float.settings_account_fontSize'))
            Text(this.account.toString())
              .fontSize($r('app.float.little_text_size'))
              .margin({ top: $r('app.float.settings_name_margin') })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: $r('app.float.settings_account_margin') })
        }
        .margin({ top: $r('app.float.settings_account_margin') })
        .alignItems(VerticalAlign.Center)
        .width(CommonConstants.Full_PARENT)
        .height($r('app.float.settings_account_height'))
        .backgroundColor(Color.White)
        .padding({ left: $r('app.float.settings_account_padding') })
        .borderRadius($r('app.float.settings_account_borderRadius'))

        //   列表布局组件
        List() {

          ForEach(DataModel.getSettingListData(), (item: ItemData) => {
            //   构建每一个列表项
            ListItem() {
              this.settingCell(item)
            }
            .height($r('app.float.settings_list_height'))
          })
        }
        .backgroundColor(Color.White)
        .width(CommonConstants.Full_PARENT)
        .height(CommonConstants.SET_LIST_HEIGHT)
        .divider({
          strokeWidth: $r('app.float.settings_list_strokeWidth'),
          color: Color.Gray,
          startMargin: $r('app.float.settings_list_startMargin'),
          endMargin: $r('app.float.settings_list_endMargin')
        })
        .borderRadius($r('app.float.settings_list_borderRadius'))
        .padding({ top: $r('app.float.settings_list_padding'), bottom: $r('app.float.settings_list_padding') })

        Blank()

        //   退出
        Button($r('app.string.settings_button'),{type:ButtonType.Capsule})
          .width(CommonConstants.BUTTON_WIDTH)
          .height($r('app.float.login_button_height'))
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.setting_button_fontColor'))
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.setting_button_backgroundColor'))
          .margin({bottom:$r('app.float.setting_button_bottom')})
      }
      .height(CommonConstants.Full_PARENT)
    }
  }
}