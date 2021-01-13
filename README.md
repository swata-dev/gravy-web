![Gravy Logo](https://user-images.githubusercontent.com/74521093/101759428-ef9b7d80-3b1c-11eb-8a33-33b97be09ede.png)

## :wrench: Tools

<br>
<p align="center">
  <a href="https://guides.rubyonrails.org/"><img width="180" alt="68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f3534333133332f37613663323763642d303963622d623965372d376231622d3163623536646662656530632e706e67" src="https://user-images.githubusercontent.com/60377349/85693307-1a317f80-b711-11ea-9ae6-b1fa9b3e601d.png"></a>
  <a href="https://aws.amazon.com/jp/?nc2=h_lg"><img width="110" alt="73935917-fec20580-4924-11ea-9b42-36715e8d4ede" src="https://user-images.githubusercontent.com/60377349/85695135-b7d97e80-b712-11ea-9631-79a922107cbe.png"></a>
  <br>
   <a href="https://jquery.com/"><img width="200" alt="73933784-96712500-4920-11ea-974f-23b73e2c6113" src="https://user-images.githubusercontent.com/60377349/85695031-9f696400-b712-11ea-8590-de189a70ea87.png"></a>
  <a href="http://haml.info/"><img width="150" alt="74001312-78520600-49ae-11ea-9f29-33f42bd75df4" src="https://user-images.githubusercontent.com/60377349/85693570-51079580-b711-11ea-8433-ad1a662e2d74.png"></a>
  <a href="https://sass-lang.com/styleguide/brand"><img width="180" alt="73996999-a29cc700-49a0-11ea-8f87-2ce847edfeea" src="https://user-images.githubusercontent.com/60377349/85694866-7cd74b00-b712-11ea-8d26-07edc0fde819.png"></a>
</p>

## 🌐 App URL
https://gravy-32310.herokuapp.com/

## 📝 About
C2Cのフードデリバリーを実現するためのプラットフォームです。
好みの香りや使用場面、持たせたい印象をリストから選択し、それに合わせておすすめの香水を提案します。  
また、選択した香水を購入することができます。  
※実取引は不可能です

## 🌝 What brought me to make this app
世の中はたくさんの香りであふれています。  
香りは気分を変えてくれたり、リラックスさせてくれたりと生活を豊かにしてくれるものの1つです。  
心理学的には人の印象を決定づける一番の要因が香りと言われています。  
ところで、皆様は普段から香水を使用しますか？  
香水はつける場所や香りによって印象を変えることができます。  
ひとつの香水には平均して50〜200種類もの香料が含まれており、それらの香料はまた何百という香りを構成する成分からなっています。  
時折、どの香水がいいか分からない、おすすめの香水を教えて欲しい、と思うことありませんか？  
このサイトはそういった悩みの手助けとなるべく開設しました。  

## 💫 Functions
- haml/SASS記法と、命名規則BEMを使ったマークアップ
- deviseを用いたユーザー新規登録とログイン
- cancancanを用いた管理者権限の付与
- rails_adminを用いた管理者ページ作成及び商品登録
- カート機能
- 非同期通信による商品お気に入り機能
- 非同期通信による商品へのコメント機能
- gretelを用いたパンくずリスト
- PAY.JPを用いたクレジットカードの登録及び購入処理
- RSpecを使ったモデルの単体テストコード
- capistranoによるAWS EC2への自動デプロイ

## 🙌 Check It on Local
```
$ git clone 
$ cd gravy-32310
$ bundle install
```

商品一覧、商品詳細、商品検索についてはログインなしで使用可能です。  
商品の購入/カート機能には、新規登録/ログイン、マイページ(my account)でのクレジットカードの登録及び送付先住所の登録が必要です。  
ログインにあたっては、以下の登録済みアカウントをご利用いただけます。  
- email           :
- password        :

また、クレジットカードについては、以下のテストカードをご利用ください。  
※ご自身のカードは使用しないで下さい。  

- number          : 4242424242424242
- expiration date : 01/23
- cvc             : 123

## 💡 Supplementary information
- Ruby 2.5.1
- Ruby on Rails 5.2.4.2

## 👀 E-R Diagram
<img width="1001" alt="スクリーンショット 2020-06-24 18 50 59" src="https://user-images.githubusercontent.com/60377349/85540710-4c2fdc80-b652-11ea-81a9-79851429a05b.png">

## 📙 Features
## Home
![18 176 232 167_ (1)](https://user-images.githubusercontent.com/60377349/85860335-98695100-b7f9-11ea-8a05-2d0e9c860f8f.png)
## Index of dishes

## Detail of a dish

## Cart

## Log in (User)

## Sign up (User)

## Log in (Chef)

## Sign up (Chef)


## My Account

## Favarite

## Registration of an address

## Registration of a credit card

## Confirmation before payment

## Completion of Purchasing

## Purchase history

## Details of purchase history

## Index page for chef

## Registration of dishes (Chef)


# Database

## users table

|Column |Type |Options |
|-------|-----|--------|
| nickname        | string      | null: false                     |
| email           | string      | null: false, uniqueness: true   |
| password        | string      | null: false                     |
| zip_code        | string      | null: false                     |
| prefecture_id   | integer     | null: false                     |
| district        | string      | null: false                     |
| street          | string      | null: false                     |
| phone_number    | string      | null: false                     |

### Association
- has_many :orders
- has_many :dishes, through: :orders

## chefs table

|Column |Type |Options |
|-------|-----|--------|
| name           | string      | null: false                    |
| email          | string      | null: false, uniqueness: true  |
| password       | string      | null: false                    |
| zip_code       | string      | null: false                    |
| prefecture_id  | integer     | null: false                    |
| district       | string      | null: false                    |
| street         | string      | null: false                    |
| phone_number   | string      | null: false                    |

### Association
- has_many :dishes
- has_one :profile

## profiles table

| about               | text        |                                |
| business_hour_begin | time        | null: false                    |
| business_hour_end   | time        | null: false                    |
| status_id           | integer     | null: false                    |
| gender_id           | integer     | null: false                    |
| age_id              | integer     | null: false                    |
| genre_id            | integer     | null: false                    |
| chef                | references  | null: false, foreign_key: true |

### Association
- belongs_to :chef

## dishes table

|Column |Type |Options |
|-------|-----|--------|
| name        | string      | null: false                    |
| about       | text        |                                |
| ready_id    | integer     | null: false                    |
| price       | integer     | null: false                    |
| chef        | references  | null: false, foreign_key: true |


### Association
- belongs_to :chef
- has_many :orders
- has_many :users, through: :orders
- has_many :dish_tag_relations
- has_many :tags, through: :dish_tag_relations

## orders table

|Column |Type |Options |
|-------|-----|--------|
| user   | references   | null: false, foreign_key: true |
| dish   | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :dish

## tags table

|Column |Type |Options |
|-------|-----|--------|
| name        | string      | null: false, uniqueness: true  |

### Association
- has_many :dish_tag_relations
- has_many :dishes, through: :dish_tag_relations


