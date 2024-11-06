/*
 * App首页
 */
import CommonConstants from './CommonConstants'
import ItemData from './ItemData'
import DataModel from './DataModel'
import router from '@ohos.router'

@Entry
@Component
struct Home {
  // 轮播控制器的实例
  private swiperController: SwiperController = new SwiperController()

  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        // 第一部分：标题
        Column() { // 创建一个内嵌的列布局
          Text($r('app.string.mainPage_tabTitles_home'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.page_title_text_size'))
            .margin({ top: $r('app.float.mainPage_tabTitle_margin') })
            .padding({ left: $r('app.float.mainPage_tabTitle_padding') })
        }
        .width(CommonConstants.Full_PARENT)
        .alignItems(HorizontalAlign.Start)

        // 第二部分：轮播图
        Swiper(this.swiperController) {
          ForEach(DataModel.getSwiperImages(), (item: Resource) => {
            // 构建每一张图片组件
            Image(item)
              .borderRadius($r('app.float.home_swiper_borderRadius'))
          })
        }
        .autoPlay(true) //swiper 自动播放
        .height($r('app.float.home_swiper_height'))
        .margin({ top: $r('app.float.home_swiper_margin') })

        //   第三部分   金剛區   网格布局
        Grid() {
          ForEach(DataModel.getFirstGridData(), (item: ItemData) => {
            GridItem() {
              Column() {
                Image(item.img)
                  .width($r('app.float.home_homeCel_size'))
                  .height($r('app.float.home_homeCel_size'))
                Text(item.title)
                  .fontSize($r('app.float.little_text_size'))
                  .margin({ top: $r('app.float.home_homeCel_margin') })
              }
            }

          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr') // 设置网格的列模版 ，每列平分空间
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .padding({top:$r('app.float.home_grid_padding'),bottom:$r('app.float.home_grid_padding')})
        .height($r('app.float.home_grid_height'))
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.home_grid_borderRadius'))

        // 第四部分
        Text($r('app.string.home_list'))
          .fontSize($r('app.float.normal_text_size'))
          .fontWeight(FontWeight.Medium)
          .width(CommonConstants.Full_PARENT)
          .margin({top:$r('app.float.home_text_margin')})

        Grid(){
          ForEach(DataModel.getSecondGridData(),(item:ItemData) => {
            GridItem(){
              Column(){
                Text(item.title)
                  .fontSize($r('app.float.normal_text_size'))
                  .fontWeight(FontWeight.Medium)
                  .fontColor(Color.Yellow)
                Text(item.others)
                  .fontSize($r('app.float.little_text_size'))
                  .fontColor($r('app.color.home_grid_fontColor'))
                  .margin({top:$r('app.float.home_list_margin')})
                  .fontColor(Color.Yellow)
              }
              .alignItems(HorizontalAlign.Start)
            }
            .padding({top:$r('app.float.home_list_padding'),left:$r('app.float.home_list_padding')})
            .borderRadius($r('app.float.home_backgroundImage_borderRadius'))
            .align(Alignment.TopStart)
            .backgroundImage(item.img)
            .backgroundImageSize(ImageSize.Cover)  //设置背景图像尺寸模式为覆盖
            .width(CommonConstants.Full_PARENT)
            .height(CommonConstants.Full_PARENT)
          })
        }
        .width(CommonConstants.Full_PARENT)
        .height($r('app.float.home_secondGrid_height'))
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .margin({bottom:$r('app.float.setting_button_bottom')})
      }
    }
    .height(CommonConstants.Full_PARENT)
  }
}