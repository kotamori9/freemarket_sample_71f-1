class Statushash < ActiveHash::Base
  self.data = [
  {id: 1, name: '新品未使用'}, {id: 2, name: '中古美品'}, {id: 3, name: '状態が悪い'}
  ]
end