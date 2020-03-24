class Shippinghash < ActiveHash::Base
  self.data = [
  {id: 1, name: '支払い後１〜２日で発送'}, {id: 2, name: '支払い後3〜4日で発送'},{id: 3, name: '支払い後5〜6日で発送'}
  ]
end