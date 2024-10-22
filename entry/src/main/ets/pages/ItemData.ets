export default class ItemData {
  img: Resource
  title: Resource
  others?:Resource

  constructor(img: Resource, title: Resource, others?: Resource) {
    this.img = img
    this.title = title
    this.others = others
  }
}