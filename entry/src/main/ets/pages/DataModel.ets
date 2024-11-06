import ItemData from './ItemData'

export class DataModel {
  /*
   * 获取轮播图的图片数据
   *
   * @return {Array<Resource>} 返回轮播图图片数组
   */
  getSwiperImages(): Array<Resource> {
    const swiperImages: Resource[] = [
      $r('app.media.fig1'),
      $r('app.media.fig2'),
      $r('app.media.fig3'),
    ]
    return swiperImages
  }

  /*
   * 获取金刚区数据
   *
   * @return {Array<ItemData>} 返回金刚区的数据数组
   */
  getFirstGridData(): Array<ItemData> {
    const firstGridData: ItemData[] = [
      new ItemData($r('app.media.home_love'), $r('app.string.my_love')),
      new ItemData($r('app.media.home_record'), $r('app.string.history_record')),
      new ItemData($r('app.media.home_message'), $r('app.string.message')),
      new ItemData($r('app.media.home_shop'), $r('app.string.shopping_cart')),
      new ItemData($r('app.media.home_top'), $r('app.string.my_goal')),
      new ItemData($r('app.media.home_quan'), $r('app.string.group')),
      new ItemData($r('app.media.home_place'), $r('app.string.favorites')),
      new ItemData($r('app.media.home_cycle'), $r('app.string.recycle_bin')),
    ]
    return firstGridData
  }

  /*
 * 获取菜单列表数据
 *
 * @return {Array<ItemData>} 返回菜单列表的数据数组
 */
  getSecondGridData():Array<ItemData> {
    const secondGridData:ItemData[] = [
      new ItemData($r('app.media.second_1'), $r('app.string.mainPage_top'),$r('app.string.mainPage_text_top')),
      new ItemData($r('app.media.second_2'), $r( 'app.string.mainPage_new'), $r('app.string.mainPage_text_new')),
      new ItemData($r('app.media.second_3'), $r( 'app.string.mainPage_brand'), $r('app.string.mainPage_text_brand')),
      new ItemData($r('app.media.second_4'), $r( 'app.string.mainPage_found'), $r('app.string.mainPage_text_found')),
    ]
    return secondGridData
  }

  /*
   * 获取设置列表的数据
   *
   * @return {Array<PageResource>}  返回设置列表的数据数组
   * */
  getSettingListData(): Array<ItemData> {
    const settingListData: ItemData[] = [
      new ItemData($r('app.media.push'), $r('app.string.settings_push_notifications'),
        $r('app.string.settings_switch')),
      new ItemData($r('app.media.dataManage'), $r('app.string.settings_data_management')),
      new ItemData($r('app.media.setting'), $r('app.string.settings_menu_settings')),
      new ItemData($r('app.media.about_setting'), $r('app.string.settings_about')),
      new ItemData($r('app.media.clear'), $r('app.string.settings_clear_cache')),
      new ItemData($r('app.media.agreement'), $r('app.string.settings_privacy_agreement'))
    ]
    return settingListData
  }
}

export default new DataModel()