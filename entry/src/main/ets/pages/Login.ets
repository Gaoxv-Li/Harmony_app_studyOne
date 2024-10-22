/*
 * 登录页
 */
import CommonConstants from './CommonConstants'
import prompt from '@ohos.promptAction';
import router from '@ohos.router';


@Extend(TextInput)
function inputStyle() { //输入文本框样式
  .placeholderColor($r('app.color.placeholder_color'))
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.big_text_size'))
  .backgroundColor($r('app.color.white'))
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
struct Login {
  @State account: string = '' // 登录名
  @State password: string = '' //密码
  @State isShowProgress: boolean = false //控制是否显示進度條
  private timeOutId: number = -1 // 控制登录超时时间的变量

  login(): void {
    if (this.account === '' || this.password === '') {
      // 开启一个确认的弹层
      prompt.showToast({
        message: $r('app.string.input_empty_tips')
      })
    } else {
      this.isShowProgress = true
      if (this.timeOutId === -1) {
        //   设置一个定时器，定时两秒，
        this.timeOutId = setTimeout(() => {
          // 2秒之后执行的函数
          this.isShowProgress = false
          this.timeOutId = -1
          //   页面跳转
          router.replaceUrl({
            url:'pages/MySettings',
            params:{
              sendMsg:this.account
            }
          })
        }, CommonConstants.LOGIN_DELAY_TIME)
      }
    }
  }

  aboutToAppear(): void {
    //   取消定时器
    clearTimeout(this.timeOutId)
    this.timeOutId = -1
  }

  @Builder
  imageButton(image: Resource) {
    //   构建按钮图片：本质上，就是在按钮里增加一个 Image组件
    Button({ type: ButtonType.Circle, stateEffect: true }) { // 圆形按钮。按下开启切换效果
      Image(image)
    }
    .height($r('app.float.other_login_image_size'))
    .width($r('app.float.other_login_image_size'))
    .backgroundColor($r('app.color.background'))
  }

  build() {
    Column() { // 登录页面的布局
      Image($r('app.media.loginLogo'))//Logo
        .width($r('app.float.logo_image_size'))
        .height($r('app.float.logo_image_size'))
        .borderRadius($r('app.float.logo_image_radius'))
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

      // 短信提示  &&  忘记密码
      Row() {
        Text($r('app.string.message_login')).blueTextStyle()
        Text($r('app.string.forgot_password')).blueTextStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width(CommonConstants.Full_PARENT)
      .padding({ left: $r('app.float.common_padding_l_r'), right: $r('app.float.common_padding_l_r') })
      .margin({ top: $r('app.float.forgot_margin_top') })

      // 登录按钮
      Button($r('app.string.login_text'), { type: ButtonType.Capsule })//胶囊形状的按钮
        .width(CommonConstants.BUTTON_WIDTH)
        .height($r('app.float.login_button_height'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.login_button_color'))
        .margin({ top: $r('app.float.login_button_margin_top'), bottom: $r('app.float.login_button_margin_bottom') })
        .onClick(() => {
          // 登录事件
          this.login()
        })

      // 注册账号
      Text($r('app.string.register_account'))
        .fontColor($r('app.color.login_blue_text_color'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)

      // 进度条
      if (this.isShowProgress) {
        LoadingProgress()
          .color($r('app.color.loading_color'))
          .width($r('app.float.login_progress_size'))
          .height($r('app.float.login_progress_size'))
          .margin({ top: $r('app.float.login_progress_margin_top') })
      }

      Blank()

      // 其他登录方式文本
      Text($r('app.string.other_login_method'))
        .fontColor($r('app.color.other_login_text_color'))
        .fontSize($r('app.float.little_text_size'))
        .fontWeight(FontWeight.Medium)
        .margin({ top: $r('app.float.other_login_margin_top'), bottom: $r('app.float.other_login_margin_bottom') })

      //   其他登录方式按钮
      Row({ space: CommonConstants.LOGIN_METHODS_SPACE }) {
        this.imageButton($r('app.media.vx'))
        this.imageButton($r('app.media.qq'))
        this.imageButton($r('app.media.ali'))
      }

    }
    .height('100%')
    .width('100%')
  }
}