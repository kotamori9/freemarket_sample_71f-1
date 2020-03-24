class Postagehash < ActiveHash::Base
  self.data = [
  {id: 1, name: '出品者が負担'}, {id: 2, name: '購入者が負担'}
  ]
end