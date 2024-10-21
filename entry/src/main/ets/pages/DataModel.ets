import ItemData from './ItemData'

export  class DataModel{

  /*
   * 获取设置列表的数据
   *
   * @return {Array<PageResource>}  返回设置列表的数据数组
   * */
  getSettingListData():Array<ItemData>{
    let settingListData:ItemData[] = [
      new ItemData()
    ]
  }
}