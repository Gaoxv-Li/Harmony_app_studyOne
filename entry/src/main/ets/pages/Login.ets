/*
 * 登录页
 */
import CommonConstants from './CommonConstants'

@Extend(TextInput)
function inputStyle() { //输入文本框样式
  .placeholderColor($r('app.color.placeholder_color'))
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.big_text_size'))
  .backgroundColor($r('app.color.background'))
  .width(CommonConstants.Full_PARENT)
  .padding({ left: CommonConstants.INPUT_PADDING_LEFT })
  .margin({ top: $r('app.float.input_margin_top') })
}

// Line 组件的自定义样式拓展
@Extend(Line)
function lineStyle() {
  .width(CommonConstants.Full_PARENT) // 宽度为父组件的100%
  .height($r('app.float.line_height')) //高度
  .backgroundColor($r('app.color.line_color')) // 背景颜色
}

// Text组件的蓝色文本样式
@Extend(Text)
function blueTextStyle() {
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize($r('app.float.small_text_size'))
  .fontWeight(FontWeight.Medium)
}

@Entry
@Component
struct Index {
  @State account: string = '' // 登录名
  @State password: string = '' //密码

  build() {
    Column() { // 登录页面的布局
      Image($r('app.media.loginLogo'))//Logo
        .width($r('app.float.logo_image_size'))
        .height($r('app.float.logo_image_size'))
        .margin({ top: $r('app.float.logo_margin_top'), bottom: $r('app.float.logo_margin_bottom') })

      // 登录标题
      Text($r('app.string.login_page'))
        .fontSize($r('app.float.page_title_text_size'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))

      // 登录了解更多的text
      Text($r('app.string.login_more'))
        .fontSize($r('app.float.normal_text_size'))
        .fontColor($r('app.color.login_more_text_color'))
        .margin({ bottom: $r('app.float.login_more_margin_bottom'), top: $r('app.float.login_more_margin_top') })

      // 账号输入框
      TextInput({ placeholder: $r('app.string.account') })
        .inputStyle()
        .maxLength(CommonConstants.INPUT_ACCOUNT_LENGTH)
        .type(InputType.Number)
        .onChange((val: string) => {
          this.account = val
        })
      Line().lineStyle() // 输入框下的一条线

      // 密码输入框
      TextInput({ placeholder: $r('app.string.password') })
        .inputStyle()
        .maxLength(CommonConstants.INPUT_ACCOUNT_LENGTH)
        .type(InputType.Password)
        .onChange((val: string) => {
          this.password = val
        })
      Line().lineStyle() // 输入框下的一条线
    }
    .height('100%')
    .width('100%')
  }
}