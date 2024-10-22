import ItemData from './ItemData'

export  class DataModel{

  /*
   * 获取设置列表的数据
   *
   * @return {Array<PageResource>}  返回设置列表的数据数组
   * */
  getSettingListData():Array<ItemData>{
    const  settingListData:ItemData[] = [
      new ItemData($r('app.media.push'),$r('app.string.settings_push_notifications'),$r('app.string.settings_switch')),
      new ItemData($r('app.media.dataManage'),$r('app.string.settings_data_management')),
      new ItemData($r('app.media.setting'),$r('app.string.settings_menu_settings')),
      new ItemData($r('app.media.about_setting'),$r('app.string.settings_about')),
      new ItemData($r('app.media.clear'),$r('app.string.settings_clear_cache')),
      new ItemData($r('app.media.agreement'),$r('app.string.settings_privacy_agreement'))
    ]
    return settingListData
  }
}

export default  new DataModel()